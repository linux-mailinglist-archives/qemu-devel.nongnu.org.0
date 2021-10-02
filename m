Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D4941FC62
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:53:52 +0200 (CEST)
Received: from localhost ([::1]:34166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWfSZ-0006Ye-FE
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfQl-0005BF-Sn
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 09:52:01 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfQk-0000AT-FQ
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 09:51:59 -0400
Received: by mail-wm1-x334.google.com with SMTP id v127so9281774wme.5
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 06:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2iYaLqrUJZ/0oTffguliLgFMJPTC8J9XdhaknmpRTK8=;
 b=bL9F9z2wptfq3cIWxTmDyz0k1kD91qvIDk0j4LyfXHbGY+92DbtxXcAai8+nJUaH/e
 AAPqXHUcdhwyH3oiI3+7xTJ6O5NmZ2rFW28vrthMRd2Z+vCGjqWtindsPejnfw8V2gFh
 HbUEV0N4MwE1zQ4NfUSdhQR5zPfVssVVbas+3d+V/CHvuKqY/qiELOUmB2aRU3kYp03K
 K3ACKaVWDz1acI1Cv5mGYE3J3Eoz90/26yjT1dEt7RcWpT59wN7OY3vTR7v+Ui+LsxGB
 pZzLeRFblZdHpxqxPzq5sSK0AkEoW97wgxluO/zRNT/inj/1teFnxnZ8o+i9RlhJkPjU
 pgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2iYaLqrUJZ/0oTffguliLgFMJPTC8J9XdhaknmpRTK8=;
 b=0k8EJIWrMvkgcLAIasV9soZVz/YDewybdUjim433zwarUlzG+9wMUyAcisuaGQoTSc
 bjCIr2ywmHEfk+wQQ0pmiI9Oox5/CyLrtdc3zK+CY62KeiM0SBkasLnqrK1qlRYfWuJf
 ZmAoXCcytvCrcj9A01BzqryjUq8urg2ZSly0iM4F9LfBgDtTLuR7emys7nyEqd7tFMii
 CO2bdH3LjPY1CD2mo/r5zUJPOzxanrd9/xiSjCqLYUp5qLNEduVpSJ8NYdySf9SjzL2L
 Tf/VSEsau1dBRAjJRI5WJJBPvlAyab2+5a7P4naBvVlpyLabsZYBmxoBYCoUr2Nvi8i9
 0PFQ==
X-Gm-Message-State: AOAM533b47xiXTPcNu6P6td1XrhOFtkoModmN1NqNhnYOQY2hGK3DqpQ
 R0gWZDcPBdXiK6duJa4HMBs=
X-Google-Smtp-Source: ABdhPJyzAAZd1El+XVNrt0dimPnGeN1IZiyoEnreb1XSzlo9qVaiZ5EBQe2tapN6QuZ2ISKNZQ4Qgg==
X-Received: by 2002:a05:600c:3ba4:: with SMTP id
 n36mr9773337wms.35.1633182717077; 
 Sat, 02 Oct 2021 06:51:57 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id y11sm10534990wrg.18.2021.10.02.06.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 06:51:56 -0700 (PDT)
Message-ID: <123e873f-ff5a-2671-41d5-4000ac9fc9ec@amsat.org>
Date: Sat, 2 Oct 2021 15:51:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 02/12] macfb: fix invalid object reference in
 macfb_common_realize()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-3-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211002110007.30825-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.413,
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

On 10/2/21 12:59, Mark Cave-Ayland wrote:
> During realize memory_region_init_ram_nomigrate() is used to initialise the RAM
> memory region used for the framebuffer but the owner object reference is
> incorrect since MacFbState is a typedef and not a QOM type.
> 
> Change the memory region owner to be the corresponding DeviceState to fix the
> issue and prevent random crashes during macfb_common_realize().
> 

Fixes: 8ac919a0654 ("hw/m68k: add Nubus macfb video card")
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/macfb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

