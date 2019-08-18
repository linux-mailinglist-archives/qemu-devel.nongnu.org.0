Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FC89199D
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Aug 2019 23:00:35 +0200 (CEST)
Received: from localhost ([::1]:42884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzSHx-0005dg-Ku
	for lists+qemu-devel@lfdr.de; Sun, 18 Aug 2019 17:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35561)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hzSGX-00052z-RB
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 16:59:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hzSGW-0005mH-Iu
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 16:59:05 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44527)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1hzSGW-0005lA-CD; Sun, 18 Aug 2019 16:59:04 -0400
Received: by mail-ot1-x342.google.com with SMTP id w4so14143018ote.11;
 Sun, 18 Aug 2019 13:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=QGUQOX7DG/EeFOoGwh2nTaAPBL77V5yeXpq7T9XE2tU=;
 b=WAG9h06i2Uj/iUe8bJh07+MQOeI6iZYJkIHYJOwM0dKRuAYb1b1rB8lyihmZtZ3lBe
 XlgO+PeipCv8HtWl0QfEit4ZEhB7kwnmsxt/vq2RInf+MhqjyZpwArc1viFYwDe6/R+n
 CPL7CG/5gaKpUmoCfxVKppXO9O9RC+DVCNF8Y9B7V4zxGgZo+GAYGavyYPhZ1xm0DtQs
 Uhd6oPywQN6zgeBxRs0HJw5LmEI9aFJLOubr/y7y+Afp9RBIO9OR531k4KF02VXcStsJ
 fspLRKJbSRGcRW2UrCrnOXHmEpcnkIlqp7MsytpBrtO5gFnJDHMC6RZYvP+cHnE8ztEF
 QeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=QGUQOX7DG/EeFOoGwh2nTaAPBL77V5yeXpq7T9XE2tU=;
 b=g78gqKbP9eJYi5xuHlXHsR9Cgujmdp47UUI5FwjIBHUfqfxJjSpEDc8WsuFttYxv0h
 HpzcusNn2Js+/wtk17UW5xWlr4s/sr3b7hAKIlG1yvVFBMcJ+8h+Agqp2+ebD3XfY04H
 Yc0le60W06p/xPclD8lG4sOB/PeM/GElYE0/h0B4CSZFniwSGm1AQ2JcvQAGBvu601Vk
 HiQaVHsMJkV4WtO5pO9x1ovPVzlH/WxmAKwMqBQndtUlbBzVDQXVNdJyHRrq5xPVrVCI
 VXBFS72I26nJl4TnoEH8KshE3Jg6lrHa2Vbk+onLsgCgOx/atbLmBpxJCsa3igH5z1cN
 lfww==
X-Gm-Message-State: APjAAAVzGeu8JY4YLWZ3XOE8zvChfydyugVyXufq4HHStzSk5FKreDyF
 gli0yVtBaKJZlo4pmtkodgCpiyrTIk8g7NIVz6A=
X-Google-Smtp-Source: APXvYqxK2whlD69bq4n78HnPWENdN4IFgcW8tqkIcB1D1Bi6njEhmvXkcp9BbKLgPxaGx6n9/MT9Z/dSstd1UBQw2jo=
X-Received: by 2002:a9d:1288:: with SMTP id g8mr13004663otg.306.1566161942590; 
 Sun, 18 Aug 2019 13:59:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Sun, 18 Aug 2019 13:59:01
 -0700 (PDT)
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Sun, 18 Aug 2019 13:59:01
 -0700 (PDT)
In-Reply-To: <0cfddc22-92ef-3067-9275-8f4f22ca9805@linaro.org>
References: <1565983669-6886-1-git-send-email-pc@us.ibm.com>
 <CAL1e-=jy6vggskJ26rTc8dnaqtqCB0SdfpV9p-NvKdjoBk+Vkw@mail.gmail.com>
 <0cfddc22-92ef-3067-9275-8f4f22ca9805@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Sun, 18 Aug 2019 22:59:01 +0200
Message-ID: <CAL1e-=h=Hzfm8KZ4ebwaBsS6U=KVcReXpOPT2-vy4OeBktjWkQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH] ppc: Three floating point fixes
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
Cc: "Paul A. Clarke" <pc@us.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

18.08.2019. 10.10, "Richard Henderson" <richard.henderson@linaro.org> =D1=
=98=D0=B5
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> On 8/16/19 11:59 PM, Aleksandar Markovic wrote:
> >> From: "Paul A. Clarke" <pc@us.ibm.com>
> ...
> >>   ISA 3.0B has xscvdpspn leaving its result in word 1 of the target
> > register,
> >>   and mffprwz expecting its input to come from word 0 of the source
> > register.
> >>   This sequence fails with QEMU, as a shift is required between those
two
> >>   instructions.  However, the hardware splats the result to both word =
0
> > and
> >>   word 1 of its output register, so the shift is not necessary.
> >>   Expect a future revision of the ISA to specify this behavior.
> >>
> >
> > Hmmm... Isn't this a gcc bug (using undocumented hardware feature),
given
> > everything you said here?
>
> The key here is "expect a future revision of the ISA to specify this
behavior".
>
> It's clearly within IBM's purview to adjust the specification to document
a
> previously undocumented hardware feature.
>

By no means, yes, the key is in ISA documentation. But, the impression that
full original commit message conveys is that the main reason for change is
gcc behavior. If we accepted in general that gcc behavior determines QEMU
behavior, I am afraid we would be on a very slippery slope - therefore I
think the commit message (and possible code comment) should, in my opinion,
mention ISA docs as the central reason for change. Paul, is there any
tentative release date of the new ISA specification?

Aleksandar

>
> r~
