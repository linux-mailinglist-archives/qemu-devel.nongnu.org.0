Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C953C6073
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:26:23 +0200 (CEST)
Received: from localhost ([::1]:34176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2ylC-00052o-KX
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2yji-00042L-V2
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:24:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2yjg-0008V7-Fc
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:24:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626107086;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I6N7G//TnrgB0muUq3po6aYpsEbMh78wpzpeCxHNHWE=;
 b=RlW6c8p9OVlP8kngh8AXs4SMTgkSe998d/0pC3Gdt9MSJ5yYZv5Bh0Qs7G08N6Fe0wy8wo
 rrmSQ0wPCdkGWgYYGsGBFOL79FISnsAZK0nWAmsDaWIAXc0utKoszRBqb35io4ka6+cWGi
 cPj8Eu9El1y1tnWUBLHGlXk797rOxmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-0HyX2XqCP_O57od5GgF0EQ-1; Mon, 12 Jul 2021 12:24:45 -0400
X-MC-Unique: 0HyX2XqCP_O57od5GgF0EQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 846DD19057A2;
 Mon, 12 Jul 2021 16:24:43 +0000 (UTC)
Received: from redhat.com (ovpn-114-105.ams2.redhat.com [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E8A260C17;
 Mon, 12 Jul 2021 16:24:36 +0000 (UTC)
Date: Mon, 12 Jul 2021 17:24:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Subject: Re: [RFC PATCH 2/6] i386/sev: extend sev-guest property to include
 SEV-SNP
Message-ID: <YOxswVowx3ksqMm3@redhat.com>
References: <20210709215550.32496-1-brijesh.singh@amd.com>
 <20210709215550.32496-3-brijesh.singh@amd.com>
 <YOxVIjuQnQnO9ytT@redhat.com>
 <cd63ed13-ba05-84de-ecba-6e497cf7874d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd63ed13-ba05-84de-ecba-6e497cf7874d@amd.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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

On Mon, Jul 12, 2021 at 10:56:40AM -0500, Brijesh Singh wrote:
> 
> 
> On 7/12/21 9:43 AM, Daniel P. Berrangé wrote:
> > On Fri, Jul 09, 2021 at 04:55:46PM -0500, Brijesh Singh wrote:
> > > To launch the SEV-SNP guest, a user can specify up to 8 parameters.
> > > Passing all parameters through command line can be difficult.
> > 
> > This sentence applies to pretty much everything in QEMU and the
> > SEV-SNP example is nowhere near an extreme example IMHO.
> > 
> > >                                                               To simplify
> > > the launch parameter passing, introduce a .ini-like config file that can be
> > > used for passing the parameters to the launch flow.
> > 
> > Inventing a new config file format for usage by just one specific
> > niche feature in QEMU is something I'd say we do not want.
> > 
> > Our long term goal in QEMU is to move to a world where 100% of
> > QEMU configuration is provided in JSON format, using the QAPI
> > schema to define the accepted input set.
> > 
> 
> I am open to all suggestions. I was trying to avoid passing all these
> parameters through the command line because some of them can be huge (up to
> a page size)
> 
> 
> > > 
> > > The contents of the config file will look like this:
> > > 
> > > $ cat snp-launch.init
> > > 
> > > # SNP launch parameters
> > > [SEV-SNP]
> > > init_flags = 0
> > > policy = 0x1000
> > > id_block = "YWFhYWFhYWFhYWFhYWFhCg=="
> > 
> > These parameters are really tiny and trivial to provide on the command
> > line, so I'm not finding this config file compelling.
> > 
> 
> I have only included 3 small parameters. Other parameters can be up to a
> page size. The breakdown looks like this:
> 
> policy: 8 bytes
> flags: 8 bytes
> id_block: 96 bytes
> id_auth: 4096 bytes
> host_data: 32 bytes
> gosvw: 16 bytes

Only the id_auth parameter is really considered large here.

When you say "up to a page size", that implies that the size is
actually variable.  Is that correct, and if so, what is a real
world common size going to be ? Is the common size much smaller
than this upper limit ? If so I'd just ignore the issue entirely.

If not, then, 4k on the command line is certainly ugly, but isn't
technically impossible. It would be similarly ugly to have this
value stuffed into a libvirt XML configuration for that matter.

One option is to supply only that one parameter via an external
file, with the file being an opaque blob whose context is the
parameter value thus avoiding inventing a custom file format
parser.

When "id_auth" is described as "authentication data", are there
any secrecy requirements around this ?

QEMU does have the '-object secret' framework for passing blobs
of sensitive data to QEMU and can allow passing via a file:

  https://qemu-project.gitlab.io/qemu/system/secrets.html

Even if this doesn't actually need to be kept private, we
could decide to simply (ab)use the 'secret' object anyway
as a way to let it be passed in out of band via a file.

Libvirt also has a 'secret' concept for passing blobs of
sensitive data out of band from the main XML config, which
could again be leveraged.

It does feel a little dirty to be using 'secrets' in libvirt
and QEMU for data that doesn't actually need to be secret,
just as a way to avoid huge config files. So we could just
ignore the secrets and directly have 'id_auth_file' as a
parameter and directly reference a file.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


