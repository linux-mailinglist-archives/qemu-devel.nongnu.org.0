Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F2D12F70
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 15:42:59 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMYSo-0000Dy-NV
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 09:42:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMYRg-00084k-1J
	for qemu-devel@nongnu.org; Fri, 03 May 2019 09:41:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMYRf-0008Qe-0M
	for qemu-devel@nongnu.org; Fri, 03 May 2019 09:41:47 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45559)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hMYRe-0008Nk-Pz
	for qemu-devel@nongnu.org; Fri, 03 May 2019 09:41:46 -0400
Received: by mail-oi1-x241.google.com with SMTP id t189so4351662oih.12
	for <qemu-devel@nongnu.org>; Fri, 03 May 2019 06:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j05+Wb+yW/BwCrNzG/deMORmAOifC8pqsFWtq6Q5RJw=;
	b=SsaKcxYRA0XQJymC+a4oooWGeXsretho1MmDYks7TeGB075akbyRzevRoHpMlffTRT
	LjEdqeFDiOAVmSIv0YLlCkEQ9qrT/0l2JtazUJ8X7guPuNrsoFFA7h2sn7qlppD5t25I
	KgTGQgN7myXaJjdof0qi/2jXegKbPHuyhBXFGjltIiNbQdjw+E9DfD6A9xuuozS16GZx
	IDxyZf13iL909qAEqam0PBtBXFkA5X+DRkLNLz607hegBAs7//KxlP9driAHuZTmZGh6
	VB8hJ/nr+zYshaxS6KXO6aZMzEH98CZFYZmehkXMn9sIw+LyEx6bIZ2FyreKNn5iwrEf
	18qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j05+Wb+yW/BwCrNzG/deMORmAOifC8pqsFWtq6Q5RJw=;
	b=bF4+zkk+B3hnRCmTKnAB8CYBWLYbvstmATtp132U6iMrOXz5qtrf/fwpTM1P170EO4
	A156ixWbcR+UTWFovYf3/hXcvfdhcw+eSfMmkqwrThHSie20nrq01iQ8p8ulkCKMXmV/
	nCE1f6/95oQr0LHTOWrvA/Kq1D0kVu9i2f5Dkb1hhE2fLf3F9Sy/SpKwCaF5JeAYQneC
	XpjGk4SXtlRrAIRnjy/BOSPYXLhJ3OkrdfPHijC7U0OvvmM2YAlX8C71Kg5agukaf77E
	ZMcNjovN1Xvrt9fHLosnV0nXjbV+Mvk0y1PEl1ijHunPby6/79YBzeG1moPlYtPLq3Qd
	4LRQ==
X-Gm-Message-State: APjAAAWyJNleKsBj2bUOL0gVid214zlRNlGpL2ddrsOE5bFbUOxrCFg7
	grOisJ+/yRH7Mu0GYsxKphRI9IqiNk0nCTkNTmlLcg==
X-Google-Smtp-Source: APXvYqxD4Y8xvyIRZFrdumF63cbirg4m4WhYx2r96ItnluTr6gcy9TqMrNhlzGni61XYrkagp4GO8aEuhPdiSEy9IUk=
X-Received: by 2002:aca:ab12:: with SMTP id u18mr5555659oie.48.1556890905946; 
	Fri, 03 May 2019 06:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1556774049.git.alistair@alistair23.me>
	<PSXP216MB0277ED8370BA14BF6CFBECE8DD340@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
In-Reply-To: <PSXP216MB0277ED8370BA14BF6CFBECE8DD340@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 May 2019 14:41:34 +0100
Message-ID: <CAFEAcA_OxewimrCacfgW9jBUzUvaUSggCNzyOcgPi2DcYKNZpg@mail.gmail.com>
To: Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v1 2/5] hw/misc: Add the STM32F4xx EXTI
 device
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
Cc: "alistair23@gmail.com" <alistair23@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 May 2019 at 06:41, Alistair Francis <alistair@alistair23.me> wrote:
>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

