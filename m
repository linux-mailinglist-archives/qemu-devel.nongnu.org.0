Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44004C46F6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 14:54:53 +0100 (CET)
Received: from localhost ([::1]:45784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNb3c-0003X7-DX
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 08:54:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNaB4-0006PS-BH
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:58:30 -0500
Received: from [2607:f8b0:4864:20::b31] (port=36392
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNaB2-00016n-7n
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:58:29 -0500
Received: by mail-yb1-xb31.google.com with SMTP id c6so5718101ybk.3
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 04:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MBA9X+tj5k99ZoCCB8ylpBQixOnsz+q7Wjt3ZnHuvK4=;
 b=iFgHV7JBKmTLBvmAYGP9t0/MleBIOmEWoJVJrCVBTqF3T1Ofn9wKkDj8J9dmbXSH8R
 2SUCgyJn/Ud4KmGKm4Rs/LNsC4SMLnzhpUEmqG9pzVAkhTjipAO6p9fotSauUQG6lzHf
 6VM7qTqG6iNBv25nnSsIckvrYrKxmvcACFAEqgcAK6NiCqcQLv5OwcuJ3Ab1AyLlRn8d
 aguafqnrXJXYuag4BHyaWLY3+Tc8T2KWlMx709c6Z98kPOMvGbaJZn7ZJaKADFOb5ltl
 ce2aZSigG0B9OMv3MDdjwULdPApm/mkBC0qxU/f6bmbNP1ZM3B6AQDzwVrRySp7g7NAr
 1E1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MBA9X+tj5k99ZoCCB8ylpBQixOnsz+q7Wjt3ZnHuvK4=;
 b=CflNh+xSH7GdiQq3XditzSgTUTvnsJoISp6HjHeGtUIzCPSnZTOrAf5pIsKsiohT0Y
 B8n06ZlvtLwZuNCl6ODzaSSf5MHUWHqzG/YrQ+cNGNiTbJ8ZHB//A85VaD6MzKGh73UV
 wODNdR13BfgW2D+ZUYQeMMVmcWioOpub0b9uco1GOPjr+QmsZulakY4UB5JGPtB5H4cg
 /4jv/+Kl+anhJVCcPwq/wP/JzGJYHFtqzXlTxKbf3zl+/nPvSzOGPJ4uRCLXzRDpBj9B
 +815OoPeZ1lw098u7FeGE4ztjbNMhVOTUIYuMM7iTMfIMG25jTltluDLKfBOM5JmvCiL
 YfmA==
X-Gm-Message-State: AOAM5312BIhBaPZJwkppIuO/Cy5AtjSD59iZqgcIuNVLh1sW8N67gxMm
 0l+Nq8UoEbYsYMjigoNEwfh2sY7U+2ydGsuszV4B9w==
X-Google-Smtp-Source: ABdhPJwvT8HnmEvadi91SzR8SQVWGbsNOQCs43O6mLE/86sP4mwQThZVG9zuV49fa67ssS3Lda2Z70Md3F8L5SDMWfM=
X-Received: by 2002:a25:8084:0:b0:5fe:cadd:2532 with SMTP id
 n4-20020a258084000000b005fecadd2532mr7071555ybk.193.1645793907308; Fri, 25
 Feb 2022 04:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20220214185605.28087-1-f4bug@amsat.org>
 <20220214185605.28087-17-f4bug@amsat.org>
In-Reply-To: <20220214185605.28087-17-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Feb 2022 12:58:16 +0000
Message-ID: <CAFEAcA8vttdUF9QiZYjOfs+mAq3Q3ksYnn-_5Dq-wwTEcwKArg@mail.gmail.com>
Subject: Re: [PATCH v5 16/16] gitlab-ci: Support macOS 12 via cirrus-run
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Li Zhang <lizhang@suse.de>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 at 18:58, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Add support for macOS 12 build on Cirrus-CI, similarly to commit
> 0e103a65ba1 ("gitlab: support for ... macOS 11 via cirrus-run"),
> but with the following differences:
>  - Enable modules (configure --enable-modules)
>  - Do not run softfloat3 tests (make check-softfloat)
>  - Run Aarch64 qtests instead of x86_64 ones
>
> Generate the vars file by calling 'make lcitool-refresh'.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/cirrus.yml           | 16 ++++++++++++++++
>  .gitlab-ci.d/cirrus/macos-12.vars | 16 ++++++++++++++++
>  audio/coreaudio.c                 |  2 +-

This coreaudio.c change looks like it should have been in a
different patch ?

>  tests/lcitool/refresh             |  1 +

Was this the change that was supposed to be in the previous patch?


thanks
-- PMM

