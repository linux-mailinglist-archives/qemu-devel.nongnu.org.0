Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 901AC2BC8CB
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 20:43:33 +0100 (CET)
Received: from localhost ([::1]:49720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgvGm-000194-41
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 14:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgvEu-0000Tr-OY
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 14:41:36 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgvEt-0003cX-AF
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 14:41:36 -0500
Received: by mail-wr1-x435.google.com with SMTP id 64so3064635wra.11
 for <qemu-devel@nongnu.org>; Sun, 22 Nov 2020 11:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EQvGqjU6MCftHm7wdInpIWfc+iWr484PNK7cUuwjMvE=;
 b=l4PghwlRqyDbe2LT3A5ns3b64xfl8TvOHOA6n375UuTIgQ4/IvHDf29/iWvvz57BN1
 IWrIEegbWR+3/tunlqPB0UEEUMdIBecPtqLmWGbDrWwkQPx2yKI4Cz/K1Dk0oCKawSZ/
 6q5YmSxEGvwGgNMYxNTxpK0NQhZuJIBoW8W3QCvVjsE8fXV6CaY1RRZLAQjckG++uslz
 AaFmtrz8hCDkMhGEBfMi3N5qAt1yHcY+NDI0r1cPMAcYZMoBgXDBj1KwtNc0Dko58TiI
 kVUSMe6zUFbOeWokHxNt5OvaO7k6EtBlasqiDcP6s9GHUa4yCEnMYnBJ7aI4DFPBwuxW
 PLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EQvGqjU6MCftHm7wdInpIWfc+iWr484PNK7cUuwjMvE=;
 b=Wd6WZuqk9eDMP63S3hklrK+TMW/UMDzQ7NqOACKBDGCoKULWqSyaTO6jntGNJo8ZUm
 6FAKq4cyUaOJjWlNNFKCX85mqznc1RvWM2FuHPy6QiN9tpi/dn+Lb2c8dytfJgZ7CVIx
 a9kDfJIH+ivln//8s8r2hmPji1mBL5PL4x5foV6DcneX9qeLXzbYYqRbeexO2mTUqbBC
 FPYtJgcHIH8EHO4f2mAtdOrmdHWVyefotAQnuR6ZZ6rFxgdTUuNsR8ctn5Va10Y5OBLf
 LRNzt9ObECLSAZ8aqH3vTFk/NShTutqCCKfme3RmOK9WdpTrGJZEuQiqrJsq40V8YrSM
 KGXA==
X-Gm-Message-State: AOAM53230fCLqWlAaFLTR3xwMcFpZ1yZNsAGMYv7Y3Ka/wkplNztMW7U
 OA384mUDLBs58fkiNcx8ZxA=
X-Google-Smtp-Source: ABdhPJzHj7HlYwGh0mVy/+gyzXYAtijyvgAX8U4QKh97FC+YXubYgaLRrS/MQ4/mdWzpgVsbFq6cXQ==
X-Received: by 2002:adf:82f5:: with SMTP id 108mr27833807wrc.269.1606074092925; 
 Sun, 22 Nov 2020 11:41:32 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id g138sm11921013wme.39.2020.11.22.11.41.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2020 11:41:31 -0800 (PST)
Subject: Re: [PATCH-for-6.0 0/2] target/mips: CP0 housekeeping patches for Nov
 2020
To: qemu-devel@nongnu.org
References: <20201109090422.2445166-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9ec4721f-15ba-db53-7252-16d6f6f72d0e@amsat.org>
Date: Sun, 22 Nov 2020 20:41:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201109090422.2445166-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/20 10:04 AM, Philippe Mathieu-Daudé wrote:
> Based-on: <20201108234234.2389789-1-f4bug@amsat.org>
> 
> Philippe Mathieu-Daudé (2):
>   target/mips: Replace magic values by CP0PM_MASK or
>     TARGET_PAGE_BITS_MIN
>   target/mips: Do not include CP0 helpers in user-mode emulation
> 
>  target/mips/cp0_helper.c | 9 +++------
>  target/mips/helper.c     | 4 ++--
>  target/mips/meson.build  | 2 +-
>  3 files changed, 6 insertions(+), 9 deletions(-)

Thanks, applied to mips-next.


