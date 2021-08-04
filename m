Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928983E073D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 20:09:49 +0200 (CEST)
Received: from localhost ([::1]:39258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBLKu-0006QD-K0
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 14:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBJCf-0001PW-RA
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:53:16 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:45046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBJCU-00009H-KA
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:53:03 -0400
Received: by mail-ej1-x62b.google.com with SMTP id yk17so4396729ejb.11
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 08:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U9ZboniIHK4+WhyP6R/GtOHECpKO8fE4tOUMsQSAJu4=;
 b=teXk91NEeU4r9PEUTJwQNvqGFP/5r/NH4bDvQ86NEZY8ExZblAucW/E8WCyvsatoiK
 KpnHhOpFwxW4WW/cTQGlcvUHwT+qB9LEl92ALWloG0cyJo0aaK/Cd8FZmdL8cl0oviPK
 mH1oG8rhq+kWRK1hjpo5SaLfGk20HrjremTFAR3VXsBlkKBhoUWJ06+QymGiH1ppvBkD
 M5L2xOK/Je2cWUAUfmOc4YgTMchgXBSGzu0D22K1OjKKwcUU768rA/CPazNd0YTPC9RG
 5+5KX04ic+sTCaQTJCsYtRpJacTafOB+GKbeYs4AkQ/CmGzWNLB8r1wnXb8xSNJn8iDy
 mE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U9ZboniIHK4+WhyP6R/GtOHECpKO8fE4tOUMsQSAJu4=;
 b=a24Uyhgdown84EO9aCx0uzrAl8H9TZVDyHzoHgaM8vyp8Ngbd5v2SOZnaY2Q9UjXDT
 4URFdexmxR2Na/fKH2Ea8ZsuimXiTrYEs18qmaNoa0D7Nsfsky03cHCV+Wh325tclOQV
 hU6WR7EGz6ncjwQjwbN1Tu0GvAVvUmXJlfLNihVVBKj7y7dfMZSPLfeooqDhO3vDsi6+
 oQ01XM5/Y/26WYq5GWOT/IiVykwxXgC8EYjYVgfSutkzTDQHJ6lj98ob51dihvnfJjUM
 VctWHkEhaGyJ6xBY1O9SuvYlE7Os9/tirNVaOpluCHazPia4Jtg28mgp42VGa0lsK+i3
 FOzg==
X-Gm-Message-State: AOAM533S8ykMnvTPo49X0PQbS3sEtCAU5dUzdIFnmIJ7bpcN3USZFuW2
 eLhR5WXo9xVR6AlvFrgctj3ZHyFgPNPQgJ2nIfNE3Q==
X-Google-Smtp-Source: ABdhPJx5/OEaWGfU7mLtQMKQ9+SQhtZ36zdi5CqoPwNPz0kCB5pmskubKIxfPwQGd2sjsR2bEl7yjXvnu2H29aGCRSo=
X-Received: by 2002:a17:906:6cb:: with SMTP id
 v11mr26311455ejb.482.1628092376377; 
 Wed, 04 Aug 2021 08:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210803205043.165034-1-mst@redhat.com>
In-Reply-To: <20210803205043.165034-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Aug 2021 16:52:12 +0100
Message-ID: <CAFEAcA9=URQnbnQJuicV5_vvwCX2mmZtdN_Ncq3G8sCPLEg0tQ@mail.gmail.com>
Subject: Re: [PULL 0/5] pc,pci: bugfixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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

On Tue, 3 Aug 2021 at 21:52, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit f2da205cb4142259d9bc6b9d4596ebbe2426fe49:
>
>   Update version for v6.1.0-rc1 release (2021-07-27 18:07:52 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to 62a4db5522cbbd8b5309a2949c22f00e5b0138e3:
>
>   Drop _DSM 5 from expected DSDTs on ARM (2021-08-03 16:32:35 -0400)
>
> ----------------------------------------------------------------
> pc,pci: bugfixes
>
> Small bugfixes all over the place.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

