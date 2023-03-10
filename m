Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324346B4FC7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 19:08:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pah9l-0001hx-Pd; Fri, 10 Mar 2023 13:07:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pah9j-0001h7-Bi
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:07:51 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pah9h-0005c5-RO
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:07:51 -0500
Received: by mail-pf1-x433.google.com with SMTP id c10so4156895pfv.13
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 10:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678471668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yDWH/Bafpq6Al4Qixgc7s1DXFTyThL0etvF5h9pL7lQ=;
 b=ufUd3hGnNtztI7jy8iYLCXJtY8hs4V8LKpugLfajkYgv1yK0Bm2Mjl5tZlZN9gDBBr
 zvmv1Mh+Y2+ZDxtta96pTjzmKbV8pDKK4hoIxVHO31AZFmOAYP0htE+C5wNGrZt1Udfu
 /VjcfZf7C9fr+V9V1d9FyxQJs9rAf5k81jwM03Krj7d0W9AsmVif5sUFEdxzkmdDyN/L
 9YCdPTQYdP+dnZKo4uIxjoyXjXLc7DIs+ISvjDUyb3365SGzalaggnelUHDGMqavxMQC
 STrzEXl6BRvNjtx0TWOBr0EHw9CZg6/L2Pfk2Jyqujaw8IvWoMjbpYB1h7vyVmXoZrIF
 UujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678471668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yDWH/Bafpq6Al4Qixgc7s1DXFTyThL0etvF5h9pL7lQ=;
 b=ySBsZeC1cUZ0RrAmX6Me1Sgd5JOpo8+SmOwvcrdncfIJLV1vI5lxQ9NOAa6OdPu4wi
 qG8wDr14Dh6G3bijECX94UA77t2WB35KDsAZSSOlooJ/FI0gEYkMZ5O2Nm7IP6T2omWf
 ewO4e3Ys3wZSd9fMQVdsWPYpY9h/oFAzLT7rexlyLgpatCCkxcwJf0jfeevFaTf1jLmB
 q6fjHC2oc9i3fedgVr31uJzC+yQOcEO9DZCJZiQM82w02P8QMU1tKxxgb0VkjAtJBxjZ
 zfV73M7dN8sPaCl9hfG3nTiyysAer0PSATc7DVk5k7uD9897Vu8orwGvU2MQecq/iFwt
 6Beg==
X-Gm-Message-State: AO0yUKUPEi1vecHjIV1Z+XehbTzL94cv8qQqXJE+grUwzJqqCo1Q83DE
 PvtGZDNXXNMRoP7qe5TRUh9ms1SzdEkDviBdea/wUw==
X-Google-Smtp-Source: AK7set8HQKUciAtKD6ti0HoI8lLeBrCAPYFvgFEuiUaYb3zpsolCQraHgI6fMinx04ogvg/awNtpdszwf/iUn3wkfVo=
X-Received: by 2002:a62:d041:0:b0:592:41a:1054 with SMTP id
 p62-20020a62d041000000b00592041a1054mr10923450pfg.5.1678471667819; Fri, 10
 Mar 2023 10:07:47 -0800 (PST)
MIME-Version: 1.0
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org>
 <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
 <87wn3ocwqz.fsf@suse.de>
In-Reply-To: <87wn3ocwqz.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Mar 2023 18:07:36 +0000
Message-ID: <CAFEAcA_bjTPO+68gV0V7436S2n=iJAoH3qXGw1v9-xhG2N0CLA@mail.gmail.com>
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
To: Fabiano Rosas <farosas@suse.de>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Luis Machado <luis.machado@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x433.google.com
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

On Fri, 10 Mar 2023 at 18:00, Fabiano Rosas <farosas@suse.de> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Fri, 10 Mar 2023 at 10:31, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> You need a very new gdb to be able to run with pauth support otherwise
> >> your likely to hit asserts and aborts. Disable pauth for now until we
> >> can properly probe support in gdb.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >
> > If it makes gdb fall over, then shouldn't we be disabling
> > the pauth gdbstub stuff entirely ? Otherwise even if our
> > tests are fine our users will not be...
> >
>
> Have you seem my message on IRC about changing the feature name in the
> XML? I think the issue is that we're putting the .xml in a "namespace"
> where GDB expects to only find stuff which it has code to
> support. Changing from "org.gnu.gdb.aarch64.pauth" to
> "org.qemu.aarch64.pauth" made it stop crashing and I can read the
> registers just fine.

But then presumably a pauth-aware GDB won't actually know
the values it needs to be able to convert between with-PAC
and without-PAC addresses for backtracing?

Luis, how is this intended to work? Is there some way the
stub can check with the gdb that's connected whether the
gdb is able to cope with the pauth XML, so it can avoid
sending it to a gdb that is going to crash if it sees it ?

thanks
-- PMM

