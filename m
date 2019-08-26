Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0839D8A0
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 23:45:02 +0200 (CEST)
Received: from localhost ([::1]:57922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2MnN-00019C-Av
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 17:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41518)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1i2MmS-0000fT-9v
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 17:44:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1i2MmQ-0008Sg-4x
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 17:44:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45722)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1i2MmP-0008S3-Vv
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 17:44:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7D011307D965;
 Mon, 26 Aug 2019 21:44:00 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F2415D6C8;
 Mon, 26 Aug 2019 21:43:59 +0000 (UTC)
Message-ID: <241fe64c8cfca92597e865c31981964ecd25229b.camel@redhat.com>
From: Maxim Levitsky <mlevitsk@redhat.com>
To: =?UTF-8?Q?K=C5=91v=C3=A1g=C3=B3=2C_Zolt=C3=A1n?=
 <dirty.ice.hu@gmail.com>,  qemu-devel@nongnu.org
Date: Tue, 27 Aug 2019 00:43:58 +0300
In-Reply-To: <cover.1566847960.git.DirtY.iCE.hu@gmail.com>
References: <cover.1566847960.git.DirtY.iCE.hu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Mon, 26 Aug 2019 21:44:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 0/4] Audio: misc fixes for "Audio
 20190821 patches"
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

On Mon, 2019-08-26 at 21:59 +0200, K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n wro=
te:
> Hi,
>=20
> This is the second iteration of my "random fixes" patchset.  Compared t=
o
> v1, this has a new patch, fixing the memory error caused by an invalid
> malloc.
>=20
> Regards,
> Zoltan
>=20
> K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n (4):
>   audio: fix invalid malloc size in audio_create_pdos
>   audio: omitting audiodev=3D parameter is only deprecated
>   audio: paaudio: fix client name
>   audio: paaudio: ability to specify stream name
>=20
>  qemu-deprecated.texi |  7 +++++++
>  qapi/audio.json      |  6 ++++++
>  audio/audio.c        | 10 +++++-----
>  audio/paaudio.c      |  6 +++---
>  4 files changed, 21 insertions(+), 8 deletions(-)
>=20

With that patch series everything works as expected.
No more heap corruption when I don't use audiodev.
Thanks!


Best regards,
	Maxim Levitsky


