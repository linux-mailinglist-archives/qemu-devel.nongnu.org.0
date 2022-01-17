Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9626249071E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 12:25:39 +0100 (CET)
Received: from localhost ([::1]:36568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Q8n-0003IZ-W9
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 06:25:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n9Q5R-0002To-16
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 06:22:11 -0500
Received: from [2a00:1450:4864:20::531] (port=36358
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n9Q5H-0005fq-6p
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 06:22:03 -0500
Received: by mail-ed1-x531.google.com with SMTP id 30so64202047edv.3
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 03:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=CSd1rTjj/waGvNabUX1Uh3ODjbcqo4gtAPfb3Jw0Pyc=;
 b=GQwKPRHIoAlxHu3F9ZTq6RGaJ/UwvtFY7AoUuhDmc4Bs+M5RUHQcpWfoym4yNMlt4k
 p1Pc0Gzy39taOkoWkxoR6yvryx/01ouYSPoFny+xYayrGV5IILb3nWb20JhkWOFlQ8Yl
 BatfZTdefnDxGxBScLv9VoZGxup5G0nk0oNIi1B3H7VC5dLPHBfnTWGWYJlT85r7sRgP
 wFigGndOMQhNKSe+CH0wehXHFCla7oQH3mv63oxe/62dHZi97g09h3qN7fJElN+hRezT
 eJq8QSks4p9Ocs/krAvEXkZh5V9qXNMusO0VD8J2YJ8Posv4nE6QERVGk4W76LwPo20K
 eVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=CSd1rTjj/waGvNabUX1Uh3ODjbcqo4gtAPfb3Jw0Pyc=;
 b=zJarVCIYXccdTakAE43pObFNOlnv5XCoy3zQPqs7G+gVOlc7yaR87RKwTNY65RB2hL
 0XY/yw1tIIxx9swgtcakr/bl0BeOYZbNcqCZaLVET2WyaQLjJ7RXFJVaincgeQex0II5
 gNMiANVVhGpNAEe9i92yds2fFJoWWyNoRvDBbJ+KTCjzTcWn2eSo6sExYM2f0SG4fak/
 NWF6GhV8LnQU9ym1nJCHnmwRNT0fUbbJi9j4k1SiuG+Jg6+6gKKEymhDYDg2NMx8Ngrx
 9KW5rdd55XvOtXRUiz5zfzG9LE3Iy//IlgD6VqGsPaG6y173Dv09vJR14qXpgJYkrEI5
 tVjQ==
X-Gm-Message-State: AOAM531JwOVOvSmDMM6Dw3tNB5PhbCyimZoHkyDV81Q+UH9q+uCA20oG
 w9ynKyOI84cFYEcFDPYlMTmnzg==
X-Google-Smtp-Source: ABdhPJyMyj7cTUrMRq032jPY+UJdHb4/zeI4rJAKH2na8DO9fL+jm/hCyXe47nmWbteY639djT5usQ==
X-Received: by 2002:a17:907:7f89:: with SMTP id
 qk9mr4015812ejc.506.1642418516661; 
 Mon, 17 Jan 2022 03:21:56 -0800 (PST)
Received: from smtpclient.apple ([79.115.178.1])
 by smtp.gmail.com with ESMTPSA id i14sm5679078eda.54.2022.01.17.03.21.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jan 2022 03:21:55 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: ui/cocoa.m compile error (Cocoa -> SDL)
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <ef5e98d4-d8b2-fc6e-2735-53c075db3f3b@redhat.com>
Date: Mon, 17 Jan 2022 13:21:54 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <CCB6E84E-5F90-4FC6-BEEB-42A7C591BDBF@livius.net>
References: <586FEC07-844C-4E1B-88E0-93B97FFC9010@livius.net>
 <CAFEAcA_=jn1G==9R1=LuU7GF0=LWPz92f1Qx9xO7w+m+TqL1Tw@mail.gmail.com>
 <F140E9AC-F44C-44A9-8670-F60E33046B83@livius.net>
 <574D1950-B892-430B-A450-23262C258950@livius.net>
 <ef5e98d4-d8b2-fc6e-2735-53c075db3f3b@redhat.com>
To: Thomas Huth <thuth@redhat.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::531;
 envelope-from=ilg@livius.net; helo=mail-ed1-x531.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 17 Jan 2022, at 11:41, Thomas Huth <thuth@redhat.com> wrote:
>=20
> On 10/01/2022 11.33, Liviu Ionescu wrote:
>> I now have successful builds on all platforms, including on macOS 11 =
with Apple Silicon and macOS 10.13 with Intel, but I had to disable =
Cocoa support, and enable SDL support.
>> The resulting binaries (qemu-system-arm/aarch64/riscv32/riscv64) =
start, but I could not tell if the lack of Cocoa in the macOS builds has =
some disadvantages or not.
>> Are there any emulated Arm/RISC-V machines that use graphics, so I =
can test my macOS binaries with?
>=20
> Have a look here:
>=20
> https://www.qemu-advent-calendar.org/2018/#day-16
> https://www.qemu-advent-calendar.org/2018/#day-24

Thank you, Thomas.


I tried to run the Arm demo, but, as expected, on macOS starting a qemu =
configured with SDL instead of Cocoa, failed.

I did not check the implementation details, but if Cocoa is mandatory =
when building on macOS, why is it even allowed to choose SDL during =
configure?

Regards,

Liviu


