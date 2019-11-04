Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA9DEDC27
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Nov 2019 11:10:58 +0100 (CET)
Received: from localhost ([::1]:59190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRZK5-0008OB-1F
	for lists+qemu-devel@lfdr.de; Mon, 04 Nov 2019 05:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50109)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iRZJF-0007sI-Vd
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 05:10:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iRZJE-0008Mj-66
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 05:10:05 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:27385
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iRZJE-0008Lx-28
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 05:10:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572862202;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iEnJ2SvQm+Z5gBTpgQnwSePMmdltOa5FPnrmdRNGo/E=;
 b=GHv3drYyosFxNFsOcXIcbwX8GisJpuMObi0kO5QPYAL+6OA4avD1cbrU3Qc5RCrv1euxM6
 hSU5sNWGEd+PX9vm87uGnCa7AMniXAEwJmemxG/WI5GV7Zl9TxtIBXGUiC05yOCHJRpcm2
 rLCW2dFi4cOIotY/bNdMFK+7L2J87zQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-e43JyHB1NO2cED5bn3owkg-1; Mon, 04 Nov 2019 05:09:59 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E62DF1005502
 for <qemu-devel@nongnu.org>; Mon,  4 Nov 2019 10:09:58 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81DD95D9E5
 for <qemu-devel@nongnu.org>; Mon,  4 Nov 2019 10:09:58 +0000 (UTC)
Date: Mon, 4 Nov 2019 10:09:56 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: Wiki account
Message-ID: <20191104100956.GD2987@redhat.com>
References: <CAGbAg_D_FL-7GVppw_nYDV3i2Bu7Z1hm6eW74tvhvxEKXh0KcA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGbAg_D_FL-7GVppw_nYDV3i2Bu7Z1hm6eW74tvhvxEKXh0KcA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: e43JyHB1NO2cED5bn3owkg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Nov 03, 2019 at 11:27:33AM +0100, Esteban Bosse wrote:
> Hello,
> I would like to have an wiki account.
>=20
> Preferred user: estebanb

I've created this account and sent password details off-list.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


