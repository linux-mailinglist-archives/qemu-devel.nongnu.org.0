Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662D61C3B31
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 15:26:34 +0200 (CEST)
Received: from localhost ([::1]:40308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVb7B-0007Cy-Ff
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 09:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jVb6G-0006g1-6w
 for qemu-devel@nongnu.org; Mon, 04 May 2020 09:25:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41481
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jVb6E-0007yg-9r
 for qemu-devel@nongnu.org; Mon, 04 May 2020 09:25:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588598733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3QcK2mS7c6sye8DSpEHpIMMzG2iaQSD7K3/a8yUw8ms=;
 b=SXz/RfMEwNhH8LIaIP3RyuTs9rlzL31ErBqFDNx+BNXwQPOPHl7XzeOJpjWmK41Fim0NJY
 ioBFyioEuRUtvOrC8d1BxC1V8768eVbm+JXDNBucZyIcdJlSSSmUPhKr5MHISp+h2Kppjw
 39Lj4ib3Ic0YOyDkssCyNPbkdhKKlWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-7tMd-vIRNqSAJ012yuCQaw-1; Mon, 04 May 2020 09:25:25 -0400
X-MC-Unique: 7tMd-vIRNqSAJ012yuCQaw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E59C8015CF;
 Mon,  4 May 2020 13:25:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A45A62C277;
 Mon,  4 May 2020 13:25:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 006D017477; Mon,  4 May 2020 15:25:16 +0200 (CEST)
Date: Mon, 4 May 2020 15:25:16 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 10/15] acpi: parallel: don't use _STA method
Message-ID: <20200504132516.yfdysvnyv3oys75a@sirius.home.kraxel.org>
References: <20200429140003.7336-1-kraxel@redhat.com>
 <20200429140003.7336-11-kraxel@redhat.com>
 <20200430182524.5e6fd311@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200430182524.5e6fd311@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 04:24:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 30, 2020 at 06:25:24PM +0200, Igor Mammedov wrote:
> On Wed, 29 Apr 2020 15:59:58 +0200
> Gerd Hoffmann <kraxel@redhat.com> wrote:
>=20
> > The _STA method dates back to the days where we had a static DSDT.  The
> > device is listed in the DSDT table unconditionally and the _STA method
> > checks a bit in the isa bridge pci config space to figure whenever a
> > given is isa device is present or not, then evaluates to 0x0f (present)
> > or 0x00 (absent).
> >=20
> > These days the DSDT is generated by qemu anyway, so if a device is not
> > present we can simply drop it from the DSDT instead.
> >=20
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>=20
> looking more at it, we should also cleanup no longer used LPEN field
> the same applies to similar fields for serial and ...=20

IIRC these bits are in the chipset specs so we should not remove them
from pci config space.

Removing from DSDT should be possible indeed (I guess this is what you
mean?)

take care,
  Gerd


