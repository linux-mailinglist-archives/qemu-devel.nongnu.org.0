Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32C859BDBD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 12:44:37 +0200 (CEST)
Received: from localhost ([::1]:45232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ4v6-0005jV-Qh
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 06:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ4tr-0003kZ-Cn
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 06:43:19 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:33648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ4tp-0006am-Nx
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 06:43:19 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-32a09b909f6so281391677b3.0
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 03:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=peV3GlwjoVNSynnq0blSFJELLxLMfliJ/fGmXGfDt/M=;
 b=eUeYgFZE7RV3IS2FWgl81fSA4l1e29UdNR1eVbztmT+Hnlvd4bhNeDvUNNErXP7kjR
 Xu0JNj1I6Vb+UturHNvvDGnqTTB5uEcXBoDZU7W2goyTPRQ5GULwAPLLmbQDNQHEIF5X
 GKcASblaCskXFU6eUsQc5FUQ+QDX01CF4IVBmPCq8p39PFdoFWL2v7Vp6bIhGPqCE/Vg
 nPotR3jCEbTkoH4iHw1hxnyouUG3N+c8xZebBf6/gUu7hDHJwGfAyc5dcRNVGN1xqin7
 hVb8pX4gpvHhePlW9USxGfTt+hRgk1zUgUYH3aQglKRh2BoMB0h0c5VTEGGyIiqqwdr8
 QWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=peV3GlwjoVNSynnq0blSFJELLxLMfliJ/fGmXGfDt/M=;
 b=FBxKj9gUTQNUT3HIlN67SHiRh5B+9saBHeJrvyY75th5KJuU+NRaf4e5SEjlagdNgV
 L7urE/u2rsd7IVbHQqUTH4MvXnbn2Y2XrZ6FxK788E2SYGP/bPvEqBr4ZkRrRRjNiXEN
 BmHxjtIGQOX9gAXpuAQG672LGOTIRSvv7IXHtQBV9eKaLTv2/9mo4KAN7L/qImQsKytg
 jEwQYcBJW0xFDejMm3oUOtKWMBlfUHCC5hwscOSRPJEW6YTV8JISm0K9YkGnll6aPl6t
 Hu28BvxvP6Hd49ee5PNFUi5YXwBq1yfA0N3OFzyy7Ty9ba9baPS7KL6M1V80kMyY8Pq1
 /m6g==
X-Gm-Message-State: ACgBeo2+jT6qc56448yq1XHp1aN4f/2K8ZhdyIYGIh4VdRC8DuJWI1e0
 2wlXqF49bQVx2azzzPt3W/QH5ZKKFIEChjKT+Gznxg==
X-Google-Smtp-Source: AA6agR4NcsX0yXskiqvXF+q2H0c/tUMVc45h2uevX85iC7YsAnWwlVEyGP1wXTQQ+agMJ243g8XgjMtyIM6zVY9SFZw=
X-Received: by 2002:a25:9a06:0:b0:676:4585:3df7 with SMTP id
 x6-20020a259a06000000b0067645853df7mr20559102ybn.193.1661164995722; Mon, 22
 Aug 2022 03:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220819174757.3551361-1-alex.bennee@linaro.org>
In-Reply-To: <20220819174757.3551361-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Aug 2022 11:42:34 +0100
Message-ID: <CAFEAcA9vLxs26kkGEzwGaSnazbtRSUwE2R4MMPBi_huZD+C9Aw@mail.gmail.com>
Subject: Re: [RFC PATCH] qemu-options: try and clarify preferred block
 semantics
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Fri, 19 Aug 2022 at 19:10, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Try to correct any confusion about QEMU's Byzantine disk options by
> laying out the preferred "modern" options as-per:
>
>  "<danpb> (best:  -device + -blockdev,  2nd obsolete syntax: -device +
>      -drive,  3rd obsolete syntax: -drive, 4th obsolete syntax: -hdNN)"
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: qemu-block@nongnu.org
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Cc: Daniel P. Berrange <berrange@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> ---
>  qemu-options.hx | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 3f23a42fa8..d57239d364 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1105,6 +1105,19 @@ DEFHEADING()
>
>  DEFHEADING(Block device options:)
>
> +SRST
> +The QEMU block device handling options have a long history and
> +have gone through several iterations as the feature set and complexity
> +of the block layer have grown. Many online guides to QEMU often
> +reference older and deprecated options which can lead to confusion.

"options, "

> +
> +The recommended modern way to describe disks is to use combination of

"a combination"

> +``-device`` to specify the hardware device and ``-blockdev`` to
> +describe the backend. The device defines what the guest sees and the
> +backend describes how QEMU handles the data.

thanks
-- PMM

