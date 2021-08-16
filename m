Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D2F3ED9C1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 17:18:39 +0200 (CEST)
Received: from localhost ([::1]:42386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFeNq-0005AR-OG
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 11:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mFeM2-0003e9-JR
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 11:16:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mFeM0-0007yQ-Ko
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 11:16:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629127004;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hw341CdRRfI9W7otGB/Ln/3wgaFoJ9zI6kaYPlIdHck=;
 b=P2u5IXG7sOtUS2Vp+GajVvgEq9ynKnGqU/cyqii/j8I1cppKbpOlJ8ij3YsMaQOwDog3DL
 C4dEAP4zBdYVP1PNaLzupDgTGWPFr8jiE0QG6IDbKFkjQQcp8Y06t9IoBt39tZf0BuMarv
 Nzoqvi0tqY15O7WtdT2gCX/xwyTJs6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-D2SgY7DZMK623HrSP3CXDQ-1; Mon, 16 Aug 2021 11:16:42 -0400
X-MC-Unique: D2SgY7DZMK623HrSP3CXDQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 581196EAF7;
 Mon, 16 Aug 2021 15:16:41 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3CA319C46;
 Mon, 16 Aug 2021 15:16:33 +0000 (UTC)
Date: Mon, 16 Aug 2021 16:16:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
Message-ID: <YRqBTiv8AgTMBcrw@redhat.com>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <fb737cf0-3d96-173f-333b-876dfd59d32b@redhat.com>
 <YRp09sXRaNPefs2g@redhat.com>
 <b77dfd8f-94e7-084f-b633-105dc5fdb645@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b77dfd8f-94e7-084f-b633-105dc5fdb645@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: thomas.lendacky@amd.com, Ashish Kalra <Ashish.Kalra@amd.com>,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, tobin@ibm.com, jejb@linux.ibm.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, dgilbert@redhat.com,
 frankeh@us.ibm.com, dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 05:00:21PM +0200, Paolo Bonzini wrote:
> On 16/08/21 16:23, Daniel P. Berrangé wrote:
> > snip
> > 
> > > With this implementation, the number of mirror vCPUs does not even have to
> > > be indicated on the command line.  The VM and its vCPUs can simply be
> > > created when migration starts.  In the SEV-ES case, the guest can even
> > > provide the VMSA that starts the migration helper.
> > 
> > I don't think management apps will accept that approach when pinning
> > guests. They will want control over how many extra vCPU threads are
> > created, what host pCPUs they are pinned to, and what schedular
> > policies might be applied to them.
> 
> That doesn't require creating the migration threads at startup, or making
> them vCPU threads, does it?
> 
> The migration helper is guest code that is run within the context of the
> migration helper in order to decrypt/re-encrypt the code (using a different
> tweak that is based on e.g. the ram_addr_t rather than the HPA).  How does
> libvirt pin migration thread(s) currently?

I don't think we do explicit pinning of migration related threads right
now, which means they'll inherit characteristics of whichever thread
spawns the transient migration thread.  If the mgmt app has pinned the
emulator threads to a single CPU, then creating many migration threads
is a waste of time as they'll compete with each other.

I woudn't be needed to create migration threads at startup - we should
just think about how we would identify and control them when created
at runtime. The complexity here is a trust issue - once guest code has
been run, we can't trust what QMP tells us - so I'm not sure how we
would learn what PIDs are associated with the transiently created
migration threads, in order to set their properties.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


