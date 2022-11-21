Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3113632FEE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 23:38:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxFPs-0001R0-3U; Mon, 21 Nov 2022 17:37:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxFPn-0001QM-Qq
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 17:37:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxFPl-0003WW-Oe
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 17:37:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669070240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wv12Nsi47HHu2cbWJJbTwvmDX+QhrRR0zQbSbTdBQbc=;
 b=AyC51xcOxWOZfD4pzfGGq69mBkRHXCC2QOQVkY7nCCk1W7DIlA3LW4n9b0/i3c5gj7uqVn
 CJGlEemcVceeqQVPCnNDx/C9+1n0KIf4MfBXEsTVF7PVWnZmGKBTPqWV6MZmDoEFttnp8p
 Rw2waFKNRvxOv0n2iraitx19kHa+S7Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-576-iYzxZ7dIM-mMzCnTuB8z3A-1; Mon, 21 Nov 2022 17:37:19 -0500
X-MC-Unique: iYzxZ7dIM-mMzCnTuB8z3A-1
Received: by mail-wm1-f69.google.com with SMTP id
 m17-20020a05600c3b1100b003cf9cc47da5so7162262wms.9
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 14:37:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wv12Nsi47HHu2cbWJJbTwvmDX+QhrRR0zQbSbTdBQbc=;
 b=SM1+I73AWBfU/l9D7tcNHs97hEe6XMecxR0HqDB1E5myNd/4ZGdkoFRlRRfzEJn8m4
 AnOLfOVR+Cb8I4lZZ1hiT2XsX+668vm95Zb1DN6jhCC6+mQhoARIV9H3YTrH3zqXDiuV
 Ec7RqONNVOsBlC/t2epfh2c6YiUZtqqZqN6s5MB7T4vFq8DYHp6WEN4/9IUsCBBhw8IQ
 w4kPh+NHStnC1qFiS0NugWuZ+0mRMyC2a3bS3Thziml6uXzjGCgoEZ53AbqZijqvOs2Q
 Fy3C3F4IT+Y25dd15s7sspMw03uE7/0mjB4ntPnIHgDKC+HILwS+bvo0Z/Mt2hQRLmkF
 0UJQ==
X-Gm-Message-State: ANoB5pnmyMEe1nGN+DNUgwq/K+Yje5jMIN9JRpqzJX0QalWOKMvadLLh
 XKxqM9SpORi1TxcgfXSooEo152QbfQfjt35Pn3A8hzlz1eyNdYbwzZaAkuPGXMZO4Ds3aDN+y5z
 YJ0v3SZle0MwRGe8=
X-Received: by 2002:a05:600c:41c7:b0:3cf:a0f4:7879 with SMTP id
 t7-20020a05600c41c700b003cfa0f47879mr400467wmh.152.1669070236873; 
 Mon, 21 Nov 2022 14:37:16 -0800 (PST)
X-Google-Smtp-Source: AA0mqf47MyjQZia5fm5XZck5ig/K9AIJmu0Z7kX5X6LuOhOsA0ibAld0McfxA7CwZEJ8K6m6ryDH1g==
X-Received: by 2002:a05:600c:41c7:b0:3cf:a0f4:7879 with SMTP id
 t7-20020a05600c41c700b003cfa0f47879mr400450wmh.152.1669070236572; 
 Mon, 21 Nov 2022 14:37:16 -0800 (PST)
Received: from redhat.com ([2.52.21.254]) by smtp.gmail.com with ESMTPSA id
 g18-20020a5d5412000000b00241bd7a7165sm11260741wrv.82.2022.11.21.14.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 14:37:15 -0800 (PST)
Date: Mon, 21 Nov 2022 17:37:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "open list:virtiofs" <virtio-fs@redhat.com>
Subject: Re: [PATCH v1 5/9] hw/virtio: introduce virtio_device_should_start
Message-ID: <20221121173656-mutt-send-email-mst@kernel.org>
References: <20221114113518-mutt-send-email-mst@kernel.org>
 <aaae3f2a-c5bb-8e62-09d4-4f6f43efe37b@linux.ibm.com>
 <20221114115549-mutt-send-email-mst@kernel.org>
 <2bd5f801-a203-2598-3e6e-ed8f5dad5159@linux.ibm.com>
 <20221114121959-mutt-send-email-mst@kernel.org>
 <87tu309tlk.fsf@linaro.org>
 <26b4e8d8-784d-d1ce-67a3-b61896701bf7@linux.ibm.com>
 <87leoc9p98.fsf@linaro.org>
 <471b71ad-1892-8ab4-a94b-c0ec3d34e6b1@linux.ibm.com>
 <1bfc2fee-5972-676e-563e-e245814e54c3@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1bfc2fee-5972-676e-563e-e245814e54c3@linux.ibm.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 15, 2022 at 05:46:58PM +0100, Christian Borntraeger wrote:
> 
> 
> Am 15.11.22 um 17:40 schrieb Christian Borntraeger:
> > 
> > 
> > Am 15.11.22 um 17:05 schrieb Alex Bennée:
> > > 
> > > Christian Borntraeger <borntraeger@linux.ibm.com> writes:
> > > 
> > > > Am 15.11.22 um 15:31 schrieb Alex Bennée:
> > > > > "Michael S. Tsirkin" <mst@redhat.com> writes:
> > > > > 
> > > > > > On Mon, Nov 14, 2022 at 06:15:30PM +0100, Christian Borntraeger wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > Am 14.11.22 um 18:10 schrieb Michael S. Tsirkin:
> > > > > > > > On Mon, Nov 14, 2022 at 05:55:09PM +0100, Christian Borntraeger wrote:
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Am 14.11.22 um 17:37 schrieb Michael S. Tsirkin:
> > > > > > > > > > On Mon, Nov 14, 2022 at 05:18:53PM +0100, Christian Borntraeger wrote:
> > > > > > > > > > > Am 08.11.22 um 10:23 schrieb Alex Bennée:
> > > > > > > > > > > > The previous fix to virtio_device_started revealed a problem in its
> > > > > > > > > > > > use by both the core and the device code. The core code should be able
> > > > > > > > > > > > to handle the device "starting" while the VM isn't running to handle
> > > > > > > > > > > > the restoration of migration state. To solve this dual use introduce a
> > > > > > > > > > > > new helper for use by the vhost-user backends who all use it to feed a
> > > > > > > > > > > > should_start variable.
> > > > > > > > > > > > 
> > > > > > > > > > > > We can also pick up a change vhost_user_blk_set_status while we are at
> > > > > > > > > > > > it which follows the same pattern.
> > > > > > > > > > > > 
> > > > > > > > > > > > Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
> > > > > > > > > > > > Fixes: 27ba7b027f (hw/virtio: add boilerplate for vhost-user-gpio device)
> > > > > > > > > > > > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > > > > > > > > > > > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > > > > > > > > > > 
> > > > > > > > > > > Hmmm, is this
> > > > > > > > > > > commit 259d69c00b67c02a67f3bdbeeea71c2c0af76c35
> > > > > > > > > > > Author:     Alex Bennée <alex.bennee@linaro.org>
> > > > > > > > > > > AuthorDate: Mon Nov 7 12:14:07 2022 +0000
> > > > > > > > > > > Commit:     Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > > > CommitDate: Mon Nov 7 14:08:18 2022 -0500
> > > > > > > > > > > 
> > > > > > > > > > >         hw/virtio: introduce virtio_device_should_start
> > > > > > > > > > > 
> > > > > > > > > > > and older version?
> > > > > > > > > > 
> > > > > > > > > > This is what got merged:
> > > > > > > > > > https://lore.kernel.org/r/20221107121407.1010913-1-alex.bennee%40linaro.org
> > > > > > > > > > This patch was sent after I merged the RFC.
> > > > > > > > > > I think the only difference is the commit log but I might be missing
> > > > > > > > > > something.
> > > > > > > > > > 
> > > > > > > > > > > This does not seem to fix the regression that I have reported.
> > > > > > > > > > 
> > > > > > > > > > This was applied on top of 9f6bcfd99f which IIUC does, right?
> > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > QEMU master still fails for me for suspend/resume to disk:
> > > > > > > > > 
> > > > > > > > > #0  0x000003ff8e3980a6 in __pthread_kill_implementation () at /lib64/libc.so.6
> > > > > > > > > #1  0x000003ff8e348580 in raise () at /lib64/libc.so.6
> > > > > > > > > #2  0x000003ff8e32b5c0 in abort () at /lib64/libc.so.6
> > > > > > > > > #3  0x000003ff8e3409da in __assert_fail_base () at /lib64/libc.so.6
> > > > > > > > > #4  0x000003ff8e340a4e in  () at /lib64/libc.so.6
> > > > > > > > > #5 0x000002aa1ffa8966 in vhost_vsock_common_pre_save
> > > > > > > > > (opaque=<optimized out>) at
> > > > > > > > > ../hw/virtio/vhost-vsock-common.c:203
> > > > > > > > > #6  0x000002aa1fe5e0ee in vmstate_save_state_v
> > > > > > > > >        (f=f@entry=0x2aa21bdc170, vmsd=0x2aa204ac5f0
> > > > > > > > > <vmstate_virtio_vhost_vsock>, opaque=0x2aa21bac9f8,
> > > > > > > > > vmdesc=vmdesc@entry=0x3fddc08eb30,
> > > > > > > > > version_id=version_id@entry=0) at ../migration/vmstate.c:329
> > > > > > > > > #7 0x000002aa1fe5ebf8 in vmstate_save_state
> > > > > > > > > (f=f@entry=0x2aa21bdc170, vmsd=<optimized out>,
> > > > > > > > > opaque=<optimized out>, vmdesc_id=vmdesc_id@entry=0x3fddc08eb30)
> > > > > > > > > at ../migration/vmstate.c:317
> > > > > > > > > #8 0x000002aa1fe75bd0 in vmstate_save (f=f@entry=0x2aa21bdc170,
> > > > > > > > > se=se@entry=0x2aa21bdbe90, vmdesc=vmdesc@entry=0x3fddc08eb30) at
> > > > > > > > > ../migration/savevm.c:908
> > > > > > > > > #9 0x000002aa1fe79584 in
> > > > > > > > > qemu_savevm_state_complete_precopy_non_iterable
> > > > > > > > > (f=f@entry=0x2aa21bdc170, in_postcopy=in_postcopy@entry=false,
> > > > > > > > > inactivate_disks=inactivate_disks@entry=true)
> > > > > > > > >        at ../migration/savevm.c:1393
> > > > > > > > > #10 0x000002aa1fe79a96 in qemu_savevm_state_complete_precopy
> > > > > > > > > (f=0x2aa21bdc170, iterable_only=iterable_only@entry=false,
> > > > > > > > > inactivate_disks=inactivate_disks@entry=true) at
> > > > > > > > > ../migration/savevm.c:1459
> > > > > > > > > #11 0x000002aa1fe6d6ee in migration_completion (s=0x2aa218ef600) at ../migration/migration.c:3314
> > > > > > > > > #12 migration_iteration_run (s=0x2aa218ef600) at ../migration/migration.c:3761
> > > > > > > > > #13 migration_thread (opaque=opaque@entry=0x2aa218ef600) at ../migration/migration.c:3989
> > > > > > > > > #14 0x000002aa201f0b8c in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:505
> > > > > > > > > #15 0x000003ff8e396248 in start_thread () at /lib64/libc.so.6
> > > > > > > > > #16 0x000003ff8e41183e in thread_start () at /lib64/libc.so.6
> > > > > > > > > 
> > > > > > > > > Michael, your previous branch did work if I recall correctly.
> > > > > > > > 
> > > > > > > > That one was failing under github CI though (for reasons we didn't
> > > > > > > > really address, such as disconnect during stop causing a recursive
> > > > > > > > call to stop, but there you are).
> > > > > > > Even the double revert of everything?
> > > > > > 
> > > > > > I don't remember at this point.
> > > > > > 
> > > > > > > So how do we proceed now?
> > > > > > 
> > > > > > I'm hopeful Alex will come up with a fix.
> > > > > I need to replicate the failing test for that. Which test is
> > > > > failing?
> > > > 
> > > > 
> > > > Pretty much the same as before. guest with vsock, managedsave and
> > > > restore.
> > > 
> > > If this isn't in our test suite I'm going to need exact steps.
> > 
> > Just get any libvirt guest, add
> >      <vsock model='virtio'>
> >        <cid auto='yes'/>
> >      </vsock>
> > 
> > to your libvirt xml. Start the guest (with the new xml).
> > Run virsh managedsave - qemu crashes. On x86 and s390.
> 
> 
> the libvirt log:
> 
> /home/cborntra/REPOS/qemu/build/x86_64-softmmu/qemu-system-x86_64 \
> -name guest=f36,debug-threads=on \
> -S \
> -object '{"qom-type":"secret","id":"masterKey0","format":"raw","file":"/var/lib/libvirt/qemu/domain-1-f36/master-key.aes"}' \
> -machine pc-i440fx-7.2,usb=off,dump-guest-core=off,memory-backend=pc.ram \
> -accel kvm \
> -cpu Cooperlake,ss=on,pdcm=on,hypervisor=on,tsc-adjust=on,avx512ifma=on,sha-ni=on,avx512vbmi=on,umip=on,avx512vbmi2=on,gfni=on,vaes=on,vpclmulqdq=on,avx512bitalg=on,avx512-vpopcntdq=on,rdpid=on,movdiri=on,movdir64b=on,fsrm=on,md-clear=on,xsaves=on,ibpb=on,ibrs=on,amd-stibp=on,amd-ssbd=on,hle=off,rtm=off,avx512-bf16=off,taa-no=off \
> -m 2048 \
> -object '{"qom-type":"memory-backend-ram","id":"pc.ram","size":2147483648}' \
> -overcommit mem-lock=off \
> -smp 2,sockets=2,cores=1,threads=1 \
> -uuid 712590b2-fbd8-4a2f-a8e9-be33cb9ee0da \
> -display none \
> -no-user-config \
> -nodefaults \
> -chardev socket,id=charmonitor,fd=39,server=on,wait=off \
> -mon chardev=charmonitor,id=monitor,mode=control \
> -rtc base=utc,driftfix=slew \
> -global kvm-pit.lost_tick_policy=delay \
> -no-hpet \
> -no-shutdown \
> -global PIIX4_PM.disable_s3=1 \
> -global PIIX4_PM.disable_s4=1 \
> -boot strict=on \
> -device ich9-usb-ehci1,id=usb,bus=pci.0,addr=0x3.0x7 \
> -device ich9-usb-uhci1,masterbus=usb.0,firstport=0,bus=pci.0,multifunction=on,addr=0x3 \
> -device ich9-usb-uhci2,masterbus=usb.0,firstport=2,bus=pci.0,addr=0x3.0x1 \
> -device ich9-usb-uhci3,masterbus=usb.0,firstport=4,bus=pci.0,addr=0x3.0x2 \
> -blockdev '{"driver":"file","filename":"/var/lib/libvirt/images/f36.qcow2","node-name":"libvirt-1-storage","auto-read-only":true,"discard":"unmap"}' \
> -blockdev '{"node-name":"libvirt-1-format","read-only":false,"driver":"qcow2","file":"libvirt-1-storage","backing":null}' \
> -device ide-hd,bus=ide.0,unit=0,drive=libvirt-1-format,id=ide0-0-0,bootindex=1 \
> -netdev user,id=hostnet0 \
> -device e1000,netdev=hostnet0,id=net0,mac=52:54:00:20:ba:4a,bus=pci.0,addr=0x2 \
> -chardev pty,id=charserial0 \
> -device isa-serial,chardev=charserial0,id=serial0 \
> -audiodev '{"id":"audio1","driver":"none"}' \
> -device virtio-balloon-pci,id=balloon0,bus=pci.0,addr=0x4 \
> -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny \
> -device vhost-vsock-pci,id=vsock0,guest-cid=3,vhostfd=35,bus=pci.0,addr=0x5 \
> -msg timestamp=on
> char device redirected to /dev/pts/1 (label charserial0)
> qemu-system-x86_64: ../hw/virtio/vhost-vsock-common.c:203: vhost_vsock_common_pre_save: Assertion `!vhost_dev_is_started(&vvc->vhost_dev)' failed.
> 2022-11-15 16:38:46.096+0000: shutting down, reason=crashed

Alex were you able to replicate? Just curious.


-- 
MST


