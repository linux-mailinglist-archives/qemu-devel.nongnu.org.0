Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0AF3310BE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:26:38 +0100 (CET)
Received: from localhost ([::1]:50036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGqD-0005No-Ub
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJGTl-0005Xt-6Q
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:03:25 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:45980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJGTi-0006Z1-D5
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:03:24 -0500
Received: by mail-ej1-x634.google.com with SMTP id mm21so20530035ejb.12
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 06:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1MVJ+cyJ1uJhdl/MbyCV+p1N1bsfPKT0Bxi2SNtiOuw=;
 b=BFOKf3C99KmT6eLX+ZClZbeb8MULMxd9c71juvafTDt5yFhhmZnNWsgy6V9z3X6gWS
 T5Eow1DjPoaFA5VzHEJmLJzbdre2T0ksCLB76GtKKtkCvy5ioQBJlLmfHo1cPh8BxOd/
 8VpK3ViVF8st9GCwwFLQWG6sQJQTv1qlB/qPQBHAoY7sV+nVqhtgqunWbAJ620AEVVUz
 wIn4Q3F9bBrheB26+weHHjuCBgtEGMX2kEJWLJreIK4mupT+qgiYhnI3s74WnmHgi8gt
 1LK0BDwjTKb9hAeMU/0phttDFHVYeHGKX+sN59vqO2nJZjbhNFdZe8LaYGO+xEGyGV43
 ei8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1MVJ+cyJ1uJhdl/MbyCV+p1N1bsfPKT0Bxi2SNtiOuw=;
 b=KRqxkU0OtBx6k3+MPNCx4xf1cgdIsDIPWgvUMWPnuTGOnKIDcY/mnXVl5J/uYd+XXq
 p/G8FZSKmQOPiC9JqhoqnKBcmZBjZEcIHcsu0Xg3WRDToysV4te2CxVMuXFOe0A5J8Yg
 tlYuxgM7yRxe8BiZwwP1YIOt34si4s6y7YfmmeisRqbsWdyPPZdCOb7H/vlQ5FbIRMJa
 JMxgE1K84Gry7CYodzoZ2/P55zmPLERV01co6m98R8u/HaZcn/d/c1waRQdC2IRPzwMd
 34UAdTeqtyAG0Or3XqKDH651cPq5DtQinWSGbVOdpi3KdU/ilSgnHtDFK/f59/ute+iD
 a7tA==
X-Gm-Message-State: AOAM530XX684sePF5LPep5RTMg3s4LUMZL6jefOmS7wlp0FfVhVPx2Yv
 3x0REZo59UcPq8t1sRBfOu0aT/oDfJf04v+dzEXjnA==
X-Google-Smtp-Source: ABdhPJz4+OqQ3voCN5MuzkiwfmQS0XngpQUWo92OnR+XaCdg34nYP9D90Hr5GOmvbT2DGPglvzBM0/zgidgVTRrw2F8=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr15416267ejb.56.1615212200563; 
 Mon, 08 Mar 2021 06:03:20 -0800 (PST)
MIME-Version: 1.0
References: <20210308111649.14898-1-alex.bennee@linaro.org>
In-Reply-To: <20210308111649.14898-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 14:03:03 +0000
Message-ID: <CAFEAcA9kwSH07hafgvpuKvnbg5R2uz_2mdZe6wWuYG9K0+0nnQ@mail.gmail.com>
Subject: Re: [qemu-web RFC PATCH] _download/source.html: show the GPG
 fingerprint for releases
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Mar 2021 at 11:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> At the moment we mention the signature but don't actually say what it
> is or how to check it. Lets surface the fingerprint on the information
> along with a guide of how to verify the download.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  _download/source.html | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/_download/source.html b/_download/source.html
> index 35fd156..6c2f6f6 100644
> --- a/_download/source.html
> +++ b/_download/source.html
> @@ -8,14 +8,21 @@
>         <div id=3D"releases">
>         {% include releases.html %}
>         </div>
> -       <p>or stay on the bleeding edge with the
> -          <a href=3D"https://gitlab.com/qemu-project/qemu">git repositor=
y!</a></p>
> -
> +       <p>
> +          Our source code tarballs are signed with the release
> +          managers key, fingerprint:

"manager's"

> +          <pre><code>CEAC C9E1 5534 EBAB B82D  3FA0 3353 C9CE F108 B584<=
/code></pre>.
> +          Alternatively stay on the bleeding edge with the
> +         <a href=3D"https://gitlab.com/qemu-project/qemu">git repository=
!</a></p>
>         <h2>Build instructions</h2>
>
>         {% for release in site.data.releases offset: 0 limit: 1 %}
>         <p>To download and build QEMU {{release.branch}}.{{release.patch}=
}:</p>
>  <pre>wget https://download.qemu.org/qemu-{{release.branch}}.{{release.pa=
tch}}.tar.xz
> +# optional verify signature

"optionally"

thanks
-- PMM

