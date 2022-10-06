Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65B65F6DF5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 21:12:25 +0200 (CEST)
Received: from localhost ([::1]:45088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogWIB-0006DN-Hn
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 15:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1ogVwd-0000pM-It
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:50:07 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:27723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1ogVwY-00063o-MS
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:50:07 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 4Mk0qW0rTMz4CVb
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 18:49:59 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Mk0qW06tqz3h0D
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 18:49:59 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1665082199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1IDqeNv+wxc/imNmped9aXyIkyRmqwAAdagPofWYa78=;
 b=pNREQX4IeRQFVpmRxuZ065m+EUmHrW1F6ilpsbs7pkNWKa9IN62W8ILJ95xNDYIGWXfbXH
 rpJVttXhAIv+W7xg/QMriQH55QqStYuRipEsYRL3Gnw7onWPui+52XtLbpPhc7dNYZ8p6+
 KJKL709gh8gkVVxzcL0puD4XamnHKJDkjEPsTwzTDhwXwtt818ZMIq2BvqiHqnR/UGcjdk
 hcSI/0/i+DXyU75Omp66VVrWzivexNSRToXIxHaxKrbCEGPORI0/VK6U9HE4vZTKRMVcS0
 +XQz0bArSlNRs7mhBMpjYf3JboC5FJ9gfSTyku84TyhH7joCG9aV10WS02oR2g==
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 4Mk0qV5lzmzYmG
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 18:49:58 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f174.google.com with SMTP id d15so1606075qka.9
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 11:49:58 -0700 (PDT)
X-Gm-Message-State: ACrzQf1vEmafUmEdb2iUIoCg/oCuLQl/IFp7vWve0HErXOqZ5oWkzt7M
 UTszdG/umppEu/PiTScrM1m3Ys5/laPwn7uasXw=
X-Google-Smtp-Source: AMsMyM6ZVNoDEJ3Eo45Hp73eVre3bD58fSAYmO5A0M3chcR2cD7nffG7WS1+HESLmhi14va19jpXgesHJ99Jm5Mb+9Q=
X-Received: by 2002:a05:620a:2045:b0:6df:9c34:5184 with SMTP id
 d5-20020a05620a204500b006df9c345184mr1214250qka.425.1665082198262; Thu, 06
 Oct 2022 11:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221004120047.857591-1-berrange@redhat.com>
 <5c5849a3-6830-8577-c427-02cb3244ba8c@linaro.org>
 <Yz8aqBq7m0wn0jvS@redhat.com>
 <0d3f27ab-de02-c5b5-488f-08fb7e329bd8@linaro.org>
In-Reply-To: <0d3f27ab-de02-c5b5-488f-08fb7e329bd8@linaro.org>
From: Kyle Evans <kevans@freebsd.org>
Date: Thu, 6 Oct 2022 11:49:47 -0700
X-Gmail-Original-Message-ID: <CACNAnaHN=xv14PycQ3_nvu60AkSyFc=mAXeh_EVcats8UnrbrA@mail.gmail.com>
Message-ID: <CACNAnaHN=xv14PycQ3_nvu60AkSyFc=mAXeh_EVcats8UnrbrA@mail.gmail.com>
Subject: Re: [PATCH] linux-user,bsd-user: re-exec with G_SLICE=always-malloc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>, ncopa@alpinelinux.org,
 Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1665082199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1IDqeNv+wxc/imNmped9aXyIkyRmqwAAdagPofWYa78=;
 b=d2ebDQ6Uc6nwcn+sBBnZqPs/DDnPLtCDjpjdG58a7sTiRc52a3Va1xbz5sAHLypy8olKiR
 H559F5elx6x0jkITvqdMWpws8+nuIWpzdJ5vd5vvWE4A7iXd4uyHIrO/1jXkJ+MYAwBIv1
 Gh+eXnagmYsNLw8/nHUufArLKQP+hsg/UDc06INjKFKrEtRrRxPFQMD3AGNh01lYIfdPlD
 CqLJprDkbl6NICo37ElBVOjAdSt9tVanpESV+/tTtODTcCzmEjBTPDrW9gwi20axglBWI4
 BYb8co04wirxrFUrjZsllPIpTr5TMdoSTMQ32V1h/RT73wTuCFNiVLGpmsCYEA==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1665082199; a=rsa-sha256; cv=none;
 b=HQMc2+XYZKCssO61R6/rX5MFrdc0ov0aBE5a7ntImUaMtOXBHBWzXFIIU6DX+iY4rv9xyJ
 1UD6qqzElkhNCrj+QpWItXuFHAYSUALdMZhp6YJLBjJohiDDJGjkZBy4CqYBn/nctQSX0J
 J2NPkSGvADPiYbYMuybyFX83958aBdyRe10K9AFDUfgwXO3ojAbD2Md3jw1HRADAjDERc8
 POySFAiRWycB7YVAdzsqAUHz5N0Rr6IChDyRMtYl8LJ2ST8Pga4dIXwXwjrIOLGrubEo1M
 DVwyxI8O1bRbN7mBENuBLC50cRr5ZkE6BoTOPaLA/kzYCnxx8jnZ7xSSNVc4ag==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 6, 2022 at 11:29 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/6/22 11:12, Daniel P. Berrang=C3=A9 wrote:
> > The only possible silver linining is that in static linked builds,
> > it appears that a QEMU constructor with priority 101, will pre-empt
> > the constructor from any library. This is kind of crazy, as it means
> > if any library or app code uses priorities, it'll get totally different
> > execution ordering depending on whether it is dynamic or statically
> > built.
>
> Plausible...
>

> > I guess we could rely on this hack if we declare that everyone using
> > binfmt is probably relying on static linked QEMU, and in non-binfmt
> > cases people can set the env var themselves.  It still feels pretty
> > dirty.
>
> ... but as you say, dirty.

FWIW, on FreeBSD at least, we don't support dynamically linked
bsd-user and I'd go as far as to say that we have no desire to change
that in the future, either -- the benefits are simply not there to
outweigh the pain for our use-cases.

Thanks,

Kyle Evans

