Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2901E143BDF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 12:15:33 +0100 (CET)
Received: from localhost ([::1]:51918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itrVM-0000Zt-7S
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 06:15:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41667)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1itrSF-0005BD-4u
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 06:12:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1itrSE-00079r-0h
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 06:12:18 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:36310)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1itrSD-00079L-R1
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 06:12:17 -0500
Received: by mail-oi1-x22c.google.com with SMTP id c16so2189904oic.3
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 03:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oboNPV63Cm7QG5/Ec/bQeEruLpM/3IojuOljnGjcxSk=;
 b=NVU47i3jK3DfFOoi7qh8DdWYJvvSvSqKbe2gRyI8fm8AwcSACYJ/4n61vYw7IQWt4F
 Afq7BtLUjSj8xHdrCLeCMGylDImUYH6u44NQe+VfdTyf+gQZRY/Ds9FLlcKoxKcMpehJ
 a1iz9E26kPiTRHuE55qHAaFuzOsTtv6FAx1tjKbkLmSpVGQTOQGYdc4HENhcPYg9jErV
 PREBSohmtOQ8ndkRUCrRagSeQPY4f5+yp0SvTgqF9S6YcBBzvLrJGn4fiXqR/Ul7OJKv
 6twxjejzgtTUlZACyIkHpWkt0V2lFPT6BZiHvG5AQPb8Fxh8Xpvdqx0ZnhcjoMmBm+NO
 Htrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oboNPV63Cm7QG5/Ec/bQeEruLpM/3IojuOljnGjcxSk=;
 b=WAjz2+QUw2S0v4xQMRrNGEUhOOsfKCcF9avVUSDtebXUEPF+jmxxd4nZzCnXh94tL5
 qWiySh9jV0hM+SJnewOPn8o/gUlkENFMv7WdtBZ//pdVnVGQCOhWIl+wBYXCdJEKppP2
 Y8LnPt6sc4Pyte+sYOTlFVRH4V/nkZ6I4DadDU2o92X/onjP6edeoGgDGTEIK/P4C+Fl
 2b6rHCcv8ehwpDgKdmBI66Sdyvg0Ervmugd+ARpomf0fmRzoUOe5jh2Qgx9njIPa0/iV
 RziBqyIyz+Ahiw8+z1mkEYIz5K9RdpU3XP7ezcAGzEI6j4T2lMJ2jjy/I0XuOTM4VATs
 lsuw==
X-Gm-Message-State: APjAAAUFRu4VVsJ89U0CYzjuaB1ZrzMsxMrc9BaaStpiw5iwXgiOvYko
 jO0ih9jmRPHOF0gTL5NmUjm6hbDt+4Ep31HKdUSYbQ==
X-Google-Smtp-Source: APXvYqw6zTZfFYcepVdFlqWZG8Y+hGSPHvBPXgmARgvYxfTNgHsNos+VOOpyMIeavmhjgUx7xGIWuQ+3NUFemGRR4zM=
X-Received: by 2002:aca:f484:: with SMTP id s126mr2495694oih.48.1579605136713; 
 Tue, 21 Jan 2020 03:12:16 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-_Y0Qaw-S83tMAph21opaDx-2y6aPbv5J_J0Bo4bgJuA@mail.gmail.com>
 <96e75f84-fc52-9f19-3733-671aec6dc7fc@redhat.com>
 <87k15ll3c3.fsf@dusky.pond.sub.org>
In-Reply-To: <87k15ll3c3.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jan 2020 11:12:05 +0000
Message-ID: <CAFEAcA_JyNUbKcuaXn0J_isGqGpxJrou-wyOiUsms89RRMzW3A@mail.gmail.com>
Subject: Re: Proposal for handling .hx files with Sphinx
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22c
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Jan 2020 at 06:40, Markus Armbruster <armbru@redhat.com> wrote:
> John Snow <jsnow@redhat.com> writes:
> > Still, I do want to ask: Are we sure we want to double-down on keeping
> > the .hx files around instead of trying to move to a more generic data
> > format?
>
> One the one hand, I'd prefer to invest as little as practical into .hx.
> On the other hand, adding more hard dependencies on QAPIfication is not
> a good idea.
>
> What's the stupidest solution that could possibly work now?  Is it the
> one Peter sketched?

FWIW, I wrote some code for the Sphinx extension approach yesterday,
along the 'simplest possible thing' lines. It's less than 200 lines
of Python (though I still need to put in the support for DEFHEADING
and ARCHHEADING). The actual texinfo fragments in the various .hx
files of course would also need to be hand-converted to rST, same
as the hand-written manual .texi file contents.

(This has been easier than my last half-attempt at
updating qapi-gen to support output of rST format...)

thanks
-- PMM

