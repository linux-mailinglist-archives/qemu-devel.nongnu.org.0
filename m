Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C2935F23
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 16:23:43 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYWpJ-0002jI-SK
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 10:23:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Natalia.Fursova@ispras.ru>) id 1hYWoG-0002Ru-Uz
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:22:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Natalia.Fursova@ispras.ru>) id 1hYWoG-0003cn-4A
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:22:36 -0400
Received: from mail.ispras.ru ([83.149.199.45]:59112)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Natalia.Fursova@ispras.ru>) id 1hYWoF-0003PC-Ra
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:22:36 -0400
Received: from NATALIAFURSOVA (unknown [85.142.117.226])
	by mail.ispras.ru (Postfix) with ESMTPSA id 61FF654008B;
	Wed,  5 Jun 2019 17:22:30 +0300 (MSK)
From: "Natalia Fursova" <Natalia.Fursova@ispras.ru>
To: "'Paolo Bonzini'" <pbonzini@redhat.com>, <qemu-devel@nongnu.org>,
	=?koi8-r?B?J/DB28En?= <Pavel.Dovgaluk@ispras.ru>
References: <5cf62de9.1c69fb81.66fc.8f4fSMTPIN_ADDED_BROKEN@mx.google.com>
	<1e9e4edd-f4ad-d8d6-95a2-e0aeab89510d@redhat.com>
	<5cf7b6e6.1c69fb81.1cdca.e260SMTPIN_ADDED_BROKEN@mx.google.com>
	<ec5033a4-5c68-91b7-ca9e-a1f38c990221@redhat.com>
In-Reply-To: <ec5033a4-5c68-91b7-ca9e-a1f38c990221@redhat.com>
Date: Wed, 5 Jun 2019 17:22:30 +0300
Message-ID: <001e01d51baa$1c190650$544b12f0$@Fursova@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdUbn5dVomEoJ1bbQxiyw0FvHJZsTgAClymw
Content-Language: ru
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 83.149.199.45
Subject: Re: [Qemu-devel] qgraph
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I see.
We need this opportunity and want to implement it. Will it ok for QOM
conception?



Best regards,
Natalia

-----Original Message-----
From: Paolo Bonzini [mailto:pbonzini@redhat.com]=20
Sent: Wednesday, June 05, 2019 4:07 PM
To: Natalia Fursova; qemu-devel@nongnu.org; '=F0=C1=DB=C1'
Subject: Re: [Qemu-devel] qgraph

On 05/06/19 14:34, Natalia Fursova wrote:
>=20
> Thank you for your answer. I would like to clarify something about the =
qmp
> commands.
> For example, consider SCSI controller "lsi53c895a". For getting
information
> we use two commands: "device-list-properties" and =
"qom-list-properties".
> Output consists of many properties, but there is no information about
> provided buses by this device. Is there a qmp command which provides =
this
> information?

Unfortunately there is no information in QMP about buses that are
provided.   qom-list-types gives the buses that are requested.

Paolo


