Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD98431632
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 12:33:50 +0200 (CEST)
Received: from localhost ([::1]:35014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcPxl-0008Ru-U7
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 06:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcPvp-0006fJ-96; Mon, 18 Oct 2021 06:31:49 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:46883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcPvn-00076x-R1; Mon, 18 Oct 2021 06:31:49 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 l38-20020a05600c1d2600b0030d80c3667aso8047743wms.5; 
 Mon, 18 Oct 2021 03:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WG/Rk1Ctg/ci8FRuHetaosRMHsslP/YDyNl7bRleTUg=;
 b=ds2pRLUhPL96L0F+tXp+8JPT3nLciH4COZ633zi4NwafqBI6Vcpbp8lgbMgV+1g5hd
 /JLLTPKLF+zT4gBYfm0H5vdstUTuVD++LTKGSjdDhc0+CWfGa9L2YOCiI/vg+tOag14m
 DGxW+rKMEn3O+DiugIIo5f+bWXrzx/xG4YJ5WPB6X+UWR4MRb9DQy6KGg9i767C7uziZ
 yV3NJKp8q/mj5reIJywfxXUls1tuIiLyBy9PDJK8CCvmDFXtDVZlS/xrGdNodXY2YJML
 snCZT1ACcD4mi6wQ4g42vxumDDwwbRV+BK3zUBM2Nl05WpXcO0dFZGvsFq+SjvsR75E0
 HSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WG/Rk1Ctg/ci8FRuHetaosRMHsslP/YDyNl7bRleTUg=;
 b=uZXLAk4ZqzHKGeUQSE8d+H60ni0QLTFj+eIJCrtUWeTWEo9ZBHo86CI5VyAH2Pcyud
 VoO6IJEL2i3t3DTwc0dgEvu1WiUx4xpNKKj2xS8vO+WHcZ3FKTs1fHqJlNsmCh2OTkKF
 CKllGgTfiDOd30SU4okETxvZqLVWN/rEWrUYMCYNmNyJblV1Nrxnk2VvdE7lCF1akZxH
 d1hMw7qwVGkvn5gJC/rlNnly2sn93voHC28WQUrXHWEhXXZLskOeXyj6ZcPpXYAzF9WJ
 FFvsVHmZIrj5s3RCbS7KgXAc96TDS0P3cuV0bzjM9xMWrBZpuKcNEb4dW4+Sm5BnZhOa
 UROw==
X-Gm-Message-State: AOAM533gvcRTV5WGJHJy/grQBZ/ub5KtP0MpZegx6KKlfu0SRUQRR8Xi
 82dJdjfKqJCXHUZqFzeCcZ4=
X-Google-Smtp-Source: ABdhPJxZYhX4kfX091k0GtIIZI+FqHJmYXJIwqCKpGsxctNpeUsnGm8k1Ns6EVocYdAE8yYIW7vZTw==
X-Received: by 2002:a1c:7918:: with SMTP id l24mr14979282wme.137.1634553105608; 
 Mon, 18 Oct 2021 03:31:45 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id m14sm1484941wms.25.2021.10.18.03.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 03:31:45 -0700 (PDT)
Message-ID: <9c8f7ca7-522b-522a-8fc9-cd5e8897cf2d@amsat.org>
Date: Mon, 18 Oct 2021 12:31:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/3] hw/nvram: Fix Memory Leaks in Xilinx eFUSE
Content-Language: en-US
To: Tong Ho <tong.ho@xilinx.com>, qemu-arm@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20211015203532.2463705-1-tong.ho@xilinx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211015203532.2463705-1-tong.ho@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: peter.maydell@linaro.org, alistair@alistair23.me, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-trivial@

On 10/15/21 22:35, Tong Ho wrote:
> This series fixes memory leaks in Xilinx eFUSE devices for
> the Versal and ZynqMP product families.
> 
> The leaks result from failing to free memory allocated
> by object_get_canonical_path().
> 
> Tong Ho (3):
>   hw/nvram: Fix Memory Leak in Xilinx eFuse QOM
>   hw/nvram: Fix Memory Leak in Xilinx Versal eFuse device
>   hw/nvram: Fix Memory Leak in Xilinx ZynqMP eFuse device
> 
>  hw/nvram/xlnx-efuse.c             |  9 ++++++---
>  hw/nvram/xlnx-versal-efuse-ctrl.c | 20 +++++++++++++++-----
>  hw/nvram/xlnx-zynqmp-efuse.c      | 18 ++++++++++++------
>  3 files changed, 33 insertions(+), 14 deletions(-)
> 

Series:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


