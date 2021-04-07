Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A968356D88
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 15:41:34 +0200 (CEST)
Received: from localhost ([::1]:43738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU8R3-0007M0-4S
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 09:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lU8Q3-0006kJ-Hq
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:40:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lU8Q1-000070-Bk
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:40:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617802827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=35FWGfUF/Vq8JADjVgC02s2vy/iQmCdVMv7lFMCZOrk=;
 b=PxguUoTN5W6J4oe9TIZicy56OOvPVy8GZ7RSn1DBxSYRtaiu4mV4TGkrQgcZqXEI83/jKh
 OwzKdYkj4i48tzFKKmIqrmZuWSlE3bsJCg+1TObxJihZlpaJ/TpHs2qGjR4Ki421GcHO9M
 ul3MMYrxT+cFtpSsHVrnXTbWM1dvNd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-aJ7tDhwIMb6GcE1o7EKejw-1; Wed, 07 Apr 2021 09:40:25 -0400
X-MC-Unique: aJ7tDhwIMb6GcE1o7EKejw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E75D1008067;
 Wed,  7 Apr 2021 13:40:24 +0000 (UTC)
Received: from localhost (ovpn-118-57.rdu2.redhat.com [10.10.118.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9153418210;
 Wed,  7 Apr 2021 13:40:17 +0000 (UTC)
Date: Wed, 7 Apr 2021 09:40:16 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH 1/6] qdev: introduce qapi/hmp command for kick/call event
Message-ID: <20210407134016.u5vdwuji6b4jvtxu@habkost.net>
References: <20210326054433.11762-1-dongli.zhang@oracle.com>
 <20210326054433.11762-2-dongli.zhang@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20210326054433.11762-2-dongli.zhang@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, mst@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 joe.jin@oracle.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 25, 2021 at 10:44:28PM -0700, Dongli Zhang wrote:
> The virtio device/driver (e.g., vhost-scsi or vhost-net) may hang due to
> the loss of doorbell kick, e.g.,
> 
> https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01711.html
> 
> ... or due to the loss of IRQ, e.g., as fixed by linux kernel commit
> fe200ae48ef5 ("genirq: Mark polled irqs and defer the real handler").
> 
> This patch introduces a new debug interface 'DeviceEvent' to DeviceClass
> to help narrow down if the issue is due to loss of irq/kick. So far the new
> interface handles only two events: 'call' and 'kick'. Any device (e.g.,
> virtio/vhost or VFIO) may implement the interface (e.g., via eventfd, MSI-X
> or legacy IRQ).
> 
> The 'call' is to inject irq on purpose by admin for a specific device (e.g.,
> vhost-scsi) from QEMU/host to VM, while the 'kick' is to kick the doorbell
> on purpose by admin at QEMU/host side for a specific device.
> 
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
[...]
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index 605d57287a..c7795d4ba5 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -129,5 +129,6 @@ void hmp_info_replay(Monitor *mon, const QDict *qdict);
>  void hmp_replay_break(Monitor *mon, const QDict *qdict);
>  void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
>  void hmp_replay_seek(Monitor *mon, const QDict *qdict);
> +void hmp_x_debug_device_event(Monitor *mon, const QDict *qdict);
>  
>  #endif
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index b83178220b..711c4a297a 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -124,3 +124,33 @@
>  ##
>  { 'event': 'DEVICE_DELETED',
>    'data': { '*device': 'str', 'path': 'str' } }
> +
> +##
> +# @x-debug-device-event:
> +#
> +# Generate device event for a specific device queue
> +#
> +# @dev: device path
> +#
> +# @event: event (e.g., kick or call) to trigger

Any specific reason to not use an enum here?

In addition to making the QAPI schema and documentation more
descriptive, it would save you the work of manually defining the
DEVICE_EVENT_* constants and implementing get_device_event().


> +#
> +# @queue: queue id
> +#
> +# Returns: Nothing on success
> +#
> +# Since: 6.1
> +#
> +# Notes: This is used to debug VM driver hang issue. The 'kick' event is to
> +#        send notification to QEMU/vhost while the 'call' event is to
> +#        interrupt VM on purpose.
> +#
> +# Example:
> +#
> +# -> { "execute": "x-debug-device_event",
> +#      "arguments": { "dev": "/machine/peripheral/vscsi0", "event": "kick",
> +#                     "queue": 1 } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'x-debug-device-event',
> +  'data': {'dev': 'str', 'event': 'str', 'queue': 'int'} }
[...]

-- 
Eduardo


