Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BF21B2AA0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Apr 2020 17:04:57 +0200 (CEST)
Received: from localhost ([::1]:59616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQuSF-0002rL-SM
	for lists+qemu-devel@lfdr.de; Tue, 21 Apr 2020 11:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40794)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jQuQ1-0001aM-O6
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 11:02:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jQuQ1-0006bp-4f
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 11:02:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49765
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jQuQ0-0006Re-O7
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 11:02:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587481351;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iAQoQWdVW1JyGJlQl7ojuMgLcXykfnBeBb3NKTXWiiI=;
 b=fRuS1jGwPl9v0xTpn0bc13Tq7SXr2ShuqbSQStP9P5g+XGxhnBQGNcr6LmsvWy2aafw5Vs
 gO2/5K7LRCazPWuPe9zKu15ZiZSByOsjOnVzAwkXZcPR5g+CqBDzF3nXTZQkN++4dkHyW0
 jlm7y2q6vl1yWeDNEB2KAIt5MQv5jVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-9KrN4s41Ma6VCFH-xoHegg-1; Tue, 21 Apr 2020 11:02:13 -0400
X-MC-Unique: 9KrN4s41Ma6VCFH-xoHegg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33998DBA3;
 Tue, 21 Apr 2020 15:02:12 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E3E75C1B2;
 Tue, 21 Apr 2020 15:02:03 +0000 (UTC)
Date: Tue, 21 Apr 2020 16:02:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <ani.sinha@nutanix.com>
Subject: Re: [PATCH] Add a new PIIX option to control PCI hot unplugging of
 devices on non-root buses
Message-ID: <20200421150201.GI479771@redhat.com>
References: <1587136411-200885-1-git-send-email-ani.sinha@nutanix.com>
 <20200417112620-mutt-send-email-mst@kernel.org>
 <2A13ACCD-BD24-41FB-B6EA-2804F7C1FF1D@nutanix.com>
 <20200417120732-mutt-send-email-mst@kernel.org>
 <20200420092459.GF346737@redhat.com>
 <20200420105936-mutt-send-email-mst@kernel.org>
 <07BC06B8-34F6-4C46-ACCE-DD7A4CBA9BC7@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <07BC06B8-34F6-4C46-ACCE-DD7A4CBA9BC7@nutanix.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 04:54:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 21, 2020 at 02:45:04PM +0000, Ani Sinha wrote:
>=20
>=20
> > On Apr 20, 2020, at 8:32 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
> >=20
> > But I for one would like to focus on keeping PIIX stable
> > and focus development on q35.  Not bloating PIIX with lots of new
> > features is IMHO a good way to do that.
>=20
> Does this mean this patch is a no-go then? :(

I'd support this patch, as I don't think it can really be described as
bloat or destabalizing. It is just adding a simple property to
conditionalize existing functionality.  Telling people to switch to Q35
is unreasonable as it is not a simple 1-1 conversion from existing use
of PIIX. Q35 has much higher complexity in its configuration, has higher
memory overhead per VM too, and lacks certain features of PIIX too.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


