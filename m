Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD5F132964
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 15:54:33 +0100 (CET)
Received: from localhost ([::1]:50598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioqFc-00086Y-Al
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 09:54:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50484)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iop7g-0005t3-8h
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 08:42:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iop7e-0003EU-T0
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 08:42:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35829
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iop7e-0003EB-P6
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 08:42:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578404534;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=esTNyJI3A1E1uVV7RYU0tw93SQp2eHtDOzs7lxRNzCM=;
 b=XqlwS+p7ocAekMqLzY8yxJq/O9KpbOnnAETSHkd9ny0z0xYGalRUVgQJaiCM1Ct0d8+0dO
 LMJr0lGhL5UVTilttXnwfWjlWPRhOLldgAJbor0cYNmz+Qqj/kDJnfpDeozlicQOr/LCSG
 dquM8K2oDved5Fv9cSISeMfT2WQ9KS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-ecK9DCATPqq5dgLDVCcO0g-1; Tue, 07 Jan 2020 08:42:13 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6215564A7F
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 13:42:12 +0000 (UTC)
Received: from redhat.com (ovpn-112-61.ams2.redhat.com [10.36.112.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9E2B10016DA;
 Tue,  7 Jan 2020 13:42:08 +0000 (UTC)
Date: Tue, 7 Jan 2020 13:42:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 01/10] migration: Increase default number of multifd
 channels to 16
Message-ID: <20200107134205.GM3368802@redhat.com>
References: <20191218020119.3776-1-quintela@redhat.com>
 <20191218020119.3776-2-quintela@redhat.com>
 <20200103165832.GU2753983@redhat.com> <87mub4xurf.fsf@trasno.org>
 <20200107124934.GK3368802@redhat.com> <87muazpf2v.fsf@trasno.org>
MIME-Version: 1.0
In-Reply-To: <87muazpf2v.fsf@trasno.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: ecK9DCATPqq5dgLDVCcO0g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 07, 2020 at 02:32:24PM +0100, Juan Quintela wrote:
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> >> - What does libvirt prefferes
> >
> > Libvirt doesn't really have an opinion in this case. I believe we'll
> > always set the number of channels on both src & dst, so we don't
> > see the defaults.
>=20
> What does libvirt does today for this value?

Libvirt doesn't have any default value. By default migration uses a
single connection.  The mgmt app can request multiple connections
for the migration, which will cause libvirt to turn on multifd with
the request channel count.

Essentially we avoid the problem by not having a separate tunable
for "multifd enable" & "multifd channels" - we only have one tunable
"connection count".  Thus the idea of enabling multifd with a default
channel count doesn't exist.


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


