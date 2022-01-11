Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989DB48A94A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 09:23:34 +0100 (CET)
Received: from localhost ([::1]:50742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7CRJ-0001XA-FY
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 03:23:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7CPP-0008Vr-7g
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 03:21:35 -0500
Received: from [2a00:1450:4864:20::431] (port=33287
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7CPN-0001bP-GZ
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 03:21:34 -0500
Received: by mail-wr1-x431.google.com with SMTP id d19so904852wrb.0
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 00:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HQ+C2hNzawow0Z1duSAtCYyEWc3uLapDwUUEt50u+Vs=;
 b=Ho3hwKoFnPnlQYPN4KSDXue6Gvdf0DuFp9yHatTrhAu35SKD7K+LhQx/jPP7/8Pwlz
 plnXf6b552ttdC9ITaIyhiC2KtiMnlFCaTQcfdAL9C2Kektv8/eCu8RC8GumciPH62GN
 Dt8TlO3wevXuaef1gr7XPg6Ylaa62rugJZZH46aF4l/MOQ2iHucSGMLiFQjlJBa82bAV
 icfcAziZkalSnGRoQkHoeGwKoaKELSGoi7t9I0TaG6voeS+EuXhNLPtzBWslxDtBBs8+
 fGQvNABCRlEhjupO1I8vqe2QdkxP08PG7d1IQEHivQ/bEwxKFVrmrqSy+WnxW8lo8sxZ
 XfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HQ+C2hNzawow0Z1duSAtCYyEWc3uLapDwUUEt50u+Vs=;
 b=Ponsa1Hbf4rOjYhLbUu5owhfEagxWsOriYWu32r+2D5KzZsLA6PRE/CGiQphZSq0RA
 58dLMbGUf0rX8e+oMIYikqexuQcAN8/PZ9jMA3VRPhZcd4uOyTX8iR3wK5s86vp4B0SN
 CLn0HiR7zSfmtthkmgirWDB8Dn0qRbxiE3xVaLlzoY/c8uEbNwYbmgU3uMqE44PslNjr
 95nDQGmjlDPU/jJ+1IthQAFEoQcF7rsUQ+QSR0IHYH5DlUTWGaOBD1MaiNiRe6JNI2yY
 605kPOmqH0aHHIzj7VbcWOkd7+dMfkKuHSKncTQk7lWMg2Y9fuMeSiGGg9dsrLH7aUGw
 rwmA==
X-Gm-Message-State: AOAM531l1pNq1SSxIZqcdB8tX17KcBiKluSB0w61FQHs5oArorguV3A/
 vPfeTEtuUqxWfVBC2KGWzyqx8SKlwa4qBy35A8AwAA==
X-Google-Smtp-Source: ABdhPJwv+Wx1mLoVIY9YfdM/+n9Dx79X74aGFH3SmZ8Qy8QNKNnSGi5ONTrIoVo12zdFUesgA9ciAGLARVTyH2Pqwqg=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr2702884wri.295.1641889291848; 
 Tue, 11 Jan 2022 00:21:31 -0800 (PST)
MIME-Version: 1.0
References: <20220110191751.3335516-1-peter.maydell@linaro.org>
 <26df0ffb-bddb-440d-4e9c-4f756d83f7c3@vivier.eu>
In-Reply-To: <26df0ffb-bddb-440d-4e9c-4f756d83f7c3@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 08:21:20 +0000
Message-ID: <CAFEAcA96Ht7_nerUOFz74S5K34px-9_2bo_XUwXG6obYmovsiQ@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Fix clang warning for nios2-linux-user code
To: Laurent Vivier <Laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 Jan 2022 at 07:01, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 10/01/2022 =C3=A0 20:17, Peter Maydell a =C3=A9crit :
> > The clang in Ubuntu 18.04 (10.0.0-4ubuntu1) produces a warning
> > on the code added in commit f5ef0e518d03 where we use a
> > shifted expression in a boolean context:
> >
> > ../../linux-user/elfload.c:2423:16: error: converting the result of '<<=
' to a boolean always evaluates to true [-Werror,-Wtautological-constant-co=
mpare]
> >      } else if (LO_COMMPAGE) {
> >                 ^
> > ../../linux-user/elfload.c:1102:22: note: expanded from macro 'LO_COMMP=
AGE'
> > #define LO_COMMPAGE  TARGET_PAGE_SIZE
> >                       ^
> > /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/include/exec/cpu-all.h:231:3=
1: note: expanded from macro 'TARGET_PAGE_SIZE'
> > #define TARGET_PAGE_SIZE   (1 << TARGET_PAGE_BITS)
> >                                ^
> > 1 error generated.
> >
> > The warning is bogus because whether LO_COMMPAGE is zero or not
> > depends on compile-time ifdefs; shut the compiler up by adding
> > an explicit comparison to zero.
> >
> > Fixes: f5ef0e518d0331 ("linux-user/nios2: Map a real kuser page")
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > I'm probably going to apply this directly once it's reviewed, because
> > it fixes a build-break on one of my machines.
> >
> >   linux-user/elfload.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> > index 329b2375ef1..2993b01e60c 100644
> > --- a/linux-user/elfload.c
> > +++ b/linux-user/elfload.c
> > @@ -2420,7 +2420,7 @@ static void pgb_static(const char *image_name, ab=
i_ulong orig_loaddr,
> >           } else {
> >               offset =3D -(HI_COMMPAGE & -align);
> >           }
> > -    } else if (LO_COMMPAGE) {
> > +    } else if (LO_COMMPAGE =3D=3D 0) {
>
> It seems to revert the logic should it be "(LO_COMMPAGE !=3D 0)"?

You're right, it should -- I was too hasty in writing this fix, clearly...

-- PMM

