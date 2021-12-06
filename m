Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CBB46A3D2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 19:15:59 +0100 (CET)
Received: from localhost ([::1]:56420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muIWs-00067a-8Q
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 13:15:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1muIUw-0005If-Lq; Mon, 06 Dec 2021 13:13:58 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:34263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1muIUu-000444-AV; Mon, 06 Dec 2021 13:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=fEM12tEEh0kkR3lccpUeT9Lx7NBBLf8iwifv608gCeg=; b=AWIEv7t5G7Y7Px1tvl9IetTTna
 tfSMWPvOq2EtyWURKe1WXC/3c9UwSldeto8yS3OIuNTqIac1DD1RzMCj9jfdQZs/QzgTFoXCY7RIj
 Q73kg4ySfNHHHksDknT3XqOfpdW3qVEMsjOarrXbq2exNXeHJCde547YawIxRO8rMVI72rIzIPlc5
 1TXMo7lHPAk8VyABUrjBv9XLXvOriU0QFWWRCNrF2l1ALXa5vgo+AFfhqGCZxmqE2mpKnIeCdYyD2
 6J/n3c3ZGU1Vh6xPYFzPoKqnmlpA8/4I7M/hbQMgr8bm7oEtJVtTyzxQkSdeWepNlQXqOsgQVzViS
 9xQ/15Wgp/S1XChpOPHMsEAEh4ZXmKIS4IB44D0jB04xaYjSnM/DdbdSAtsYU4cujjywseq+9Q5vj
 95o4NmX7cPBINlBizO76HBZuyQuxLDrUWIww4AzZUUnVg5rIqxN7TRtfWJxcFOvEAIALXa9jSpWU6
 3mMEVzoaK2IivrmBmGYYPxNl6nYoLYLbRcI51wXjooq/46zfPJnBDC+eMTfNyeF/Dr6+ziWUvOifV
 Y91ugXWPW3a85t0VmzCWB52bMoWyXn+BL0b975D91smulMqM5PWZjfi57dE/QAYe2iS8bZ9aHul7D
 DIaL0Uqhfp7x4R3BeuBB1WtuPrsdrTJj6vUT8VaAM=;
To: qemu-devel@nongnu.org
Cc: Jonah Palmer <jonah.palmer@oracle.com>, mst@redhat.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Subject: Re: [PATCH v10 0/8] hmp,
 qmp: Add commands to introspect virtio devices
Date: Mon, 06 Dec 2021 19:13:49 +0100
Message-ID: <819408538.haW0C61HAu@silver>
In-Reply-To: <b8d74a5c-73ac-3fe5-6eae-1e5b3c907628@oracle.com>
References: <1638794606-19631-1-git-send-email-jonah.palmer@oracle.com>
 <2322952.dU7V5S69UE@silver> <b8d74a5c-73ac-3fe5-6eae-1e5b3c907628@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Christian Schoenebeck <qemu_oss@crudebyte.com>
From:  Christian Schoenebeck via <qemu-devel@nongnu.org>

On Montag, 6. Dezember 2021 17:09:45 CET Jonah Palmer wrote:
> On 12/6/21 08:50, Christian Schoenebeck wrote:
> > On Montag, 6. Dezember 2021 13:43:18 CET Jonah Palmer wrote:
> >> This series introduces new QMP/HMP commands to dump the status of a
> >> virtio device at different levels.
> >> 
> >> [Jonah: Rebasing previous patchset from Nov. 10 (v9). Original patches
> >> 
> >>   are by Laurent Vivier from May 2020.
> >>   
> >>   Rebase from v9 to v10 includes reformatting virtio.json examples and
> >>   command structures for better consistency. Also removed all enums from
> >>   virtio.json and replaced their purpose with string literals.
> >>   
> >>   Removed @ndescs from VirtioQueueElement, as the number of descriptors
> >>   can be inferred from the length of the @descs chain.
> >>   
> >>   Lastly, removed the examples in hmp-commands-info.hx to fix
> >>   'inconsistent
> >>   literal block quoting' warning from Sphinx.]
> > 
> > I have not followed the entire discussion. AFAICS this is intended to
> > monitor status information on virtio level only, like virtqueue fill
> > status, etc.
> > 
> > One thing that I am looking for is monitoring device specific information
> > above virtio level, e.g. certain performance numbers or statistics that
> > only make sense for the specific device. That would not fit into any of
> > these commands, right?
> > 
> > Best regards,
> > Christian Schoenebeck
> 
> Correct. These are just one-shot commands that dump information on virtio
> devices (including vhosts), their virtqueues, and virtqueue elements as they
> are at the time of the command.
> 
> Jonah

What I would find useful though on this virtio level: also being able to query 
the maximum and average fill state of the two ring buffers of each virtqueue. 
That would allow to identify performance bottlenecks.

Best regards,
Christian Schoenebeck



