Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E196B75E2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:23:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbgGD-0001AH-Af; Mon, 13 Mar 2023 07:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbgGB-00019r-2u
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:22:35 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbgG9-0008NM-5I
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:22:34 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso11309699pjs.3
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 04:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678706551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Jjp0IPjDVjgkZ8bmvKpZIv0/9hsebzJcUCPvBP48yQ=;
 b=AMYDPaSjO1y7vsQs9thCPMwWmmNap9e/HKQiPeVnKN7HD0n17Dj+mRwUca4pzqmTsn
 OibzLZQJ/LTPjoI+rSeKhI2myVuv+CxghYJvNCK3r9gNQrDPrI6qFvwk9EBwqXXKBP71
 4QunV9KdboQ3LfBkVD+LcysKBUEQVvY5lrjeAa8BLYPTp8+43xO/z1bCVNUs79rIAtdw
 FBV4mTE+p+P+loUk0CvuN0SdboxkgyLTt5OlRCaCWJx1nRlp9lUbfTg/1TffFCIegw06
 gY41+4ulT0vOcFwl6psUs7Af2crQpGSHEX4k4+YpxKFwWl1ti2j+IT0JTlW3yRAFlKGy
 Zx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678706551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Jjp0IPjDVjgkZ8bmvKpZIv0/9hsebzJcUCPvBP48yQ=;
 b=gFoDDSmxaJBCHU8MiFDdJq6h3ctgOhOtvItcr2mbcqwnF/vIG3sctref4ZB2mrVQ7C
 qc6LrEYoQkBQHsbf4r+XVqtKHEt1Xw9yn1xssXBuv393RZ0mln02vptlk/1V+J+fqUms
 Az3JshkhciAkDjo5aXtW2xC1Hc75ECGoBchhqtHsc70U8FU0SmUgqjCJSIRMi93odIVe
 4iUhGLNpLMCDBYVrUwqcbkB5jjGow/OuDzjiKs0VhAa1v2XGVQYakBnqYitdQ5dfKqYk
 DdFuDeVLyR7EqVxNDhMv4Ua92sU+vts8jRiqMNBO6A2tqD9flToDcReb4Bz0TLXU22DF
 6cCQ==
X-Gm-Message-State: AO0yUKVMVgdfo5AsrjuREXYZeKw5dIfluSnVGTJhBocDhHGkhaxEx6Dw
 JminBVdBq1ZpHWCrAryyaaeWU9f4JhGNyoAiV49Qbw==
X-Google-Smtp-Source: AK7set/68yCaI9xux4n/yisEv3YmWfA8kifJI6mmxM/y5Y+d/JTxDSR77mEmBGnxMJqDzra5DCVbwDfKw2iKdfS9rXI=
X-Received: by 2002:a17:90b:23d2:b0:23d:20c:2065 with SMTP id
 md18-20020a17090b23d200b0023d020c2065mr1135077pjb.1.1678706551656; Mon, 13
 Mar 2023 04:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org>
 <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
 <87wn3ocwqz.fsf@suse.de> <87sfeclb8o.fsf@linaro.org>
In-Reply-To: <87sfeclb8o.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Mar 2023 11:22:20 +0000
Message-ID: <CAFEAcA8SFtzMAFPaE=_CJtwXDYiJQ8rDWgEE+Nx2Qz=-FjCmMA@mail.gmail.com>
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org, 
 David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, gdb <gdb@gnu.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
 Omair Javaid <omair.javaid@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 10 Mar 2023 at 18:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> (adding some more gdb types to CC)
>
> Fabiano Rosas <farosas@suse.de> writes:
>
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> >> On Fri, 10 Mar 2023 at 10:31, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
> >>>
> >>> You need a very new gdb to be able to run with pauth support otherwis=
e
> >>> your likely to hit asserts and aborts. Disable pauth for now until we
> >>> can properly probe support in gdb.
> >>>
> >>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >>
> >> If it makes gdb fall over, then shouldn't we be disabling
> >> the pauth gdbstub stuff entirely ? Otherwise even if our
> >> tests are fine our users will not be...
> >>
> >
> > Have you seem my message on IRC about changing the feature name in the
> > XML? I think the issue is that we're putting the .xml in a "namespace"
> > where GDB expects to only find stuff which it has code to
> > support. Changing from "org.gnu.gdb.aarch64.pauth" to
> > "org.qemu.aarch64.pauth" made it stop crashing and I can read the
> > registers just fine.
>
> That would work, although I would prefer to probe support so we can use
> the official namespace.

I don't think there's a way to probe for this problem. I spoke
to Luis about this, and apparently it's a bug in how gdb handles
the pauth XML description (fixed in gdb commit 1ba3a3222039eb25).
A gdb without any pauth support at all will be fine; a gdb with
the bug will report that it has pauth support but will crash
if you feed it the whole set of XML that QEMU has; a gdb
with the bug fixed will also report pauth support but won't crash.
(The bug only manifests if the full XML includes registers that GDB
doesn't care about, like the system registers; if the stub sends
only registers GDB knows about then it won't crash.)

Luis and I came up with two options:

(1) leave QEMU outputting the pauth xml as-is, and tell people
whose gdb 12 crashes that they should upgrade to a newer gdb

(2) make QEMU output the pauth info under a different XML namespace,
and tell people who need backtraces when pauth is enabled
that they should upgrade to a newer gdb

Neither of these feel great, but on balance I guess 2 is better?

Luis: I think that rather than doing (2) with a QEMU namespace,
we should define a gdb namespace for this. That makes it clear
that this is still a gdb-upstream-sanctioned way of exposing
the pauth registers.

thanks
-- PMM

