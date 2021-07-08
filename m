Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D65E3BF7B5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 11:41:22 +0200 (CEST)
Received: from localhost ([::1]:44144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1QX1-0008IF-5D
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 05:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1QVq-0007Po-Ca
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:40:07 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:36636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1QVn-0000dL-TL
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:40:06 -0400
Received: by mail-ed1-x532.google.com with SMTP id h2so7631009edt.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 02:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rxMCSrLHA4c1UVGNUvl9ZeYs3baYk4tMWFmR7eoSoTs=;
 b=OdbAoak5vVaYhFZKO/qIqiXyNqs88QJzGIoJkMrMWsY9cbZP60Tpbs5o+lFAjYxsRY
 Uc5xFECaz7Uajv8OL6R4MFu5yJNbTz74rHO6I4oiXlz/QmZ7evyu0Jkuc+ZGZ2FZxo5I
 QMVySHRcJho8Sq5tdDAnDcwoiwDqzrKvHwhKA/HAk8RAd5zGE8bccF+I9AMXsIIgzgJv
 YcgmO33btnw0vUjQv7yF5kGGUVpLqmyfY0niQkcHg5QVSPWFnvF8wwsYEXJ+HQEcizF6
 E9st6V3PMypS02v3io7cxX8FgXDgCib3oH4FYDXkGRm7ceMOJIlaImhYShTJB7QFg+oB
 l+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rxMCSrLHA4c1UVGNUvl9ZeYs3baYk4tMWFmR7eoSoTs=;
 b=Xx6KOw3GLOq+gVFsxW5QUYuN+pe08M3f0Rc3BWHIKYqcUDvDslGr+X8xnjF4H2k6jN
 RJsUYB0fm8niLKVMiZJEBODwJn7phXVYleiVb1vlV2+b4Sx6aVRwrXJ5euBG5F03yzoM
 Ge65VTtNQCFV5vNFsS1/mClijf15HILsmQSnrqNm5GaHn7WcO8cG7QZ1NeEg7e9MZv3+
 7l1u9252vpkdbVghB6kt1mxgwvfSDSzk5tidCCF8WLU9aXTaD5v+xLHeZkGk28cLEHg1
 jNUyDHxMY8v2bmgpiCkuvq17tvlBmOQHB5XPQB0WDxHIYx2r1KQXEZfkVO39JN18hsxs
 qnew==
X-Gm-Message-State: AOAM531X6dQnWaUk/KnkPVD+3nWiXPu0X9dr/X51L9LvKnO55owhE3ja
 OwJvgZcPmsbZcI7oeG/ysejVpQHQ4wuMGD4MSTYkPA==
X-Google-Smtp-Source: ABdhPJzZ9Jb2QQzaWZgaJyUSn3BKjEjrK1I8ttbOruFI1OhvKuVERQbsjxg2NJUTkM0X9svr1nJxV5E5RNYuIRPC6FI=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr35930648edt.100.1625737202294; 
 Thu, 08 Jul 2021 02:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-4-peter.maydell@linaro.org>
 <52e5cb6e-1be5-cc73-5aab-790c5b9b80bb@amsat.org>
 <CAFEAcA9n-3-0V4==-j5-vBFsMHtHmXtkctxsyYEVWi-obipRBw@mail.gmail.com>
 <137e8616-f4d9-9824-56aa-b20f8c784305@linaro.org>
In-Reply-To: <137e8616-f4d9-9824-56aa-b20f8c784305@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 10:39:23 +0100
Message-ID: <CAFEAcA-r_RAVHtL_4v8K3ZXF+-wCgwrBNoNebA-qnWHfykHR8g@mail.gmail.com>
Subject: Re: [PATCH 03/11] hw/gpio/pl061: Clean up read/write offset handling
 logic
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Maxim Uvarov <maxim.uvarov@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Jul 2021 at 02:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/2/21 4:45 AM, Peter Maydell wrote:
> > On Fri, 2 Jul 2021 at 12:02, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> >> On 7/2/21 12:40 PM, Peter Maydell wrote:
> >>>   static const VMStateDescription vmstate_pl061 =3D {
> >>> @@ -151,16 +150,9 @@ static uint64_t pl061_read(void *opaque, hwaddr =
offset,
> >>>   {
> >>>       PL061State *s =3D (PL061State *)opaque;
> >>>
> >>> -    if (offset < 0x400) {
> >>> -        return s->data & (offset >> 2);
> >>> -    }
> >>> -    if (offset >=3D s->rsvd_start && offset <=3D 0xfcc) {
> >>> -        goto err_out;
> >>> -    }
> >>> -    if (offset >=3D 0xfd0 && offset < 0x1000) {
> >>> -        return s->id[(offset - 0xfd0) >> 2];
> >>> -    }
> >>>       switch (offset) {
> >>> +    case 0x0 ... 0x3fc: /* Data */
> >>> +        return s->data & (offset >> 2);
> >>
> >> Don't we need to set pl061_ops.impl.min/max_access_size =3D 4
> >> to keep the same logic?
> >
> > I think the hardware intends to permit accesses of any width, but only
> > at 4-byte boundaries. There is a slight behaviour change here:
> > accesses to 0x3fd, 0x3fe, 0x3ff now fall into the default case (ie erro=
r)
> > rather than being treated like 0x3fc, and similarly accesses to 0xfdd,
> > 0xfde, 0xfdf are errors rather than treated like 0xfdc. But I think
> > that it's probably more correct to consider those to be errors.
> >
> > (We could explicitly check and goto err_out if (offset & 3)
> > right at the top, I suppose.)
>
> Perhaps just better to retain current behaviour with this patch by extend=
ing the case to
> the ends.

Makes sense. I propose to squash this diff into this patch, which
should make it a no-behaviour-change refactor, and then queue the
series to target-arm.next, since it's now all reviewed except for
patch 11 which is a comment-only change. (If you think this is a bit
fast I'm happy to post a v2 instead -- as a bugfix patchset this is
still OK post-softfreeze, so it's just a matter of my personal convenience
to be able to put it into the arm pull I'm going to do either this
afternoon or tomorrow.)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 0f5d12e6d5a..b21b230402f 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -151,7 +151,7 @@ static uint64_t pl061_read(void *opaque, hwaddr offset,
     PL061State *s =3D (PL061State *)opaque;

     switch (offset) {
-    case 0x0 ... 0x3fc: /* Data */
+    case 0x0 ... 0x3ff: /* Data */
         return s->data & (offset >> 2);
     case 0x400: /* Direction */
         return s->dir;
@@ -224,9 +224,7 @@ static uint64_t pl061_read(void *opaque, hwaddr offset,
             goto bad_offset;
         }
         return s->amsel;
-    case 0x52c ... 0xfcc: /* Reserved */
-        goto bad_offset;
-    case 0xfd0 ... 0xffc: /* ID registers */
+    case 0xfd0 ... 0xfff: /* ID registers */
         return s->id[(offset - 0xfd0) >> 2];
     default:
     bad_offset:
@@ -244,7 +242,7 @@ static void pl061_write(void *opaque, hwaddr offset,
     uint8_t mask;

     switch (offset) {
-    case 0 ... 0x3fc:
+    case 0 ... 0x3ff:
         mask =3D (offset >> 2) & s->dir;
         s->data =3D (s->data & ~mask) | (value & mask);
         pl061_update(s);

thanks
-- PMM

