Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B81F2CEE91
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 14:04:11 +0100 (CET)
Received: from localhost ([::1]:42054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klAkr-0001Sm-WF
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 08:04:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1klAjg-0000yq-OG
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 08:02:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1klAjb-00012A-Bc
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 08:02:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607086970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=59X3aab27f3awYI+rGEwZiscQBjw1qgK2xysv2laeaI=;
 b=KpY1F0doNMTlFgRA3jOczytyYb19hpXp7gbeJSB36FgpP9vH2oxA+4jABQ2kjYYDfYkror
 t0Nj07ZLFPrMbmgG1E4Kj5THGzrPZbadDA2Z02YqoUUediFPKyQF4OVGiUGBtZsm7xDjLQ
 KPYxG+9tljBWJKK67BRZ2zwMHDDS27U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-GRo6l-eBPd62plelxZupKQ-1; Fri, 04 Dec 2020 08:02:46 -0500
X-MC-Unique: GRo6l-eBPd62plelxZupKQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0F6218C8C12;
 Fri,  4 Dec 2020 13:02:43 +0000 (UTC)
Received: from gondolin (ovpn-113-97.ams2.redhat.com [10.36.113.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23F085D9CA;
 Fri,  4 Dec 2020 13:02:07 +0000 (UTC)
Date: Fri, 4 Dec 2020 14:02:05 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [for-6.0 v5 00/13] Generalize memory encryption models
Message-ID: <20201204140205.66e205da.cohuck@redhat.com>
In-Reply-To: <f2419585-4e39-1f3d-9e38-9095e26a6410@de.ibm.com>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <f2419585-4e39-1f3d-9e38-9095e26a6410@de.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, frankja@linux.ibm.com,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, david@redhat.com, dgilbert@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 berrange@redhat.com, thuth@redhat.com, pbonzini@redhat.com, rth@twiddle.net,
 mdroth@linux.vnet.ibm.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Dec 2020 09:06:50 +0100
Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> On 04.12.20 06:44, David Gibson wrote:
> > A number of hardware platforms are implementing mechanisms whereby the
> > hypervisor does not have unfettered access to guest memory, in order
> > to mitigate the security impact of a compromised hypervisor.
> > 
> > AMD's SEV implements this with in-cpu memory encryption, and Intel has
> > its own memory encryption mechanism.  POWER has an upcoming mechanism
> > to accomplish this in a different way, using a new memory protection
> > level plus a small trusted ultravisor.  s390 also has a protected
> > execution environment.
> > 
> > The current code (committed or draft) for these features has each
> > platform's version configured entirely differently.  That doesn't seem
> > ideal for users, or particularly for management layers.
> > 
> > AMD SEV introduces a notionally generic machine option
> > "machine-encryption", but it doesn't actually cover any cases other
> > than SEV.
> > 
> > This series is a proposal to at least partially unify configuration
> > for these mechanisms, by renaming and generalizing AMD's
> > "memory-encryption" property.  It is replaced by a
> > "securable-guest-memory" property pointing to a platform specific  
> 
> Can we do "securable-guest" ?
> s390x also protects registers and integrity. memory is only one piece
> of the puzzle and what we protect might differ from platform to 
> platform.
> 

I agree. Even technologies that currently only do memory encryption may
be enhanced with more protections later.


