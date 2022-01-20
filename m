Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07604495225
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 17:15:16 +0100 (CET)
Received: from localhost ([::1]:32830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAa5j-00044n-0k
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 11:15:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nAVsb-00067s-N2
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:45:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nAVsY-0000cw-HX
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642679114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/2j8stZvuOqyt0gPmrzfafV8x7tsiKZT8n0YCUxUE30=;
 b=a9gRPc9Mbe5W3x790JxvO4juyvfLPcdyRUgHlGZzrad+lCCScJyeKj68sRx5ic0OfDU7FF
 8wx8IlwCQMt8qYNV8w3Q7gs0UDh/1Txze5FAbCqDThqabg7J6Pl7asor/6NrXxyhkjl16+
 UMih4dNzfDsCjTw4qi5GIQLNYq542ok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-Lduwf9RwPti4NXfyr57WRQ-1; Thu, 20 Jan 2022 06:45:13 -0500
X-MC-Unique: Lduwf9RwPti4NXfyr57WRQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB5AA1932480;
 Thu, 20 Jan 2022 11:45:11 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C6297D70C;
 Thu, 20 Jan 2022 11:45:04 +0000 (UTC)
Date: Thu, 20 Jan 2022 12:45:02 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Pierre Libeau <pierre.libeau@ovhcloud.com>
Subject: Re: TR: Openstack NOVA - Improve the time of file system freeze
 during live-snapshot
Message-ID: <YelLPjw7Qliknhhb@redhat.com>
References: <f3e284b53a6e46f9a18c9117fd841cf7@ovhcloud.com>
 <aca7e9de0935423ba1d59b5472ab64a7@ovhcloud.com>
MIME-Version: 1.0
In-Reply-To: <aca7e9de0935423ba1d59b5472ab64a7@ovhcloud.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pkrempa@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, kchamart@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.01.2022 um 09:02 hat Pierre Libeau geschrieben:
> Hello
> 
> I'm forwarding to you my question because I have pushed on the wrong
> mailing list at the beginning. Can you give me your opinion or forward
> me to the right people who can help me.
> 
> Thx.
> 
> Pierre
> 
> 
> ________________________________
> De : Qemu-discuss <qemu-discuss-bounces+pierre.libeau=corp.ovh.com@nongnu.org> de la part de Pierre Libeau <pierre.libeau@ovhcloud.com>
> Envoyé : lundi 17 janvier 2022 08:43
> À : qemu-discuss@nongnu.org
> Objet : Openstack NOVA - Improve the time of file system freeze during live-snapshot
> 
> 
> Hello,
> 
> I'm working on a patch in nova to improve the time of file system
> freeze during live-snapshot on an instance with a local disk and I
> need your opinion about the solution I would propose.
> 
> My issue during the live migration is the duration of file system
> freeze on an instance with a big local disk. [1]
>
> In my case instance have locally a disk (400Go) and the
> qemu-guest-agent is installed.
>
> Nova process like that: [2]
> dev = guest.get_block_device(disk_path)
> 
> 1. guest.freeze_filesystems()
> 2. dev.rebase(disk_delta, copy=True, reuse_ext=True, shallow=True)
> 3. while not dev.is_job_complete() #wait for the end of mirroring (the
>    issue is here, the waiting time depend on the size of the disk and
>    the IOPS)
> 4. dev.abort_job()
> 5. guest.thaw_filesystems()

So first of all, I have to do some translation of terminology which
seems to be different from what I am used to.

dev.rebase with copy=True seems to result in a mirror block job in QEMU?

So what you're calling a snapshot here doesn't seem to be a differential
snapshot (e.g. by adding a COW overlay), but a full copy that results in
two fully independent, standalone images. Is this right?

Adding a bit more context, the whole process seems to be:

1. Create a qcow2 for the copy of the top layer that shares the backing
   file with the active image.

2. Freeze guest filesystems

3. Create a full copy of the active layer (into the new qcow2 file)
    a. Start a mirror job
    b. Wait for the mirror job to move to the READY state
    c. Cancel the mirror job with force=false, i.e. complete the mirror
       job without changing the active image of the VM

4. Thaw the guest filesystems

5. qemu-img convert the copied top layer with its full backing chain
   to a standalone raw image

6. Delete the temporary qcow2 copy

> My proposition is to move the freeze after the end of mirroring and
> before the stop of mirroring. [3] I have tried on an instance and the
> last written file on the fs corresponds to the end of the mirror.

Yes, you only need the freeze around the mirror job completion, that is,
step 3c above.

However, the whole process seems very complicated for a rather simple
operation. A comment mentions that the dance with the temporary qcow2
file is because of a (not further specified) bug in QEMU 1.3. I believe,
libvirt hasn't supported a QEMU version that old for a while, so is this
really still a valid reason?

But what I would actually have used is a backup block job, which makes
sure that the copy will contain the disk content at the point of time
when the block job was started rather than when it happened to complete.

I'm adding a few more people to CC who may have additional comments on
this.

Kevin


