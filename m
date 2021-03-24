Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B998F3480D3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:43:40 +0100 (CET)
Received: from localhost ([::1]:44648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8Tj-0000i9-Hp
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP8QJ-0007Hi-Me
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:40:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP8QF-0006Ve-7A
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:40:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616611201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vWEMBOasYrQ8C4jNA7lVFB2dFLgXLsQzIeDhWS++tJU=;
 b=S3NxipqW8WB2H0OuIZHYN22j2ntU5JDzO31OWzvRq5RtXDcCHDLMuaaN3a2SOX9rlkDO9M
 k+Y42Th+EP9KJhvOnDkAT6T9z6QgjdIMrLfEPR+ViVKOtNF1a/ZnY/+5xB5J8TW/eKDaTO
 ljtUroCBOrutR7Gc3D8NXxmsTIKdc5E=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-J4RTsDMnM_GNYBowWMVUbA-1; Wed, 24 Mar 2021 14:39:58 -0400
X-MC-Unique: J4RTsDMnM_GNYBowWMVUbA-1
Received: by mail-qk1-f198.google.com with SMTP id k188so2291019qkb.5
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=36pN8hv87mhPAsWcjEHqAKBUsBWWRg6ppeWJqaaFjG4=;
 b=T1dj9r1B5VqsLNUzdRFoj0bq4o/p/n9gf3v3tQqo4KB2UfqwnZ+gEAKGfoyTDz2Ao1
 d8uU6VRI9Mb0JgE7zXiVF5HI/bvfmWhtd+YoiMaUBTu19+6/S9V4ti/RdJ2Q6CNP+T/w
 bQwGSL1moiX+4YBCUambITYfFjZ4wEM8XgTSXkT2Ph4Le5/8JBIcn68X5hHU1yh4Mg2I
 thqrv4ybG9OBPW5lB7iHNTpHJ1fB2iSlDklGzMAs+rJQFbI/D53yobI4CTTm5RV3LvYW
 KNJpZ7XrRjCDM9hkyDVwRYcaghWNeQaKVrKHRsPbz23T7fY10825pMyRMYKQfBeh6Bk9
 e/1g==
X-Gm-Message-State: AOAM531UnoovjT3iBDf3S0SW7Os6JfSPYI1gnm7ko3TbA2Xtrv/TKTHO
 HM5Jz9dvYw9VvU6NhPFwadi9paGeWMkOXyWhrvtNMY0z+lY8v9oW4RcnzHqmm+XHxwwqIwlSshn
 M9fbyFR6olB/SaJ+cHrgMaKOm8rCEOS7nx3n8vTu1/0DID0rtsKZ6tboQEtU3b0Te
X-Received: by 2002:a0c:a954:: with SMTP id z20mr4710710qva.29.1616611197327; 
 Wed, 24 Mar 2021 11:39:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEWvwO3NXwFhEwhzKASxZ20EmAVuLZOTxBmblyfQtQDPP5Kci+LL4DES/JFCcv/RlfgKfp0Q==
X-Received: by 2002:a0c:a954:: with SMTP id z20mr4710674qva.29.1616611196809; 
 Wed, 24 Mar 2021 11:39:56 -0700 (PDT)
Received: from xz-x1.redhat.com
 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca. [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id t24sm2001083qto.23.2021.03.24.11.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 11:39:56 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/10] KVM: Dirty ring support (QEMU part)
Date: Wed, 24 Mar 2021 14:39:44 -0400
Message-Id: <20210324183954.345629-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is v6 of the qemu dirty ring interface support.=0D
=0D
v6:=0D
- Fix slots_lock init [Keqian, Paolo]=0D
- Comment above KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 on todo (to enable=0D
  KVM_CLEAR_DIRTY_LOG for dirty ring too) [Keqian, Paolo]=0D
- Fix comment for CPUState [Keqian]=0D
=0D
v5:=0D
- rebase=0D
- dropped patch "update-linux-headers: Include const.h" after rebase=0D
- dropped patch "KVM: Fixup kvm_log_clear_one_slot() ioctl return check" si=
nce=0D
  similar patch got merged recently (38e0b7904eca7cd32f8953c3)=0D
=0D
=3D=3D=3D=3D=3D=3D=3D=3D=3D v4 cover letter below =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=0D
=0D
It is merely the same as v3 content-wise, but there're a few things to ment=
ion=0D
besides the rebase itself:=0D
=0D
  - I picked up two patches from Eric Farman for the linux-header updates (=
from=0D
    Eric's v3 series) for convenience just in case any of the series would =
got=0D
    queued by any maintainer.=0D
=0D
  - One more patch is added as "KVM: Disable manual dirty log when dirty ri=
ng=0D
    enabled".  I found this when testing the branch after rebasing to lates=
t=0D
    qemu, that not only the manual dirty log capability is not needed for k=
vm=0D
    dirty ring, but more importantly INITIALLY_ALL_SET is totally against k=
vm=0D
    dirty ring and it could silently crash the guest after migration.  For =
this=0D
    new commit, I touched up "KVM: Add dirty-gfn-count property" a bit.=0D
=0D
  - A few more documentation lines in qemu-options.hx.=0D
=0D
  - I removed the RFC tag after kernel series got merged.=0D
=0D
Again, this is only the 1st step to support dirty ring.  Ideally dirty ring=
=0D
should grant QEMU the possibility to remove the whole layered dirty bitmap =
so=0D
that dirty ring will work similarly as auto-converge enabled but should bet=
ter;=0D
we will just throttle vcpus with the dirty ring kvm exit rather than explic=
itly=0D
adding a timer to stop the vcpu thread from entering the guest again (like =
what=0D
we did with current migration auto-converge).  Some more information could =
also=0D
be found in the kvm forum 2020 talk regarding kvm dirty ring (slides 21/22 =
[1]).=0D
=0D
That next step (to remove all the dirty bitmaps, as mentioned above) is sti=
ll=0D
discussable: firstly I don't know whether there's anything I've overlooked =
in=0D
there.  Meanwhile that's also only services huge VM cases, may not be extre=
mely=0D
helpful with a lot major scenarios where VMs are not that huge.=0D
=0D
There's probably other ways to fix huge VM migration issues, majorly focusi=
ng=0D
on responsiveness and convergence.  For example, Google has proposed some n=
ew=0D
userfaultfd kernel capability called "minor modes" [2] to track page minor=
=0D
faults and that could be finally served for that purpose too using postcopy=
.=0D
That's another long story so I'll stop here, but just as a marker along wit=
h=0D
the dirty ring series so there'll still be a record to reference.=0D
=0D
Said that, I still think this series is very worth merging even if we don't=
=0D
persue the next steps yet, since dirty ring is disabled by default, and we =
can=0D
always work upon this series.=0D
=0D
Please review, thanks.=0D
=0D
V3: https://lore.kernel.org/qemu-devel/20200523232035.1029349-1-peterx@redh=
at.com/=0D
    (V3 contains all the pre-v3 changelog)=0D
=0D
QEMU branch for testing (requires kernel version 5.11-rc1+):=0D
    https://github.com/xzpeter/qemu/tree/kvm-dirty-ring=0D
=0D
[1] https://static.sched.com/hosted_files/kvmforum2020/97/kvm_dirty_ring_pe=
ter.pdf=0D
[2] https://lore.kernel.org/lkml/20210107190453.3051110-1-axelrasmussen@goo=
gle.com/=0D
=0D
---------------------------8<---------------------------------=0D
=0D
Overview=0D
=3D=3D=3D=3D=3D=3D=3D=3D=0D
=0D
KVM dirty ring is a new interface to pass over dirty bits from kernel=0D
to the userspace.  Instead of using a bitmap for each memory region,=0D
the dirty ring contains an array of dirtied GPAs to fetch, one ring=0D
per vcpu.=0D
=0D
There're a few major changes comparing to how the old dirty logging=0D
interface would work:=0D
=0D
- Granularity of dirty bits=0D
=0D
  KVM dirty ring interface does not offer memory region level=0D
  granularity to collect dirty bits (i.e., per KVM memory=0D
  slot). Instead the dirty bit is collected globally for all the vcpus=0D
  at once.  The major effect is on VGA part because VGA dirty tracking=0D
  is enabled as long as the device is created, also it was in memory=0D
  region granularity.  Now that operation will be amplified to a VM=0D
  sync.  Maybe there's smarter way to do the same thing in VGA with=0D
  the new interface, but so far I don't see it affects much at least=0D
  on regular VMs.=0D
=0D
- Collection of dirty bits=0D
=0D
  The old dirty logging interface collects KVM dirty bits when=0D
  synchronizing dirty bits.  KVM dirty ring interface instead used a=0D
  standalone thread to do that.  So when the other thread (e.g., the=0D
  migration thread) wants to synchronize the dirty bits, it simply=0D
  kick the thread and wait until it flushes all the dirty bits to the=0D
  ramblock dirty bitmap.=0D
=0D
A new parameter "dirty-ring-size" is added to "-accel kvm".  By=0D
default, dirty ring is still disabled (size=3D=3D0).  To enable it, we=0D
need to be with:=0D
=0D
  -accel kvm,dirty-ring-size=3D65536=0D
=0D
This establishes a 64K dirty ring buffer per vcpu.  Then if we=0D
migrate, it'll switch to dirty ring.=0D
=0D
I gave it a shot with a 24G guest, 8 vcpus, using 10g NIC as migration=0D
channel.  When idle or dirty workload small, I don't observe major=0D
difference on total migration time.  When with higher random dirty=0D
workload (800MB/s dirty rate upon 20G memory, worse for kvm dirty=0D
ring). Total migration time is (ping pong migrate for 6 times, in=0D
seconds):=0D
=0D
|-------------------------+---------------|=0D
| dirty ring (4k entries) | dirty logging |=0D
|-------------------------+---------------|=0D
|                      70 |            58 |=0D
|                      78 |            70 |=0D
|                      72 |            48 |=0D
|                      74 |            52 |=0D
|                      83 |            49 |=0D
|                      65 |            54 |=0D
|-------------------------+---------------|=0D
=0D
Summary:=0D
=0D
dirty ring average:    73s=0D
dirty logging average: 55s=0D
=0D
The KVM dirty ring will be slower in above case.  The number may show=0D
that the dirty logging is still preferred as a default value because=0D
small/medium VMs are still major cases, and high dirty workload=0D
happens frequently too.  And that's what this series did.=0D
=0D
TODO:=0D
=0D
- Consider to drop the BQL dependency: then we can run the reaper thread in=
=0D
  parallel of main thread.  Needs some thought around the race conditions.=
=0D
=0D
- Consider to drop the kvmslot bitmap: logically this can be dropped with k=
vm=0D
  dirty ring, not only for space saving, but also it's still another layer=
=0D
  linear to guest mem size which is against the whole idea of kvm dirty rin=
g.=0D
  This should make above number (of kvm dirty ring) even smaller (but still=
 may=0D
  not be as good as dirty logging when with such high workload).=0D
=0D
Please refer to the code and comment itself for more information.=0D
=0D
Thanks,=0D
=0D
Peter Xu (10):=0D
  memory: Introduce log_sync_global() to memory listener=0D
  KVM: Use a big lock to replace per-kml slots_lock=0D
  KVM: Create the KVMSlot dirty bitmap on flag changes=0D
  KVM: Provide helper to get kvm dirty log=0D
  KVM: Provide helper to sync dirty bitmap from slot to ramblock=0D
  KVM: Simplify dirty log sync in kvm_set_phys_mem=0D
  KVM: Cache kvm slot dirty bitmap size=0D
  KVM: Add dirty-gfn-count property=0D
  KVM: Disable manual dirty log when dirty ring enabled=0D
  KVM: Dirty ring support=0D
=0D
 accel/kvm/kvm-all.c      | 593 +++++++++++++++++++++++++++++++++------=0D
 accel/kvm/trace-events   |   7 +=0D
 include/exec/memory.h    |  12 +=0D
 include/hw/core/cpu.h    |   7 +=0D
 include/sysemu/kvm_int.h |   7 +-=0D
 qemu-options.hx          |  12 +=0D
 softmmu/memory.c         |  33 ++-=0D
 7 files changed, 572 insertions(+), 99 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


