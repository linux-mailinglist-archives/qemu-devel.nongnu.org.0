Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F3341C188
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:22:45 +0200 (CEST)
Received: from localhost ([::1]:32934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVVnY-0006sV-KL
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVVll-00065Z-UM
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:20:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVVlk-0007AT-6g
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632907249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kKV+6Lp5M45pHsB7AMUBjDAX9paCkCphYB/ch3XldLU=;
 b=RcW8yLPQ9uE7vAwQd8banqiguNNJjPIlp1AVBDELBKjSbrOythEJi9A8iO7J6I2NfdeFxq
 77jrVly2ZEpFSf0ZNMrDOAtkLYoG8Kz7yiM8WoVzAGOA/08KWqHTuhevxjlO1aUH/BdIDf
 HBJ7RHwG0OZKL2xGjdKXe5qs14rWOz8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-VJkqIBfvNq-Lw6wFK3vlDA-1; Wed, 29 Sep 2021 05:20:46 -0400
X-MC-Unique: VJkqIBfvNq-Lw6wFK3vlDA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57DD4802947
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 09:20:45 +0000 (UTC)
Received: from localhost (unknown [10.39.194.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 039A66A904;
 Wed, 29 Sep 2021 09:20:44 +0000 (UTC)
Date: Wed, 29 Sep 2021 10:20:44 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH 0/1] vmx: Fix <genid/> mapping
Message-ID: <20210929092044.GE3361@redhat.com>
References: <cover.1632900578.git.mprivozn@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1632900578.git.mprivozn@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 10:01:55AM +0200, Michal Privoznik wrote:
> Apparently, parsing vmx.genid is not as easy as I thought. Anyway, it
> was brought up in a private thread that libvirt doesn't report correct
> UUIDs. For instance for the following input:
> 
>   vm.genid = "-8536691797830587195"
>   vm.genidX = "-1723453263670062919"

(The two lines above come from a VMware .vmx file)

The only thing that really matters is what the guest sees.  I ran
VMGENID.EXE (https://bugzilla.redhat.com/show_bug.cgi?id=1598350#c3
https://docs.microsoft.com/en-gb/windows/win32/hyperv_v2/virtual-machine-generation-identifier)
inside the guest and it showed:

  8987940a09512cc5:e81510634ff550b9

Note these numbers are the hex equivalents of the VMware .vmx numbers:

>>> print("%x" % (2**64-8536691797830587195))
8987940a09512cc5
>>> print("%x" % (2**64-1723453263670062919))
e81510634ff550b9

> Libvirt would report:
> 
>   <genid>8987940a-0951-2cc5-e815-10634ff550b9</genid>
> 
> while virt-v2v would report:
> 
>   <genid>09512cc5-940a-8987-b950-f54f631015e8</genid>

After thinking about this a bit more, IMHO the real problem is
with qemu.  If you pass this to qemu:

  -device vmgenid,guid=8987940a-0951-2cc5-e815-10634ff550b9,id=vmgenid0

then inside the guest VMGENID shows 2cc509518987940a:b950f54f631015e8 (wrong)

If you pass this to qemu:

  ...guid=09512cc5-940a-8987-b950-f54f631015e8...

then inside the guest it sees 8987940a09512cc5:e81510634ff550b9
(the correct values, matching VMware).

This is the reason why virt-v2v mangles the GUID, in order to trick
libvirt into passing a mangled GUID which gets mangled again by qemu
which is the same as unmangling it.

So another way to fix this could be for us to fix qemu.  We could just
pass the two numbers to qemu instead of using GUIDs, eg:

  -device vmgenid,low=0x8987940a09512cc5,high=0xe81510634ff550b9,id=vmgenid0

and then we'd fix the implementation in qemu so that the low/high
values match what is seen by VMGENID.EXE in the guest.

Or we could have libvirt use the current GUID in <genid> but to do the
mangling when it gets passed through to qemu (instead of virt-v2v
doing the mangling).

Adding qemu-devel because I'm interesting to see if the qemu
developers would prefer to fix this properly in qemu.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html


