Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2B12D75FF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 13:49:40 +0100 (CET)
Received: from localhost ([::1]:57300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knhrf-0002aR-Re
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 07:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knhqO-00025a-3B
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:48:20 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:38861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knhqM-0008Nu-7l
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:48:19 -0500
Received: by mail-ed1-x530.google.com with SMTP id cw27so9219704edb.5
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 04:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oP5xX+HcvmR7qwQTLfGl3wonPXcAyMOpF5Cl8Rc1/BA=;
 b=kgSNlOom+pOEJxceicQZ5NoBg2UvUQcsGFkyIYC/pA9gxOvxN2mKiFhfKbiq+d9e2O
 PPWprYxoUISPgBUJ6Mx+15Gvh6f68LIb8PjJJSJ5m0Xq932ZT5BEiqT8uOnxxWWTDlth
 TNXKTK9qp4ml3C+t2myadrNHA8RwrnMVQIWTkyYfR39gsTMrYaFvhpOQ9TLKRpxnJ4i5
 KbrmS+iOpM67MVY8vW8ZxzFSBW3lMPLXGLJWQy89rctUTaTncwLl0EOpnkwgbEK0ag6d
 NC4ui37KX6sf1fwUVDzsuhW7f77A1jK6+2RtncFXQwT6nFdkdQU4zZFqYXii8gkQpYBp
 jexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oP5xX+HcvmR7qwQTLfGl3wonPXcAyMOpF5Cl8Rc1/BA=;
 b=JOaYFZDE0G8TEUXRuSNTaf5RrsU7/VccUCggxqRh2pNht5dI8Utv0Co2CzuR546qHO
 KACpalZ8xJhZ3jieugBJInz7UC6tIe5m/tPevp7xPfEkda4ioN4JhWwzV5fFtF9bv0J1
 2zSmzyh5qPvCs+Lhbr307sgr4rrHR8WukULWfx88pFT62GwjIbbgULSQu4XXqgNszzzQ
 iglZB2exylsqIpI69w3fhSbeKfk1LjsJBB+Wd3DXT8c//TgMC1gdLbyCtLnRCmM8RsNs
 eWVBN8cIP3VWwG9OsYhiJ1OvWwz6Oa7tZ849RO4cJ4VoF4HclrsEMBzT8ieCuiE82h6g
 emGA==
X-Gm-Message-State: AOAM533PFhGbomM5u1T85Q0yp787mZaZsvsziE1omZlLqWIclzyvpJ0u
 Y3+kLGIuRKVcG22CkLEKFwYpJbQNcWlESBOgrz/Vag==
X-Google-Smtp-Source: ABdhPJzaJt3buQAF2iU08VIwgftTK8QN3q4BRb8nADSlJhIpSf8om/ff3nK6gyC4LK/hx0fHVZ9EwJneZOhLcf6NYqk=
X-Received: by 2002:a50:fd18:: with SMTP id i24mr11815105eds.146.1607690896677; 
 Fri, 11 Dec 2020 04:48:16 -0800 (PST)
MIME-Version: 1.0
References: <20201211041507.425378-1-david@gibson.dropbear.id.au>
 <442b503f-1bd5-4fef-254d-d57c5d7b57be@redhat.com>
In-Reply-To: <442b503f-1bd5-4fef-254d-d57c5d7b57be@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 12:48:05 +0000
Message-ID: <CAFEAcA80wPxky=SdOzc1yAKa+JNbceO8zvmWWWqcwyuSE=qNKA@mail.gmail.com>
Subject: Re: [PULL 00/30] ppc-for-6.0 queue 20201211
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 at 12:35, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 12/11/20 5:14 AM, David Gibson wrote:
> > LemonBoy (5):
> >       ppc/translate: Fix unordered f64/f128 comparisons
> >       ppc/translate: Turn the helper macros into functions
> >       ppc/translate: Delay NaN checking after comparison
> >       ppc/translate: Raise exceptions after setting the cc
> >       ppc/translate: Rewrite gen_lxvdsx to use gvec primitives
>
> I was surprised by that author and went to check the wiki
> https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a=
_Signed-off-by:_line
>
>   Please use your real name to sign a patch (not an alias or acronym).
>   If you wrote the patch, make sure your "From:" and "Signed-off-by:"
>   lines use the same spelling.
>
> The patches are signed with Giuseppe real name, so this is OK.
> Author can be fixed up later in .mailmap.

Well, it could be, but since we've caught this before the pullreq
has been merged into master we might as well fix up the From
lines in the commits directly. David, would you mind doing that
and resending?

Thanks for the catch, Philippe.

thanks
-- PMM

