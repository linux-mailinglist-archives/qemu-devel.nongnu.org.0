Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E463315083
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 14:42:10 +0100 (CET)
Received: from localhost ([::1]:51222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9THN-0000aw-7d
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 08:42:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9TGZ-00008R-Lc
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:41:19 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:40813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9TGY-00013L-3V
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:41:19 -0500
Received: by mail-ej1-x629.google.com with SMTP id i8so31435614ejc.7
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 05:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wW8IG+zWhekbva2yfXK2WeLV4Dpsg1rrJ4uaJwpFXjc=;
 b=LPk7B3jTHSdoz2el5wYFz95hj6bb1AwjQzGzm2892jyUmTVUH6e81OPiEolhYuU46V
 el383SDkM5Xe55qTrUYoLxeKHr92cxUAcSBH0l9O4qXmNkbmid2oHuXtYgc+/W9hSYZi
 4NhC6Cg8GZtECbNEFhzyOvmfQdyawlVVh9arnj/MQVbXGwsUgQbeKSz5Hl91cRSUPa1V
 XnCZnbfra6UIljhXyXobEPt8FbJ0iyniKarv1z4+fxkEWOhebfZfmiB32AfCS02uJxhc
 N63zBXnPjMiITIrVWqpfEZPKH2BNENP8uoDXCwxkWfrmx4Jj2h9nMrDicTkCrRPz1XSY
 QQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wW8IG+zWhekbva2yfXK2WeLV4Dpsg1rrJ4uaJwpFXjc=;
 b=CY3Ew6rU4+cU1oJHIa6iO9vIX2Xl9kZsEREq5n8StlTvVTk+2J4Hjg82YZJAd12isF
 UpZ5nsN8zXCSInvOqPWTkqAwMdT4yxwhm0s1HDI8Hu2exuSOA7rmvBAR0kN43rk+qFes
 gWvvDImk+q07ABLbqHDVsNSXuqMTbTRHueKNHYKRORWPOdHK7LZ+vs+/Adeg0LZOcDL0
 2kCHo24bkWZ6qUx1XCiHJJD5PcTmRqDEp3dqKM0jUzKqLNomDGlIm4VkGaZhlThCPsWY
 cKskcCzYA8aeetp6LLTFMTB3xPXBmZk4prMgI1TZlMUiSScC/kOglnMiXWWZ2jhjVlkN
 A3JA==
X-Gm-Message-State: AOAM530uP0fCkHcqaOnxLLa5fPkah1/suiOiRUm+OKXgol4EJFHVyfiJ
 vbLwZlM5CFaGkGeeHyserPDmYdsOYqK9rqGLeqJqUg==
X-Google-Smtp-Source: ABdhPJx67+MY1llyrX4dTgVgpTCsU1qOV83+HooJpsacElKloCS4daMn1yacrGZQoI3eeS6J+x1ZScWgGOCdPbnmUps=
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr22323869ejh.85.1612878075997; 
 Tue, 09 Feb 2021 05:41:15 -0800 (PST)
MIME-Version: 1.0
References: <20210207121239.2288530-1-f4bug@amsat.org>
 <ebdddd92-cb51-e8b9-dfc0-fbce35015eb3@redhat.com>
 <CAAdtpL5YO=A-V06+7Wyhn5XnavGCUAqqcD8XpU2cVpE4AV-W3w@mail.gmail.com>
In-Reply-To: <CAAdtpL5YO=A-V06+7Wyhn5XnavGCUAqqcD8XpU2cVpE4AV-W3w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Feb 2021 13:41:05 +0000
Message-ID: <CAFEAcA-m0MKhMr05mX7HyJZ8DuK7D2YzCFnTyG4B32=-r-5mpA@mail.gmail.com>
Subject: Re: [PATCH v3] travis-ci: Disable C++ optional objects on AArch64
 container
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Feb 2021 at 13:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Migration of this job is pending of Cleber's possibility to add an AArch6=
4
> runner to Gitlab-CI, right? Then we need someone to support and maintain
> the hardware... I don't think anybody volunteered.

We have the hardware already. Effectively Alex is maintaining it...

thanks
-- PMM

