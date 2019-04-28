Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64750B5D7
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Apr 2019 12:44:08 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42448 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hKhHz-00015d-8A
	for lists+qemu-devel@lfdr.de; Sun, 28 Apr 2019 06:44:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hKhGu-0000io-Ep
	for qemu-devel@nongnu.org; Sun, 28 Apr 2019 06:43:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hKhGs-0000fH-HM
	for qemu-devel@nongnu.org; Sun, 28 Apr 2019 06:43:00 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:44362)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hKhGq-0000eP-3p
	for qemu-devel@nongnu.org; Sun, 28 Apr 2019 06:42:56 -0400
Received: by mail-ot1-x32a.google.com with SMTP id d24so6246580otl.11
	for <qemu-devel@nongnu.org>; Sun, 28 Apr 2019 03:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1rhYIhAS3D9HTIH1UY8Y3Oa3q/L+zX66vf5zhMMDcoM=;
	b=Uf+EKOLYWVsIAmA6jeCRsYklWc4tm6q0KGPNFIJP9v9MGS/bGEZ7PmJ8X59H/u/qx7
	IrB10YWCoGZvd5lcDAfdd2M3lwlLe68qsqMCUAH1pvXOdl571dki/QkAHF3m1rfTVhVL
	a+B0jogNIXwy75fHmDW4P+q6p4r9TW/7qEeX29YYz46VmOGg7ZoVwYZHI1vU1S2w/JjM
	zlGzQvWYGNiNJYKwiH4LW+Uk6pZ+hGSVkOLFFwKM9MAvCyX68CuyV0sTfedOOd/1LztR
	Mu8nvlyz6HIEPH/q807kxQqJUGuVp2sBKXSkdSgK7CxTQEUNz1wWESi241ZGp4IgCccr
	CbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1rhYIhAS3D9HTIH1UY8Y3Oa3q/L+zX66vf5zhMMDcoM=;
	b=MD9JFdBi+UIjLgtEQmCHRNIyMjrcMfBAyioaVKHWCW9yqx/mKcdrSFiAyAndgz524A
	aLQZGCoNB2+0K1wTm28yUc9lbm0YkTxM2F/kMsw8AQ4NyW1kemtrfvovSKkG5+1Ay+r6
	7WpX32I2AUKfExk9H6F8OPlUZvrvYKSSZjIJlb74SBwh39EA57kucx90Zq30FbT/XguD
	Dnp4n/6HgBR1DhpDGqb8vpYIYLD2AzeXYi4n112G829jGEO5ZT9LhMlNaHdf7DhTFNn9
	UCwwN+EL+g6ISmDEJ65vLfQbAd0D7EVux6rC63aPs/mWMkbZPVMHlp3LEQIeFeL10cB+
	PMSg==
X-Gm-Message-State: APjAAAXHYASAcgnSRHlmLcIZmpWcKR6uA29SHz4nYosm1p3goc01asOb
	AXufwIJknW9aTVpOhFDIGeOgmI3hdXC9bGIDtDGN48Sc
X-Google-Smtp-Source: APXvYqwHakerCbdvgZjyqdAePmhEHHolfob3Itvm8JnuA+Ns01Qay/wnHFpcsOqt3iSvdRa5ycH0q4EQu/4gBGnbF0I=
X-Received: by 2002:a9d:57c4:: with SMTP id q4mr589463oti.151.1556448174424;
	Sun, 28 Apr 2019 03:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190426060627.18153-1-david@gibson.dropbear.id.au>
In-Reply-To: <20190426060627.18153-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 28 Apr 2019 11:42:42 +0100
Message-ID: <CAFEAcA-Psn1mhZBfO7de01VL6FfWZC8C87O1qvG0Vn_u31bZew@mail.gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::32a
Subject: Re: [Qemu-devel] [PULL 00/36] ppc-for-4.1 queue 20190426
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: gkurz@kaod.org, qemu-ppc <qemu-ppc@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Apr 2019 at 07:06, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit 3284aa128153750f14a61e8a96fd085e6f2999b6:
>
>   Merge remote-tracking branch 'remotes/lersek/tags/edk2-pull-2019-04-22' into staging (2019-04-24 13:19:41 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/dgibson/qemu.git tags/ppc-for-4.1-20190426
>
> for you to fetch changes up to aaef873b130f4f9c78f8e97b69c235c81b8b8b88:
>
>   target/ppc: improve performance of large BAT invalidations (2019-04-26 11:37:57 +1000)
>
> ----------------------------------------------------------------
> ppc patch queue 2019-04-26
>
> Here's the first ppc target pull request for qemu-4.1.  This has a
> number of things that have accumulated while qemu-4.0 was frozen.
>
>  * A number of emulated MMU improvements from Ben Herrenschmidt
>
>  * Assorted cleanups fro Greg Kurz
>
>  * A large set of mostly mechanical cleanups from me to make target/ppc
>    much closer to compliant with the modern coding style
>
>  * Support for passthrough of NVIDIA GPUs using NVLink2
>
> As well as some other assorted fixes.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

