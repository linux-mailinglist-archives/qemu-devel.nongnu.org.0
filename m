Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AE45EA44D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 13:44:39 +0200 (CEST)
Received: from localhost ([::1]:35944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocmXN-0001Tg-3E
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 07:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ocmOF-0003Km-TW
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 07:35:18 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:34450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ocmOE-0002fT-CB
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 07:35:11 -0400
Received: by mail-lj1-x236.google.com with SMTP id h3so7117171lja.1
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 04:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=9QstjYzA5AbLY1M/E7I53Ztzj47MCUXlCiFs3NDV3NI=;
 b=XPHFv5rC4WNB+HyFlxmCKouOD3q50XRQIpfAkynziQ7eSDs1BXwOoWeJH9hZ+JgglR
 ZpUypT4LgoctYfv52glAU7idsmclfciX6UNigNC893qkSDPJZ2c6kBDJaxiptFGpIxKU
 2XvUMJPqmg+0+6OjchQm7R18Fo/F7VEPoeEqpkYtg/IXbNmjogPu31mxaJWlsjMpQ0Ff
 JxyiRZKwvv8f6eJdVfaoPoZS2zYz5WUU7+/+/fXwQohP+PFi63/EtJRri+cXQK08mpL3
 DApRyXQOdjb/rpFEUQhSvGuEwQCf9NfAPGbcvduiOeenW0WBTU31YeGl0IcR5m1M4BXM
 fG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9QstjYzA5AbLY1M/E7I53Ztzj47MCUXlCiFs3NDV3NI=;
 b=eezlX+0szMcJ2reEDqnfqia5o06QEAO3PNZ3c9GbOWnclKcPQkUnyk8jRliSzIxtvI
 QG2/B5BsDHgOkCS6jMhMaiNwfooHoMbAptTWOpSy92CNJjYZyz8cAB5Pgct3caFD+/zM
 oa5cTGELZ7crYjLpVkWhU9u3qnoALoNXznM9c3KzYe0Um5vjyFeVL2QLMuLnrj9H2lXV
 O86ElqO+GHRQcKOTKe9zRA36AZHAdXXPBDbDZKPt5KEwJwzJIrL/r1J8ypSiPqiRm3I7
 g3gCAV/bhZbsSDF10npj8061ZlPnKghsNi7gy5+UsMSXkKlOXQnKFlyT9HK4nnpR60It
 kxjw==
X-Gm-Message-State: ACrzQf2xQwxB7qDSLBm5O9GoQcskLZYMo5f2ceCH3Pa36E84rHMLWXnH
 Yd1SRy/ltTIfC9oD94+RDck=
X-Google-Smtp-Source: AMsMyM4ohj/ctY4LUKGRMa1IvGDoyEJeazcWIn3i5cn94xZpDr9GSb2cFiWgKpN0s6e+0AGKct/pCQ==
X-Received: by 2002:a05:651c:10af:b0:26c:3c37:79f6 with SMTP id
 k15-20020a05651c10af00b0026c3c3779f6mr7887545ljn.111.1664192107604; 
 Mon, 26 Sep 2022 04:35:07 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a05651233c400b004994c190581sm2495145lfg.123.2022.09.26.04.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 04:35:07 -0700 (PDT)
Date: Mon, 26 Sep 2022 13:35:05 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, edgar.iglesias@amd.com, francisco.iglesias@amd.com
Subject: Re: [QEMU][PATCH 1/5] MAINTAINERS: Update maintainer's email for
 Xilinx CAN
Message-ID: <20220926113505.GC4571@fralle-msi>
References: <20220910061252.2614-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220910061252.2614-1-vikram.garhwal@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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

On [2022 Sep 09] Fri 23:12:48, Vikram Garhwal wrote:
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>

> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1729c0901c..1d45e92271 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1751,8 +1751,8 @@ F: tests/qtest/intel-hda-test.c
>  F: tests/qtest/fuzz-sb16-test.c
>  
>  Xilinx CAN
> -M: Vikram Garhwal <fnu.vikram@xilinx.com>
> -M: Francisco Iglesias <francisco.iglesias@xilinx.com>
> +M: Vikram Garhwal <vikram.garhwal@amd.com>
> +M: Francisco Iglesias <francisco.iglesias@amd.com>
>  S: Maintained
>  F: hw/net/can/xlnx-*
>  F: include/hw/net/xlnx-*
> -- 
> 2.17.1
> 
> 

