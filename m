Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51492659877
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 13:52:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBEqY-0007Fz-QD; Fri, 30 Dec 2022 07:50:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBEpu-00076A-Ty
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:50:11 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBEpr-0004tL-LT
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:50:10 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso12076824wms.5
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 04:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iapm294QnROPjPgR1C9sjLppeLkRFWNVBXobkEVnJZM=;
 b=zX0rbLKJmF/5bEmPagun8NLJqIFu5Tekj11x/BF0UJDPxllKmGuRnyhmykAM57y7aF
 Nzi4J2tavA4LiQHgOjjiMR3ZDkXeRFRnZSfiglLVtBM+0HCWUqWmVr3piRlv+8gyO4c+
 RSzCU+8fpYLu7eyXq2eV/F8ddG2Er8g3fc9HSOKx4wdeCzTcEbudjfIBhJjfSNh2hu+P
 SYduvh2n48vMMneRRkVRB6Idx7zhfEkYEPwsXt5T90lAtP4Lr2Lt1hRKrfxbtSg7eIzc
 JGFdcqzrTDH4aXCeBD6ph6l4NXMhV1QTWyC34m4Sut4k0vXzOeX6ec3NGAyBlyTkA34e
 KSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iapm294QnROPjPgR1C9sjLppeLkRFWNVBXobkEVnJZM=;
 b=OCL+dGEVAj3fNpSt/5HM7Hc8m4C3Yc786v/oI8MxhlWlzu+tzJdD4iYMnCvD/8NQWL
 3DFLaKcdNDh9x3VDcuWI9/DupXcXvL5nvEKiwby3jM74YJ3VV4rpkznW3noCXMdj12fd
 VVp+TUdD7SjTBKkxPCmWtJCEFWa5afwjsz5ztJn8HElnUDM05lbX8yDLTUwfzoQhWxUi
 Xks7/47a6GRHvIH7p3SU1m6l5+/7ekOBG02LxlEYLzueFuOM/gtJlFyaBOaJ9L2E3pMK
 eXhWEiFGUj6QooZnW1FCcXK8ImrJiAPXdJINltvob91RrazhUKtadlVApOPSx5ITdo5j
 djaQ==
X-Gm-Message-State: AFqh2krcjSiZTbetAjkZEvv/oQwkc5jGBvw0BBOXAWFtlyvGgf+1L51m
 /ymm5a+YvOvENfcG5xHq+y1i7w==
X-Google-Smtp-Source: AMrXdXt/zrkvkuyhAFJKlTos0tHviBQvtAWIqBz5BRj8/ZE/iR6qU/kueVQn1QRbLz77/7uh3FErWQ==
X-Received: by 2002:a05:600c:4998:b0:3cf:68d3:3047 with SMTP id
 h24-20020a05600c499800b003cf68d33047mr22310070wmp.41.1672404603085; 
 Fri, 30 Dec 2022 04:50:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k31-20020a05600c1c9f00b003d22528decesm35791787wms.43.2022.12.30.04.50.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 04:50:02 -0800 (PST)
Message-ID: <271b3768-81c3-cdc3-a006-39c79f9381d0@linaro.org>
Date: Fri, 30 Dec 2022 13:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 04/11] hw/riscv/boot.c: exit early if filename is NULL
 in load_(kernel|initrd)
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
 <20221229181135.270661-5-dbarboza@ventanamicro.com>
 <CAEUhbmWEdia4AQ4HK9hxh41v2bWPFSBfkz5DKMzRYqMVwmzfxw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAEUhbmWEdia4AQ4HK9hxh41v2bWPFSBfkz5DKMzRYqMVwmzfxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 30/12/22 09:58, Bin Meng wrote:
> On Fri, Dec 30, 2022 at 2:21 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> riscv_load_kernel() and riscv_load_initrd() works under the assumption
>> that 'kernel_filename' and 'filename' are not NULL.
> 
> We should do the same in riscv_load_firmware()

Can be done on top IMHO.

>> This is currently the case since all callers of both functions are
>> checking for NULL before calling them. Put an assert in both to make
>> sure that a NULL value for both cases would be considered a bug.
>>
>> Suggested-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   hw/riscv/boot.c | 4 ++++
>>   1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


