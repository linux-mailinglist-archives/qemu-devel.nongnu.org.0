Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C8936E8D2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 12:32:39 +0200 (CEST)
Received: from localhost ([::1]:52980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc3yI-0007Hx-CW
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 06:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lc3wU-00062z-VF
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:30:46 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:37780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lc3wT-0004PI-Bf
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:30:46 -0400
Received: by mail-ej1-x62b.google.com with SMTP id w3so99138756ejc.4
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 03:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WZMW8rZa8JiefjVoIlMAdTAnYotZua4qnNl5p8AWfUw=;
 b=WI8YMImP/2k3+kjiVFMIlu1T7ogXDrRIb7Dv1sf5gnhjt5z7005WScXDGkGxiO1BKg
 mCrvq2JPWEWUpv9RlArWAoatAZKzusccODbpyusP5JfENxFvWQzBQc5thI8ZfD9Rw+by
 O4NaHdpzPueoyti7XTz34FLLxInkJyI+PeurRKF39nLVGAkNV3cdu5ujHJWyYQdej9bB
 fcLuNqWHBCBstPE8NWjr73fsN6d94+UbfU5YfwaEZIz9myAEdCVVCZg0vBfIIRfoZXvF
 J4lkzTPZXwl1KRs+ScSsDLbFCIxWhBGDTj2VqnIthPCXF43nO8wLn++TZGW3TyJu3vYg
 FpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WZMW8rZa8JiefjVoIlMAdTAnYotZua4qnNl5p8AWfUw=;
 b=XbeG3AuPXFkKjMVjLregKmXNkWJElbxfBwP/Bor1fwkU9hJSlHYYAxVqAF4i2QNJaJ
 5Cs3oUaZuQJzmsab7gbxC42ndiJFYBXP80o3TZVIWT7c1DAvWo0whSjLJAjsnv19PTgs
 VFi/NRUYWCPJ3qmklHg+qsUrAS85D2hYidPjChff0hXooqp8/H9e01nWESFHIWKujcwD
 OJmyVwk7siMR9YcI8ld9EPQAD7WzpTAKGzvqZZALwf2D0gNRsChAMmsMHR5gzTrGY856
 rYnK63z4eSN20RWLOpe5gQgg8+YhrUeFq1v/5aMO7tnM1GtTOzW4fpbLYOzFuFqpfbBE
 FRKQ==
X-Gm-Message-State: AOAM532uK8O6FzvfobdVV0/Lo6zxBhTbQ+QnWMncC/ua2KFMMwaNuixa
 +ikIa5RRKBzZuazfIS034CVLkCBm8fR00MI2hh0u067gENc=
X-Google-Smtp-Source: ABdhPJxSZbTFDW1+kDEGTfEEmJxVbInI4zPoMbJc+0vza1Losno+IRcc0kSiAgk6kyc6X/0NDvZa+yUq6s47jIeCIaw=
X-Received: by 2002:a17:906:8303:: with SMTP id
 j3mr34107303ejx.85.1619692243165; 
 Thu, 29 Apr 2021 03:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
 <20210429101842.hupkajdlkttq6l4v@sirius.home.kraxel.org>
 <YIqJY1Z4jqruCu17@redhat.com>
In-Reply-To: <YIqJY1Z4jqruCu17@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Apr 2021 11:29:42 +0100
Message-ID: <CAFEAcA-_UTcs-XgPD6OLnKBUYJ9xnYRg9FAorinxejp7XZCxpQ@mail.gmail.com>
Subject: Re: Let's remove some deprecated stuff
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Apr 2021 at 11:28, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Thu, Apr 29, 2021 at 12:18:42PM +0200, Gerd Hoffmann wrote:
> >   Hi,
> >
> > >     ``QEMU_AUDIO_`` environment variables and ``-audio-help`` (since =
4.0)
> > >     Creating sound card devices and vnc without ``audiodev=3D`` prope=
rty (since 4.2)
> > >     Creating sound card devices using ``-soundhw`` (since 5.1)
> >
> > I think these three should be dropped together, to minimize disruption.
> >
> > Where do we strand in terms of libvirt support?  IIRC audiodev=3D suppo=
rt
> > in libvirt is rather recent (merged this year).  I'd tend to wait a bit
> > longer because of that.
> >
> > Daniel?
>
> Libvirt added supoort for -audio in 7.2.0, release April 4th, so only
> one month ago.
>
> If we drop the features in QEMU in this dev cycle though, this won't
> impact most users until QEMU 6.1 releases in mid August. I'm perfectly
> ok with people who use unreleased QEMU git master needing to update
> their libvirt. The final release date is far enough away that distros
> will have had new enough libvirt for a good while.

It does feel to me that dropping the old options now would be being
a bit over-eager, though. The deprecation cycle time is a minimum, not
a target :-)

-- PMM

