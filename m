Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75806483AF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 15:23:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3eGJ-0001PJ-G1; Fri, 09 Dec 2022 09:22:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3eGG-0001M1-Ar
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:22:00 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3eFx-0003xw-3U
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:21:54 -0500
Received: by mail-wr1-x42f.google.com with SMTP id m14so5339341wrh.7
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 06:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kbExQA0onQG9QAZ5T2ULEalFtg+MiSswrh7KmRsnoyI=;
 b=Bj7CFAUskf5WrlAbJScqHFF+itDfnvt/yNGU5DbQc5xwIVkt4Wxdw5/SkOskVBK8PY
 YEjCFO5XG/Dk8Smd68tFOumue8gQkkrKC1trO8KQG/rr9tNpFrYeXFUfS7DQwBnRcd2o
 BVBbNBWBGYJE137RYgbGyfiYLfia4HfWkix/RqRUk7IgQHcvKStvxD7l5rsYAjomJeIk
 dQj3yrtKru6aw7SFAcX4y53zaMUhGfS7V42qQtxnLbca35ySgAdJk4R3h6sPcWI6Oqj5
 ZZDg7GpNKv7lqzVsvN0SUQdnVpbPllMyNynLP4Z/ZsjKhaq4u8Ac1SeIuP6b33J6ZhM5
 f8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kbExQA0onQG9QAZ5T2ULEalFtg+MiSswrh7KmRsnoyI=;
 b=2mIqOqXei1eGjeagv87uN33Wgi5uPEYtGl7oshJZ30T4gjjynrFg9NfBop60a3PPN7
 PtaF6u3MysKebWegiGUZqBdqDsW+o4Owostmndo4MjLfQKX2RyKIr7sEnKoX4yrL4S0J
 bNxCejQ3TBBpAjS4lkTToL9LlpUKvh3PAfsJZAGcRwG8IX7pXPv+puUH4gf5Vm6X+ySS
 NK7lU40c+DbdXLO1aXAT7dGGBU+wggTtadO1ZSASzpxwrci+3ZB+q1DEDP+/huur0yVs
 gdW+OZX84nHhYmOyz50qSoy7NzBQvBSk/iWz6aY3JwoLVjX7iTDptGx76+0bIaqw+4K3
 t7EA==
X-Gm-Message-State: ANoB5pkUpj6PY2EBIsFLGiwIN4t8ShcpROhQMxv++Th3vraf12JOB9PA
 lTP2i65/KmgTt74klXhd0UEcJw==
X-Google-Smtp-Source: AA0mqf7lzy6rnHB7hRpRrD89a8oN+rQEWRsCFTAibqUjlesa2wJP/CMaM5G5ZT4FoIeKkfwx50qkAg==
X-Received: by 2002:a5d:58d2:0:b0:242:4697:d826 with SMTP id
 o18-20020a5d58d2000000b002424697d826mr3897603wrf.29.1670595689885; 
 Fri, 09 Dec 2022 06:21:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d13-20020adfef8d000000b00241e5b917d0sm1879756wro.36.2022.12.09.06.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 06:21:29 -0800 (PST)
Message-ID: <6275f9b9-a878-bec9-d5c6-54d1c4bf192a@linaro.org>
Date: Fri, 9 Dec 2022 15:21:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 19/30] configure, meson: move --enable-debug-info to Meson
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-20-pbonzini@redhat.com>
 <bc114971-ee1f-b48b-cee7-ebcdae4d572c@linaro.org>
 <be63447e-ba8e-6876-78a8-0cdb875b98c3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <be63447e-ba8e-6876-78a8-0cdb875b98c3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/12/22 14:54, Paolo Bonzini wrote:
> On 12/9/22 13:55, Philippe Mathieu-Daudé wrote:
>>>
>>> +  printf "%s\n" '  --disable-debug-info     Enable debug symbols and 
>>> other information'
>>
>> We should get '--enable-debug-info' here, ...
>>
>>>     printf "%s\n" '  --disable-install-blobs  install provided 
>>> firmware blobs'
>>
>> ... and here. Do we have a bug in meson-buildoptions.py?
> 
> No, for boolean options it only includes the non-default setting.  This 
> behavior was copied from the prior handcrafted help output:
> 
>    --with-devices-ARCH=NAME override default configs/devices
>    --enable-debug           enable common debug build options
>    --enable-sanitizers      enable default sanitizers
>    --enable-tsan            enable thread sanitizer
>    --disable-strip          disable stripping binaries
>    --disable-werror         disable compilation abort on warning
>    --disable-stack-protector disable compiler-provided stack protection

These are correct... For debug-info I'd expect that (change on top of
your patch):

-  printf "%s\n" '  --disable-debug-info     Enable debug symbols and 
other information'
+  printf "%s\n" '  --disable-debug-info     Disable debug symbols and 
other information'



