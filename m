Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDF9479A31
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 11:17:45 +0100 (CET)
Received: from localhost ([::1]:43192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myWme-0005a1-FT
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 05:17:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myWlB-0003zZ-79
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 05:16:13 -0500
Received: from [2a00:1450:4864:20::42c] (port=45968
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myWl9-0007ND-Fd
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 05:16:12 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v7so1478185wrv.12
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 02:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u617NSXW5K/yGcPJn72N+rlOhBa58Xv6wlmWB7HbOHI=;
 b=hdJ4La2fsYobb/FLdo6pkQ2cyXiKLwk2nL538FJ+RWlFQTPHr5Lqn0xTqIoTjrWiZD
 25Og4SLUjPzEQ4mNreRFz1++cdFbcK0/pW5hYBmjTweS+9slWFQvFJwxE4BMKOZC42lh
 FooExoBbWVoTHMj5oTkiiOgxtJigm7ya4kw5EeqwXIIYJ1Z9TKhffMqAz8X/XPGIOAwM
 +qKoRJ2NvYIPfNteY3w5SwDnLVp7vIgMgXRu/nl3yL0pR5braMz71L+AQ5/FRPLtmY9B
 fUINQi0IwwKurSPspnMGmvNLc6C2//dgm7ECXsbGMkEgcSMOXUdBrufipJVfJagkNT0Q
 690Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u617NSXW5K/yGcPJn72N+rlOhBa58Xv6wlmWB7HbOHI=;
 b=1xlsgqBTeZbo/uiTcJsI5druYWcVypIcaLwm0h4cROxU58aTCWXWC2Y5jzdOO4DKh2
 B7mLPQCfMX3H3vU3K4pV28yXgML/MwgXSxmwVAB9vICv6y/w0nCOIFw75HjM+pfJIyCN
 /RWO/FxTjcQD/DEYNgFVDWBxIXNJ3ZYQFQkJalUQU5fFk5i16yIwykTosFh4vWE0C6xO
 IazgKWRBtBEdXiLKFxfKTAtZT6kscYYTKW5OtL3ZgdxNbvZ8Wrogj2cyRrs1/651o2Lo
 aHkjRSrvA7Ou6d45Mw+8hUXhuTGPPtLKCrb74dfTQuB39X0LNefunzQh9WRAlN4Ynokj
 wFdw==
X-Gm-Message-State: AOAM533aAHS1IEHHT4gvR+nOwQ2xGap6aQAoLxfzI3F4wFEx+1BGQPFv
 QPwFrmSpqLfJ+yKS8E8WyYc=
X-Google-Smtp-Source: ABdhPJyfzQ8drU+PEGHe0iqwi8TIJXVfQiwpMpzlfHq4y/kKqgcWF1wqJgJJ1tQz1YhT7lGmEJsjiQ==
X-Received: by 2002:adf:fe86:: with SMTP id l6mr1160660wrr.99.1639822565827;
 Sat, 18 Dec 2021 02:16:05 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id a3sm11333306wri.98.2021.12.18.02.16.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Dec 2021 02:16:05 -0800 (PST)
Message-ID: <3229f60d-233b-4cc7-8ea9-1eb623f7a568@redhat.com>
Date: Sat, 18 Dec 2021 11:16:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 04/10] configure: do not set bsd_user/linux_user early
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211216085139.99682-1-pbonzini@redhat.com>
 <20211216085139.99682-5-pbonzini@redhat.com>
 <bbb9e84a-da68-2642-603f-29748ab6d65c@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <bbb9e84a-da68-2642-603f-29748ab6d65c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 21:49, Richard Henderson wrote:
> On 12/16/21 12:51 AM, Paolo Bonzini wrote:
>> @@ -541,7 +541,6 @@ gnu/kfreebsd)
>>   ;;
>>   freebsd)
>>     bsd="yes"
>> -  bsd_user="yes"
>>     make="${MAKE-gmake}"
>>     # needed for kinfo_getvmmap(3) in libutil.h
>>   ;;
>> @@ -586,7 +585,6 @@ haiku)
>>   ;;
>>   linux)
>>     linux="yes"
>> -  linux_user="yes"
>>     vhost_user=${default_feature:-yes}
>>   ;;
>>   esac
> ...
>> +if [ "$linux_user" != no ]; then
>> +    if [ "$targetos" = linux ] && [ -d 
>> $source_path/linux-user/host/$cpu ]; then
>> +        linux_user=yes
>> +    elif [ "$linux_user" = yes ]; then
>> +        error_exit "linux-user not supported on this architecture"
>> +    fi
>> +fi
>> +if [ "$bsd_user" != no ]; then
>> +    if [ -d $source_path/bsd-user/$targetos ]; then
>> +        bsd_user=yes
>> +    elif [ "$bsd_user" = yes ]; then
>> +        error_exit "bsd-user not supported on this host OS"
>> +    fi
>> +fi
> 
> Missing the check for $targetos = freebsd.
> This looks like it would enable bsd_user on linux, etc.

It's replaced by checking for bsd-user/$targetos but yes, that would
flip the default for netbsd and openbsd.

A better condition is

if [ "$bsd_user" != no ]; then
     if [ "$bsd_user" = "" ]; then
         test $targetos = freebsd && bsd_user=yes
     fi
     if [ "$bsd_user" = yes ] && ! [ -d $source_path/bsd-user/$targetos 
]; then
         error_exit "bsd-user not supported on this host OS"
     fi
fi

Paolo

