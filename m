Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B734593AE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 18:06:22 +0100 (CET)
Received: from localhost ([::1]:34536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpClp-0003Ti-4L
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 12:06:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpCgM-0004oz-5N
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 12:00:42 -0500
Received: from [2a00:1450:4864:20::330] (port=54191
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpCgK-0000th-7o
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 12:00:41 -0500
Received: by mail-wm1-x330.google.com with SMTP id y196so16075279wmc.3
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 09:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eSlNkQ5tLTr4RM4eeeKMGrEq2tIF3brO5Xh3rwX9O9U=;
 b=Re1x7g5okwdGCOm9CsXCks59pMozFvRCm5ald63Q9KgbPtmatfsrCyBeC06JrdU5an
 ml3kI4VrkRN6KYdDY3Y4vPDRkTc3f8hF6N7CBYPzQ21NGdUFh0ACC7CVZe3bgF4oSdTZ
 l8a/7aiGDr2nKcDRFttyGmAg2TCtmSFAvQ2XwUcfbrflIhWH8Ydf0gi56GnBmZCfyIcQ
 Y9+x8dp1qTgv0hL7NCMwCG2JYmJw88a5savHnOyRfGzF2MwqoFgEtwt94MiLsMG90N6r
 cvNM7SarlFr6HOCn+GkHBcFk4h140rLiw2GxQ2hjL5WwV+P6WfRjiUNXMd9C47pBt1Xr
 pYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eSlNkQ5tLTr4RM4eeeKMGrEq2tIF3brO5Xh3rwX9O9U=;
 b=Q9lkNm8NlnQ+KXKZGZPB4KNROzu6xBzlFDNXcXqvHyyFgfaBe91uVy3qP4l69IGPev
 +Tq9m5clK6oNsKHtSnhlHAOHGGGN35CJpqb/AyNE8dO2S/wDm5qVs5bVJcOpQ9om3oV6
 okDgmG9oVm93VcU5EZdKilh4RUIO8yXxwbpJOVSdpLs5e1S5JzrG27frRwe1IugIDT9V
 gw9J3h1TvBHflsDFNcXeEASEKYyva2za1vGLcNqgNNaRkPQR/weOKt5LcJNjiQnZk0Fg
 IFpY1MBUEle0LAO5hj0AbVp6pCKjpi5jpw/A7dYe/Ue8idO+PxwdbEYY5hO+99Hu3g4U
 CDLg==
X-Gm-Message-State: AOAM532A0hv/bMLppk8oJDBpiyauJB5fAHW7nPmYHbd8pQ1pkbSjs4sj
 ++MWFUon05bCJaA2OcormqHtoSiJEd5urb2UsXBBXQ==
X-Google-Smtp-Source: ABdhPJwoKUtDYYK/tObb08BDmfCCyB6pc8EB6CnYYgEti/ZZlJ/yLoeRj7qZLahrlA9MCoYcZBG33MqSaEQKR5vHJ/w=
X-Received: by 2002:a05:600c:22d0:: with SMTP id
 16mr31833578wmg.37.1637600438654; 
 Mon, 22 Nov 2021 09:00:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1632437396.git.fthain@linux-m68k.org>
 <e0411348-abd7-3db9-b5bd-8f1d52c1226f@linux-m68k.org>
 <2fb3d9f8-0f20-082d-d9f1-ab2984356866@ilande.co.uk>
 <ad537ce9-ec40-b5e4-bb32-5f53e42db29@linux-m68k.org>
 <74d1f17a-d414-8cda-6720-a62617613215@ilande.co.uk>
 <8b1022bd-f4ae-d0bd-3f22-425da56ef753@linux-m68k.org>
In-Reply-To: <8b1022bd-f4ae-d0bd-3f22-425da56ef753@linux-m68k.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Nov 2021 17:00:27 +0000
Message-ID: <CAFEAcA-h2B3JELSrQs0dP3shqPNDe2NDMqCqT5oGoOjjM6mzRw@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] hw/mos6522: VIA timer emulation fixes and
 improvements
To: Finn Thain <fthain@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 Laurent Vivier <Laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 20 Nov 2021 at 23:40, Finn Thain <fthain@linux-m68k.org> wrote:
> Anyway, thanks for taking the time to write. A competent reviewer has to
> do much more than that, but I'm not paying for competence so I suppose I'm
> asking too much.

Please dial back the aggressive tone here, Finn: this kind of
thing is way out of line. We're all trying to help improve QEMU here,
and sniping at Mark is not constructive.

-- PMM

