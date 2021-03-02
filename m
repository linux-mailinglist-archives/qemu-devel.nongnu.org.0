Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406B632AC6A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:57:07 +0100 (CET)
Received: from localhost ([::1]:49106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHD0s-0001md-AK
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:57:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lHCzW-0000YH-Pj
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:55:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lHCzU-0000ev-FI
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:55:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614722139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UCFdCVs5sGxNB7MEfHRqBEYG7gQEXFQ8dLysohrk+oQ=;
 b=PFCKboJIyagJ0m8t+zrSPHMFldZds6YMQfhD8ZbTVrluR65xfEd7flWjs3PdyY/5oU8Hcl
 yzOwr2QdSOEbQIPuY8sXb1A+lSEH7SA1xigJmAkIW4zIl81mGL3jy1Ji1LhanO+hnljfdA
 XZK0ExA7scV4c8wB3Wu8TKDEyJoy130=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-QA9U3Hc3NE2ahqR4uaWyFQ-1; Tue, 02 Mar 2021 16:55:38 -0500
X-MC-Unique: QA9U3Hc3NE2ahqR4uaWyFQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E97AA804023;
 Tue,  2 Mar 2021 21:55:36 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2F726F7E8;
 Tue,  2 Mar 2021 21:55:36 +0000 (UTC)
Date: Tue, 2 Mar 2021 14:55:31 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Cover docs/igd-assign.txt in VFIO section
Message-ID: <20210302145531.30489a44@omen.home.shazbot.org>
In-Reply-To: <da2393b7-c0a8-8f59-5ee5-4a5569f9853c@redhat.com>
References: <20210202155611.998424-1-philmd@redhat.com>
 <da2393b7-c0a8-8f59-5ee5-4a5569f9853c@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Feb 2021 09:26:17 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> ping?
>=20
> On 2/2/21 4:56 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index bcd88668bcd..838d0f14a59 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1768,6 +1768,7 @@ M: Alex Williamson <alex.williamson@redhat.com>
> >  S: Supported
> >  F: hw/vfio/*
> >  F: include/hw/vfio/
> > +F: docs/igd-assign.txt
> > =20
> >  vfio-ccw
> >  M: Cornelia Huck <cohuck@redhat.com>
> >  =20
>=20

Queued.  Thanks,

Alex


