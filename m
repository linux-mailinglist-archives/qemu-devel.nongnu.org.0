Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC3321204
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 04:30:24 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39992 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRSdb-0003bA-S2
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 22:30:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1hRScd-0003KG-6h
	for qemu-devel@nongnu.org; Thu, 16 May 2019 22:29:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1hRScc-0004xl-2S
	for qemu-devel@nongnu.org; Thu, 16 May 2019 22:29:23 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:33267)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liq3ea@gmail.com>) id 1hRScb-0004xE-R9
	for qemu-devel@nongnu.org; Thu, 16 May 2019 22:29:22 -0400
Received: by mail-oi1-x231.google.com with SMTP id m204so4124961oib.0
	for <qemu-devel@nongnu.org>; Thu, 16 May 2019 19:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=icR+CWzDNIbdcZVyJIQbicm9aC17R9QLBeuDJuimjrk=;
	b=Y7IvYtfpCkFmdvAIWL9Rf3zsUgeAKRp5qW/QHl0tZFc+BN8bS1ZvUDoG76HcbTf6xH
	X4jlxl8TAZZsI+LgEgD29Dpjt9O3PjTBb2w2sJmcmhH44UcIX4/vfWjTFSaJDXg1XH6A
	NsoGBiVLYsAAudke+ADhJkc/nCsNOtu8xfh6fSGQlOdtV83bE3q973ZGj4v/j6Ny47eQ
	KY69vKkr418CuaHocTREnm8q0+R3Mmp52rEULTauDrLxPySIfw1L08WBgYezvOKHk9gn
	akEQgwNeQF/rxDMJZxcKHwroQJ9RV9fQu/3vnYCMj80TNhJsYhyrnZsCWNN4yrq1tT4c
	aQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=icR+CWzDNIbdcZVyJIQbicm9aC17R9QLBeuDJuimjrk=;
	b=kIl8vKPONc6P/lXBcT2Un3aRxgtpb1p73xdxZHZcY3vtJ+gyw6Roeg8QsZofp+bUwl
	K9LA2pPqiQ42+SsczCdZY533PAL/dkArBCqtJcRXXV4iPQo/yOwpPOUfB6r1tzpQPbp7
	VmriDxpxKykarztIQLfefSq6PAdjzrf8bhag5Btkoo2laEqiGbmlNtTljScu/XZReNpC
	8MBF91JbsHdVHG/FSlS1Aze+pyoG6xnL1vOETfk5Gie0ihRP2I2A+ko7NMnCqAzl+Vu6
	Qw6JOTK7jxNN9Rym6cPOw5RaXGypRgRrZC5rKUoLNsPR6hdgaKc6b5QkLivARfXR+Z1u
	tkBQ==
X-Gm-Message-State: APjAAAXtXzNP20dl0GDtoPfJKq1/VQIEZVSrK+CwgXlkrZ5u9U6aYDpI
	dQMqNz4MwySs1qtRJ2zI7T+X7yNRWgrrjpUlaOo=
X-Google-Smtp-Source: APXvYqy8LJsTlX5pUbwmXFA8gHh98BdbqxAnelxpU9zO5I++1SLPwUfdM+rWq7ObYQ/PbuvEib8Ya3uFHEwBdssclFk=
X-Received: by 2002:aca:fc43:: with SMTP id a64mr63726oii.129.1558060160123;
	Thu, 16 May 2019 19:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190424140643.62457-1-liq3ea@163.com>
	<CAKXe6S+J7OgqJkrDByo3y9M5BGTaCN0Cjb0_WYxDyTvFGg-w8w@mail.gmail.com>
In-Reply-To: <CAKXe6S+J7OgqJkrDByo3y9M5BGTaCN0Cjb0_WYxDyTvFGg-w8w@mail.gmail.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Fri, 17 May 2019 10:28:44 +0800
Message-ID: <CAKXe6SL3x6S5Pco6ZdFvPpmwPhPj6d2B7mFLDbyGoSqcGB+KCQ@mail.gmail.com>
To: Li Qiang <liq3ea@163.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::231
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v2 0/5] fw_cfg_test refactor and add two
 test cases
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
Cc: lvivier@redhat.com, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	Qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping.....

Li Qiang <liq3ea@gmail.com> =E4=BA=8E2019=E5=B9=B45=E6=9C=889=E6=97=A5=E5=
=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=885:57=E5=86=99=E9=81=93=EF=BC=9A

> Ping.... this serials.
>
> Thanks,
> Li Qiang
>
> Li Qiang <liq3ea@163.com> =E4=BA=8E2019=E5=B9=B44=E6=9C=8824=E6=97=A5=E5=
=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=8810:07=E5=86=99=E9=81=93=EF=BC=9A
>
>> In the disscuss of adding reboot timeout test case:
>> https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg03304.html
>>
>> Philippe suggested we should uses the only related option for one
>> specific test. However currently we uses one QTestState for all the
>> test cases. In order to achieve Philippe's idea, I split the test case
>> for its own QTestState. As this patchset has changed a lot, I don't bump
>> the version.
>>
>> Change since v1:
>> Add a patch to store the reboot_timeout as little endian
>> Fix the endian issue per Thomas's review
>>
>> Li Qiang (5):
>>   tests: refactor fw_cfg_test
>>   tests: fw_cfg: add a function to get the fw_cfg file
>>   fw_cfg: reboot: store reboot-timeout as little endian
>>   tests: fw_cfg: add reboot_timeout test case
>>   tests: fw_cfg: add splash time test case
>>
>>  hw/nvram/fw_cfg.c     |   4 +-
>>  tests/fw_cfg-test.c   | 125 +++++++++++++++++++++++++++++++++++++++---
>>  tests/libqos/fw_cfg.c |  55 +++++++++++++++++++
>>  tests/libqos/fw_cfg.h |   9 +++
>>  4 files changed, 184 insertions(+), 9 deletions(-)
>>
>> --
>> 2.17.1
>>
>>
>>
