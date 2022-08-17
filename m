Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AF859716D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 16:38:37 +0200 (CEST)
Received: from localhost ([::1]:57886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOKBo-0008KP-4u
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 10:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOK7P-0004sw-L2
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:34:03 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:36618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOK7N-0000AU-V4
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:34:03 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-332fc508d88so166505877b3.3
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 07:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=RdAuBQ9HarjbJVQF8eCfs8thmQlN+djaaefJdrhMBmE=;
 b=hoK17MiDV2OKzc5ZGgnape3clApA/V6/tYvL184HWgmfW9WCnropOJfMQgdwSFjco1
 jjFIILaIIAFIAua00miuBB9nsSM1tb769jQGwe4ZmUl4dglhhmzU8yTroZXwiylBIdW1
 UOI3OCTTp5BqJBw5LQ2x4rSaqEzUGPEv+vcfUT0yj/GYr/NfBNIxTYqOZ6xGf1f+91ul
 gdChdmmF5yFnHe52fkIHuqudykFbzcXUlSzfzfVXBnaC6CAl31XEf+YKmiAWXJCmdV2a
 TKbYtZ8Vp12LtTnEb/aV1viOVnhqJaLUb7Kw+vcx6cWYNJjkGpOia9MYj28quwxj7AhT
 QNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=RdAuBQ9HarjbJVQF8eCfs8thmQlN+djaaefJdrhMBmE=;
 b=Y7xYIKewz9R46qG0PlU7y1OW/jUpSPhmB1Mbb8BRLJ1jj5K2Hra5QLVM71nUE4pNfb
 WXmPv58lp2f5JwDJ1ssxIfTHhI6P1nLiUwX8mtp4Imd9Ng60LUvLPIpWixCIazJsCmGi
 2vvJtUn4X1YaYDMWbf1xPKCppDWoT2SbHiKkjoX+ojBM9SpxT86tK6xKYX/cz7eflt/r
 4SH1V2J11il47C1cCg9tTiPMuSWTbIVSTGJgXi0UuxpYjznp34dAP5qkcvSetQ1WNpSK
 EL+Bpwy0F8pguZi1+awTSvRjPBfAVTwv14XJIQcXy/yk3cvJ9b3w2OptkdvfTwGzZXlq
 d/EA==
X-Gm-Message-State: ACgBeo0ygYJPLY+esZUdQ6pLgDfH3/gs9C5xy9B4g2rjXDE9wmeWg2fC
 ArcQhD7IGPn4TPokGypxPQ4cGWwZY+BQrC2fRMwweQ==
X-Google-Smtp-Source: AA6agR7UmYT9fnvUuYiuXESB6I/52jekHH9PobGlQpc7SrRqw+AfNuiATsKVtbjAkz7TPgVQk7OKCOxWC1lZpgf2nfA=
X-Received: by 2002:a25:20c:0:b0:68e:bf0:c6d4 with SMTP id
 12-20020a25020c000000b0068e0bf0c6d4mr6920015ybc.479.1660746840841; 
 Wed, 17 Aug 2022 07:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220817141754.2105981-1-anton.kochkov@proton.me>
In-Reply-To: <20220817141754.2105981-1-anton.kochkov@proton.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Aug 2022 15:33:09 +0100
Message-ID: <CAFEAcA-ii9vOLvtO_Yb4c90KaH8dENbgUEquiuqJPkQKd03D-g@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net/can: fix Xilinx ZynqMP CAN RX FIFO logic
To: Anton Kochkov <anton.kochkov@proton.me>
Cc: qemu-devel@nongnu.org, Francisco Iglesias <frasse.iglesias@gmail.com>, 
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>, 
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 17 Aug 2022 at 15:24, Anton Kochkov <anton.kochkov@proton.me> wrote:
>
> For consistency, function "update_rx_fifo()" should use
> the RX FIFO register names, not the TX FIFO ones even if

"register field names"

> they refer to the same memory region.

"same bit positions in the register".

(No need to spin a v3 just for that; if there's no other
issues with the patch I'll fix it up when I take it into
target-arm.next.)

thanks
-- PMM

