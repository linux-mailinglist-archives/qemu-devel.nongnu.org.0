Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD1F32154A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 12:43:03 +0100 (CET)
Received: from localhost ([::1]:35460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE9cE-0000eL-4e
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 06:43:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lE9Ze-0007GI-RL
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:40:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lE9Za-0001if-UZ
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:40:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613994016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ar+FSzRFv2CpKg2e0GtHo+U1918AoLkW2cYxvW82tXA=;
 b=QNCacSPZMycFvZZc4ZSHAsw1381srpzK4yFf1gOo02P2XHy3OC/a4xTaLOL0+RIBBUSoxo
 cgClfqJYQGBbkewztGXO13xHtsPtPgjTvs1s7c+kcLs5AjDQCfvAoYW0Po3h6u6o+lIPs/
 pJY4y/JjRD6uPjVF+iCKhsiBgEVVaPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-DXgKjrsNPv2J633q1S_yIQ-1; Mon, 22 Feb 2021 06:40:15 -0500
X-MC-Unique: DXgKjrsNPv2J633q1S_yIQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11859AFA82;
 Mon, 22 Feb 2021 11:40:14 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-186.ams2.redhat.com [10.36.114.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 949255D9CC;
 Mon, 22 Feb 2021 11:40:09 +0000 (UTC)
Date: Mon, 22 Feb 2021 12:40:07 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: Interactive launch over QMP socket?
Message-ID: <20210222114007.GB6866@merkur.fritz.box>
References: <47b15088-514a-8174-029d-8d9c4571960a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <47b15088-514a-8174-029d-8d9c4571960a@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: jejb@linux.ibm.com, npmccallum@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 10.02.2021 um 19:01 hat Connor Kuehl geschrieben:
> Hello,
> 
> Does QEMU have an internal API which would allow VM construction to wait at
> a *very specific point* until specific data/QMP message(s) are supplied via
> the QMP socket?
> 
> For some additional context: QEMU supports launching AMD SEV-protected
> guests; in short: encrypted virtual machines. Guest owners may participate
> in attestation to cryptographically verify their assumptions about the
> guest's initial state, the host's platform, and the host platform owner's
> identity. If the guest owner is satisfied with the attestation process, a
> secret can be safely injected into the guest's address space over a secure
> channel.
> 
> Attestation is an unavoidably interactive process.
> 
> It appears that QEMU already exposes most of the API required to perform
> this attestation remotely with a guest owner over QMP, with only one
> exception: starting the attestation session. It looks like the session
> components (policy, session-file, and dh-cert-file) are supplied via command
> line arguments to QEMU and don't have a message type in the QMP spec:
> 
> 	-object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1,policy=0x1,session-file=blah.session,dh-cert-file=guest_owner.cert
> 
> I would like to add a message type to QMP which allows guest owners to
> supply this data over a socket and _not_ require these components a priori
> via command line arguments.

I don't think you need a new QMP command for this. If you would use
-object on the command line, you can use QMP object-add at runtime.

Kevin


