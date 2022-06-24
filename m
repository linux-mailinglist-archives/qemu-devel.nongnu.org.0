Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C8C55980D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 12:43:50 +0200 (CEST)
Received: from localhost ([::1]:40370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4gmy-0004rM-Pw
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 06:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4glm-0003tQ-Mv
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 06:42:34 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:35503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4gll-000505-9G
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 06:42:34 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-317741c86fdso20738587b3.2
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 03:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t+Byo1b4X9Vbz/m7CyDm8kInKMKO0y+GBykwADZ8WmE=;
 b=TQ0l6TXsTnX4C3Z8K73saa/OV9zdzb7o1WStXBQDX6AadaryI4yw7JjhkrRJzqPNn6
 mtTSkllyAcQej8hsdq+9lvQUDDX/0W3HzZv9haS+SqlE+J9aDUVx7r3EB5VxtfvdGmxo
 ff9suaD1bYTOTTolUJg8suBUxodExgv0+BHwRuz6r+hJjIX0CZI/hHAN6PVN4EZYr3fr
 W8nkqODphPaiYsarIRIxS5w0asNpt0T2JzMws4Zzb56ayJzDrR8ASK2fKfNclbi9Nddy
 xuCKyve1c3NVQZs8mSDXx8HfzosVTzDzDWAiJlKqQWoRgN/EqGITmgPLijtXZeDNDW/F
 8A4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t+Byo1b4X9Vbz/m7CyDm8kInKMKO0y+GBykwADZ8WmE=;
 b=ythegHXE89LP0rmaQfTqysY++0h6gbYh9ZmVgs48UumSgci1Vgtrm7+7O2JYnCp846
 sY48JWYqKGKogH53KjpDZQomHv4aH2Q49alIeZHYC+zq6tJ1cKR20DCpfTGTr4XJZuAf
 QlAGz1u8crUrInGXdFVZRDrTwalOmCt/D2YyZJPjv5p6r0dh+JTRH6U+aMnKJev5fr3M
 4j8HSDASbYLU/PFke25P1FV+Xh4lM4dxSimmQM8q42xo+w0w1gpfYd9AduU3i+zsupRB
 qk2XQ1zdl4LA4gCmF0NtwbzV9BJIrptt8IPXyczUhRXexDLQF81J3wrfdYCrB4uh4zPC
 H3eA==
X-Gm-Message-State: AJIora9m9osyU8PCfGdDCMDoradRHtlrFW/kfTxhyBO632cw19jMGPpw
 DXZ3ERYtmyxn5YaUERD7C/EhWQIrsNSlaef55oBM0A==
X-Google-Smtp-Source: AGRyM1sq+/2VjBMF5dFg09mCn+s1Qdjq3iIBMrleMMhwNzQyYBgetjTSfEuoJKDinF7P8RioYadghPn+2sUqZUWqvaE=
X-Received: by 2002:a0d:ca0f:0:b0:317:a2cc:aa2 with SMTP id
 m15-20020a0dca0f000000b00317a2cc0aa2mr16667139ywd.347.1656067352203; Fri, 24
 Jun 2022 03:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220616141950.23374-1-Jonathan.Cameron@huawei.com>
 <20220616141950.23374-3-Jonathan.Cameron@huawei.com>
In-Reply-To: <20220616141950.23374-3-Jonathan.Cameron@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 11:41:54 +0100
Message-ID: <CAFEAcA-rmDrMcq-s4X68dSSWwhwHcY=5m=20wFZSJ1qKm7gfjA@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] qtest/cxl: Add aarch64 virt test for CXL
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, qemu-arm@nongnu.org, 
 "Michael S . Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, 
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Adam Manzanares <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, 
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
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

On Thu, 16 Jun 2022 at 15:20, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> Add a single complex case for aarch64 virt machine.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  tests/qtest/cxl-test.c  | 48 +++++++++++++++++++++++++++++++++--------
>  tests/qtest/meson.build |  1 +
>  2 files changed, 40 insertions(+), 9 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

