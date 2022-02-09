Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBDC4AF00C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 12:44:01 +0100 (CET)
Received: from localhost ([::1]:39948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHlOB-00018P-Pn
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 06:43:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHlBz-0001oD-Gp
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:31:26 -0500
Received: from [2a00:1450:4864:20::42c] (port=40789
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHlBx-0006fQ-8J
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:31:22 -0500
Received: by mail-wr1-x42c.google.com with SMTP id s18so3476332wrv.7
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 03:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=joqEyJAUInXTfV3/JlRpWrkV1JmQ5n/Y689UD4KX7G0=;
 b=lJMgPa5L3FtQo9UEF9InneUQw6Gl5x/PDHTkIBYuiCCmDPZACDsOiwrEacFdLvSD9y
 EfQX311SckYnXVqe4Eik3QbFwDPLoLqaI//yTsF4xQjraONC+Ar79nUdPe9YEMViXulR
 944JGcCuP7iKSLKS8be1QJJ9Xew76nObPpO5eAQTvSXbAiNYe1zuql2fff/cqFK8bP1+
 UNR1jJgTWKK+RQLC0flk7VoAlu9kI/dAhHtsQl9dbb3dUosXZWoiB88CUBm3CWt5Pg5I
 0Z2SpxRZE71x/pzC+8D5n4sk5Mt4aMJhv3DN4+qZsG0MvqkEiDLHiRi/NP5jh8vfFsbq
 L/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=joqEyJAUInXTfV3/JlRpWrkV1JmQ5n/Y689UD4KX7G0=;
 b=ufNGYYC2h14C+PBcrFHZ/1YLNc9UsRJ3w4BCHx8Yjn4RkKhAIwrgdCTT3xlEgpI+Yx
 6qj0jy2qBPAXUXZoUpjRsECkfuWUcpp/SB+2X8Y/JeESmGApSx9o0FxpTGhsGA0zDFmk
 htpYiXX1wws0B91iSg/0zfYjrX9fKgONBCPU6Qz5Xd9+xixiU7TBMuGLRnONrnsgprmN
 lneBsJR8lTYzQhv3+kFCgwyiJz74uyMq9TsI9A8nd95GOUnRvl+K2v4Ho60O5tTMneNV
 /UhWCO5YsqJKBeDtPiRjOmH4kC4J+JT8sja160hX1E67JrMQcOUvm1sAW8C3BM/LxMBt
 61Vw==
X-Gm-Message-State: AOAM533XhriAabynwd4xngwbe8PvfuoiIovlL0EBdbyu7oIj66vo8xZu
 i0SqcQjWQo61tnrnczMT3T4upN75nU7hHUvKmgERjA==
X-Google-Smtp-Source: ABdhPJxIZREART+8SUFCEz3AlLUlHQbDl2xG6vH2sQuGt5+ppo0FuMg3TLH1zWg517bCqD5/LtAXZjfIXS7Sew6hYns=
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr1674512wrs.295.1644406268292; 
 Wed, 09 Feb 2022 03:31:08 -0800 (PST)
MIME-Version: 1.0
References: <20220120113545.55820-1-ilg@livius.net>
 <8A1E1B8F-ADA0-4966-A4E9-C0A08EB0A327@livius.net>
 <D6833D18-344A-473E-AC4D-89A64F8AA0EC@livius.net>
 <CAFEAcA91q2t9sVvaW6h3BwFMExgyCdVsb3TozH52EM70aPJt4w@mail.gmail.com>
 <DEEEEB34-BF47-4AD3-99BC-EAB791508D27@livius.net>
 <YgOQF0W78MVVsDw6@stefanha-x1.localdomain>
 <BB942F04-BF20-4531-A356-DDF7931B1DEB@livius.net>
In-Reply-To: <BB942F04-BF20-4531-A356-DDF7931B1DEB@livius.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Feb 2022 11:30:57 +0000
Message-ID: <CAFEAcA_TzC6t=m27ZM=oAPBZwNcPm8b=bne4hb722cMx4vQ0Rw@mail.gmail.com>
Subject: Re: [PATCH] Add --with-branding-prefix and QEMU_BRANDING_PREFIX
To: Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Feb 2022 at 10:13, Liviu Ionescu <ilg@livius.net> wrote:
> > On 9 Feb 2022, at 11:57, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> >
> > Is the existing ./configure --with-pkgversion= option not enough?
>
> My understanding of --with-pkgversion=, based on the fact that in QEMU this string is appended to the version, was that it is a suffix that describes a specific version.
>
> Most GNU tools, including GCC, binutils, etc, use a similar option, but the string is prepended to the greeting message.

gcc doesn't prepend the pkgversion string to the greeting. Taking
the distro gcc as an example, 'gcc -v' prints out the configure options
used, which include
--with-pkgversion='Ubuntu 9.3.0-17ubuntu1~20.04'

and 'gcc --version' prints the version as:
gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0

which is fairly similar to what qemu does today:
QEMU emulator version 4.2.1 (Debian 1:4.2-3ubuntu6.19)

(we just have the pkgversion and the upstream version swapped).

-- PMM

