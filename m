Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D915800BA
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:28:33 +0200 (CEST)
Received: from localhost ([::1]:45294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFz4S-00017p-Nc
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oFyik-0001cR-US
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:06:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oFyif-0000KX-PL
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:06:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658757960;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aKHocq3ucPWFmYBIKtek1W2sDX85ef1wrg2w1l/QC/M=;
 b=ZJ6XJyyog9udHwu/eCc+HYkroUypk7gHc36U/QwSmqenm8T2qg8glh2E1pjTZwL1WVfKYu
 dgy1IwXuqdbpkU8UtEYkxA6uh4EWdVYgF42FIeUawB3VTL/Fw7mx5K6PlabiuWos9O0WaI
 nGumQhAgFOhm8p/ku4HLcM6ipDkzB7c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-BJs8-oU7MxOT3tYPgtDbpQ-1; Mon, 25 Jul 2022 10:05:57 -0400
X-MC-Unique: BJs8-oU7MxOT3tYPgtDbpQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CAB48037AA;
 Mon, 25 Jul 2022 14:05:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F48D1121314;
 Mon, 25 Jul 2022 14:05:56 +0000 (UTC)
Date: Mon, 25 Jul 2022 15:05:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH for-7.2 00/10] add hmp 'save-fdt' and 'info fdt' commands
Message-ID: <Yt6jQRwr+iSjVmcP@redhat.com>
References: <20220722200007.1602174-1-danielhb413@gmail.com>
 <Yt5eJDhwdQclX5fY@redhat.com>
 <da81ff9a-069b-1a7a-b633-f47696110759@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da81ff9a-069b-1a7a-b633-f47696110759@gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 25, 2022 at 10:16:11AM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 7/25/22 06:11, Daniel P. Berrangé wrote:
> > On Fri, Jul 22, 2022 at 04:59:57PM -0300, Daniel Henrique Barboza wrote:
> > > Hi,
> > > 
> > > After dealing with a FDT element that isn't being shown in the userspace
> > > and having to shutdown the guest, dump the FDT using 'machine -dumpdtb' and
> > > then using 'dtc' to see what was inside the FDT, I thought it was a good
> > > idea to add extra support for FDT handling in QEMU.
> > > 
> > > This series introduces 2 commands. 'fdt-save' behaves similar to what
> > > 'machine -dumpdtb' does, with the advantage of saving the FDT of a running
> > > guest on demand. This command is implemented in patch 03.
> > > 
> > > The second command, 'info fdt <command>' is more sophisticated. This
> > > command can print specific nodes and properties of the FDT. A few
> > > examples:
> > > 
> > > - print the /cpus/cpu@0 from an ARM 'virt' machine:
> > > 
> > > (qemu) info fdt /cpus/cpu@0
> > > /cpus/cpu@0 {
> > >      phandle = <0x8001>
> > >      reg = <0x0>
> > >      compatible = 'arm,cortex-a57'
> > >      device_type = 'cpu'
> > > }
> > > (qemu)
> > > 
> > > - print the device_type property of the interrupt-controller node of a
> > > pSeries machine:
> > > 
> > > (qemu) info fdt /interrupt-controller/device_type
> > > /interrupt-controller/device_type = 'PowerPC-External-Interrupt-Presentation'
> > > (qemu)
> > 
> > Please don't add new HMP-only commands. These should be provided
> > as QMP commands, where the HMP is a tiny shim to the QMP.
> 
> I wasn't sure if this would be useful to be in QMP, but perhaps it's better to
> let QMP consumers to decide whether use it or not.

That's not a relevant question to consider. The end goal is for HMP
to be 100% implemented in terms of QMP commands. So if anything is
required for HMP, then by definition it is also required for QMP.

The only question is whether the QMP command should be marked stable
or unstable. If there's any doubt, that pushes towards the 'unstable'
side, such that we don't have to promise API compat

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


