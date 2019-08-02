Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B18DB7F50F
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 12:32:12 +0200 (CEST)
Received: from localhost ([::1]:33348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htUr5-0008GQ-Jz
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 06:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38663)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@gmail.com>) id 1htUqc-0007oc-2z
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 06:31:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1htUqa-00007n-UT
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 06:31:42 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38785)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1htUqa-00007D-LJ
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 06:31:40 -0400
Received: by mail-wr1-x431.google.com with SMTP id g17so76632939wrr.5
 for <qemu-devel@nongnu.org>; Fri, 02 Aug 2019 03:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q25Sjm/xKj9ssAOoRkSqnun1dQXQ6ewF2pSyhrCuNAs=;
 b=Pbpj4HibX3t1LmSJG1Wn9WJZJtKnh8fXfVM26XZNKMAlcnZlDRxcr8x9CSmz6dWbQ9
 UmPX56bN+GfksbeL3CBlP18bV28hWehghIvdLk9rO6ziG2JKKaPZZOgsjyKcYxTlyvBZ
 A4B3zIOVS7FYjuPPQzwKcNrtEX84zDmvi5GdZ/VzA5mlp7o1fpICCj988G9ZxDXucWSi
 B8sNWt+jc2b8hNa5khBMmqYuOhp9iLuOnAcvfJmT2h+p51kSkInXplJosWcdI77Sfc/P
 u4nuYH84A8hWM6JpRKxSl50vzhgNcANT8pojm2t8eCuMOyA1EqK4L1qvZApgIkEbJwej
 d7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q25Sjm/xKj9ssAOoRkSqnun1dQXQ6ewF2pSyhrCuNAs=;
 b=Lfw78/9c/7ABxRcDj2k2oZKDQLRwZoXXKYLagR5j5aGefXrN6NLTprmVLa4LuXYMxj
 BCqzHVlmVwmnwdkCpChCDjlaC5oR278oEJPR1Mm0Lu3saW41MUnauom8Pg8UwmA9I5pA
 5p3eXp2SccbBRFpxqF9NrE10Pm26AQqbalB1MbUlOyoYXM4yh9qW7wUAvOxi3qme85MG
 Tuf72VwEK5JkblxYrRiDY24fRQ7F5VgNVQxaHI3TH+uuuV57on+a8NEkFnGdoMm2wtRv
 N/5Ed387wj1eVWrcrZcmRSpdzWdj+O/x9WP0JYCiGE3VqHjeRzIaZuD9nG+5Lr/ZJz96
 +Aww==
X-Gm-Message-State: APjAAAUsVsH1SI72KOAijM142+RBCMJ9kdCoz4SpL2q6cqwVXSZSevu5
 /Cs1eWlMtJoOcuesvjHzhw5Z4dxMI8eajtnmZgY=
X-Google-Smtp-Source: APXvYqxBzY/2uVt+R6ua3F+rFIkdz69YBAB6H2bTboDhwd55xs8OoBRzNM2/XXGE4sdBPKz4hnYlVYgAeE671S4EMfE=
X-Received: by 2002:adf:eac4:: with SMTP id o4mr142395257wrn.290.1564741898976; 
 Fri, 02 Aug 2019 03:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <156452993884.16169.12168229409049273970@sif>
 <3c6ebc55-9416-a467-cfbe-73d2df6a64f2@redhat.com>
 <CAFEAcA9Vs=N_kaO1_DHM=Azttp=1Ju=bKFMU3iZdt6-+J=Oq4Q@mail.gmail.com>
 <CAFEAcA-dcHzyH0ojrpbKuq-NALToxRLjCwz9MiZqNfN2=xLLsA@mail.gmail.com>
In-Reply-To: <CAFEAcA-dcHzyH0ojrpbKuq-NALToxRLjCwz9MiZqNfN2=xLLsA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 2 Aug 2019 14:31:26 +0400
Message-ID: <CAJ+F1CJj8F3PFBDiKanqGdZ22r9AmeqYuTDQFq0RjeayR7U4dQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::431
Subject: Re: [Qemu-devel] [ANNOUNCE] QEMU 4.1.0-rc3 is now available
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Samuel Thibault <samuel.thibault@gnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Fri, Aug 2, 2019 at 2:19 PM Peter Maydell <peter.maydell@linaro.org> wro=
te:
>
> On Wed, 31 Jul 2019 at 19:17, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> >
> > On Wed, 31 Jul 2019 at 19:05, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
> > >
> > > >   Unless there are any release critical bugs discovered, this
> > > >   will be the last release candidate before final release of 4.1.0
> > > >   on the 6th August. Otherwise we'll do an rc4 and release on
> > > >   the 13th August.
> > >
> > > We forgot to update the slirp submodule :(
> >
> > Were there any RC bugs in it?
>
> Ping! If we want to put this into an rc4 can we have a
> pull request with a justification on the mailing list
> sooner rather than later, please?

It's about a CVE-2019-14378, that Samuel fixed a few days ago:
https://gitlab.freedesktop.org/slirp/libslirp/commit/126c04acbabd7ad32c2b01=
8fe10dfac2a3bc1210

Imho, it's not a regression, so no need to delay qemu release.

I would encourage distributions to switch to the shared library
version instead, so they can more easily and quickly apply updates.

--=20
Marc-Andr=C3=A9 Lureau

