Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796372C5F68
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 06:04:52 +0100 (CET)
Received: from localhost ([::1]:38644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiVwB-0004Y5-Ip
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 00:04:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiVvD-000480-VN
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 00:03:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiVvC-0000am-Cd
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 00:03:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606453429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OIc8hxQLG3QffazL32WkQKnQiOr0/1ohZR+ALx2ul8U=;
 b=YfMWDQvJWk4SuNh5xd1p4BvMGkZ23GO62H1Uxd2Suy8+c6lUlSqEpzE4b5cdC1Uwp/bgrg
 dAx7LjBfZLNJWMExTmPpMUbfYsUUBczj7pLGW8yBBQg/T2bM1DgyQi4UhKYY/9XcZXhKQv
 moC6f292jJe1XN6HdKFBqwhcvRKCdiE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-cn-m-rgiNTOiwbCn2gLoQA-1; Fri, 27 Nov 2020 00:03:47 -0500
X-MC-Unique: cn-m-rgiNTOiwbCn2gLoQA-1
Received: by mail-ej1-f70.google.com with SMTP id dx19so1601278ejb.7
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 21:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OIc8hxQLG3QffazL32WkQKnQiOr0/1ohZR+ALx2ul8U=;
 b=EP1kUKPLQHhW76Tcwe8unuNP7e2JXEPA8P5AMBukohvk3M3uDltAmredlwcS5AqnIZ
 AypfbI3LI7SRWwaynRmL2K5zHTdZXIV2N02vBY1lLPZw/2g6uua7EQYDRa5P6fknVHD5
 W0AXmsjvQg6V5zGU5dW/wme0PY3J0rEXymyqqc4bOydfBVTCgc0kj1lSojys9Q1u254C
 1Fd8ThN+P8dtcPOb6xS0UaBTKnAF4ImqVV/8fl1zDrkOwadZWPO9MnIE+rqOa9oRKkMU
 hK8lBGbb2AURl7hGKRGHH47OSHf7RrpT6CZh7v6EsfBjRBDXowdmS9uSbvwuVV7oTUGF
 mH8A==
X-Gm-Message-State: AOAM530cbpUVkKMH1oEROVff6L3qvWf8+XVzdlzSu+oBDKTFIjFk6wLm
 4rQmBCx402Uvsz6mNlLUhhNK7EzUG6J4rp25GeCithX4gmSzuIYW+ChzfhURD7LiG97XTclio5M
 JGoLYXAg7k55Q1uSIM1fNiPwlDYcx7RQR0yDHBHpWt5CP2zYNX6bvov9O0PR5U9i6Zs8=
X-Received: by 2002:a17:906:8046:: with SMTP id
 x6mr5830740ejw.189.1606453425782; 
 Thu, 26 Nov 2020 21:03:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXaWfcF1tNPtZ/DAevBi+uQKo5CmyUa8Y47p9Ccrnr4e1YS5s+WOHLfeZ5ohHXZSgwh1kZpw==
X-Received: by 2002:a17:906:8046:: with SMTP id
 x6mr5830723ejw.189.1606453425527; 
 Thu, 26 Nov 2020 21:03:45 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id u1sm4162000edf.65.2020.11.26.21.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 21:03:44 -0800 (PST)
Subject: Re: [PATCH 13/36] vl: move semihosting command line fallback to
 qemu_init_board
To: Igor Mammedov <imammedo@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
 <20201123141435.2726558-14-pbonzini@redhat.com>
 <20201126181036.3ff5d605@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8866f216-911b-2803-4b15-0e794c4c71e1@redhat.com>
Date: Fri, 27 Nov 2020 06:03:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201126181036.3ff5d605@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/11/20 18:10, Igor Mammedov wrote:
> On Mon, 23 Nov 2020 09:14:12 -0500
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
>> Move more sane parts of the huge qemu_init function out of it.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   softmmu/vl.c | 12 +++++-------
>>   1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index ab08a0290c..5d68cf828c 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -3070,6 +3070,11 @@ static void qemu_init_board(void)
>>   {
>>       MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
>>   
>> +    if (semihosting_enabled() && !semihosting_get_argc() && current_machine->kernel_filename) {
>> +        /* fall back to the -kernel/-append */
>> +        semihosting_arg_fallback(current_machine->kernel_filename, current_machine->kernel_cmdline);
>> +    }
> 
> it doesn't seem to depend on anything that warrants calling it this late.

Yes, calling it around machine initialization time is also a 
possibility.  I just wanted to get rid of it in code that I'm actually 
looking at. :)

Paolo

> 
>>       if (machine_class->default_ram_id && current_machine->ram_size &&
>>           numa_uses_legacy_mem() && !current_machine->ram_memdev_id) {
>>           create_default_memdev(current_machine, mem_path);
>> @@ -4385,13 +4390,6 @@ void qemu_init(int argc, char **argv, char **envp)
>>           boot_order = machine_class->default_boot_order;
>>       }
>>   
>> -    if (semihosting_enabled() && !semihosting_get_argc()) {
>> -        const char *kernel_filename = qemu_opt_get(machine_opts, "kernel");
>> -        const char *kernel_cmdline = qemu_opt_get(machine_opts, "append");
>> -        /* fall back to the -kernel/-append */
>> -        semihosting_arg_fallback(kernel_filename, kernel_cmdline);
>> -    }
> 
> Can we move this hunk as is to somewhere around qemu_maybe_daemonize() time?
> 
> 
>>       if (net_init_clients(&err) < 0) {
>>           error_report_err(err);
>>           exit(1);
> 


