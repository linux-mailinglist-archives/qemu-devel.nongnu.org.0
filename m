Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3139B46BFC6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 16:47:48 +0100 (CET)
Received: from localhost ([::1]:39324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1much0-0006Jj-OR
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 10:47:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mucfU-0005N3-Iv
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 10:46:12 -0500
Received: from [2a00:1450:4864:20::32c] (port=34546
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mucfN-0008OZ-Nv
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 10:46:09 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 m25-20020a7bcb99000000b0033aa12cdd33so1850672wmi.1
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 07:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uvnNEM8JD+Q+EFbLDOX+y9losyOBY049XcucY+k/TcI=;
 b=XcTt9QTubQund5m0rXC/jfwf3bCZjAS+WUbbfz1dIptglQDXCRkSSsWj+zuxe8UO85
 ak+tnU1trNfEm6Qy/P1hKgHOuUL+1DOs6ulKVkf+SvnWXxlvFPZXp48Plm2JWfExqQIX
 rACk+eEIGFa6fh51D+7CVDJt7C5jm/Y4U5NA5N9Nw0nRYXsF1JO38CqPXVSccu3Y1mXS
 LfRrnynPeEXzxR1cLB7zKlsIxpi0TDPyEvSJk123aVv+x/1dQ515p6sWkbU/twsq2LhA
 TPwZLQK5e+lPw5A7d7kOSln249BAhGIuoYIph1cEJjRxYRDeBiUVQXsEsiN38b9omTl5
 XLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uvnNEM8JD+Q+EFbLDOX+y9losyOBY049XcucY+k/TcI=;
 b=cmdtbko6XH1ScM4WBt344k15BpBYCyP1dmtKf5PsncqF9CD2FAGcy/HhcI70wDM2V7
 UqhUh4peZJSQP7SFkPPuECQXGQ/UJwk0vDeuBmnXTzEetqSdTTxSckCQh+6ukIB6MZtX
 9/v3G6d/gTOZWwUPq/UPOac+1rIKvVrXv48EU8MCnIgCc0lBGgN/i0qN1k2U/rhxTf8b
 aHLdMKPdAzEYQ3d1PpDVZKrM7XpgsKWzfUjBg8BBZ47Xzz/geraSnCijqnpNkJ6Yz5Oc
 gfu5re1CV8GhSFlpe2G7dhxowZilBvESnHHvER66EHRG/dkjW7uYxhiQnCPminfaYd/O
 lVqg==
X-Gm-Message-State: AOAM533hqJPjPsIf5rBQc+NEQjX4RnMLvh38Q500cMgM+wT1Y0IKmVLV
 hQekxiUcBLGWLd8RLccizjpCnvC3eLo0bEHoHNqK7g==
X-Google-Smtp-Source: ABdhPJz+fFJQDls8jmeWMS7J2xlj6hxKciuJ28sJ3FEO9zb2pGEWH1mwFdbxt1+mTqWReggKGBcvtTTxfcCMsQgKR3w=
X-Received: by 2002:a1c:96:: with SMTP id 144mr8073915wma.126.1638891963898;
 Tue, 07 Dec 2021 07:46:03 -0800 (PST)
MIME-Version: 1.0
References: <20211207094427.3473-1-damien.hedde@greensocs.com>
 <CAFEAcA-=8an6Q0ZC2Nx6=VoaB0_rucv+vEGS8Fy+ChMc2zCqHg@mail.gmail.com>
 <SN6PR02MB42054732F8B59940998D01EDB86E9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <CAFEAcA-x_e4NrQziTEpYrTZn7X_enEMjKn0bHEK8uS4ED1vjzw@mail.gmail.com>
In-Reply-To: <CAFEAcA-x_e4NrQziTEpYrTZn7X_enEMjKn0bHEK8uS4ED1vjzw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Dec 2021 15:45:52 +0000
Message-ID: <CAFEAcA_C17byZDDdenOfmD6TU4UuTq=uHfXQxdurppaa18S4mQ@mail.gmail.com>
Subject: Re: [PATCH v2 for 6.2?] gicv3: fix ICH_MISR's LRENP computation
To: Brian Cain <bcain@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Sid Manning <sidneym@quicinc.com>, Carl van Schaik <cvanscha@qti.qualcomm.com>,
 "shashi.mallela@linaro.org" <shashi.mallela@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Dec 2021 at 15:24, Peter Maydell <peter.maydell@linaro.org> wrote:
> The bug is a bug in any case and we'll fix it, it's just a
> question of whether it meets the bar to go into 6.2, which is
> hopefully going to have its final RC tagged today. If this
> patch had arrived a week ago then the bar would have been
> lower and it would definitely have gone in. As it is I have
> to weigh up the chances of this change causing a regression
> for eg KVM running on emulated QEMU.

Looking at the KVM source it doesn't ever set the LRENPIE
bit (it doesn't even have a #define for it), which both
explains why we didn't notice this bug before and also
means we can be pretty certain we're not going to cause a
regression for KVM at least if we fix it...

-- PMM

