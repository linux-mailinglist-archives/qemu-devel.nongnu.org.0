Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C7B4A3AC2
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 23:41:35 +0100 (CET)
Received: from localhost ([::1]:56782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEIt4-0001HO-ED
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 17:41:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEIrH-0000Xa-Kk
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 17:39:43 -0500
Received: from [2a00:1450:4864:20::433] (port=37619
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEIrG-0003LT-5C
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 17:39:43 -0500
Received: by mail-wr1-x433.google.com with SMTP id w11so21862694wra.4
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 14:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xtejDC5j2j/aE9XoUqAnq/0uwAFCdIWgmH5RDVHIWhU=;
 b=TurRDm0/Y/7a6WlHDpcfhAM3BiJdyGS4AvVoq8slqwA8Bak2wHTfzRBUpnE/uerTYc
 u5tEc1EKOulaabRTjEcXoZa9ve2Xz5w36DOF9yLDq4ZksMyHhakodObtN82azijcm3cT
 tlDSYPBQtwIqJmMHOWgD44KQHz2JuL/I9MTUsAOleBrwXJsRp+jUmR6Yhb/P2FdYqX6O
 ax3BKYIJIGSDK6sN6ue7MQHIlDfpcAhA7iGT0CiVb7tp3UHLTymshIiqRkflKoazCPyb
 r0S5ELS9jupfOMO7mY2+I7AWSsZxWKNBSsoIC9YfKhBsTv27hS0RI8ZTzj41LpR4rgq7
 0DvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xtejDC5j2j/aE9XoUqAnq/0uwAFCdIWgmH5RDVHIWhU=;
 b=qsz+Qibh8SR3shsojRDpUGzohfME7XaML5O1/1jS194diloKjeqnKnG/lNi7c1eonU
 TnKfZ1C6/bnM93ptr9kJZxfKiS1IrEQdMRwrlor3OGeHZRGhEbuSrNzzQXbmoT5v9tqQ
 SKX1hzycaIHPxMwFcgcfbi6skPwMoPgrqU4LhWoNo3IjIK8k/sVWaulGYJl762pIJsIL
 3u2qk3zyFZiBX+NFcmmqwSo/3NZfShlWslp9eTFzjRvC/qw+F3dgYPSwX/agNdswqViB
 esH1kd1bVaUaWIACWgsNJxfZgZSr1ZATQsC1eEesGgWMivo3cHjjXKRylSSFhe9l/Wno
 biyg==
X-Gm-Message-State: AOAM531vsspmTvCMMT6zjYm4sPZiJwnjcl0OtgLRdp57Bm8q0QjQl8i8
 R0NQURA6455evT2Fz8sm9rQ=
X-Google-Smtp-Source: ABdhPJzt9fxiiT/G1p20WpMQkicbecx1YK23xdEqEQz6QI9mR4B1RRzO4FHKefZdf1i/e9mYY30QDA==
X-Received: by 2002:adf:e6c9:: with SMTP id y9mr15759384wrm.389.1643582371212; 
 Sun, 30 Jan 2022 14:39:31 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id m14sm12443680wrp.4.2022.01.30.14.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 14:39:30 -0800 (PST)
Message-ID: <15415670-1e38-4f27-bebd-8c62d8c0a500@amsat.org>
Date: Sun, 30 Jan 2022 23:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] isa/piix4: Resolve global variables
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20220112213629.9126-1-shentey@gmail.com>
 <20220112213629.9126-4-shentey@gmail.com>
In-Reply-To: <20220112213629.9126-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 12/1/22 22:36, Bernhard Beschow wrote:
> Now that piix4_set_irq's opaque parameter references own PIIX4State,
> piix4_dev becomes redundant and pci_irq_levels can be moved into PIIX4State.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix4.c                | 22 +++++++++-------------
>   include/hw/southbridge/piix.h |  2 --
>   2 files changed, 9 insertions(+), 15 deletions(-)

Finally!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

