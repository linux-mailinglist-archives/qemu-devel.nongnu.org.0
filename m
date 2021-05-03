Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EE6371670
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 16:12:31 +0200 (CEST)
Received: from localhost ([::1]:48442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldZJF-0007rw-Tb
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 10:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ldZH0-00075e-LF
 for qemu-devel@nongnu.org; Mon, 03 May 2021 10:10:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ldZGr-000875-O8
 for qemu-devel@nongnu.org; Mon, 03 May 2021 10:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620050999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UTggtTA81Dv0V0RoXJM80qC4nsXOnFudxTABjpB1X/0=;
 b=WSlg93x24KqsoV4fGgKzT8AQXwpRnTqsHL09DGX00dCWbk7CCBtrqlNsLEiT33blyA7oKy
 BijyCssc1ULHV+unHErpCOwgqv5ws7XfAS/b6l/l8c/y19251o693i3tPVGoH7Kab8jkaO
 0ey7LR/jrAIdhT3cxQntHQWlfJdDESg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-VDM_vOBuNbi6rjBAe3WIEQ-1; Mon, 03 May 2021 10:09:55 -0400
X-MC-Unique: VDM_vOBuNbi6rjBAe3WIEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2715D801982;
 Mon,  3 May 2021 14:09:54 +0000 (UTC)
Received: from localhost (unknown [10.40.208.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81F415D742;
 Mon,  3 May 2021 14:09:41 +0000 (UTC)
Date: Mon, 3 May 2021 16:09:39 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Milan Zamazal <mzamazal@redhat.com>
Subject: Re: Adjustments of NVDIMM devices and future data safety
Message-ID: <20210503160939.30047450@redhat.com>
In-Reply-To: <87y2d0gjw6.fsf@redhat.com>
References: <87y2d0gjw6.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Liu,
 Jingqi" <jingqi.liu@intel.com>, "Lai, Paul C" <paul.c.lai@intel.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Amnon Ilan <ailan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 14:18:30 +0200
Milan Zamazal <mzamazal@redhat.com> wrote:

> Hi,
> 
> I work on NVDIMM support in oVirt/RHV, I think other virtualization
> management software built on top of QEMU may have similar concerns.
> 
> When a virtual NVDIMM device size is specified, it's not necessarily the
> eventual NVDIMM device size visible to the guest OS.  As seen in
> https://github.com/qemu/qemu/blob/v6.0.0/hw/mem/nvdimm.c#L117, QEMU
> makes some adjustments (other adjustments are performed by libvirt but
> that's a topic for a different forum):
> 
> - NVDIMM label size is subtracted from the NVDIMM size.
> 
> - NVDIMM label is pointed to a certain memory region.
> 
> - The remaining NVDIMM size is aligned down.
> 
> There are some related potential problems:
> 
> - If the alignment rules change in a future QEMU version, it may result
>   in a different device size visible to the guest (even if the requested
>   size remains the same) and cause trouble there up to data loss.
> 
> - If the layout on the backing device changes, e.g. a label placement,
>   then the stored data may become corrupt or inaccessible.

We usually tie ABI changes to machine versions, so if in future we decide to
change NVDIMM layout, we should preserve old layout for old machine types
(which is accomplished using compat mechanism)

> 
> - I'm not sure about the current QEMU version, but at least in previous
>   QEMU versions, the resulting size is important for memory hot plug.
>   The NVDIMM alignment size is smaller than the required regular memory
>   DIMM placement alignment.  If a VM contains an NVDIMM with the
>   resulting size not matching the DIMM placement requirements and a
>   memory hot plug is attempted then the hot plug fails because the DIMM
>   is mapped next to the end of the NVDIMM region, which is not
>   DIMM-aligned.


I vaguely recall that, start address of any hotplugged (NV)DIMM
is aligned on 1G boundary (only the very first versions of memory
hotplug used unaligned address). Described above situation shouldn't happen.

I'd try to fix alignment issues first if there is any before talking about
splitting label out.


> All this means:
> 
> - The requested NVDIMM size must be computed and specified carefully,
>   with attention to QEMU internal implementation.
> 
> - And because it depends on QEMU internal implementation, there is a
>   risk of malfunction or data loss when the same backing device with the
>   same parameters is used with a future QEMU version.

When making incompatible changes, we usually add a new property to enable them,
so normally situation when NVDIMM "with the same parameters" is used
should lead to old behaviour.
If we change 'default' values then as long as one uses versioned machine
type, old behaviour will be preserved with future QEMU.
However if one uses un-versioned/another machine type or enables new behavior,
QEMU doesn't guarantee any compatibility.


> As for labels, I was told NVDIMM labels might be put to regular files in
> future to avoid some problems.  Since label placement is not visible to
> the guest, such a change could be made transparently without disrupting
> access to the data.  (As long as the label data is transferred to the
> new location properly and undesirable resulting NVDIMM size changes are
> not induced by such a change.)

I think current approach resembles real nvdimm devices
(the only problem is that one has to configure size/label size,
where with real devices it's done by manufacturer).

if we add a dedicated property, It should be possible to split label out
into a separate file.
However I don't fancy carrying transparent migration from old format to
the new one in QEMU, I think it should be done by separate utility. So
that if users have access to backend + and know used label size,
they should be able split it.

Also I'm not sure that splitting label out is fixing anything, it just
replaces one set of rules how to set size/label (assuming there is one)
with another + user will have to manage 1 more backend (content + label).
 
> The primary point is still how to ensure that data kept on a backing
> device will remain accessible and safe in future QEMU versions and how
> to possibly avoid reliance on QEMU implementation details.  A big
> warning in the NVDIMM handling source code to keep backward
> compatibility (incl. memory hot plugs) and data safety on mind before
> making any changes there might be a reasonable minimum measure.
> Any additional ideas?  What do you think about it all?
we usually are trying to keep compatibility (versioned or new features
are disabled by default and user has to explicitly enable them)
when making breaking changes.
(and that is done without extra warnings in the code,
otherwise QEMU will be full of them).

> 
> Thank you,
> Milan
> 
> 


