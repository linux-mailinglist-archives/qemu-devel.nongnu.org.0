Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB923C25BA
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:16:52 +0200 (CEST)
Received: from localhost ([::1]:43518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rJE-0000u2-1Q
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m1rI1-0000CG-Sx
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:15:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m1rHw-00075F-48
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:15:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625840129;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KL+7Sk2TVaqzJiwUENQiYkHdrcxWabbPT3KfKB+GwhI=;
 b=KlDIOxf+YdwXTqKZdRkOUpp5Al1PnLs3Yzaxi1yQ1wBy/6a5KjMTjgpMdxhBqqktW6r0gp
 9r+GBt5KF8JHTBw9wnqhfltixN0ApG66jDQgV6LnnRbY6TDYkqHMPtXFqSaZ11RkU7l0g0
 YeSepxu328XdaE8XY188y4cVPiM8nJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-FMrUvAY0MnG5OBnDoXchIw-1; Fri, 09 Jul 2021 10:15:26 -0400
X-MC-Unique: FMrUvAY0MnG5OBnDoXchIw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4226DF8A5;
 Fri,  9 Jul 2021 14:15:24 +0000 (UTC)
Received: from redhat.com (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 837727886D;
 Fri,  9 Jul 2021 14:15:17 +0000 (UTC)
Date: Fri, 9 Jul 2021 15:15:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [PATCH 4/4] qemu-options: rewrite help for -smp options
Message-ID: <YOhZ8RncPfTq6LiR@redhat.com>
References: <20210628113047.462498-1-berrange@redhat.com>
 <20210628113047.462498-5-berrange@redhat.com>
 <0fe6ae73-62f2-569b-1e9d-04bd7da7458a@huawei.com>
MIME-Version: 1.0
In-Reply-To: <0fe6ae73-62f2-569b-1e9d-04bd7da7458a@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 28, 2021 at 09:46:16PM +0800, wangyanan (Y) wrote:
> Hi Daniel,
> 
> On 2021/6/28 19:30, Daniel P. Berrangé wrote:
> > The -smp option help is peculiarly specific about mentioning the CPU
> > upper limits, but these are wrong. The "PC" target has varying max
> > CPU counts depending on the machine type picked. Notes about guest
> > OS limits are inappropriate for QEMU docs. There are way too many
> > machine types for it to be practical to mention actual limits, and
> > some limits are even modified by downstream distribtions. Thus it
> > is better to remove the specific limits entirely.
> > 
> > The CPU topology reporting is also not neccessarily specific to the
> > PC platform and descriptions around the rules of usage are somewhat
> > terse. Expand this information with some examples to show effects
> > of defaulting.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   qemu-options.hx | 29 +++++++++++++++++++++--------
> >   1 file changed, 21 insertions(+), 8 deletions(-)
> > 
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 5871df7291..0021e9ec7b 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -207,14 +207,27 @@ DEF("smp", HAS_ARG, QEMU_OPTION_smp,
> >           QEMU_ARCH_ALL)
> >   SRST
> >   ``-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]``
> > -    Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs
> > -    are supported. On Sparc32 target, Linux limits the number of usable
> > -    CPUs to 4. For the PC target, the number of cores per die, the
> > -    number of threads per cores, the number of dies per packages and the
> > -    total number of sockets can be specified. Missing values will be
> > -    computed. If any on the three values is given, the total number of
> > -    CPUs n can be omitted. maxcpus specifies the maximum number of
> > -    hotpluggable CPUs.
> > +    Simulate an SMP system with '\ ``n``\ ' CPUs initially present on
> Should be "a SMP system".

Pre-existing bug, but I'll fix it anyway


> > +    the machine type board. On boards supporting CPU hotplug, the optional
> > +    '\ ``maxcpus``\ ' parameter can be set to enable further CPUs to be
> > +    added at runtime. If omitted the maximum number of CPUs will be
> > +    set to match the initial CPU count. Both parameters are subject to
> > +    an upper limit that is determined by the specific machine type chosen.
> > +
> > +    To control reporting of CPU topology information, the number of sockets,
> > +    dies per socket, cores per die, and threads per core can be specified.
> > +    The sum `` sockets * cores * dies * threads `` must be equal to the
> > +    maximum CPU count. CPU targets may only support a subset of the topology
> > +    parameters. Where a CPU target does not support use of a particular
> > +    topology parameter, its value should be assumed to be 1 for the purpose
> > +    of computing the CPU maximum count.
> > +
> Explicitly saying "sockets * dies * cores * threads" seems not arch-neutral
> at
> first glance, although we have the explanation behind. How about the
> following statement for this paragraph?
> 
> "
> To control reporting of CPU topology information, at most the number of
> sockets,
> dies per socket, cores per die, and threads per core can be specified. CPU
> targets
> may only support a subset of the topology parameters. If a CPU target does
> not
> support use of a particular topology parameter, it must not be specified.
> The sum
> of the supported subset of parameters must be equal to the maximum CPU
> count.
> "
> 
> I think this also make it easier to expand if we are going to add one more
> topology
> parameter, e.g, cluster, in the future.

I won't make this suggested change, since we discussed against another
patch that mgmt apps like libvirt will already be setting 'dies=1' for
any target. We merely need QEMU to reject values > 1 if not supported.

> > +    Either the initial CPU count, or at least one of the topology parameters
> > +    must be specified. Values for any omitted parameters will be computed
> > +    from those which are given. Historically preference was given to the
> > +    coarsest topology parameters when computing missing values (ie sockets
> > +    preferred over cores, which were preferred over threads), however, this
> > +    behaviour is considered liable to change.
> >   ERST
> >   DEF("numa", HAS_ARG, QEMU_OPTION_numa,
> Thanks,
> Yanan
> .
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


