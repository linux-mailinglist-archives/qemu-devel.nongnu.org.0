Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE9C3C5E8C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 16:45:03 +0200 (CEST)
Received: from localhost ([::1]:47598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xB8-0001ng-NP
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 10:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2xA8-0000dx-JM
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:44:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2xA7-0001xO-3F
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:44:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626101038;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/hur5bIhEYkoQXxvA1D+ZqSlUPy6prLJMFDVP9XQz8k=;
 b=XhQbIOghs0l6Qt10Q9BexWx/KBWkNMR4DvE8DpZkZr45FnMUtjNeIYWlOUFxd/8xXnt0Xw
 pIQPbpT8QmrAEwpZyJG3afKRUqA6xrnfotdlirngWH+5lt+Ame9nUpc21Og0y5B4N/sil0
 e13lJsdBzdDU+/xc3nJcpCWdgjU6wDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404--D6HKpjGPxaE6Dt4B6ImKQ-1; Mon, 12 Jul 2021 10:43:57 -0400
X-MC-Unique: -D6HKpjGPxaE6Dt4B6ImKQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84DE71932482;
 Mon, 12 Jul 2021 14:43:55 +0000 (UTC)
Received: from redhat.com (ovpn-114-105.ams2.redhat.com [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC88D1962F;
 Mon, 12 Jul 2021 14:43:48 +0000 (UTC)
Date: Mon, 12 Jul 2021 15:43:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Subject: Re: [RFC PATCH 2/6] i386/sev: extend sev-guest property to include
 SEV-SNP
Message-ID: <YOxVIjuQnQnO9ytT@redhat.com>
References: <20210709215550.32496-1-brijesh.singh@amd.com>
 <20210709215550.32496-3-brijesh.singh@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210709215550.32496-3-brijesh.singh@amd.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Michael Roth <michael.roth@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 09, 2021 at 04:55:46PM -0500, Brijesh Singh wrote:
> To launch the SEV-SNP guest, a user can specify up to 8 parameters.
> Passing all parameters through command line can be difficult.

This sentence applies to pretty much everything in QEMU and the
SEV-SNP example is nowhere near an extreme example IMHO.

>                                                              To simplify
> the launch parameter passing, introduce a .ini-like config file that can be
> used for passing the parameters to the launch flow.

Inventing a new config file format for usage by just one specific
niche feature in QEMU is something I'd say we do not want.

Our long term goal in QEMU is to move to a world where 100% of
QEMU configuration is provided in JSON format, using the QAPI
schema to define the accepted input set.  

> 
> The contents of the config file will look like this:
> 
> $ cat snp-launch.init
> 
> # SNP launch parameters
> [SEV-SNP]
> init_flags = 0
> policy = 0x1000
> id_block = "YWFhYWFhYWFhYWFhYWFhCg=="

These parameters are really tiny and trivial to provide on the command
line, so I'm not finding this config file compelling.

> 
> 
> Add 'snp' property that can be used to indicate that SEV guest launch
> should enable the SNP support.
> 
> SEV-SNP guest launch examples:
> 
> 1) launch without additional parameters
> 
>   $(QEMU_CLI) \
>     -object sev-guest,id=sev0,snp=on
> 
> 2) launch with optional parameters
>   $(QEMU_CLI) \
>     -object sev-guest,id=sev0,snp=on,launch-config=<file>
> 
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
>  docs/amd-memory-encryption.txt |  81 +++++++++++-
>  qapi/qom.json                  |   6 +
>  target/i386/sev.c              | 227 +++++++++++++++++++++++++++++++++
>  3 files changed, 312 insertions(+), 2 deletions(-)

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


