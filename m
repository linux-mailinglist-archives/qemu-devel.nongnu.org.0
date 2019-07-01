Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFFD4B0DA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 06:28:14 +0200 (CEST)
Received: from localhost ([::1]:35030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdSCj-0007ae-1U
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 00:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55865)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <brogers@suse.com>) id 1hdSBM-00076Q-PU
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 00:26:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <brogers@suse.com>) id 1hdSBJ-0004iT-32
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 00:26:46 -0400
Received: from prv-mh.provo.novell.com ([137.65.248.74]:51251)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <brogers@suse.com>) id 1hdSBH-0004gI-Iq
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 00:26:44 -0400
Received: from INET-PRV-MTA by prv-mh.provo.novell.com
 with Novell_GroupWise; Tue, 18 Jun 2019 22:26:40 -0600
Message-Id: <5D09B9F402000048000A1DB3@prv-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 18 Jun 2019 22:28:36 -0600
From: "Bruce Rogers" <brogers@suse.com>
To: <peter.maydell@linaro.org>,<qemu-devel@nongnu.org>,
 <jsnow@redhat.com>
References: <5D096A9302000048000A1D8C@prv-mh.provo.novell.com>
 <5D0975BE02000048000A1D94@prv-mh.provo.novell.com>
 <15622953-3be9-c639-b50c-56ed8d3310b9@redhat.com>
In-Reply-To: <15622953-3be9-c639-b50c-56ed8d3310b9@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 137.65.248.74
Subject: Re: [Qemu-devel] Recent python-sphinx errors out building doc
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>> On 6/18/2019 at 6:11 PM, John Snow <jsnow@redhat.com> wrote:

>=20
> On 6/18/19 7:37 PM, Bruce Rogers wrote:
>> Hi,
>>=20
>> (Resent with correct address for John)
>> I build recent upstream qemu in the openSUSE Build Service, and for
>> the Factory repository there, python-sphinx was recently updated to
>> version 2.1.1. This caused the build to fail as follows:
>> /home/abuild/rpmbuild/BUILD/qemu-4.0.50/docs/interop/bitmaps.rst:202:Cou=
ld
>> not lex literal_block as "json". Highlighting skipped.
>>=20
>> The python-sphinx tools is called with warnings are treated as errors
>> it looks like. I don't know much at all about this tool, and hopefully
>> someone knows what to fix here. If you want to give me a pointer
>> on what needs to change, I could give a go at doing a fix however.
>>=20
>> Thanks,
>>=20
>> Bruce
>=20
> Hi, there's a series designed to fix this:
>=20
> https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg00348.html=20
>=20
> I think it's up to Peter to merge it as the maintainer of the Sphinx
> machinery.

Yup, this series fixes it for me. Thanks!

Bruce


