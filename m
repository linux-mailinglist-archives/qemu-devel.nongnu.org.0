Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DF432A3BD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 16:21:28 +0100 (CET)
Received: from localhost ([::1]:40630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH6pz-0007Uy-OD
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 10:21:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lH6mM-0003NN-AW
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 10:17:43 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lH6mK-0007l8-4l
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 10:17:42 -0500
Received: by mail-ej1-x630.google.com with SMTP id lr13so35898975ejb.8
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 07:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lDHSOwoB3DF85CURsO1UnHHI9zNq+F9HcAIiKIfbPv4=;
 b=GVZUJ8rmtsggVUyN64agfeMnfCZwYZNcpxvc4K6HuQ0FxXzslQOVY2eawH2d06ZJVz
 3bimOMNnR+BTYHjquzcrzaIM5riuHHWNSRH+/RvtvLNnVF6ya+K3QCeN9Q07n47AHWPC
 iYV3RSddyDAQRywfkkiTQInUSHMIrox9TZzBiBI/+P0GgYLsxInFOw+XtUjpTSV/Eiyv
 fvouGSq872Fw6nSXqbiv2Sijs07wppoGIOF4iAI1jEosowObvhidW2sAE0Vti/t30pTU
 p0/j+s98HU+WmmkDI2NdSbMqqCNMVyYrf5Rnt2M4lO4hayB4MMIAC0meoEm80o0DDy2T
 lBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lDHSOwoB3DF85CURsO1UnHHI9zNq+F9HcAIiKIfbPv4=;
 b=Pw3lh/4gk2GUfHd5cQmpYR9l46H8e6VKyQq5XN9XDX/kd67aOIDTddeHkSgC2s0gT6
 29UThZT37UF4dpIt0W+GhheTpWvfudBa626DpQA16D1c72gdwvcv6UPHnDya3DNhr25F
 DaQ0DnbsIk95WvraXi5gE+44HBVtirURST6JwGJ4rrMFPAxbyN1NZh80Rrf522TfCqyc
 aJbHW6kYAQ68spEUv4w/WF17XJ2z6bUl1dj5GeNJ3gXJ5YZD4Y/xTccbg+Hb1lHD2lkN
 WIePQL+QYa5DpBAi4koGan48C15VW9yUVtCz84wcS7/PEhXdEAfVI7/07+DtwSilKasX
 PHdg==
X-Gm-Message-State: AOAM533vMaKY+OBjafbTpAkZN+zLSpjl8I4hmjiza4WM4ClxkgqB0Uwh
 pBds/m/kbtpWBIo7ifzIQZbFfRWuFIZUi2O8T6wy8HODyC8=
X-Google-Smtp-Source: ABdhPJxAAcDj2y2fUB0VJA8ifA3sVhcqMh7SvmFfWLiRsK6IDSaMQ+9VUwO3eINLZxwmNx6hsLCrHdajLTQCLs1hlUQ=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr15568077ejc.250.1614698257921; 
 Tue, 02 Mar 2021 07:17:37 -0800 (PST)
MIME-Version: 1.0
References: <20210224114926.6303-1-alex.bennee@linaro.org>
In-Reply-To: <20210224114926.6303-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Mar 2021 15:17:23 +0000
Message-ID: <CAFEAcA9V5VFPPSE=mUGCuZ4gPZKCwbWrmK2m1tFfMBSxGbAMSg@mail.gmail.com>
Subject: Re: [PULL 0/7] testing updates (build, docs, dumps)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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

On Wed, 24 Feb 2021 at 11:49, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 7ef8134565dccf9186d5eabd7dbb4ecae6dead=
87:
>
>   Merge remote-tracking branch 'remotes/edgar/tags/edgar/cris-next-2021-0=
2-22.for-upstream' into staging (2021-02-22 14:20:32 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-updates-240221-1
>
> for you to fetch changes up to 93a11007681a8051c07834c52d785a2948ff9632:
>
>   docs: move CODING_STYLE into the developer documentation (2021-02-24 11=
:05:21 +0000)
>
> ----------------------------------------------------------------
> Testing tweaks (build, docs, bumps)
>
>   - expose cross compiler info in meson pretty print
>   - bump Fedora to 33
>   - "graceful" handling of missing virgl config
>   - updates to the container documentation
>   - move CODING_STYLE.rst into developer manual
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

