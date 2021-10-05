Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5504231E9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 22:26:41 +0200 (CEST)
Received: from localhost ([::1]:42700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXr1L-00051j-QK
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 16:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXr00-0004H1-S7
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 16:25:16 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:40463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXqzy-0007EX-0I
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 16:25:16 -0400
Received: by mail-pg1-x532.google.com with SMTP id h3so416727pgb.7
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 13:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=tEpUBNR5Gm/OFIbh1ob2YmJD+TUMbWyFNl0annsEN2o=;
 b=nuVSmAvG1bYACuR4IBYU8i9bEgx/qVQvR53UtWWHUBd8xm1Hjm2zGkHcVI5AvAmlvN
 1GHyZpe7aUNYbHiCKkKRJzv02TWXCbROj77nEptAPVLqSpGM8ofRmhH7LYdQEyL+shFW
 GvvvsVQckTmO6Z07dX1ck+vBHJf11D0+ndg/dYAivDoVeaRNRQMncKZzlOKKbh2anBV1
 cJrYUnZrPOpVLD30nKv2VFdyWB9dNE6ySWlgjyuj6TRUjw9T0FBfVdlQlI6HLG4cJIvl
 17+bfkVJm7yFMUR+0PqSWsFwJNIg2XDcGU1fklcFVntGBSBYFjC8dFlFWB1adHQGnxhI
 FyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tEpUBNR5Gm/OFIbh1ob2YmJD+TUMbWyFNl0annsEN2o=;
 b=q8DDFrht02Th+lUvijTd7A31QGDNBScSTmfIwqSVlCZkgdoNJePzqZDoL6EzmENcks
 PJozrEp5l1vDaEeWkjJ0RjhkODtpk2b8YYfKbsa3HWILrrgBP8EbXUEYAcGGFGFUqfCp
 SRTLsCkb5oxeVHgDPmzISx0YENSIAa8spAdcD9zsSjJfLMwFT01FgbeUmJun7RNklS43
 2iaDUeYTbRnP5MTA/MG9z7Zjxf5WMapOMQnqAFPB9h8z+uq6q4q7bxI2ixW9rYJyAn16
 P1tlR8U5DT6hV+DnXd0ZYvaWSEtgbvX3dSkwhZN8gd3UM9GJO8X3j8eVBShP5W1i1NtK
 ULPw==
X-Gm-Message-State: AOAM532cx1osBCrhW9qG3Sl61yiA9gAsHPLH3uml/ooqFLeYWJyY+JJR
 iOLTSYb7cusw+fZsuwoQYznpCJddsTLqYA==
X-Google-Smtp-Source: ABdhPJw438CtUArZ35Vfes1RZGDeV4BNe4zVHPeCwcXEwtGgCpZU/QDMSqc9ye16hoBly9H3plH5ag==
X-Received: by 2002:a05:6a00:cc9:b0:44c:2305:50de with SMTP id
 b9-20020a056a000cc900b0044c230550demr22815189pfv.79.1633465512074; 
 Tue, 05 Oct 2021 13:25:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i7sm12671909pfr.218.2021.10.05.13.25.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 13:25:11 -0700 (PDT)
Subject: Re: [RFC PATCH] meson.build: don't include libbpf in the common
 source set
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20211005182443.2954499-1-alex.bennee@linaro.org>
 <236eb940-67bd-c1a0-3fa5-d0449c3ee712@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9eb86a53-de55-a1cc-0497-ed06ad795530@linaro.org>
Date: Tue, 5 Oct 2021 13:25:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <236eb940-67bd-c1a0-3fa5-d0449c3ee712@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/5/21 12:27 PM, Paolo Bonzini wrote:
> On 05/10/21 20:24, Alex Bennée wrote:
>> This library is only needed for the softmmu targets and as such
>> break static *-user builds where libbpf is detected and it tries to
>> link it into the user binaries.
>>
>> Fixes: 46627f41b6 ("ebpf: Added eBPF RSS loader.")
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   meson.build | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 60f4f45165..d8bcf13b21 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -2307,7 +2307,7 @@ subdir('bsd-user')
>>   subdir('linux-user')
>>   subdir('ebpf')
>> -common_ss.add(libbpf)
>> +softmmu_ss.add(libbpf)
> 
> It should not be needed at all, since ebpf/meson.build has
> 
> softmmu_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: 
> files('ebpf_rss-stub.c'))
> 
> (which already adds libbpf if needed).

Ooo, magic side effects.  I'll note that the manual doesn't say that it adds and 
dependencies from varnames_and_deps, only that it checks them.


r~

