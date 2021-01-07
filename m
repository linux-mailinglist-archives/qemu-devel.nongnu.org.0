Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B082ED5F5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 18:47:31 +0100 (CET)
Received: from localhost ([::1]:49074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZNi-0004PS-QZ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 12:47:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZJo-0000yI-Oa
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:43:28 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:33195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZJn-0004zP-6K
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:43:28 -0500
Received: by mail-ed1-x52d.google.com with SMTP id j16so8619471edr.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 09:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LBOgn61wexeXsurZm8vyfI7SFAM/KVT0qJzidYdDdIk=;
 b=jeKyFhW2nLQEfD1NVGZ/P7iV8L40GOO1rQjSPhjY+RLb3FzrfI9NG+sDVvXMvJzA0p
 f4+FYue+YCg3BycfSscA+8vziqs36jBdz7aFf366Lxf53QZaR1g2bGB88ng0Fz4rRw+E
 E2F5i1l/XSKAZymdqabL3oLiq4cmLMIubdl82+hqM1mAcsX260/62hQS/ke9zJVQ/13q
 cGsgqhK4D8ohjkqMA+QyCXDOpThz57HwdyHFWyCzJAiKVOoojb6+rjCZDeqBA6Wn3ItG
 1/Vrw97rFMy+0o0bAjlN8398Mv91pxg9Jj8eKMTuzs/cC2W0R+Roat41zHQS0wNwdMY6
 AenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LBOgn61wexeXsurZm8vyfI7SFAM/KVT0qJzidYdDdIk=;
 b=FQeM9UZ8WMew42txTNmcwwH6OYyG3gqwwj75WIbSCgvrOB35k6IZAIQS3lvr3W8o1t
 oYJKnxQrZ2djKpE0Qpa/XX726xeIVSBE/PBqhUCxMGHABJdIFh0dxVlwp7CTXod9Xv5w
 OAwIjNClI+BiZuxaFmznw1FfvkV5IXP0t6Y1yx036CkpK8TLfM6yK8mMBhk5tm3x3L6P
 WaoHQKM0+FAxfyiogA/Nmr0hbObsltmJlkw6J0CYjfRVACozPk3I3Hf517J1iXpmzbO4
 A44A9jf5WzRFOMKzbIyf0SJtMZNo9u2ZfYJriHcrPNXIutgxdc2rlh0gmTznNZndwp4G
 yWsg==
X-Gm-Message-State: AOAM530djBP/qvY5c56qenEXdLcBJgrn+YjhXLkAKQ9B08Q2chMQML94
 AUWgBa45MU1ZSa2gdAW5MCWx8mZc6XGljEU6JfnRoQ==
X-Google-Smtp-Source: ABdhPJxsAIe0quszlsx39/os5E/XhJP9EHfHqqyun8inAHqSvzz+rXq1MDWKU+VP9CcEOU05azZ0YepXznHMYka9a2E=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr2411472edv.100.1610041403544; 
 Thu, 07 Jan 2021 09:43:23 -0800 (PST)
MIME-Version: 1.0
References: <20201215114828.18076-1-leif@nuviainc.com>
 <20201215114828.18076-4-leif@nuviainc.com>
 <CABoDooPXUC585huW0-1Md1WTAO0AwhKvOe20FioU=SbOJ+FdkA@mail.gmail.com>
 <20201215164904.GY1664@vanye>
 <CABoDooO==m2SiE+6t6idGjMsM71d1C0=_BBNJBriBkgg+eAXDQ@mail.gmail.com>
 <20201217121031.GK1664@vanye>
 <CABoDooP_uW-w5JaMXmo6AzUomFp5BuSS27zn6x3hu1VKbNbEVA@mail.gmail.com>
 <20201217122444.GL1664@vanye>
In-Reply-To: <20201217122444.GL1664@vanye>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 17:43:12 +0000
Message-ID: <CAFEAcA8huj+2Dc2+fWjkXEY1ToYEoDcSVddD+94D_vmGz1eoaA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] target/arm: add descriptions of CLIDR_EL1,
 CCSIDR_EL1, CTR_EL0 to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020 at 12:24, Leif Lindholm <leif@nuviainc.com> wrote:
>
> On Thu, Dec 17, 2020 at 13:18:03 +0100, Laurent Desnogues wrote:
> > I was thinking about changing the field names, not the register name
> > because the register is the same, only the layout changes.  So
> > LINESIZE -> CCIDX_LINESIZE, etc.
> >
> > That's personal preference, Peter might have a different one.
>
> I see. Sure, that works too, and doesn't pollute the register name.
> I'll wait for Peter before sending out v3.

Laurent's suggestion works for me.

thanks
-- PMM

