Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CB43ADA7B
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 16:45:20 +0200 (CEST)
Received: from localhost ([::1]:42560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lucDn-00017Q-P4
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 10:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lucCa-0000QC-7g
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 10:44:04 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lucCY-0006qU-SA
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 10:44:04 -0400
Received: by mail-wr1-x432.google.com with SMTP id y7so14126509wrh.7
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 07:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pFBf4pWvNmwOTbW51jmku/kdZJk43uw7AAqOU63vTLc=;
 b=s98Bw7OSI0dLarJVHZldv+lAPsDWBkiyhqbbnvWv7e/w0GvU/lNfCUoI0gGdWb39Zd
 oDgtbS6z99ZjkPn6eFU5epO+mUPjofLVofEg24n7/ff0lKk/UIOqUjJht5h1dSbIzzJW
 hKMEbyigJJZWzX0GmuaZ6bqSopnxCW76VltL7YhuUK0m85lYpjQN2xgtNytA41vyvEop
 aDNteVdhBaAwlrgnQpUVbdHWJMMQgPEYG2beQJsHRN4qmJ5YJkbWU9k8grl5uM+AZULK
 pl5tbGQBL/jrPVdvdVIrndM7VZca/+CuQ3o1ae0QtP8IPFgaME5wiIPxKOawX3QBEe37
 EhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pFBf4pWvNmwOTbW51jmku/kdZJk43uw7AAqOU63vTLc=;
 b=iAKkG58cw+qTMNRC8m7RL+iXqHTnDbUnGqZ9NwYk0ce1V38sD9a3seHn3PkS8Bnx7C
 kvuvOVNnu7UkwxQ4IcEq387jWDlUHg9Kc2/me1vmvGjf0stb3f58+peqUOp8YbH4PHaN
 iBTkhLrQnfY4UNtfS2c/n5gSoo/U6SKG4dxDauIBjXQtT9ri6fGQHsgzQlTjOf2vT0er
 1f2BeCDAIKb+g7m+2xhuVgHSRxxZTMdTU9UoHQ/+0d+9ltY8GDU5Y9c/0waukZgscxhZ
 4AVI9RmEFIk9WYvc2dqePDc7p7Mh5NQIPgbTrmpXh0GljmNVTRpb7DJ8lbkhbaa3ZkyS
 dVgQ==
X-Gm-Message-State: AOAM533bl5gSvX+RCHAXYbKXkfpzOs3+tmE3Kgz9j8+DPirw4n11lEyP
 5wHwNqiNZjxqONEZDsOEuus=
X-Google-Smtp-Source: ABdhPJxX67eyqiNNQqn4O6Te9xKYEX3rnnMjV7rLPxwPkqiT5MUI4iPs9WQFNWvXOyugxCuz6L/O6Q==
X-Received: by 2002:a5d:6b0e:: with SMTP id v14mr17965121wrw.297.1624113841499; 
 Sat, 19 Jun 2021 07:44:01 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m18sm11823959wmq.45.2021.06.19.07.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 07:44:00 -0700 (PDT)
Subject: Re: [PATCH 5/9] target/mips: Restrict some system specific
 declarations to sysemu
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210617174323.2900831-1-f4bug@amsat.org>
 <20210617174323.2900831-6-f4bug@amsat.org>
 <0e884ae7-321f-ce37-44f6-1790b319e7c5@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <61da0ebb-d5d7-cba5-7836-3654ff162e4b@amsat.org>
Date: Sat, 19 Jun 2021 16:44:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <0e884ae7-321f-ce37-44f6-1790b319e7c5@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/21 12:38 AM, Richard Henderson wrote:
> On 6/17/21 10:43 AM, Philippe Mathieu-Daudé wrote:
>> Commit 043715d1e0f ("target/mips: Update ITU to utilize SAARI
>> and SAAR CP0 registers") declared itc_reconfigure() in public
>> namespace, while it is restricted to system emulation.
>>
>> Similarly commit 5679479b9a1 ("target/mips: Move CP0 helpers
>> to sysemu/cp0.c") restricted cpu_mips_soft_irq() definition to
>> system emulation, but forgot to restrict its declaration.
>>
>> Commit a2b0a27d33e ("target/mips: Move TCG source files under
>> tcg/ sub directory") restricted mips_cpu_do_unaligned_access()
>> to system emulation but forgot to guard the declaration.
> 
> FWIW, I think the unaligned_access tcg_ops hook should be available for
> user-only as well, like for tlb_fill.  That it is sysemu only at the
> moment is a bug that affects user-only atomic access.

OK understood, I'll drop that hunk.

> Anyway,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

