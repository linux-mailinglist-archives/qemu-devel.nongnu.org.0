Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AF43B3531
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 20:06:09 +0200 (CEST)
Received: from localhost ([::1]:42950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwTjs-00005M-J6
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 14:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lwThF-0006EL-P0
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:03:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lwThC-0000mo-Fc
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624557801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JQYdy3J6Xdu8LxmL65HuXCwsoCLklEyEkZTyeIRlwX8=;
 b=QSiFj2piWdu7VYgin2P4Xq2nD3H0GZc1dfQ4duvF/Z0Z4nuG1pQ0mG/w9V2rIIsSMdl4QR
 1jdYHE0kgA2QeRJco80ntGo16LFF7s62qtjVUtxXuPmiMPYaZQxyExLeVRSyl2Wr8Ht+u1
 wjcTbxTjve1nllfivTt1eaCqGBFNABc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-i8bT9KOKM3iz172pLfbWsQ-1; Thu, 24 Jun 2021 14:03:17 -0400
X-MC-Unique: i8bT9KOKM3iz172pLfbWsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7619A1084F5A;
 Thu, 24 Jun 2021 18:03:15 +0000 (UTC)
Received: from work-vm (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 535CD5D9C6;
 Thu, 24 Jun 2021 18:02:55 +0000 (UTC)
Date: Thu, 24 Jun 2021 19:02:53 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 00/34] modules: add meta-data database
Message-ID: <YNTIzc3pik798KRI@work-vm>
References: <20210624103836.2382472-1-kraxel@redhat.com>
 <YNSeRVV+vejFd9Vw@work-vm>
 <20210624172831.i4pck4moopfcgpbf@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210624172831.i4pck4moopfcgpbf@sirius.home.kraxel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Lieven <pl@kamp.de>,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Gerd Hoffmann (kraxel@redhat.com) wrote:
> On Thu, Jun 24, 2021 at 04:01:25PM +0100, Dr. David Alan Gilbert wrote:
> > * Gerd Hoffmann (kraxel@redhat.com) wrote:
> > > This patch series adds support for module meta-data.  Today this is
> > > either hard-coded in qemu (see qemu_load_module_for_opts) or handled
> > > with manually maintained lists in util/module (see module_deps[] and
> > > qom_modules[]).  This series replaced that scheme with annotation
> > > macros, so the meta-data can go into the module source code and -- for
> > > example -- the module_obj() annotations can go next to the TypeInfo
> > > struct for the object class.
> > 
> > So this is slightly off-topic for the series; but kind of relevant,
> > but...
> > Is there a way to inhibit module loading after a given point?
> 
> We could block loading after machine initialization.
> Has implications for hotplug though.

Yes; I was thinking perhaps a command to explicitly disable autoloading
if people worried about it.

> > I ask, because there's a fairly well known security escalation that
> > takes advantage of NSS loading of PAM modules; typically you have
> > your nice sandboxed application, you write out your nasty .so into the
> > sandbox and then somehow get your application to trigger the PAM module
> > load.
> > Now, what stops the same attack here?
> 
> Placing a new .so at some random directory wouldn't work, qemu only
> loads modules from the search path (but I guess the same is true for
> pam).

Yes, I'm failing to find the CVE I vaguely remember about the details of
how it was messed up.

Dave

> With this patch series applied all modules are listed the in modinfo.c
> database (even if we don't have any metadata about them), so we could
> easily limit loading to modules known at compile time.  Not sure how
> much that alone would improve security though, when the attacker is able
> to write to the qemu module directory it isn't much of a problem to just
> overwrite one of the existing modules.
> 
> We could try work with hashes or signatures stored in modinfo ...
> 
> take care,
>   Gerd
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


