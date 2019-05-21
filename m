Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B1C25066
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 15:33:53 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT4ts-0001fV-Qk
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 09:33:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1hT4rf-0000Y7-KX
	for qemu-devel@nongnu.org; Tue, 21 May 2019 09:31:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1hT4re-0005Vl-OP
	for qemu-devel@nongnu.org; Tue, 21 May 2019 09:31:35 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37349)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liq3ea@gmail.com>) id 1hT4re-0005V9-Js
	for qemu-devel@nongnu.org; Tue, 21 May 2019 09:31:34 -0400
Received: by mail-oi1-x242.google.com with SMTP id f4so12787834oib.4
	for <qemu-devel@nongnu.org>; Tue, 21 May 2019 06:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vItEtQ+QxlS5/USu0/0rorN53TvHPQcHiBUKEpZ7mVc=;
	b=VE3fP8hYsw5KJaOwjcY6xCxvDRdjM/OEpmqRTWYtOmrrEbmAzuaQhh+1vJorxLX6Na
	waPEs/mMMpeZxUdwILPsz5iIV6o9g5GaGLuP9ZREqvRBLfTvU24yP6AbKQ9KVbSNICyu
	L6YPKkGuoVL2VhbOnlGjmRA3N7EVuK6FzFd7hUWpBq2z6IeRhb8Wp+A3xe++S3JLTMb+
	lf3+GgPZfYrdl4pROZiXYbKPa6ztdNxr4uZPlZ027TRLQjWjt/wOf3t3iIUEQ43epmUO
	HWAqEEl7e/VAIEmwxjPttiJAjNRzHUOBQ2Y4pEIDfo7SXoLcXvHiTJXu1Yp24RW6FB/o
	IBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vItEtQ+QxlS5/USu0/0rorN53TvHPQcHiBUKEpZ7mVc=;
	b=mpATCPmEcHK7CAQ6c++zp66hlyI0STCssYzOjGUOBHz36ApyxIaWpCRmasn3BMKDbo
	Zlec/xtQ5iPb9IGPrhtTeCsNdMZX8T/R9W461/5fY74/1y1lIvdO/dxCGsfYcwC1Z+ID
	ealx9ZOLvK6zgiJbYijx4Rg1OiSx83RV52lOqN78MTZViOhyWiQqGoOUA3zsRBeyX3LD
	C9csThL0k3EDnb/tppUTxqCCPblE8Tjb4swjxpa2efsRkm4lF0LW4EoBQmtqe9J1pwE3
	uKw1FQegGdKy48CjUIRQgHMi8bA/mArbnpnwKCII7cLMBIFyottc6Nxf7v0zx0XsfbSx
	Z7iA==
X-Gm-Message-State: APjAAAU4kHrcpnHDbwzhEqTjbz1skhMadlz1p4R6yJDDchI0imy+7IgS
	rwqeGTcZKl2v5LLZ+tnxSv6rvkVJ46uRcwG9Qq0=
X-Google-Smtp-Source: APXvYqyhg1HuBz1zbMTTQH5KrVwbLIpLCz1qZ6iiTxDhtgyyQgIho/YXl0dSGB5VS8m+sBXMse6R4JYqVPnPy2oBIug=
X-Received: by 2002:aca:f582:: with SMTP id t124mr3602420oih.56.1558445493841; 
	Tue, 21 May 2019 06:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190510164349.81507-1-liq3ea@163.com>
In-Reply-To: <20190510164349.81507-1-liq3ea@163.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Tue, 21 May 2019 21:30:56 +0800
Message-ID: <CAKXe6SLe1_ppEACqKVesvfrieN=c28rj9ro_xSGZ6F=Rf7iWew@mail.gmail.com>
To: Li Qiang <liq3ea@163.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v4 0/3] hw: edu: some fixes
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
	Qemu Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping....

Paolo, could you merge these to your misc tree?

Thanks,
Li Qiang

Li Qiang <liq3ea@163.com> =E4=BA=8E2019=E5=B9=B45=E6=9C=8811=E6=97=A5=E5=91=
=A8=E5=85=AD =E4=B8=8A=E5=8D=8812:44=E5=86=99=E9=81=93=EF=BC=9A

> Recently I am considering write a driver for edu device.
> After reading the spec, I found these three small issue.
> Two first two related the MMIO access and the third is
> related the DMA operation.
>
> Change since v2:
> Fix an error in patch 2
> Fix some commit message and title.
>
> Change since v1:
> Fix format compile error
>
> Li Qiang (3):
>   edu: mmio: allow 64-bit access
>   edu: mmio: allow 64-bit access in read dispatch
>   edu: uses uint64_t in dma operation
>
>  hw/misc/edu.c | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
>
> --
> 2.17.1
>
>
>
