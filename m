Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221FC4A4F84
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 20:35:04 +0100 (CET)
Received: from localhost ([::1]:42238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEcS7-0000PU-5H
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 14:35:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEbwz-0007x2-0N
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:03:07 -0500
Received: from [2a00:1450:4864:20::329] (port=43712
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEbwv-0000jy-PJ
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:02:52 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 k6-20020a05600c1c8600b003524656034cso38006wms.2
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IykYQq7VHip9MGIFgCMxIkdWswqJEX1vYfnwkn09TvY=;
 b=jCvthlkgTlc/q1OIZK5oV4l2/Wjqpy+xSWmDe9siVr0aImB84b5iuRbAmueS5Wd0Uz
 Q5z6WKW5rjrbPTGxCfMVXGi59QEnVvV743ZjV4FWSSPfx7AaW/Qyt58k7hpckErq5nSW
 d/X0oEOejkjwOiGY4XRYMuPoOIKZnzdq1H8AUhrvjzm1EcdojhvjqU2CX/Njn4QSi+pj
 W2kUb+io1rRUa+5VdI29wSIwK0hYCD0pQ4z1rkR1kxdhjTe5b4fMnbI+LAA09Ju7Oofc
 eIEL0CFM9cQoT3rC3zgXTMBGtG/rYHQC4cMkhK4Ki2wF+v3y3s8oxzzkAi7kE4nxoaln
 QL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IykYQq7VHip9MGIFgCMxIkdWswqJEX1vYfnwkn09TvY=;
 b=dFfFt7oie9/U+zZfRqgroEhtKDML6jiBWKnvQDJLYmNm50eFvxU/c/dXjLyAnICTpm
 Diz/Ea3d/gYh0k6lpiX+iqV0U7uIPcJcyez1/7sAxClYkuo9Hq75xlt51LXQbziZlB5I
 +0fK/xigC3fNlqPlSm73S9G1hQW0py27QUpgRO+hjj8C9/uE8eeRTmOez6ND/3CPtPJr
 XJpk86OO6qlG1l4m/wTYddjlZNHzMhNFpDGp6ZJb/LCS/acypGL2t0u1T4ItXnA4XqYk
 dLdIu6FuPEXYsLaiS80BHY0W9OMj8Nii/HTK4Ud2Bpkm4r9V5j9stoMHM+v1rHBpfgIP
 g1JQ==
X-Gm-Message-State: AOAM532BA0HIZEWgy2yaF7nHbtEv6AEDNXbWE3MUm/5A7lMewSSZtsWR
 Z5U2/kD//dqyM27Hl6okM5Q4w5vKIjK+CA5p9SfsUQ==
X-Google-Smtp-Source: ABdhPJxOgH+gptzU+JC5iMDJk4fihcqOlkIYMaXwRKttLZ9VLRYyljojHuUQ7+VjlXUCy9ASc/5bGJBefUhKGsCZbv4=
X-Received: by 2002:a05:600c:3552:: with SMTP id
 i18mr8652268wmq.21.1643655766791; 
 Mon, 31 Jan 2022 11:02:46 -0800 (PST)
MIME-Version: 1.0
References: <20220131110811.619053-1-clg@kaod.org>
In-Reply-To: <20220131110811.619053-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Jan 2022 19:02:35 +0000
Message-ID: <CAFEAcA-dX=T6_6iJ76fkPbQA=OSBXzNLSZQ=7gGTMLjCuv1x2Q@mail.gmail.com>
Subject: Re: [PULL 00/41] ppc queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 31 Jan 2022 at 11:08, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit cfe63e46be0a1f8a7fd2fd5547222f8344a432=
79:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2022-01-27-=
v2' into staging (2022-01-27 15:45:13 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-ppc-20220130
>
> for you to fetch changes up to 4537d62dcece45183632298272abfb4859418cc0:
>
>   target/ppc: Remove support for the PowerPC 602 CPU (2022-01-28 21:38:17=
 +0100)
>
> ----------------------------------------------------------------
> ppc 7.0 queue:
>
> * Exception and TLB fixes for the 405 CPU (Fabiano and Cedric)
> * spapr fixes (Alexey and Daniel)
> * PowerNV PHB3/4 fixes (Frederic and Daniel)
> * PowerNV XIVE improvements (Cedric)
> * 603 CPUs fixes (Christophe)
> * Book-E exception fixes (Vitaly)
> * Misc compile issues  (Philippe and Fabiano)
> * Exception model rework for the BookS CPUs (Fabiano)
> * Exception model rework for the 74xx CPUs (Fabiano)
> * Removal of 602 CPUs
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

