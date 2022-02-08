Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC374AE2A7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 21:47:43 +0100 (CET)
Received: from localhost ([::1]:40818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHXOl-0007Co-TY
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 15:47:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nHXGm-0004Pq-6j
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 15:39:24 -0500
Received: from [2a00:1450:4864:20::52d] (port=37502
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nHXGk-0002gk-1S
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 15:39:23 -0500
Received: by mail-ed1-x52d.google.com with SMTP id da4so858447edb.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 12:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=SVS72fhvbZWGyrx5Grwz0WZyBqtr6srfOMRLB46MJYQ=;
 b=ay8b8zbka5cWWM2o+qwUhyP7Pg0iPOj8azwvkwhGqkBl5pf9lX96gibvsssBry3JUu
 PhtnhrksQ6AO6YHC7NDEcA5/muqB9jvS9fgJOwY7e1+DfitpdslUT3Y2RS/QJGlQVMtt
 VF+dlk1J7uSHivBl4l+A/qBuGhWp/Ro92FPEpYSKml/PD75T19JIYAO3hZsllhuUHtkQ
 ukz2b1BY7ZtMtsAT8l/xJaB/CFb7sft7IQFVeNalXCDKcgSiqEPtoqZI5qgf/zSed1yB
 5MJK0exG/Nlicz8EZZqzmx75pYTKUdLHWztLpTih0Qeqn0QTCxAnK4IhTGkqKZF0SRUh
 ihxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=SVS72fhvbZWGyrx5Grwz0WZyBqtr6srfOMRLB46MJYQ=;
 b=fFWC+Knx25bjMpPZf1f6esmh2ljwVk9KpaDWFTFUXS2SjAJCUvfu5ARwTC3onWJ55e
 2j9HiczSaHnBeovR8flipSLjmwRmaXUDDQMXyktFXFeIG0hzm/jwJoaMOhG+3g0//9X3
 lejOSn6ecvKipyqJ8OmJ/Xmi2GH7jXw+NLlIthYIWRmz1Sdtq8QGa1QkfpfyN5Q9raEW
 AdY1Q9VT10u59e8drEUh48fPPK/gU7hxpuwY+RvMcwGe5CXvAS6d0pA5sxrdTUrT4EQA
 z3BO/Qaa93PyrRUAp1xRfnFTZ+MZRjpZJx3E9igOjaY2khXsizri7FcE1JI+hOUSHLBV
 qqtQ==
X-Gm-Message-State: AOAM532Wru6W2P9cp15IXZBZUpV6Xy/R/d2pGXnw2IBayjpMeFFhurCs
 xEB/VC3lfQuAL9shLZAOmLMP5g==
X-Google-Smtp-Source: ABdhPJzT6w7McPn+YVngEvXGLVb41rmYzsH/mgyN0+fM8CuiI6ZCH9kGQp8/nv1IaEzN3ya/jFbOIw==
X-Received: by 2002:a05:6402:143:: with SMTP id s3mr6238130edu.7.1644352760467; 
 Tue, 08 Feb 2022 12:39:20 -0800 (PST)
Received: from smtpclient.apple ([188.25.251.197])
 by smtp.gmail.com with ESMTPSA id u6sm3291483eje.101.2022.02.08.12.39.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Feb 2022 12:39:20 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH] Add --with-branding-prefix and QEMU_BRANDING_PREFIX
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CAFEAcA91q2t9sVvaW6h3BwFMExgyCdVsb3TozH52EM70aPJt4w@mail.gmail.com>
Date: Tue, 8 Feb 2022 22:39:18 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <DEEEEB34-BF47-4AD3-99BC-EAB791508D27@livius.net>
References: <20220120113545.55820-1-ilg@livius.net>
 <8A1E1B8F-ADA0-4966-A4E9-C0A08EB0A327@livius.net>
 <D6833D18-344A-473E-AC4D-89A64F8AA0EC@livius.net>
 <CAFEAcA91q2t9sVvaW6h3BwFMExgyCdVsb3TozH52EM70aPJt4w@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52d;
 envelope-from=ilg@livius.net; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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



> On 8 Feb 2022, at 21:58, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> I've cc'd some people who might have an opinion on whether this
> something we want to add upstream. (Patch/thread below for context.)

Sure. For a better understanding of the reason why I found this useful: =
I use QEMU extensively in CI tests, in various environments, and, to be =
sure that the tests always run in a reproducible environment, I have =
binary packages with various tools; the tested packages have =
dependencies on explicit versions of the tools, for example:

- =
https://github.com/micro-os-plus/micro-test-plus-xpack/blob/9c23c7d7b8fdba=
849602bcf8ad4c9e64e7e2837a/package.json#L505

Seeing the branded greeting in a console log is a visual confirmation =
that the test script used the desired version, and not another version =
picked up by mistake when using an incorrect PATH.

I hope that other distributions may find this useful too.

> On the actual implementation, if you make the #define expand
> out to either the empty string "" if the user specified no prefix
> or "user-specified-prefix " with a trailing space if they did,
> then you can avoid a lot of the need for ifdefs in the rest of
> the patch.

Yes, I mentioned in a previous message that I would prefer such a =
solution; the initial implementation did not rely on meson for setting =
this macro, so it was safer to use #if/#endif; later I figured out a way =
to configure meson to process the configure option, and noticed that the =
code would be simpler if we assume the definition is always present.

> Or maybe we could have a QEMU_PROG_NAME(S) macro
> that expands to S if no prefix specified or "prefix S" if there
> is one.

Sure, any better ideas will be appreciated.

> But don't respin the patch until we've decided if we
> like the concept.

Ok.

Thank you,

Liviu


