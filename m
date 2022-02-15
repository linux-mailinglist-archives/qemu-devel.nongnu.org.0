Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57054B6EBF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 15:21:05 +0100 (CET)
Received: from localhost ([::1]:46302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJyhU-0002xZ-DX
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 09:21:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJyeQ-0000Td-B5
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 09:17:54 -0500
Received: from [2a00:1450:4864:20::42e] (port=34591
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJyeM-0005nN-QT
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 09:17:53 -0500
Received: by mail-wr1-x42e.google.com with SMTP id s10so18850212wrb.1
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 06:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mIVBk2ulOpFi1/bvZ/x8732jD12UGgyndX6bnXmtom8=;
 b=EsFF04QVzOUNKt8S6H/ZQt/fPEJMJyKnx1vITEUJsGT3NWLqTiKagAJpQQpg0+gcc7
 WP9WHvMTuhNsJXEahv0uxBXKJ/vC2hwK3z9NgZU8oqvj37xy6SAU71e64S0XaCcWg6KU
 KNCMnPZLMtplA/GA8rj4EnNbn2tZDO9CSwVP4nvjGxyemJkfZudAzUUArESwL8gU5DRq
 TEFNyvifkNuruBRjdQZcWdepCv1xIcSTwBaxDXKzfNVaXNHj2l1Dse2rE3kVKkAB5FYH
 0sx4d0aUN1ZezJZFw0eNsngmn932mLC3tmVSMwYl31T0nIm4FlM1+OeS4wtbEKcpbfDw
 RZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mIVBk2ulOpFi1/bvZ/x8732jD12UGgyndX6bnXmtom8=;
 b=GomPcp1DpewhiNcntGyhCUzVveQ3HvpN5RtiuzQ/I/I9RmU4vkcNPKBNgwSOwD+EcV
 m1T+JWHtWfi7HL3aeZgXfavib9X4jL5FgoYZj2WPRy/315W74xGqKPRQ/U3i2Bv4pAM0
 mes/4esJwRNwv5kIoS+Jj1puMKAQmzxaYiN9SYVRSLR5RhXu2sXhfZ5pkf3cHurMDhHb
 9zB4tnMOoXiHQAHY3uUVH2oXwrIyEmrQ7erEEzTDE5/RVTsotOSF3kSALlE6Hc9emeyc
 15whodUzQNI1lR0F4P9wxIW0zN0ytt1bBvrbRMUthof/llF+/Rf4kfcDn3QN4N5P9q6p
 Drbw==
X-Gm-Message-State: AOAM530rtldTmjZadWe60/c8XpikjDrP1sdfjg/WYYFF/7v0Lom933/l
 11LSJS4SX1xboNyf3sb3on7mhv5cztQTeKQPbU/12A==
X-Google-Smtp-Source: ABdhPJwdMINm3PUMpNnDETzcyB2c6K/mZ7OE/pPiRlSA6Fxv+OjpT+qgMBp0GuCBXwFfNvmKesOzRMFAoPBaBmXTF+c=
X-Received: by 2002:a5d:498d:: with SMTP id r13mr3491736wrq.172.1644934669293; 
 Tue, 15 Feb 2022 06:17:49 -0800 (PST)
MIME-Version: 1.0
References: <20220215120625.64711-1-f4bug@amsat.org>
 <5430167.XuPm0vUgvV@silver>
 <CAFEAcA_58__sVrAdN410PvketwTLyyYb=OZ4y2oWDjMYGW+J0g@mail.gmail.com>
 <2344563.XbXamImqsm@silver>
In-Reply-To: <2344563.XbXamImqsm@silver>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 14:17:37 +0000
Message-ID: <CAFEAcA8yBaMJAUTb93hu_nP8c0Fidq1g6F0JwTodrPYiAhXsgA@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] ui/cocoa: Ignore 'initializer overrides' warnings
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Feb 2022 at 14:11, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> On Dienstag, 15. Februar 2022 14:45:00 CET Peter Maydell wrote:
> > I think this won't zero-initialize, because this is a function
> > level variable, not a global or static, but maybe ObjectiveC
> > rules differ from C here? (Besides, it really should be
> > a static const array.) That said...
>
> That's a base requirement for designated initializers to fallback to automatic
> default initialization (zero) for omitted members. It's like:
>
>         int a[10] = { }; // all zero

Ah, yes, you're right.

> Yes, but if you suppress this warning globally, you shut up the potential
> warning for the linked case as well. And as demonstrated there, you would end
> up with different/unexpected behaviour depending on the precise compiler being
> used.
>
> So I still think it is not a good idea to suppress this warning globally.

We *must* suppress it globally, because we make wide use of the
array-range-initializer idiom that it incorrectly complains about,
and we don't want to discourage use of that. This is fairly standard
for compiler warnings: sometimes the compiler complains too much,
or the intent of the warning is something we disagree with. Those
warnings we disable or don't enable. In this particular case, if the
compilers ever develop versions of this warning that complain about
actual bugs without also warning about false positives like this
one, we could turn the warning on again.

Put another way, there's a tradeoff here. Sometimes it's worth
distorting the way we would write code to avoid compiler warnings,
because we'd like to keep them enabled to catch some real bugs.
Sometimes the distortion would be too much, and then we take the
choice to disable the warning. There's a judgement call based on
how much perfectly-fine code the compiler is warning about and
how much worse the rewritten code would be. In the case of this
warning we've decided that the tradeoff favours disabling the warning.

Having made that decision on a codebase-wide basis, we should then
just adhere to it whether we're building ObjC or C.

thanks
-- PMM

