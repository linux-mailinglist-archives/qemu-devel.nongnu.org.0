Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB59C57FC18
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 11:13:49 +0200 (CEST)
Received: from localhost ([::1]:41860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFu9t-0005Xn-0l
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 05:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oFu7M-0002Xm-0d
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 05:11:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oFu7I-0000Lh-QL
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 05:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658740268;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=lVmlhpjNpDfyg8uMrQfxgbMBEwHNmn7LjdUZImampOI=;
 b=eoQZ0GJnHB7q2j87jtMeb+MJA4exVFf6Igsj5n4ij7Fe5cgeXLrrFpt7I4bf7LStiTOxCT
 lOVUObnpqWP8zzIuBvQJUvZdZOhSn/3RCJz94Ypg30pcRZ7+sxvJ1zh7N4DHA47OObjC4b
 7F8TIFIas5uOw/FoBGbhf+5T1kKTxMo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-MsdFDt8iPsqA8_U21coAHw-1; Mon, 25 Jul 2022 05:11:05 -0400
X-MC-Unique: MsdFDt8iPsqA8_U21coAHw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 937F285A581;
 Mon, 25 Jul 2022 09:11:05 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0446140EBE3;
 Mon, 25 Jul 2022 09:11:03 +0000 (UTC)
Date: Mon, 25 Jul 2022 10:11:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH for-7.2 00/10] add hmp 'save-fdt' and 'info fdt' commands
Message-ID: <Yt5eJDhwdQclX5fY@redhat.com>
References: <20220722200007.1602174-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220722200007.1602174-1-danielhb413@gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, Jul 22, 2022 at 04:59:57PM -0300, Daniel Henrique Barboza wrote:
> Hi,
> 
> After dealing with a FDT element that isn't being shown in the userspace
> and having to shutdown the guest, dump the FDT using 'machine -dumpdtb' and
> then using 'dtc' to see what was inside the FDT, I thought it was a good
> idea to add extra support for FDT handling in QEMU.
> 
> This series introduces 2 commands. 'fdt-save' behaves similar to what
> 'machine -dumpdtb' does, with the advantage of saving the FDT of a running
> guest on demand. This command is implemented in patch 03.
> 
> The second command, 'info fdt <command>' is more sophisticated. This
> command can print specific nodes and properties of the FDT. A few
> examples:
> 
> - print the /cpus/cpu@0 from an ARM 'virt' machine:
> 
> (qemu) info fdt /cpus/cpu@0
> /cpus/cpu@0 {
>     phandle = <0x8001>
>     reg = <0x0>
>     compatible = 'arm,cortex-a57'
>     device_type = 'cpu'
> }
> (qemu) 
> 
> - print the device_type property of the interrupt-controller node of a
> pSeries machine:
> 
> (qemu) info fdt /interrupt-controller/device_type
> /interrupt-controller/device_type = 'PowerPC-External-Interrupt-Presentation'
> (qemu)

Please don't add new HMP-only commands. These should be provided
as QMP commands, where the HMP is a tiny shim to the QMP.

If you don't want to think about formally modelling the data
for 'info fdt' / 'query-fdt', then just put an 'x-' prefix on
the QMP command and return printed formatted data, as illustrated
in:

https://www.qemu.org/docs/master/devel/writing-monitor-commands.html#writing-a-debugging-aid-returning-unstructured-text

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


