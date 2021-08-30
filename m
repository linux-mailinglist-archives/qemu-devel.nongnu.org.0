Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8855D3FBA5C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 18:49:29 +0200 (CEST)
Received: from localhost ([::1]:58722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKkTQ-0000W1-6X
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 12:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mKkSc-0008H6-6F
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 12:48:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mKkSY-00084b-Mj
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 12:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630342113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xxeFi1JV9fJbEfv7hUILgWg910Hq30nQxtjpOkjExt8=;
 b=JNJGo2nhkewKduSoJeOGSLbNxWWUB184O5b+rxBrQ33st5BuxUqDGzargizZ3bpWRkFzef
 x6SKEaj9nsuzlM/7Gz92sG3E+sK7upK4nD+zMZeUSrpLEnWEoNOcWSP+77ZOVPFNlTGfJL
 XhAN+1UC5F+4Nl0+jMOwfngxl7oQ1lE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-PQqiKo1gNcmU4E1GfUF3mQ-1; Mon, 30 Aug 2021 12:48:31 -0400
X-MC-Unique: PQqiKo1gNcmU4E1GfUF3mQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so4912539wma.4
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 09:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xxeFi1JV9fJbEfv7hUILgWg910Hq30nQxtjpOkjExt8=;
 b=KT3/lgcE2mtiNrCJ7hwUl8OT+NkQ+1yuKBiNxfOSlJBpiQk6aJeRhq1WyexDa6Y0dc
 ypO+C9g4gssymGcsH2H681vz715Fy+qcuRjnBVYA1cW+Xbhj0Hg6EYFhVX20EfzghjW+
 hD679fCg9MiK00fXQXItUkcZRa4HC0AH9OKX5JpHuyYPG5hqmyoOQTYPeGydJWiA7Zk5
 CSBy0SpgxO560cUpdchvl/9+W+R6ESx8msIHnzzKpxuiOocb1ctPK9cz7Psi27zaNFqX
 qvBmKBWCYLkacuKK2Ww0addIXaUlu1U1gzqnEnRGxmFA3ffcwbhedJhq7QReYaz2nJDx
 2NaQ==
X-Gm-Message-State: AOAM531k1/3FaPa2AKV1bPUZey/2yqxmpBv4LROYpSR/UulgPTGRCLNw
 uvtoaO/FaXTNfYM4wpGfQNAF3wP5MUtzo4VYYdpUIv7WyP/uvfND0cZwe6yyANP+8zL1ugGUnw0
 JxbhGbTq62KhyFn8=
X-Received: by 2002:adf:80e5:: with SMTP id 92mr22241312wrl.300.1630342110530; 
 Mon, 30 Aug 2021 09:48:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8uDWU8ovEXI1H49aqp2uOoI4209GdzWiytqwpWwOtRLiw/PYynj/A7B8g36wCZLDFwChMqQ==
X-Received: by 2002:adf:80e5:: with SMTP id 92mr22241294wrl.300.1630342110274; 
 Mon, 30 Aug 2021 09:48:30 -0700 (PDT)
Received: from thuth.remote.csb (pd9e830c4.dip0.t-ipconnect.de.
 [217.232.48.196])
 by smtp.gmail.com with ESMTPSA id u27sm16511761wru.2.2021.08.30.09.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 09:48:29 -0700 (PDT)
To: Eric Blake <eblake@redhat.com>
References: <20210829173210.39562-1-thuth@redhat.com>
 <20210829173210.39562-4-thuth@redhat.com>
 <20210830153022.3yywyrpynoiss6nr@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/3] configure: Get help text from meson_options.txt
Message-ID: <17750024-fa3c-d209-bc27-1b90dd3a4ce8@redhat.com>
Date: Mon, 30 Aug 2021 18:48:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210830153022.3yywyrpynoiss6nr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/08/2021 17.30, Eric Blake wrote:
> On Sun, Aug 29, 2021 at 07:32:10PM +0200, Thomas Huth wrote:
>> It's cumbersome to maintain the option help texts twice, once in the
>> "configure" script and once in meson_options.txt. So let's add some logic to
>> the configure script to read most of the help texts from meson_options.txt.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   configure | 89 ++++++++++++++++---------------------------------------
>>   1 file changed, 25 insertions(+), 64 deletions(-)
>>
>> diff --git a/configure b/configure
>> index cb125c3f84..8446b7b3ea 100755
>> --- a/configure
>> +++ b/configure
> 
>> +
>> +current_feature=""
>> +current_desc=""
> 
> current_desc is unused below.
> 
>> +while read word1 word2 ; do
> 
> A bit misleading in the variable names.  As a sample, you are parsing:
> 
> option('malloc_trim', type : 'feature', value : 'auto',
>         description: 'enable libc malloc_trim() for memory optimization')
> 
> which read then splits into:
> 
> word1="option('malloc_trim'," word2="type : 'feature', value : 'auto',"
> or
> word1="description:" word2="'enable libc malloc_trim() for memory optimization')"
> 
> Better might be the names $first and $rest.  You could also play with
> $IFS for more precise splitting, but your hack is good enough for the
> current usage.
> 
>> +   case "$word1" in
>> +   option*)
>> +       if echo "$word2" | grep -q "type[ ]*: 'feature'"; then
> 
> Unlike my complaint in patch 1 about using echo on user-supplied text,
> here you are using it on test in meson_options.txt which is presumably
> not going to contain \ or leading -.
> 
>> +           current_feature=$(echo $word1 | sed -e "s/option('//" -e "s/',.*$//")
>> +       else
>> +           current_feature=""
>> +       fi
> 
> If desired, you can save some fork()ing by doing:
> 
> case "$word2" in *type*:*"'feature'")
>      current_feature=${word1%\'*}
>      current_feature=${current_feature#*\'}
>    *) current_feature=""
> esac
> 
>> +   ;;
>> +   description:)
>> +       if [ -n "$current_feature" ]; then
>> +           printf "  %-15s %s\n" "$current_feature" \
>> +                  "$(echo "$word2" | sed -e "s/^'//" -e "s/'.*$//")"
> 
> Similarly,
> 
> if [ "$current_feature" ]; then
>    word2=${word2%\'*}
>    printf "  %-15s %s\n" "$current_feature" "${word2#\'}"
> fi
> 
>> +           current_feature=""
>> +       fi
>> +   ;;
>> +   esac
> 
> Missing a *) catchall case (probably a good idea to reset
> current_feature back to "" on lines that don't match the two forms you
> care about).

Thanks for your review, Eric! Your shell script knowledge is always amazing! :-)

I'll wait for Paolo first to chime in to see whether he rather wants to 
resume his variant with the Perl or Python script, but if not, I'll include 
your suggestions in the next version of the patch.

  Thomas


