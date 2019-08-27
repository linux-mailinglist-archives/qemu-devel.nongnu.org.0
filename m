Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80D69E43E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 11:31:02 +0200 (CEST)
Received: from localhost ([::1]:48704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2Xob-00063p-Ui
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 05:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49427)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dovgaluk@ispras.ru>) id 1i2XnV-0005To-7B
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:29:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1i2XnT-0008AL-UL
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:29:53 -0400
Received: from mail.ispras.ru ([83.149.199.45]:37136)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1i2XnT-00086M-NX
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:29:51 -0400
Received: from PASHAISP (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id CE11454006A;
 Tue, 27 Aug 2019 12:29:45 +0300 (MSK)
From: "Pavel Dovgalyuk" <dovgaluk@ispras.ru>
To: =?utf-8?Q?'Alex_Benn=C3=A9e'?= <alex.bennee@linaro.org>,
 "'Richard Henderson'" <richard.henderson@linaro.org>
References: <20190824184635.34192-1-mrolnik@gmail.com>
 <20190824184635.34192-9-mrolnik@gmail.com> <87mufwz3e0.fsf@linaro.org>
 <6c7f5897-e7ed-b5f3-f167-78073a9e5b67@linaro.org> <87r25755a7.fsf@linaro.org>
In-Reply-To: <87r25755a7.fsf@linaro.org>
Date: Tue, 27 Aug 2019 12:29:43 +0300
Message-ID: <001b01d55cb9$f5f88df0$e1e9a9d0$@ru>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Office Outlook 12.0
Content-Language: ru
Thread-Index: AdVcuVo9Scz5SpLqTYKLFOUrX20piAAAHIhA
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 83.149.199.45
Subject: Re: [Qemu-devel] [PATCH v29 8/8] target/avr: Add tests
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
Cc: imammedo@redhat.com, thuth@redhat.com, 'Michael Rolnik' <mrolnik@gmail.com>,
 qemu-devel@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Alex Benn=C3=A9e [mailto:alex.bennee@linaro.org]
> Richard Henderson <richard.henderson@linaro.org> writes:
>=20
> > On 8/26/19 2:23 AM, Alex Benn=C3=A9e wrote:
> >> Are there any compilers available so we can add the multiarch tests =
to "check-tcg"?
> >
> > Debian has a gcc-avr package.
>=20
> Looking at the bios "bytes" it should be easy enough to do a simple
> serial based test. We can add it after it's merged though... is it =
ready
> to go yet?

I tried running this series with ASCIITable example from Arduino IDE.
Everything worked and I've got an ASCII table in the console.

Pavel Dovgalyuk


