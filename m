Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0B3A5BFA
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Sep 2019 19:57:55 +0200 (CEST)
Received: from localhost ([::1]:38982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i4qaP-0007rQ-M6
	for lists+qemu-devel@lfdr.de; Mon, 02 Sep 2019 13:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33516)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <olivier.dion@polymtl.ca>) id 1i4qHg-0004SF-Es
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 13:38:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <olivier.dion@polymtl.ca>) id 1i4qHf-0002vN-5c
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 13:38:32 -0400
Received: from smtp.polymtl.ca ([132.207.4.11]:40681)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <olivier.dion@polymtl.ca>)
 id 1i4qHf-0002lU-1D
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 13:38:31 -0400
Received: from elsa (modemcable059.101-200-24.mc.videotron.ca [24.200.101.59])
 by smtp.polymtl.ca (8.14.7/8.14.7) with ESMTP id x82HahMQ030201
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT); 
 Mon, 2 Sep 2019 13:36:48 -0400
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.polymtl.ca x82HahMQ030201
References: <20190807135458.32440-1-dion@linutronix.de>
 <20190807135458.32440-2-dion@linutronix.de>
 <7a8fa9b4-01b5-e431-be89-00e73235e3ff@vivier.eu>
From: Olivier Dion <olivier.dion@polymtl.ca>
To: Laurent Vivier <laurent@vivier.eu>
In-reply-to: <7a8fa9b4-01b5-e431-be89-00e73235e3ff@vivier.eu>
Date: Mon, 02 Sep 2019 13:36:56 -0400
Message-ID: <875zmaeh1j.fsf@polymtl.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Poly-FromMTA: (modemcable059.101-200-24.mc.videotron.ca [24.200.101.59]) at
 Mon, 2 Sep 2019 17:36:43 +0000
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 132.207.4.11
X-Mailman-Approved-At: Mon, 02 Sep 2019 13:56:52 -0400
Subject: Re: [Qemu-devel] [PATCH 1/1] linux-user: Handle /proc/self/exe in
 syscall execve
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
Cc: qemu-devel@nongnu.org, john.ogness@linutronix.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2019-08-23T12:58:43-0400, Laurent Vivier <laurent@vivier.eu> wrote:

> Le 07/08/2019 =C3=A0 15:54, dion@linutronix.de a =C3=A9crit :
> > From: Olivier Dion <dion@linutronix.de>
> >
> > If not handled, QEMU will execve itself instead of the emulated
> > process.  This could result in potential security risk.
> >

> Could you explain what you mean by potential security risk?

I don't have any exploit in mind, but someone motivated enough could
certainly find one.  For example, it's possible to ask qemu static to
execute another program.

The main point is that an emulator should never leak informations to its
environnement.  If the emulated program can determine that it is being
emulated, other than by an "official" way, then the emulator is at
fault.

--=20
Olivier Dion
Polymtl

