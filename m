Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1E337B58F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 07:42:42 +0200 (CEST)
Received: from localhost ([::1]:34596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lghdp-0001Jb-F5
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 01:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lghae-0004SD-Fn
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:39:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lghac-0007nr-Nz
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:39:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620797961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T9Q7mGwAGSb6c/tgPovDKhrleuuxFUJawYt2JwAOaqA=;
 b=Xjxb4/MXLS1WfkAwIdVEuVJxZsZSzshN/71fjHvSsv7aC3lhu0RlwTyOTlxwfwFeqtlCA1
 cJ3xkfAARWGqRICSzUYVm9Ng39Mjcz+GNdE4reQCYsUaoQSF9OH/ny+0PempcnhbIPnDlC
 8clTTePW8+0MO2a9hBTywjb+XeAEJsE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-dw7KEQOWOjOaZeaHSgvHGg-1; Wed, 12 May 2021 01:39:20 -0400
X-MC-Unique: dw7KEQOWOjOaZeaHSgvHGg-1
Received: by mail-wr1-f72.google.com with SMTP id
 88-20020adf95610000b029010758d8d7e2so9581413wrs.19
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 22:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T9Q7mGwAGSb6c/tgPovDKhrleuuxFUJawYt2JwAOaqA=;
 b=f4rJh2NL/zZrvu9DsdLr+EKOddySGWgHxVX9atxmqnlR8ebxHEfPt0zMRYS6OsNhqe
 PK0q43kdTat5MHkEKYUvJw36GNwfLUWJjsyMhWuWODwBLwtof/+6kT4sQ8OijZkMGUo9
 bsC/tCrG6N1kxwwEx4h4X0XcZpvQBN3UUDZG3rEf1UfDUvZzlfMQa11IRvUQGyjVAScz
 ebDUBRPtYCx2Kh36YN0Zm42RN6/0g+Hees/02xPLw7eQMVqvPb9RQoVnY6/ZswPrWush
 /jdfpyPUc1kwWc5SifIXPnJic7wNuIjg/6ZC09axnInorq6HvRmciHcg7C5MJlOaKcaf
 fHmw==
X-Gm-Message-State: AOAM533QJdMK/sbMtS4UvrihM4X4WBhZ34EtubQn6jDHUaHxs4fEOhlT
 cdmCyBpdMsmUIJxSlZvrN6y832HGXdACfxexrUYvjkpXpQPA7G0lH3YuUnj//gw7jdLOkDpiSA/
 J8P+Jl4yICBXGzKM=
X-Received: by 2002:a5d:598f:: with SMTP id n15mr42649371wri.21.1620797958575; 
 Tue, 11 May 2021 22:39:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz924LKet8ckO/4OlnLdWHNmKxlPwPMUp1f+DjKkio4WtCzm4fWwONI0hhAJ5U0a7+G6V4Row==
X-Received: by 2002:a5d:598f:: with SMTP id n15mr42649364wri.21.1620797958463; 
 Tue, 11 May 2021 22:39:18 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y14sm29203304wrs.64.2021.05.11.22.39.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 22:39:18 -0700 (PDT)
Subject: Re: [PATCH] configure: Only clone softfloat-3 repositories if TCG is
 enabled
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210512045821.3257963-1-philmd@redhat.com>
 <afeea06f-b778-6d62-daf6-99fa4286b056@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8c020fab-f8f2-2884-bc4c-00b8bdb669f4@redhat.com>
Date: Wed, 12 May 2021 07:39:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <afeea06f-b778-6d62-daf6-99fa4286b056@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Emilio G . Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 7:12 AM, Thomas Huth wrote:
> On 12/05/2021 06.58, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   configure | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 5877a6b2bfe..e0e02623e3e 100755
>> --- a/configure
>> +++ b/configure
>> @@ -257,8 +257,6 @@ if test -e "$source_path/.git"
>>   then
>>       git_submodules_action="update"
>>       git_submodules="ui/keycodemapdb"
>> -    git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
>> -    git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
>>   else
>>       git_submodules_action="ignore"
>>       git_submodules=""
>> @@ -2277,6 +2275,11 @@ if test "$solaris" = "yes" ; then
>>     fi
>>   fi
>>   +if test "$tcg" = "enabled"; then
> 
> Shouldn't there be a check here, too, whether git submodules are enabled
> at all or not?

IIUC this check is done later (see $git_submodules_action):

5487 if !(GIT="$git" "$source_path/scripts/git-submodule.sh"
"$git_submodules_action" "$git_submodules"); then
5488     exit 1
5489 fi

> 
>  Thomas
> 
> 
>> +    git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
>> +    git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
>> +fi
>> +
>>   if test -z "${target_list+xxx}" ; then
>>       default_targets=yes
>>       for target in $default_target_list; do
>>
> 


