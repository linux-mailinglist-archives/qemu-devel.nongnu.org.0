Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134B92C0807
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 14:05:58 +0100 (CET)
Received: from localhost ([::1]:58980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khBXY-0001fj-JT
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 08:05:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khBUq-0000aC-Nd
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 08:03:09 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khBUn-00071j-K7
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 08:03:08 -0500
Received: by mail-ej1-x62a.google.com with SMTP id z5so3066718ejp.4
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 05:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PMPDLd1nYSdf15xJQ6qCTp1U8CmOEU0xBj1BC/VgN2Y=;
 b=Wu4z3eIjFTIytiFcyD+QbjbWzqk1OvAGfxQhhL3SLSyOyrbqCsKdm5wMiHoPyNzrhl
 aH1kmCeBJnp2qXWxwAC/JlZZDBWUfjVRxZmzBdE31y4y7uihqNcbmQ8EFAGKAP93IhvS
 3OCbZ86d4cgTHESsAMsdKmZVqpGl6eUHm96Q3p55RMtT5J5Il3UZZsSMmsk/lxy+ZsH+
 vC8k+YUrAgHNd37EvspNcPowMuZxauo+IgELI9iQeIG0vJnNKNgcSsX1/y4lKu8G0uj/
 9NWk1JocAOQowG3W3Xr1MRMKWookfOYG3EwyWDdb5MhKL65H2U2zAkvfW2GnUICTp75s
 hSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PMPDLd1nYSdf15xJQ6qCTp1U8CmOEU0xBj1BC/VgN2Y=;
 b=AWLKGWHgIKMtDqr0dLbfoK4muXkQDd+VVjunZDFLeQjXy2tpdgEx4IWcKCq5YStsOu
 PA1tIvXyonl9doLUObzvJgCiI8gV/tm5m2GlulyiLUvRO89a4BrGR5jbkNlehOC+GWCB
 A33P6E7anSrBVhosAWAEII4jgubXf8Jsg0VWZzOznrhoTlgpxYRuDpGr6mha+3s4NYNI
 WwMlI7YfNgQeWfG6tKIZio+5T/yKZn2POIiJ6kk39baWKbMkc9IukmRX8ZP+Qv0iokAk
 5WhAwyBVrP0uICFPSz1ZPYsELtJ67amb+TigWL7ziVKru02eCLqvXV5MRcPFr8qcHj3c
 9MeA==
X-Gm-Message-State: AOAM531tXpI1NOEe1tyxpTqQZ9wp0U1KIx3D4T1Yw12gPVv3Kj71+hT6
 HH/Ote4o/Hzg0NcfTSawajHZieUDZghLxFsDaSaqZA==
X-Google-Smtp-Source: ABdhPJwsdIHezmxLKinwBJQYcrkqaIK4tu3jEg1+lbqi4LsJCdR1cR83oZv+K4pFJtLosb8EpI1h+vtX3crSsY9ELZQ=
X-Received: by 2002:a17:906:5a88:: with SMTP id
 l8mr42531493ejq.407.1606136583767; 
 Mon, 23 Nov 2020 05:03:03 -0800 (PST)
MIME-Version: 1.0
References: <20201123112518.13425-1-alex.bennee@linaro.org>
In-Reply-To: <20201123112518.13425-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2020 13:02:52 +0000
Message-ID: <CAFEAcA81uqHg5dMjDS7Ehh+XdgdaOmqNsK7SKB4QLNJM9rkjVw@mail.gmail.com>
Subject: Re: [PULL for 5.2-rc3 0/7] various CI cleanups (scripts, avocado,
 gitlab)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Nov 2020 at 11:25, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 8cc30eb1400fc01f2b139cdd3dc524f8b84dbe=
07:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20201122=
' into staging (2020-11-22 15:02:52 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-for-5.2-rc3-231120-1
>
> for you to fetch changes up to 534f80e1dffbf520bed9bf5fd5ae98de6662e126:
>
>   .cirrus.yml: bump timeout period for MacOS builds (2020-11-23 09:55:25 =
+0000)
>
> ----------------------------------------------------------------
> Misc CI fixes:
>
>   - more helpful logic for git-pipeline-status
>   - fix tempdir leak in avocado
>   - move remaining x86 check-tcg to gitlab
>   - add tracing headers to ubuntu2004 docker
>   - move tracing backend tests to gitlab
>   - bump up timeouts on cirrus MacOS
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

