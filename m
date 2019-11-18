Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB3B100D96
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 22:22:30 +0100 (CET)
Received: from localhost ([::1]:39650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWoTd-0006ws-Al
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 16:22:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36469)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWoRM-0004xe-91
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 16:20:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWoRI-0000ii-5T
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 16:20:08 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:33840)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWoRI-0000iM-0B
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 16:20:04 -0500
Received: by mail-oi1-x242.google.com with SMTP id l202so16779376oig.1
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 13:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fy7jzzvOcGCpHJq/Q51dhy1i3pRHbSbhtsgJjMLwAOY=;
 b=vtQeW54DUwNue2GcY/WYfPqxww7wdOisy//d4ey3h/nBT9rs2HqoKw1g/t7NYt2NnF
 uoD4dQ1HVz+J9327xsqTk/lxI4GvU2Hs3vm32mEOmySJkjbYPL5RiLJfAyE86L5iDHuu
 PcjaM6F0sXxVp0LXj8PlKTxKUTgkKcsOASJ3wg7M8TeuK9AZk6kI5fyB+ylqs1THFDPA
 Ge8OpCHx8GPcqw7vSCwV2x4m62KEhJ+etAxlieICYBfP34EQ1VtXobXq+GU5isOlvgZs
 v6t7/ouoX3yIWLiCcNrB2Fvf1hehrvDfKcrgwhVoNHVQp+JNrG/ImVaMtQklbfCniiKN
 eh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fy7jzzvOcGCpHJq/Q51dhy1i3pRHbSbhtsgJjMLwAOY=;
 b=G9mHM2hUBTGQLDVDHntrlNCS0iN/mV5nIPUUKV2TaTCuYUhamWKV7N198Dwr8I4gLt
 DJ/T4k1wRyI1TjC/ILz/hUSdCEt+1ZdwZDCY/ydXfD7ocJhC8paKIPkG0mBslU8JDDIt
 N8+/OQbwVfskS2ct3qtKtIwoPD7quRoOu/jbAcaykQ1Duxs6Cnk3deNHvffJjKl46RKJ
 2L5D9+7A90LIQqc4b9sjdKS6dGepJ3yh2oXjU9nO/CHgmNvCt/LIThCrDZghvjedhVmQ
 hYpVgvw0trOHLyiJiA8RTxSB7sXeWOQCs9V8x1cpTPNi7OQHTDRb5Gzq0QXeTi1HAHhv
 vauA==
X-Gm-Message-State: APjAAAVWqC20EZ2p/ciMS/61JwFYSMwMarwYLWhQVQtBET2igZWuNdZ0
 Ml6mQQ2tWfXGVk7Pw91aixMCQrNjQP5MXfsKmlFp1g==
X-Google-Smtp-Source: APXvYqzT6vAULOcRNpTfm/lQz/rKz0SxlBxAiK1xGUjPYUsvHuUbTqXf3FJk/buVRxkND+e+xI8ALyN3ZqLj+ga8H3A=
X-Received: by 2002:a05:6808:8c2:: with SMTP id
 k2mr902218oij.163.1574112003003; 
 Mon, 18 Nov 2019 13:20:03 -0800 (PST)
MIME-Version: 1.0
References: <20191108110714.7475-1-david@redhat.com>
 <CAFEAcA-mD3-Zg2JunGpMqbcaT1qboCenhqEFytZD0FmFcL2i9Q@mail.gmail.com>
 <5dd613c0-6d9e-b943-b64d-7ba1791cbefe@redhat.com>
 <CAFEAcA-4r53vM-K24WYr1OFSOufhZ7hDHeZBhnywyaJ0gpMO1g@mail.gmail.com>
 <20191108191057.GZ3812@habkost.net>
 <CAFEAcA_No5oAFtULbAOrPDeQE18HHgc0agXbs4m2AGZ+gK_ReQ@mail.gmail.com>
 <66c64c6d-b7c0-2cb1-2b29-4fdd9b369714@redhat.com>
 <CAFEAcA-Q7H9sZjN-PcMMDHQU41yN1RdXhNY5KqMh7E6xh0yjgA@mail.gmail.com>
 <3aa1d025-20a3-e813-2fe6-35518efedf2f@redhat.com>
 <20191118184906.GB3812@habkost.net>
In-Reply-To: <20191118184906.GB3812@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 21:19:55 +0000
Message-ID: <CAFEAcA_iTX2TKh20DB9ZMtDLuPm=OvoyP==KRhfVh99BqDnrzA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] s390x/cpumodel: Introduce "best" model variants
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Michael Mueller <mimu@linux.ibm.com>,
 Jiri Denemark <jdenemar@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Nov 2019 at 18:49, Eduardo Habkost <ehabkost@redhat.com> wrote:
> Be them experimental or deprecated, we need all features included
> on "max" if we want to make them usable through libvirt.  The
> fact Peter cares about defaults in "max" when used by humans
> indicates we have incompatible definitions of "max", and I don't
> think we can conciliate them.
>
> We could rename the CPU model that is intended for humans on arm,
> or we can document clearly that the semantics of "max" in
> x86/s390x are completely different from arm.  Peter, what do you
> prefer?

I don't want us to have different definitions of max on different
architectures if we can avoid it. More importantly, I don't think that
x- features should ever be enabled by default for *any* CPU type
on *any* architecture (unless the CPU type itself was experimental,
I suppose), whatever that architecture's semantics for 'max',
'best', etc are.

I think the solution to this is to not use 'max' as some odd way of
letting libvirt do feature detection. I'm not sure how trying to
use 'max' as a proxy for "all features on" would work for features
which can't exist on 'max' but do exist on other CPU types
(for instance for Arm some features make no sense on the
A-profile 'max' CPU and aren't provided there, but do exist for
M-profile CPUs like cortex-m4), so I don't see how libvirt
can usefully use it anyway.

Why should it matter whether a feature is enabled
or disabled by default in the CPU type? It ought to be probeable
by QMP either way (ie there is a difference between
"this CPU has this feature switch and it is on by default",
"this CPU has this feature switch and it is off by default"
and "this CPU does not have this feature switch at all",
and presumably libvirt needs to distinguish them).

thanks
-- PMM

