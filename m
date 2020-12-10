Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE3E2D5E25
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:42:34 +0100 (CET)
Received: from localhost ([::1]:41566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knN9N-0003Xn-Qp
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:42:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knMv7-0001lX-N4
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:27:51 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:34176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knMv5-0007ot-Ea
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:27:49 -0500
Received: by mail-ej1-x641.google.com with SMTP id g20so7618902ejb.1
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 06:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h0ZkNmdrRk1QmBSvbXHC8b9Yk7HUiLC1aWMMCjxRxnY=;
 b=F4QheKpiJJxVg1rHl8Qc5ltjP127YbCLivdRTsGvE/XgdZc4gFui1VMaywti47I6x+
 wTN6MdEF2x/sMYb8G1GowTyblyKhQyTl/dbsFBnLJk9k0hu0t6QczluJUnNcHp8baCae
 2E0jP0hXt/1s/BKOzp2M5R2JellblkE1jgjiGwETIGouxXMEDxZ4AekqsqCC7gE64ysC
 Rg16qM3W1/LT0hxPqs1JXkaJ/3/pP2QNmgEFeXFLmVsB6eUoiESufJj58d1A5D/6rerG
 X1Ysd5zsc3glD0HXcqM6kom6yR+d52wZwzFm572+S2LeuxOQtu207RB0pOg5bOip5+hZ
 n2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h0ZkNmdrRk1QmBSvbXHC8b9Yk7HUiLC1aWMMCjxRxnY=;
 b=oNuqKt0OR7mXuVd4yPOilD4hgKIPNXZz43jCKJ2sqHmIPQCSUnZRvSfdrKvE3rfppa
 UCmfBPEIZ+KqLVJb/slmzQoo5Dq0uUEL3Idil3RjTufXSBDFR5UAN80EkBDPCzvUFDpV
 /cYA0BO3RAozt30raqTQAvab/+My1VTgGzWi3zhUqSHNOBCL10awEmoXyqv3TEpeux6F
 4lln4GMNnZbnx0IKp++8hCgllwVFEi9eKws/9LrmlvfRNL8LwrfG80x7RW00CSYsyMI/
 LgpEnhNvzpZThOnZ2w/qc7vsb+pnhxyLuc55Fhrp7NeU4qKmCHl75+m9mlkArvlOvLQg
 o4lw==
X-Gm-Message-State: AOAM5318hvBMToFepF6ZHoyhryC0sl4YDOoTlP4IvvMKTnBkMuVz8+ub
 oWPloYrOkqAwnfhBMDVH+dgU9wx1rXzDez7vKdiOTg==
X-Google-Smtp-Source: ABdhPJxKojA/+/fWdEygGDSNtO/TGC7C2s8P2PjilRSbR6HuRNhJZ6sQ54SA4GXtiOiUK4RRINyXTzehCjna6e5aCn4=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr6606354ejf.407.1607610465440; 
 Thu, 10 Dec 2020 06:27:45 -0800 (PST)
MIME-Version: 1.0
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-9-marcandre.lureau@redhat.com>
 <a162ec7c-4dc3-5784-866e-dc95f6919b1f@redhat.com>
In-Reply-To: <a162ec7c-4dc3-5784-866e-dc95f6919b1f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Dec 2020 14:27:34 +0000
Message-ID: <CAFEAcA_xbEm+DmP5hixtkzWJK1fi8X7wZh+eGKmDneZv_=-xbA@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] audio: remove GNUC & MSVC check
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Dec 2020 at 14:26, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > QEMU requires either GCC or Clang, which both advertize __GNUC__.
> > Drop MSVC fallback path.
> >
> > Note: I intentionally left further cleanups for a later work.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  audio/audio.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> >
> > diff --git a/audio/audio.c b/audio/audio.c
> > index 46578e4a58..d7a00294de 100644
> > --- a/audio/audio.c
> > +++ b/audio/audio.c
> > @@ -122,13 +122,7 @@ int audio_bug (const char *funcname, int cond)
> >
> >  #if defined AUDIO_BREAKPOINT_ON_BUG
> >  #  if defined HOST_I386
> > -#    if defined __GNUC__
> > -        __asm__ ("int3");
> > -#    elif defined _MSC_VER
> > -        _asm _emit 0xcc;
> > -#    else
> > -        abort ();
> > -#    endif
> > +      __asm__ ("int3");
>
> This was 15 years ago... Why not simply use abort() today?

That's what I suggested when I looked at this patch in
the previous version of the patchset, yes...

-- PMM

