Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6251122D0
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 07:11:34 +0100 (CET)
Received: from localhost ([::1]:34354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icNsq-0001Y3-Rd
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 01:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44600)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1icNlC-0000TC-B5
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 01:03:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1icNl2-0006qN-TP
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 01:03:30 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39219
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1icNl1-0006TO-UG
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 01:03:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575439402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FTpJE7mH6SCsION+c2TOaTUuCral5pPjgELXXLrArcI=;
 b=D94iusgHN1cp6k3prcxUSknYWjP85TRfc/3eFM1fbIVUhqv4vLWh208oBvTMjGT/nTFvb7
 z9NgSJCItbruJ/AbQfVP55NacIFlWvdcHKEoRtEKUEdoVtkr/2Yupu4FjH8Z05DMO7aYBk
 9ZJE4IY7CCjPDBlAu1z26yZeodWfGAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-uoFNAIbDP4qzHX8nNsdBaA-1; Wed, 04 Dec 2019 01:03:18 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 049FB1802F21;
 Wed,  4 Dec 2019 06:03:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86B04600C8;
 Wed,  4 Dec 2019 06:03:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9592F11AB5; Wed,  4 Dec 2019 07:03:15 +0100 (CET)
Date: Wed, 4 Dec 2019 07:03:15 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sam Eiderman <sameid@google.com>
Subject: Re: [PULL 2/2] seabios: update to pre-1.13 snapshot again
Message-ID: <20191204060315.fbpzka7kzx3q7vzz@sirius.home.kraxel.org>
References: <20191118142407.6040-3-kraxel@redhat.com>
 <20191203130043.87913-1-sameid@google.com>
MIME-Version: 1.0
In-Reply-To: <20191203130043.87913-1-sameid@google.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: uoFNAIbDP4qzHX8nNsdBaA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 03, 2019 at 03:00:43PM +0200, Sam Eiderman wrote:
> Hi,
>=20
> Maybe we should add:
>=20
> CONFIG_HOST_BIOS_GEOMETRY=3Dn
>=20
> to rom/config.seabios-128k and recreate the 128k image?

Can do that when updating to 1.13-final (which is not yet tagged).

cheers,
  Gerd


