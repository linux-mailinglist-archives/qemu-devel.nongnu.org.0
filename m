Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B66C54432AB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:25:52 +0100 (CET)
Received: from localhost ([::1]:49990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwbf-0001Nf-Sm
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhwUO-0005tG-Qq
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:18:20 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:42721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhwUL-00012d-Pj
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:18:19 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so2502073wmd.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 09:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X4Kfbwl3YfX0VLC2hzpZ3G3Nko9TEJvVN9IW5JM4X0U=;
 b=eElxsrwgHikA2EdKQ9djtCXEEyPR4LAHCgeCyDphnl35//UanSpl0ar/VelIxQOq+x
 JwX45APVCcnp2CqA+tG6x1NbuCUNcxd3rt6tkvPPG8yFSmlX1a2DGi06KvwUMfQQAA1C
 OPtJ0j0J1GPMrF5rfFs9bVpyvWEG4lL23j4bQjv+t793ufm3oz79cyxN9bIh+Up+WytI
 l88uBXqNmN1sZt+XDKebUeQZKu4eP8jXZWV1CWyGWmwY4FZtdgd1F0iyC190Yklb8rvs
 uRIQmUCAi7Bf8toIYTnoQ2B+Q+R796VT/IZaRCuJZQI9JShK2VMZbEov8v4P+pSXSFKS
 m20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X4Kfbwl3YfX0VLC2hzpZ3G3Nko9TEJvVN9IW5JM4X0U=;
 b=65FyIMph8Awc3PFsaiWBRD6hXJqIgj6BdZ+xuRBYCThDtoUU+kxFEHwIgxui6fgFQq
 T/V+CGDQtc3X/DFEuM9/Hty4Yt3bV6U4gfYSLb7s8BIOvlUZ9XCAD6J7gXRhkCa1PNPr
 iBe+KUP7MMTMjTfd537fnyrHYJHd8DoiBPmAO4M9swxxjPULm9PhXmCwcWC7o2Gwi65y
 jFEnOJrEasqseF5Oni+nraoAYTTpPnch/Z35Cq4Lm6AzImWPoeKmeO4hP7QZYkktNQw/
 133s3Cl9ZYMF8E2tYc2pWMzrAnA2WSYw6r6V6gQbytgMMrapjM5XXokvs34j/MelRo8U
 0XXA==
X-Gm-Message-State: AOAM532RQOflfazWrETI+y9tyeGWSOedmiXbj/h/cDPkyoA8he3jA82B
 +COYz+vlGT9PZeNY0RY/z/eqw/AmDE8oyKm6ZhBZMw==
X-Google-Smtp-Source: ABdhPJwKTWzTYVn8vB1+mqXHw3Mk7QL/KhScJuz79BbxnMTY9JFBNT801ubrn4pNI+NZ/wJFnUBfrqNe6yiopk97va0=
X-Received: by 2002:a1c:f712:: with SMTP id v18mr8410548wmh.37.1635869895050; 
 Tue, 02 Nov 2021 09:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211101183146.684471-1-clg@kaod.org>
In-Reply-To: <20211101183146.684471-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Nov 2021 16:18:03 +0000
Message-ID: <CAFEAcA__8Rmrie2FSf+WOs987wZf4pa8rC5JXuyMA3WBQVe=Bw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Change status to Odd Fixes
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Nov 2021 at 18:31, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> I haven't done any Aspeed development for a couple of years now and
> maintaining the Aspeed QEMU machines has been a side project since.
> I don't have time anymore.

Thanks for the work you've done on this over the years.

I guess this means I should start picking up aspeed-related
patches into the target-arm queue again ?

Are there any currently on-list aspeed patches that I
should put into my to-review queue, or are we up to date
at the moment?

-- PMM

