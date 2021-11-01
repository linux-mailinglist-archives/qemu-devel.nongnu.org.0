Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A728441DBB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 17:08:56 +0100 (CET)
Received: from localhost ([::1]:45714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhZrj-0002rh-HP
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 12:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhZq8-00017l-4q
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:07:17 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhZq5-00027w-4m
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:07:15 -0400
Received: by mail-wr1-x430.google.com with SMTP id o14so28738866wra.12
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 09:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=D4Ma94RHb7aBegGzLcpoWHwFS512gxrmnFZPO9tY97U=;
 b=ilvVEfOFQkYaayjnTyGzG622xLRMmXwdBSxHYEV6vrNz7lbYCfW4vBvv+ADkPxSlHl
 E2WuwJZASzJo/CW9Lf7oh0EeL6sI4JYXHQ8d2vhLGuU/YkwqHNYDHUXW0Vyj4uK2f01P
 SElMSoJDZw2cJFL7DXI0ROhsrT7uPNhxAbFBqfgwgB6aOrX/e59sJftIsl6TcjukXcrd
 fOxkmvLZ9KrDV7c8zHeiqvoSrl1AX2+FaeHmF95xsWCzYBCX7I+WTc92KswkkGWrPPgl
 WbyW372nIeVrb2h0XB8GyzyqKS7BLwwrDqclI7I5y0ucew/LFZ5YnKRMCP6eu9W8EFqf
 C9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=D4Ma94RHb7aBegGzLcpoWHwFS512gxrmnFZPO9tY97U=;
 b=tQoCC9l9jEbVp8K8S7jT1AcWVDD47Mk2qRGGoSHFUV+Mg91ooidIhip1tZ1K0MUkDo
 SaLFxFfHIxgnw2rjOp3uJwrkmKaCgSR6ybubaqgNDTAznlQDO+dHD296MAcSj1IU0/sh
 QoEK7DKu7SRPeyIshgaeRqS8/N6adSma3Rp2gb2/iefICpGOEum6ApvgsZV3sz1x5KeN
 BOnlFDF+U8gDJRsSuwuR3DhMqZZEsKlo9zjieJg0vmPxEvw1GBZWvNum5zM2A/lvnhb1
 HEMOp2tjS3FswrbP2gCMEv8NbI90hHAf+zGVu0BOjoOqbBq2H/bGdWBK310QetOS4+R6
 Jpdw==
X-Gm-Message-State: AOAM533/8+rUncU+GW6TtpOJbgcz0s+hfZ7mBvVFtqYrWg/JWq8yHyEB
 to+R2zathwXH0xzhxqRnjAzodWp8Hjo=
X-Google-Smtp-Source: ABdhPJx6CM03X0edqSBQ26X6UeKcqRy9BjQSRekGVU8KxWhFz8tB44cZiJ7o41CKzzhv05+bIrqtRg==
X-Received: by 2002:a5d:5651:: with SMTP id j17mr15790036wrw.166.1635782830314; 
 Mon, 01 Nov 2021 09:07:10 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id y10sm1821407wrd.84.2021.11.01.09.07.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 09:07:09 -0700 (PDT)
Message-ID: <8cd9ea9c-7a3b-6e60-9311-4593f769c2f9@amsat.org>
Date: Mon, 1 Nov 2021 17:07:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: gitlab-ci: clang-user job failed with run-tcg-tests-sh4-linux-user
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel <qemu-devel@nongnu.org>
References: <e27941cc-2622-cb01-4c93-b9ff344bdddb@amsat.org>
In-Reply-To: <e27941cc-2622-cb01-4c93-b9ff344bdddb@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.14,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 11:27, Philippe Mathieu-Daudé wrote:
> Build failed running the 'clang-user' job:
> 
>   TEST    linux-test on sh4
> ../linux-user/syscall.c:10373:34: runtime error: member access within
> misaligned address 0x00000048af34 for type 'struct linux_dirent64',
> which requires 8 byte alignment
> 0x00000048af34: note: pointer points here
>   00 00 00 00 00 40 0c 00  00 00 00 00 7b e2 f5 de  fc d8 a1 3a 20 00 0a
> 66  69 6c 65 33 00 00 00 00
>               ^
> make[2]: *** [../Makefile.target:158: run-linux-test] Error 1
> make[1]: *** [/builds/philmd/qemu/tests/tcg/Makefile.qemu:102:
> run-guest-tests] Error 2
> make: *** [/builds/philmd/qemu/tests/Makefile.include:63:
> run-tcg-tests-sh4-linux-user] Error 2
> 
> https://gitlab.com/philmd/qemu/-/jobs/1733066358
> 

Created issue with local reproducer:
https://gitlab.com/qemu-project/qemu/-/issues/704

