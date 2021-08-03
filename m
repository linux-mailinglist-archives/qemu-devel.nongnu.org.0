Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FC53DF1D3
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 17:52:57 +0200 (CEST)
Received: from localhost ([::1]:58778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAwiu-0007ZQ-Q3
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 11:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAwhn-00065h-Eb
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:51:47 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:46661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAwhl-0003HI-Vc
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:51:47 -0400
Received: by mail-ed1-x52c.google.com with SMTP id f13so29514622edq.13
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 08:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uFas8CLsfGwRDis4s/golF+Rg+7pAjiZxUpuBIETY/4=;
 b=FtOISgG56KH9jJ+yWhJFDwIG4ckNf30iv7CDmSmkT5qETeRohWCEs40naPcQ0o1DUV
 RVSwNRfobW6wDh8xtRmrFFod8m4kHCKtdsxtQ/Rwur1T+I8sNsIR1F+I02CBCWCXhadk
 CfvB94mFmDEhkxUTYZcewe2eaYC4xm6z8qip+hkYH/nUI/QhpVr2iQaBx9KBHEFo3nMs
 pcEvGJzm3+ZtHgi8bW6zB/xBUloYAabokjsTGMv3K45912MDWPO17YS1uE/uKzp0wkuC
 /nob4Atr/qRFjHdjM4oNX/IcNau3jY4kXEku/Lg9rlp+sweIMWOV60Iidc3vRHrOfpr+
 Azig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uFas8CLsfGwRDis4s/golF+Rg+7pAjiZxUpuBIETY/4=;
 b=cNt1DMjZgb0N2oRbslsEPGhHlWDu17GZQ547mUZE55GlZWSPT6pY46FOuliFdVHeu6
 /q95ViphGd41wdQ68Iwhfvufx4TPC9J7+jz8Gt+/lYVGSfjqBms/ZTdSvnfyOHhkz7ew
 9387F5JQqqphuoyYXLgqhGT7zaOftSHTf5rIywGkk5YoWCjGqmWY+VLEXDd99V1nn5M3
 ADRjGrez/eX41ZimKJvAkB4/EuL2kklPFkr4OfPUuk41OBFxjxaygeYRvBJFMH9LWUKg
 FW+41rcjPB9JM/pnIjbWB6qAQixH8sb6oKrEJk3ivvatX35zwVJVY+y2Jwhi3EO7sX7D
 TBEA==
X-Gm-Message-State: AOAM531xcioefn2QDtvJNDx1MxQ7aRzWwhDVok/+MFoMp+ovqW4Ak6/w
 ReaZL7R1YhCGK4CWNxbz6L46bmEvYJg4RoN6whZAHQ==
X-Google-Smtp-Source: ABdhPJxFGYqFdj8Jgodu5ThcUyBmGA6qCMC8Xsf4sddXwuAmMpaA58xNizOkDiF+KakMT/4iH2PxY6Gp6FXWsUwYDmQ=
X-Received: by 2002:a05:6402:2789:: with SMTP id
 b9mr15015906ede.44.1628005904306; 
 Tue, 03 Aug 2021 08:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <005fe0a5-10cd-aa47-d649-0a296283a4eb@gmx.de>
 <CAFEAcA_EmJ9R73RE_oMqoE7hvz1ALJdKhrWpOy7U6=74xXnzwQ@mail.gmail.com>
 <4635c699-d733-3673-9f14-9d05e6193e14@gmx.de>
In-Reply-To: <4635c699-d733-3673-9f14-9d05e6193e14@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Aug 2021 16:51:01 +0100
Message-ID: <CAFEAcA9K+OodUL0i5vHwEjDa6O8S6kyVrD0r4goRL0mj2kU8rA@mail.gmail.com>
Subject: Re: [PATCH 2/2] doc: Remove trailing spaces
To: Axel Heider <axelheider@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

On Tue, 3 Aug 2021 at 16:24, Axel Heider <axelheider@gmx.de> wrote:
> Then please drop the patch 2/2 for now and just keep 1/2. I will run
> more tests about this and see if I can find a way to avoid the need
> for having traling spaces in the file. They are a bit dangerous as
> most editors are set up to remove them, whch creates annoying changes
> all the time then.

You should configure your editor not to delete trailing spaces
or otherwise make whole-file changes like that. Otherwise
you'll constantly be making changes you didn't intend...

I agree that if we can avoid the trailing spaces that would be
the best thing -- they're a pretty ugly and fragile workaround
for a rST awkwardness.

-- PMM

