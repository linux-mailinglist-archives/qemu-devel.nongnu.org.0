Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE37498763
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 18:59:44 +0100 (CET)
Received: from localhost ([::1]:53086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC3d1-0000qH-Ed
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 12:59:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nC36V-00009u-Ql
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:26:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nC36R-0000cV-Ky
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:26:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643045160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zEHw+DwRvTWTd6RSj329WNuA/OS8HCcBeETh9LWWNaw=;
 b=AY5nq7Z/Qb1sijStB9tIs6HOIBaNUCN8t6FI3m1EwpSBpxCCfQURaSBy+hUyg9oMbjlLMu
 DtP3kPb8WrQ8sGYmoRo7mqzVEylHQoJrsLdS8Yg1a2QAEp8U2590jIzCjmOV9qK9tArQdc
 HQnEsxmqJpnmwHhgYgBwRHJEoGZspeQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-Z4eETO4aO4ais260y_FDkA-1; Mon, 24 Jan 2022 12:24:43 -0500
X-MC-Unique: Z4eETO4aO4ais260y_FDkA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6907E46861;
 Mon, 24 Jan 2022 17:24:42 +0000 (UTC)
Received: from paraplu (unknown [10.39.195.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC11C1092002;
 Mon, 24 Jan 2022 17:24:40 +0000 (UTC)
Date: Mon, 24 Jan 2022 18:24:38 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: TR: Openstack NOVA - Improve the time of file system freeze
 during live-snapshot
Message-ID: <Ye7g1ilCtJPVw7M9@paraplu>
References: <f3e284b53a6e46f9a18c9117fd841cf7@ovhcloud.com>
 <aca7e9de0935423ba1d59b5472ab64a7@ovhcloud.com>
 <YelLPjw7Qliknhhb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YelLPjw7Qliknhhb@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
Cc: Pierre Libeau <pierre.libeau@ovhcloud.com>, pkrempa@redhat.com,
 eblake@redhat.com, qemu-devel@nongnu.org,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

(Sorry for the slowness here.)

On Thu, Jan 20, 2022 at 12:45:02PM +0100, Kevin Wolf wrote:
> Am 20.01.2022 um 09:02 hat Pierre Libeau geschrieben:
 
[...]

> > Hello,
> > 
> > I'm working on a patch in nova to improve the time of file system
> > freeze during live-snapshot on an instance with a local disk and I
> > need your opinion about the solution I would propose.
> > 
> > My issue during the live migration is the duration of file system
> > freeze on an instance with a big local disk. [1]
> >
> > In my case instance have locally a disk (400Go) and the
> > qemu-guest-agent is installed.
> >
> > Nova process like that: [2]
> > dev = guest.get_block_device(disk_path)
> > 
> > 1. guest.freeze_filesystems()
> > 2. dev.rebase(disk_delta, copy=True, reuse_ext=True, shallow=True)
> > 3. while not dev.is_job_complete() #wait for the end of mirroring (the
> >    issue is here, the waiting time depend on the size of the disk and
> >    the IOPS)
> > 4. dev.abort_job()
> > 5. guest.thaw_filesystems()
> 
> So first of all, I have to do some translation of terminology which
> seems to be different from what I am used to.

First, here's the API mapping from Nova to QEMU:

  - rebase() is referring to a Nova's helper[b] method 
  - ... which maps to libvirt's blockRebase() API
  - ... which in turns maps to QMP 'block-stream'

And here's the broader QEMU and libvirt block API mapping (Eric/Peter
correct me if I missed something):

  - QEMU 'block-commit' == blockCommit() API in libvirt
  - QEMU 'block-stream' == blockRebase() API in libvirt
  - QEMU 'drive-mirror' / 'blockdev-mirror' == blockCopy() API in libvirt
  - QEMU 'blockdev-backup' == backupBegin() API in libvirt

> dev.rebase with copy=True seems to result in a mirror block job in QEMU?

A detail: if you _only_ have copy=True, then you're right it makes a
fully copy.  But there's also the "shallow=True" and "reuse_ext=True".
It's worth quoting (at least for me :-)) the official libvirt API
docs[c] of virDomainRebase():

  - "When flags includes VIR_DOMAIN_BLOCK_REBASE_COPY, this starts a
    copy, where base must be the name of a new file to copy the chain
    to. By default, the copy will pull the entire source chain into the
    destination file"

  - ... "but if flags also contains VIR_DOMAIN_BLOCK_REBASE_SHALLOW, then
    only the top of the source chain will be copied (the source and
    destination have a common backing file)"

  - ... VIR_DOMAIN_BLOCK_REBASE_REUSE_EXT means, "reuse an existing file
    which was pre-created with the correct format and metadata and
    sufficient size to hold the copy"

  - ... "In case the VIR_DOMAIN_BLOCK_REBASE_SHALLOW flag is used the
    pre-created file has to exhibit the same guest visible contents as
    the backing file of the original image. This allows a management app
    to pre-create files with relative backing file names, rather than
    the default of absolute backing file names; as a security
    precaution, you should generally only use reuse_ext with the shallow
    flag and a non-raw destination file"

> So what you're calling a snapshot here doesn't seem to be a differential
> snapshot (e.g. by adding a COW overlay), but a full copy that results in
> two fully independent, standalone images. Is this right?

Correct.  The "live snapshot" in Nova has always been full copies,
afraid.

> Adding a bit more context, the whole process seems to be:
> 
> 1. Create a qcow2 for the copy of the top layer that shares the backing
>    file with the active image.
> 
> 2. Freeze guest filesystems
> 
> 3. Create a full copy of the active layer (into the new qcow2 file)
>     a. Start a mirror job

As noted above, it's a stream job.  (Assuming libvirt's blockRebase() is
still caling stream under the hood)

>     b. Wait for the mirror job to move to the READY state
>     c. Cancel the mirror job with force=false, i.e. complete the mirror
>        job without changing the active image of the VM

Yeah, the "full copy of the active layer" is what libvirt calls "shallow
copy" -- shallow=True in the rebase() call above

> 4. Thaw the guest filesystems
> 
> 5. qemu-img convert the copied top layer with its full backing chain
>    to a standalone raw image
> 
> 6. Delete the temporary qcow2 copy
> 
> > My proposition is to move the freeze after the end of mirroring and
> > before the stop of mirroring. [3] I have tried on an instance and the
> > last written file on the fs corresponds to the end of the mirror.
> 
> Yes, you only need the freeze around the mirror job completion, that is,
> step 3c above.

Thanks for confirming; I always forget these freeze semantics.

> However, the whole process seems very complicated for a rather simple
> operation. A comment mentions that the dance with the temporary qcow2
> file is because of a (not further specified) bug in QEMU 1.3. I believe,
> libvirt hasn't supported a QEMU version that old for a while, so is this
> really still a valid reason?

You're right -- you spotted code-rot in Nova here; the QEMU 1.3
code-comment gives it away (although it doesn't tell what the bug was).
That part[a] of the Nova code in _live_snapshot() method can be
refactored to use newer libvirt/QEMU APIs.  

That said, some of the "undefine a guest XML and the redefine it later"
dance is because blockRebase() doesn't have a way to restart a copy job
on guest restart while mirroring is still intact.  So the trick when
using libvirt's blockRebase() for a copy-job is to temporarily make the
domain "transient" (the guest.delete_configuration() ...
host.write_instance_config() calls in Nova).

However, blockCopy() API has a _TRANSIENT_JOB that works around the
limitation of blockRebase()

Overall, wherever Nova can, it should completely use replace
blockRebase() usage with one of the following APIs:

    - virDomainBlockCopy() -- blockCopy() -- this is already used by
      Nova today; but not consistently
    - virDomainBackupBegin() -- backupBegin()
    - virDomainBackupGetXMLDesc() -- backupGetXMLDesc()
    - virDomainCheckpointCreateXML() -- checkpointCreateXML()
    - virDomainCheckpointDelete()

> But what I would actually have used is a backup block job, which makes
> sure that the copy will contain the disk content at the point of time
> when the block job was started rather than when it happened to complete.

I agree, I'd prefer that too for the long term -- using the backup APIs
above.  I _think_ Pierre can get his problem solved with libvirt's
blockCopy() API.  Pierre, Nova has a wrapper for it, look at the usage
of the copy() wrapper method[d] in Nova.

[...]


[a] https://github.com/openstack/nova/blob/master/nova/virt/libvirt/driver.py#L3166,L3190
[b] https://github.com/openstack/nova/blob/master/nova/virt/libvirt/guest.py#L745,L767
[c] https://libvirt.org/html/libvirt-libvirt-domain.html#virDomainBlockRebase
[d] https://github.com/openstack/nova/blob/master/nova/virt/libvirt/guest.py#L729,#L743


-- 
/kashyap


