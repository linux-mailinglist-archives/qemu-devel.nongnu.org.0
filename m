Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C8E327CEE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:17:52 +0100 (CET)
Received: from localhost ([::1]:37638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGgYg-0001VP-J2
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lGgWz-0000la-Jx
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:16:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lGgWv-0001dK-H0
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:16:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614597360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UW5EAhRq01zAlhshGr6Cj14eUZMgDl5l2wepDZBjdqk=;
 b=Mq38vOakwCAA9ufqoSCEW/o6psBIIBqrO1XIwMmVYZg7o4cT7pTABX+VFagCMMSgwT4Dc3
 f1n5jNyiEoFoqAfmg4RrHZcPuTOhocmHQhMJRckfVmBPDpEhS3FwszdtdtLMNdL0YYat7A
 yqlZr9ziv/wHkpCUsQdNFxPZ0eihTDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-ODy2Ef9OM0WM6VBrQGnVAA-1; Mon, 01 Mar 2021 06:15:58 -0500
X-MC-Unique: ODy2Ef9OM0WM6VBrQGnVAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 589AA106BB23;
 Mon,  1 Mar 2021 11:15:56 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-165.ams2.redhat.com [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4DCB60BFA;
 Mon,  1 Mar 2021 11:15:35 +0000 (UTC)
Date: Mon, 1 Mar 2021 12:15:34 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Jim Fehlig <jfehlig@suse.com>
Subject: Re: [PATCH 00/14] deprecations: remove many old deprecations
Message-ID: <20210301111534.GD7698@merkur.fritz.box>
References: <20210224131142.1952027-1-berrange@redhat.com>
 <de4a241c-3cca-203e-62c2-bf2c19f9e7ce@suse.com>
MIME-Version: 1.0
In-Reply-To: <de4a241c-3cca-203e-62c2-bf2c19f9e7ce@suse.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 xen-devel <xen-devel@lists.xenproject.org>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.02.2021 um 18:32 hat Jim Fehlig geschrieben:
> Adding xen-devel and Ian to cc.
> 
> On 2/24/21 6:11 AM, Daniel P. Berrangé wrote:
> > The following features have been deprecated for well over the 2
> > release cycle we promise
> 
> This reminded me of a bug report we received late last year when updating to
> 5.2.0. 'virsh setvcpus' suddenly stopped working for Xen HVM guests. Turns
> out libxl uses cpu-add under the covers.
> 
> > 
> >    ``-usbdevice`` (since 2.10.0)
> >    ``-drive file=3Djson:{...{'driver':'file'}}`` (since 3.0)
> >    ``-vnc acl`` (since 4.0.0)
> >    ``-mon ...,control=3Dreadline,pretty=3Don|off`` (since 4.1)
> >    ``migrate_set_downtime`` and ``migrate_set_speed`` (since 2.8.0)
> >    ``query-named-block-nodes`` result ``encryption_key_missing`` (since 2.10.0)
> >    ``query-block`` result ``inserted.encryption_key_missing`` (since 2.10.0)
> >    ``migrate-set-cache-size`` and ``query-migrate-cache-size`` (since 2.11.0)
> >    ``query-named-block-nodes`` and ``query-block`` result dirty-bitmaps[i].sta=
> > tus (ince 4.0)
> >    ``query-cpus`` (since 2.12.0)
> >    ``query-cpus-fast`` ``arch`` output member (since 3.0.0)
> >    ``query-events`` (since 4.0)
> >    chardev client socket with ``wait`` option (since 4.0)
> >    ``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, ``acl_remove`` (s=
> > ince 4.0.0)
> >    ``ide-drive`` (since 4.2)
> >    ``scsi-disk`` (since 4.2)
> > 
> > AFAICT, libvirt has ceased to use all of these too.
> 
> A quick grep of the libxl code shows it uses -usbdevice, query-cpus, and scsi-disk.
> 
> > There are many more similarly old deprecations not (yet) tackled.
> 
> The Xen tools maintainers will need to be more vigilant of the deprecations.
> I don't follow Xen development close enough to know if this topic has
> already been discussed.

MAINTAINERS has a section for "Incompatible changes" that covers
docs/system/deprecated.rst. Maybe if the Xen maintainers are interested
in that, we could add another list or individual people there so they
would see patches that deprecate something?

But either way, it would probably be useful to check the full
deprecation list rather than just what we're going to remove right now.

Kevin


