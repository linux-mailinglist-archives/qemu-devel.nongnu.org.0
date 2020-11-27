Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BD72C63E1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 12:25:12 +0100 (CET)
Received: from localhost ([::1]:53334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kibsE-0004Ix-QG
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 06:25:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kibpQ-0002XL-SW
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 06:22:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kibpO-0004tM-0E
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 06:22:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606476132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a7jggOEOfjrIiycfA+XZIGrYbaDdJD4H08EQcHQhaEk=;
 b=JEVBULvAn/CgbTCkorfZxH5ofAd7khjZo27YG/hW51pdGXlr66lwnKor1I2YH9o6/54q/5
 a8Hzf4Z9FN9dPqnQOAhVmy5Lsnpip+Ym+rZ1F4Dwav4ntDD9FDT0+25bMOZQzQ4ZI1I+0d
 krkgIXHvIVkaliGJu1UKFXrFquApFR0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-R5_fxmhFOc26qU5Cofai_Q-1; Fri, 27 Nov 2020 06:22:10 -0500
X-MC-Unique: R5_fxmhFOc26qU5Cofai_Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB21B106F8BB;
 Fri, 27 Nov 2020 11:22:09 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FB745D9CC;
 Fri, 27 Nov 2020 11:21:57 +0000 (UTC)
Date: Fri, 27 Nov 2020 12:21:54 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH for-6.0 6/6] qapi: Deprecate 'query-kvm'
Message-ID: <20201127112154.GA105758@angien.pipo.sk>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-7-r.bolshakov@yadro.com>
 <20201127105059.GC1596141@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201127105059.GC1596141@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, Roman Bolshakov <r.bolshakov@yadro.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 10:50:59 +0000, Daniel Berrange wrote:
> Copying libvir-list for the deprecation warning.
> 
> 
> On Mon, Nov 16, 2020 at 04:10:11PM +0300, Roman Bolshakov wrote:
> > 'query-accel' QMP command should be used instead.
> > 
> > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > ---
> >  qapi/machine.json | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> docs/system/deprecated.rst needs to be updated for any deprecation
> to be visible to consumers of QEMU.

On behalf of libvirt I'd like to ask to consider cases where the
replacement for a deprecated feature is added in the same release as the
deprecation happens, to treat the replacement as API stable at merge
time.

Any changes to the command after the series is merged with a deprecation
of the old should be consulted with the libvirt team as we might
actually have already added support for the new approach. Considering it
as "it wasn't released so we can change it" may introduce breakage given
that the relase cycles of libvirt and qemu are not in sync.

We try hard to stay on top of such changes by using the new interface as
soon as possible, but that is very hard if the replacement changes
during the dev cycle.


