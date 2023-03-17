Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DB56BEF34
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 18:08:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdDYI-0002KH-8L; Fri, 17 Mar 2023 13:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdDYD-0002JN-TZ
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:07:35 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdDYC-0005BA-6F
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:07:33 -0400
Received: by mail-pg1-x52a.google.com with SMTP id t83so3286503pgb.11
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 10:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679072850;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XP8Q2FI1U9PJPNNWvkZAKAWR8a38tAxxBoCJWVesujc=;
 b=Uah1eNVpm5n38JC5SwvtsZEJXJl9oB5JWpI6gL8dfXJUjb7GCtWZp1cml9ukoav3Kn
 nXuTUUx45ztzILyJlZknso75cQaJvsqeUumBvBwPMrjTPYyqCenVuPuWLc8mTEoDP5TY
 1a3S0wOLMKmeteN30Q1KPOQj8nLUQUGbYj9+cHKFrE/zMHEiqdVdcod7y/3Jt9MYklRx
 EdEwGtocc13qKkhKOjSMOYoxQe2NE+83WOaqoB7rQ3JMFR8vRYxjboSggr35fekpScgd
 2DJx3Oh66RyFw2SyLwMeMJ83Zvw2N9H3hdPgKGL3s6WHpX/YI9LP5d+OP3yb448n1HQ1
 2eDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679072850;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XP8Q2FI1U9PJPNNWvkZAKAWR8a38tAxxBoCJWVesujc=;
 b=TansvnpL3uvCToU4QWZTp0v1N7sRZRLCYbJs+rmuiPxPQ+3o61fj7LuCIiXPcIYBjY
 NYyf1Sc3Mcs5fX+f00LBA6IOlDtCIwfeBMSXBr8O75dLTUcZD0YNjkOSk8YmuipRfwPX
 KZWqbqDtnrSwHU7TWVADYSMvYYe43S1owfCTo7oibt0L2W9IlVisk+aOKg3GIcWkOkXp
 GLbrQcJBkT6WUyQb3xQwiENsp0LdN/FUSQ5nT4FnYIqtPg8hWGy7lIXDKVXkAOAs6iL8
 Kp6/tnC8w5V7vjcgsXSbl5R5vAEZO+y8QYI8abYArnpLC+6gWE0NumoGzu4bddW+S3+I
 xnFw==
X-Gm-Message-State: AO0yUKVCDBFFoLaTQYRAj/tEyQcutg0L1sSmWxdhr3qgAdajivnilUe3
 F2/fIDSM+AZpnnVQqMAGtsVxDpCjpbd9LPaVfuB/ZA==
X-Google-Smtp-Source: AK7set91JaoAQhC93HH4dnDd5zdv+X5Z1/Kkld/Kkifoo5YfoFvlj57xdPK2jluw+C5LucBDQcjSUsyLqUcr+e+cm2c=
X-Received: by 2002:a65:400c:0:b0:50c:bd0:eb8c with SMTP id
 f12-20020a65400c000000b0050c0bd0eb8cmr918540pgp.6.1679072850499; Fri, 17 Mar
 2023 10:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org>
 <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
 <87wn3ocwqz.fsf@suse.de> <87sfeclb8o.fsf@linaro.org>
 <CAFEAcA8SFtzMAFPaE=_CJtwXDYiJQ8rDWgEE+Nx2Qz=-FjCmMA@mail.gmail.com>
 <9bb8ab52-c6ae-95a7-e6c8-64bcce166c19@arm.com>
 <caf97353-d116-976c-72c7-953b0cad956c@arm.com>
 <CAFEAcA9WbEaCUXWcGT1+nj5u+zjWrm_+58X1-ZyrvUoeWcOdZQ@mail.gmail.com>
 <7b032516-913f-87fa-eeb7-c38a8676465a@arm.com>
In-Reply-To: <7b032516-913f-87fa-eeb7-c38a8676465a@arm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Mar 2023 17:07:18 +0000
Message-ID: <CAFEAcA8gDqrg3Hjv=0P-6m-bHytoHrYRSrrY1anu3gGZuQaL1Q@mail.gmail.com>
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
To: Luis Machado <luis.machado@arm.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org, 
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 17 Mar 2023 at 16:55, Luis Machado <luis.machado@arm.com> wrote:
> On 3/17/23 16:37, Peter Maydell wrote:
> > Having run into this problem in another couple of situations, one of
> > which involved gdb 10, I think I'm increasingly favouring option
> > 2 here. The affected gdbs seem to be quite widely deployed, and
> > the bug results in crashes even for users who didn't really
> > care about pauth. So I'd rather we didn't release a QEMU 8.0
> > which crashes these affected deployed gdbs.
> >
>
> Are the affected gdb's packaged by distros? If so, a backport the distros can pick up
> will solve this in a quick package update.

Yes, it's exactly because these gdbs are distro-packaged
that I don't want QEMU to make them crash. I think it's
going to take a long time for the fix to go into gdb branches
and gdb to make a point release and distros to pick up that
point release, and in the meantime that's a lot of crashing
gdb bug reports that we're going to have to field.

> If we decide qemu should now emit a different xml for pauth, it will fix the crashes, but it also
> means older gdb's (9/10/11/12) will not be able to backtrace properly through pauth-signed frames.
>
> Maybe that's a reasonable drawback for qemu users?

"No backtrace through pauth frames" is the situation we've
been in ever since we implemented pauth in 2019, so I think
that's fine. It's not regressing something that used to work.

> If someone decides to implement a debugging stub that reports pauth (fast models, for example), it will
> also crash gdb, so I still plan to do the backport anyway.

If you're backporting the fix, you could also backport the
(hopefully tiny) change that says "treat pauth_v2 the same
way we do pauth", and then users with an updated older
gdb will also get working backtraces.

thanks
-- PMM

