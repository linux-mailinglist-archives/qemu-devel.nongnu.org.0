Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EA7292A5D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 17:27:10 +0200 (CEST)
Received: from localhost ([::1]:32774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUX41-0006DM-9l
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 11:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUX0R-0002VV-BB
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 11:23:28 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:35624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUX0L-0003xq-CU
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 11:23:25 -0400
Received: by mail-ed1-x541.google.com with SMTP id cq12so10694709edb.2
 for <qemu-devel@nongnu.org>; Mon, 19 Oct 2020 08:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rEF8vCp0ne68s88LSiZAalVd6SH2xeZNXOAKExoOtKE=;
 b=kr5wNKDm58CZNtiJgvXFBKp9c3+gbXYA62C3UKX153CcgyvaEFH5t2Jc6JO+3O7J6I
 4BpYo4iLK1ZMb99ku2yfMys2bo5/ZtRRUdyvisTUJpr9HmIPTJxjLXBXWzLinZhPgiL0
 AIMaSw0ENxU3tEctr6sHY/E63fzbO9tXLaIsn5z5mlSWBuDLz+8Kr5ZaVqKxtMEVsHp7
 qAy08+fk9v4TZDWhsFNLFNe6ROKDTc0pLD4Ve7c678ei2f7cM5ch/l2/F+qjVuqx8OkZ
 cRnrAd6g5ZySAufzy5ziCqRBjfoTxzi016RnR9iimL6W98U6QXe4ln43PfC0tPA5TpFV
 oG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rEF8vCp0ne68s88LSiZAalVd6SH2xeZNXOAKExoOtKE=;
 b=Gj6nThL30mZwUMhGaCJbG79de2uYwOrsvqJFspHARXHq1mq4WYIsbKFmkplB0RbebV
 oukzyDwihPVDbt+phNsKcLejz9qT3tIfSJdMWiLBWeLo58kVv5mkxZnhYe+xqoFpz3EU
 w+shFybW2NOazvlyNZkRIVyc16+Q0jyZifQBH4RqdupnzgDZW/SFKvBNU60HoyK9kLi5
 4Ff5pfVtT7SSV6iFFe6S2bsg5UEhvEIxdoOJewB1S262mAJRHW8I5F/WGV3LeVTjLQfw
 YeHKaxpatylZF22ay14djFYLpQM5x4byNP1w/US2CHk5ODe9iLEXtqi7E81uMupoQA1A
 8SWA==
X-Gm-Message-State: AOAM531Qv8VwBfcoy7QOcMRAcv3Dnuq4Aw3QRQe1/8+OLwmNi9eEbVXV
 dllDERDgVkihzlMKdVFua4EdyGQqDBMWd7RDVLy6sg==
X-Google-Smtp-Source: ABdhPJwaSQo4DgM1Frso9tKu8F1xU24jTB4teY1uN4/mTvMq+DtdJ/YnxqhkFXaUcuzRT1YsqTZUpAF1kYgnpgah4mA=
X-Received: by 2002:aa7:c7d7:: with SMTP id o23mr353827eds.44.1603120998221;
 Mon, 19 Oct 2020 08:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201014213601.205222-1-f4bug@amsat.org>
In-Reply-To: <20201014213601.205222-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Oct 2020 16:23:07 +0100
Message-ID: <CAFEAcA9GxfBR-vFeT=QdmRwD1Y_6orED1bruXEsvyD73osV2WQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/strongarm: Fix 'time to transmit a char' unit
 comment
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Oct 2020 at 22:36, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The time to transmit a char is expressed in nanoseconds, not in ticks.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/strongarm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
> index d7133eea6f9..ca7c385f313 100644
> --- a/hw/arm/strongarm.c
> +++ b/hw/arm/strongarm.c
> @@ -935,7 +935,7 @@ struct StrongARMUARTState {
>      uint8_t rx_start;
>      uint8_t rx_len;
>
> -    uint64_t char_transmit_time; /* time to transmit a char in ticks*/
> +    uint64_t char_transmit_time; /* time to transmit a char in nanosecon=
ds */
>      bool wait_break_end;
>      QEMUTimer *rx_timeout_timer;
>      QEMUTimer *tx_timer;



Applied to target-arm.next, thanks.

-- PMM

