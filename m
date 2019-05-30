Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7552FE97
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 16:55:49 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55215 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWMT6-00034m-9A
	for lists+qemu-devel@lfdr.de; Thu, 30 May 2019 10:55:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.m.mail@gmail.com>) id 1hWMRy-0002gq-5W
	for qemu-devel@nongnu.org; Thu, 30 May 2019 10:54:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.m.mail@gmail.com>) id 1hWMRu-0007SN-Ig
	for qemu-devel@nongnu.org; Thu, 30 May 2019 10:54:36 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42265)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
	id 1hWMRu-0007O2-Bj
	for qemu-devel@nongnu.org; Thu, 30 May 2019 10:54:34 -0400
Received: by mail-ot1-x344.google.com with SMTP id i2so4899873otr.9
	for <qemu-devel@nongnu.org>; Thu, 30 May 2019 07:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9YtoAJKrGPnWmndEVfFEv9afoaP1XyUssHYQ4OcaKVQ=;
	b=Pf+Lb76sWTbdVTGAggqLwsTKYtPcVXJLOoZzsLZ7N2rD2mAA+cnTSSMvois3tIKXI9
	upxLMOmXPYqB7fC4yXlVW1mCq/p3iKjPrJ9aaI5A1LrQlzCoIs1UnIV+jQ/nE1hiePMU
	6X57up3fBGBILfK4NtexqoSH2cCausa+699re8slD7h6BPy0moe2AX48OtrIOuTRChVy
	oC7md3narfu+CzwcBa7qO1t2jqVWx3dPtJIqNhxjATs6frz2XiHJFEBDdRoVA1ESxtPZ
	kyFW1PzfubrutnVdIVbojTpDjbZsRN7irY6/JhGe+7gu8xkfI47Zbp2w6N62Zyy0K5Nc
	bW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9YtoAJKrGPnWmndEVfFEv9afoaP1XyUssHYQ4OcaKVQ=;
	b=NMMcJilTmgliDas+CLJbJfLK8Kj8sLo+MesReGg6FC5+578mqvrz7/6yiUbD/npiY1
	XhqhVjkDzemQmlsUpaOPiS+z4KhLYnFH0SH6IH24Awc+w2pP0479RvVBdflTmCatIpia
	5Gjy5T9Yoa/TfuX3R7w1rY28rRvzPagQ06+q/lZ2bnVPPBHdqYxeRF4sIaYj7NXtVe7/
	m62zCCBO/vuP5/qKJy8JFHA9MrQJmdvKsQcNrBF8pxM4MHf4kvPLE7HqNdMJC13Uq4f8
	ZctMGIf3MUfkieOYhf/JQwe24AH6EBA+2UcC8Sexf4nHuszXQUQwqmbMa8vr+fgSSaIU
	eLyQ==
X-Gm-Message-State: APjAAAWod4oQ+zT46iRWn7JOgImF0TYBSFlSOLucX/zzr0sEddjX8vl5
	Lj9JfWdgEFQy7WrIsfVFUOsdMm+o9nf+/mESl8w=
X-Google-Smtp-Source: APXvYqz7dUw9p+mxf/GwuTORIsaxW5l3Mvsoq2cPGotPQhNyejWk60wKNs8PiQYAjDcKbkct0y7XC8JFDv4wydea6uU=
X-Received: by 2002:a9d:63c1:: with SMTP id e1mr1532957otl.341.1559228071987; 
	Thu, 30 May 2019 07:54:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7212:0:0:0:0:0 with HTTP; Thu, 30 May 2019 07:54:31
	-0700 (PDT)
Received: by 2002:a9d:7212:0:0:0:0:0 with HTTP; Thu, 30 May 2019 07:54:31
	-0700 (PDT)
In-Reply-To: <ecf35f19-ac1e-4964-8c9a-5cab000c6627@linaro.org>
References: <20190522222821.23850-1-richard.henderson@linaro.org>
	<20190522222821.23850-9-richard.henderson@linaro.org>
	<CAFEAcA9MTBqd5GO58hywGhYYGdbbvqiASwCvuKRBE+CVqVZTig@mail.gmail.com>
	<ecf35f19-ac1e-4964-8c9a-5cab000c6627@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 30 May 2019 16:54:31 +0200
Message-ID: <CAL1e-=i6ee0YqGMOFBeiyPsiSzfF55CHePL6Gm_0pM17ZcG-PQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PULL 08/16] tcg/i386: Support vector comparison
 select value
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On May 30, 2019 2:50 PM, "Richard Henderson" <richard.henderson@linaro.org>
wrote:
>
> On 5/30/19 6:26 AM, Peter Maydell wrote:
> >> -#define TCG_TARGET_HAS_cmpsel_vec       0
> >> +#define TCG_TARGET_HAS_cmpsel_vec       -1
> >
> > This is the only place where we define a TCG_TARGET_HAS_* macro
> > to something other than 0 or 1, which means that Coverity
> > complains (CID 1401702) when we use it in a logical boolean expression
> >   return have_vec && TCG_TARGET_HAS_cmpsel_vec;
> > later on.
> >
> > Should it really be -1, or is this a typo for 1 ?
>
> It really should be -1.
> See commit 25c012b4009256505be3430480954a0233de343e,
> which contains the rationale.
>

How about extending commit message so that it contains explanation for -1
introduced in this very patch allowing future developers not to need to
reverse engineer whole git history to (maybe) find the explanation?

Sincerely,
Aleksandar

>
> r~
>
