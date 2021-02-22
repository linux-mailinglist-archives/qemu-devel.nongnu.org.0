Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3A7321CFB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 17:30:14 +0100 (CET)
Received: from localhost ([::1]:39608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEE69-00055A-RC
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 11:30:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEE00-0007AJ-59
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:23:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEDzw-0004NF-Tn
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614011026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0JJJ9oiSAiSRIkKJ1LfYv4t5bl3i5LPv6Tme68z4V3w=;
 b=YSS2rUMUJ6faJuzTK8SUKt4PFndKNjNVo2KF2ajr3jSn8w/AxplxPQJ7a3n5jhQ9OPQ2G6
 +PNnexW/jV1zoFuldyONL7qBDD1KHHTtpGcRZjTu2AMRUmEA4/iNEUl5CuPkU74BTSf+7E
 jV63Vv92bH9R2nRPUkH/X/RR8x6mhPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-L6890zG5OTaRczVPfrW-kA-1; Mon, 22 Feb 2021 11:23:44 -0500
X-MC-Unique: L6890zG5OTaRczVPfrW-kA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B5621934103;
 Mon, 22 Feb 2021 16:23:43 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-186.ams2.redhat.com [10.36.114.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFB425D9D0;
 Mon, 22 Feb 2021 16:23:38 +0000 (UTC)
Date: Mon, 22 Feb 2021 17:23:37 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: Interactive launch over QMP socket?
Message-ID: <20210222162337.GC6866@merkur.fritz.box>
References: <47b15088-514a-8174-029d-8d9c4571960a@redhat.com>
 <20210222114007.GB6866@merkur.fritz.box>
 <YDPQGpo42m8nfLe0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YDPQGpo42m8nfLe0@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Connor Kuehl <ckuehl@redhat.com>, jejb@linux.ibm.com, npmccallum@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22.02.2021 um 16:39 hat Daniel P. Berrangé geschrieben:
> On Mon, Feb 22, 2021 at 12:40:07PM +0100, Kevin Wolf wrote:
> > Am 10.02.2021 um 19:01 hat Connor Kuehl geschrieben:
> > > Hello,
> > > 
> > > Does QEMU have an internal API which would allow VM construction to wait at
> > > a *very specific point* until specific data/QMP message(s) are supplied via
> > > the QMP socket?
> > > 
> > > For some additional context: QEMU supports launching AMD SEV-protected
> > > guests; in short: encrypted virtual machines. Guest owners may participate
> > > in attestation to cryptographically verify their assumptions about the
> > > guest's initial state, the host's platform, and the host platform owner's
> > > identity. If the guest owner is satisfied with the attestation process, a
> > > secret can be safely injected into the guest's address space over a secure
> > > channel.
> > > 
> > > Attestation is an unavoidably interactive process.
> > > 
> > > It appears that QEMU already exposes most of the API required to perform
> > > this attestation remotely with a guest owner over QMP, with only one
> > > exception: starting the attestation session. It looks like the session
> > > components (policy, session-file, and dh-cert-file) are supplied via command
> > > line arguments to QEMU and don't have a message type in the QMP spec:
> > > 
> > > 	-object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1,policy=0x1,session-file=blah.session,dh-cert-file=guest_owner.cert
> > > 
> > > I would like to add a message type to QMP which allows guest owners to
> > > supply this data over a socket and _not_ require these components a priori
> > > via command line arguments.
> > 
> > I don't think you need a new QMP command for this. If you would use
> > -object on the command line, you can use QMP object-add at runtime.
> 
> If the object were standalone that'd true, but 'sev-guest' object you
> create needs to be given to the '-machine' arg's 'memory-encryption'
> parameter. So there's a dependancy that means 'sev-guest' can only
> be used with -object in reality and not QMP object-add.

I see. But an additional QMP command can't change much about this
either.

Maybe the most realistic option today would be making some properties
optional initally so the object can be created and referenced in
-machine, and then you would use qom-set to provide the information
before you actually start using the object.

> This will eventually be solved when we make it possible to fully
> configure QEMU exclusively via QMP.

Yes, once -machine can actually be done via QMP, that would be solved.

Kevin


