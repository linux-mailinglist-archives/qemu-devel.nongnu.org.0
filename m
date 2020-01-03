Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D743412FBA4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 18:34:34 +0100 (CET)
Received: from localhost ([::1]:55206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inQqH-0005Kq-6T
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 12:34:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56660)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1inQoi-0004NA-0D
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 12:32:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1inQoe-0007Cr-Mf
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 12:32:54 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37780
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1inQoe-00072s-4J
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 12:32:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578072770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZQ7wJqhmfP/B5rdYGIUG1wz++qoIaAOgrrO1ZSoihmI=;
 b=Xqpyp1ouGBU94NHooH94MAXE+tf+YeMXacSEiq7SuhaGSxK7+4YTp+gYswnbne5w5Zl8He
 h7LED48v0tevDUNv/sr3YEBhWyghP8GrUZSqDaQwq/j2f8sibG5VlBR8D/q4GjOFEyVX26
 9rCf9TXkti2VvQHbkk/Sjqqzm7og2fM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-DjQXrk-EM4-uRvnFRmqsTw-1; Fri, 03 Jan 2020 12:32:49 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0F5E800D55
 for <qemu-devel@nongnu.org>; Fri,  3 Jan 2020 17:32:48 +0000 (UTC)
Received: from work-vm (ovpn-117-78.ams2.redhat.com [10.36.117.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5AE15C548;
 Fri,  3 Jan 2020 17:32:46 +0000 (UTC)
Date: Fri, 3 Jan 2020 17:32:44 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 01/10] migration: Increase default number of multifd
 channels to 16
Message-ID: <20200103173244.GQ3804@work-vm>
References: <20191218020119.3776-1-quintela@redhat.com>
 <20191218020119.3776-2-quintela@redhat.com>
 <20200103165832.GU2753983@redhat.com>
 <20200103170114.GO3804@work-vm>
 <20200103171233.GV2753983@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200103171233.GV2753983@redhat.com>
User-Agent: Mutt/1.13.0 (2019-11-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: DjQXrk-EM4-uRvnFRmqsTw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=iso-8859-1
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrang=E9 (berrange@redhat.com) wrote:
> On Fri, Jan 03, 2020 at 05:01:14PM +0000, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrang=E9 (berrange@redhat.com) wrote:
> > > On Wed, Dec 18, 2019 at 03:01:10AM +0100, Juan Quintela wrote:
> > > > We can scale much better with 16, so we can scale to higher numbers=
.
> > >=20
> > > What was the test scenario showing such scaling ?
> > >=20
> > > In the real world I'm sceptical that virt hosts will have
> > > 16 otherwise idle CPU cores available that are permissible
> > > to use for migration, or indeed whether they'll have network
> > > bandwidth available to allow 16 cores to saturate the link.
> >=20
> > With TLS or compression, the network bandwidth could easily be there.
>=20
> Yes, but this constant is setting a default that applies regardless of
> whether TLS / compression is enabled and/or whether CPU cores are idle.
> IOW, there can be cases where using 16 threads will be a perf win, I'm
> just questioning the suitability as a global default out of the box.
>=20
> I feel like what's really lacking with migration is documentation
> around the usefulness of the very many parameters, and the various
> interesting combinations & tradeoffs around enabling them. So instead
> of changing the default threads, can we focusing on improving
> documentation so that mgmt apps have good information on which to
> make the decision about whether & when to use 2 or 16 or $NNN migration
> threads.

Yes, although the short answer is; increase it if you find your
migration threads are saturated, either due to a very fast network
connection, or a CPU heavy setting (such as TLS or compression).
The answer to that might also vary if you have compression/encryption
offload engines (which I'd like to try).  Given that this series is for
compression, I guess that's the use Juan is using here.

On a 100Gbps NIC (which are readily available these days), I managed to
squeeze 70Gbps out of an earlier multifd version with 8 channels, which
beat the RDMA code in throughput (albeit eating CPU).

Dave

> Regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


