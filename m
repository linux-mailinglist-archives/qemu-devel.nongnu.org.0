Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E7357F02C
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 17:56:43 +0200 (CEST)
Received: from localhost ([::1]:50488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFHUg-0005KH-7z
	for lists+qemu-devel@lfdr.de; Sat, 23 Jul 2022 11:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1oFHRG-00005W-Qa
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 11:53:10 -0400
Received: from esa15.hc2706-39.iphmx.com ([216.71.140.200]:8585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1oFHRB-0003uz-Fv
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 11:53:07 -0400
X-IronPort-RemoteIP: 209.85.160.198
X-IronPort-MID: 210615186
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5YDrk6m86XZA6DG/WrELnrjo5gwzJERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbCD/UM/3YY2agLdgnOtnkoEIAvcKHx9QwT1Bk+Xw9FS4T+ZvOCOrCEkqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaQr414rZ8Ek15Kuo42tC1rADTasjUGH2xiF94K03ePnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aLVeS8oiM+t5uK23CukhcPPpMTb5LwX6v2ZwKhxLidw
 P0V3XC5pJxA0qfkwYzxWDEBe81y0DEvFBYq7hFTvOTKp3AqfUcAzN02FnBmG846otpJHGt06
 uU5IxERSUGM0rfeLLKTEoGAh+wmJcjveZoD4zRulGCJS/khRp/HTuPB4towMDUY3JgfW6aDI
 ZNHMXw2PUSojx5nYz/7DLo3mPeuimPXeSAepV6IzUYyyzKKlFIojeG9brI5fPSEQcQPsWOdn
 lnXwHTGGy4zC/GT2Du8pyfEaujn2HmTtJgpPKS18+MvjFCNy2g7DhoQWl2m5/6jhSaDt8l3L
 kUV/m83sfF3+hX6Hp/yWBq3pHPCtRkZMzZNL9AHBMi24vK8y26k6qIsFFattPROWBcKeAEX
IronPort-HdrOrdr: A9a23:9xbLCK5uxq0covwscwPXwBTXdLJyesId70hD6qkRc20vTiX8ra
 uTdZsguyMc5Ax9ZJhio6HlBED4exLhHMdOgbX5Xo3SPjUO2lHYVL2KhLGKq1fd8kvFh4tgPM
 xbHJSWZuedMbE0t7ec3OAUKadH/PCXtIqTraP1yXN1SAFjbKttqz1+Fh2QHiRNNWp77N4CZe
 Oh2vY=
Received: from mail-qt1-f198.google.com ([209.85.160.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jul 2022 11:53:00 -0400
Received: by mail-qt1-f198.google.com with SMTP id
 f18-20020ac84712000000b0031eed29015cso4092272qtp.20
 for <qemu-devel@nongnu.org>; Sat, 23 Jul 2022 08:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=imDm/YnxO9lvw9/nstB1lu3IFVFnIU89BQIyNfYGlP8=;
 b=FyJxfgMlRT1vETj5qOoT1h4lzKxHuWS1w5SNtl+trAHvl1TWKrIWkX+NOYDKaricKb
 NfZ9KXdo1ljUcH84xY5+3Z2BBH7x9zq6oZIMaOGxVR08LGYq3sk8aXtHgqgzvwYdOWa+
 QPJOSpmn+Aw7tawkf0CjCEph8y357Zu7C4ztCyoWGH25qyhHbBRQ+50LOyT8L17T8etN
 +mj+kITVpbyPTXt9bWh/okQh/SeTgy9avqI4oNmYcjmuakeY2FzCrtFeNhYYtWhKzTbI
 WQdXIiNlb/Fef6HjHuOMuy9GG7RPxTr3csGEThffuYB+gYC3vKF4sXBxN1n3M/AJYAEj
 yb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=imDm/YnxO9lvw9/nstB1lu3IFVFnIU89BQIyNfYGlP8=;
 b=K7BMgM8KqTYEVis4h6SyeLy8I+Edv3Eihg7uBlxnIvlXEROtdmD+ULs2accxx/Lod1
 1RWHvUdXzF0S79TmpTz5TNRyPDVAU4vOjtGlt3vWO3GbfFWlPWyFaN07TuYDdXUwxSDW
 nO+hUhmMynLMaNp31jVOdtkrancV0JkNs4j3lYaUNC4qcVMvCN6qEUWwH87Vgg4B0Oxb
 6Vhn8ywd93v4JonydCjJT06f/tTY86cPLwzXuZpuXt+MBmQ2OjcZMwrP0NfpP7ARtIBR
 AVM2/e1c2JggGvCJ/vOem+Jh9nc6tEU4g39G7todbj923DLpi0ViRoibG/9DPx1y5lWY
 iGZQ==
X-Gm-Message-State: AJIora/VxXZKTOerheGbQcKEfM7RwVQN2axpvaDHvWu5K0Rp3HUCsEmV
 iYTegnP4oaIWOnUg9aldLK+8TMKQ3hCqOZJ2zAAJyn+Fbqf4hMp2PsCgcpGJxFWDF/My3ZJyCiK
 8AiNArvzb8pmHmSrlQnUlzElR1D0DXw==
X-Received: by 2002:a05:620a:44d3:b0:6b5:f613:ed39 with SMTP id
 y19-20020a05620a44d300b006b5f613ed39mr3742876qkp.50.1658591580277; 
 Sat, 23 Jul 2022 08:53:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tFDE8x5dmNUErFLRB0sftukP/MqaoJREvm0mb4+QYl7JgPkHW3G3ulcZA+pd+r0CkZjPHDTQ==
X-Received: by 2002:a05:620a:44d3:b0:6b5:f613:ed39 with SMTP id
 y19-20020a05620a44d300b006b5f613ed39mr3742863qkp.50.1658591579974; 
 Sat, 23 Jul 2022 08:52:59 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a05620a40cb00b006af08c26774sm5988438qko.47.2022.07.23.08.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 08:52:59 -0700 (PDT)
Date: Sat, 23 Jul 2022 11:52:54 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Claudio Fontana <cfontana@suse.de>
Cc: Richard Liu <richy.liu.2002@gmail.com>, qemu-devel@nongnu.org,
 bsd@redhat.com, darren.kenny@oracle.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, nborisov@suse.com,
 Het Gala <het.gala@nutanix.com>
Subject: Re: [RFC 0/3] add snapshot/restore fuzzing device
Message-ID: <20220723155254.7pnid7itdux6ufgm@mozz.bu.edu>
References: <20220722192041.93006-1-richy.liu.2002@gmail.com>
 <3d9fc1a9-da25-bb34-a961-27b860c90d44@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d9fc1a9-da25-bb34-a961-27b860c90d44@suse.de>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.200; envelope-from=alxndr@bu.edu;
 helo=esa15.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 220722 2210, Claudio Fontana wrote:
> Hi Richard,
> 
> On 7/22/22 21:20, Richard Liu wrote:
> > This RFC adds a virtual device for snapshot/restores within QEMU. I am working
> > on this as a part of QEMU Google Summer of Code 2022. Fast snapshot/restores
> > within QEMU is helpful for code fuzzing.
> > 
> > I reused the migration code for saving and restoring virtual device and CPU
> > state. As for the RAM, I am using a simple COW mmaped file to do restores.
> > 
> > The loadvm migration function I used for doing restores only worked after I
> > called it from a qemu_bh. I'm not sure if I should run the migration code in a
> > separate thread (see patch 3), since currently it is running as a part of the
> > device code in the vCPU thread.
> > 
> > This is a rough first revision and feedback on the cpu and device state restores
> > is appreciated.
> 
> As I understand it, usually the save and restore of VM state in QEMU can best be
> managed by libvirt APIs, and for example using the libvirt command line tool virsh:
> 
> $ virsh save (or managedsave)
> 
> $ virsh restore (or start)
> 
> These commands start a QEMU migration using the QMP protocol to a file descriptor,
> previously opened by libvirt to contain the state file.
> 
> (getfd QMP command):
> https://qemu-project.gitlab.io/qemu/interop/qemu-qmp-ref.html#qapidoc-2811
> 
> (migrate QMP command):
> https://qemu-project.gitlab.io/qemu/interop/qemu-qmp-ref.html#qapidoc-1947
> 
> This is unfortunately currently very slow.
> 
> Maybe you could help thinking out or with the implementation of the solution?
> I tried to push this approach that only involves libvirt, using the existing QEMU multifd migration to a socket:
> 
> https://listman.redhat.com/archives/libvir-list/2022-June/232252.html
> 
> performance is very good compared with what is possible today, but it won't be upstreamable because it is not deemed optimal, and libvirt wants the code to be in QEMU.
> 
> What about helping in thinking out how the QEMU-based solution could look like?
> 
> The requirements for now in my view seem to be:
> 
> * avoiding the kernel file page trashing for large transfers
>   which currently requires in my view changing QEMU to be able to migrate a stream to an fd that is open with O_DIRECT.
>   In practice this means somehow making all QEMU migration stream writes block-friendly (adding some buffering?).
> 
> * allow concurrent parallel transfers
>   to be able to use extra cpu resources to speed up the transfer if such resources are available.
> 
> * we should be able to transfer multiple GB/s with modern nvmes for super fast VM state save and restore (few seconds even for a 30GB VM),
>   and we should do no worse than the prototype fully implemented in libvirt, otherwise it would not make sense to implement it in QEMU.
> 
> What do you think?

Hi Claudio,
These changes aim to restore a VM hundreds-thousands of times per second
within the same process. Do you think that is achievable with the design
of qmp migrate? We want to to avoid serializing/transferring all of
memory over the FD. So right now, this series only uses migration code
for device state. Right now (in 3/3), the memory is "restored" simply be
re-mmapping MAP_PRIVATE from file-backed memory. However, future
versions might use dirty-page-tracking with a shadow memory-snapshot, to
avoid the page-faults that result from the mmap + MAP_PRIVATE approach.

In terms of the way the guest initiates snapshots/restores, maybe there
is a neater way to do this with QMP, by providing the guest with access
to qmp via a serial device. That way, we avoid the need for a custom
virtual-device. Right now, the snapshots are requested/restored over
MMIO, since we need to make snapshots at precise locations in the
guest's execution (i.e. a specific program counter in a process running
in the guest). I wonder if there is a way to achieve that with qmp
forwarded to the guest.

-Alex

> 
> Ciao,
> 
> Claudio
> 
> > 
> > To test locally, boot up any linux distro. I used the following C file to
> > interact with the PCI snapshot device:
> > 
> >     #include <stdio.h>
> >     #include <stdint.h>
> >     #include <fcntl.h>
> >     #include <sys/mman.h>
> >     #include <unistd.h>
> > 
> >     int main() {
> >         int fd = open("/sys/bus/pci/devices/0000:00:04.0/resource0", O_RDWR | O_SYNC);
> >         size_t size = 1024 * 1024;
> >         uint32_t* memory = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> > 
> >         printf("%x\n", memory[0]);
> > 
> >         int a = 0;
> >         memory[0] = 0x101; // save snapshot
> >         printf("before: value of a = %d\n", a);
> >         a = 1;
> >         printf("middle: value of a = %d\n", a);
> >         memory[0] = 0x102; // load snapshot
> >         printf("after: value of a = %d\n", a);
> > 
> >         return 0;
> >     }
> > 
> > Richard Liu (3):
> >   create skeleton snapshot device and add docs
> >   implement ram save/restore
> >   use migration code for cpu and device save/restore
> > 
> >  docs/devel/snapshot.rst |  26 +++++++
> >  hw/i386/Kconfig         |   1 +
> >  hw/misc/Kconfig         |   3 +
> >  hw/misc/meson.build     |   1 +
> >  hw/misc/snapshot.c      | 164 ++++++++++++++++++++++++++++++++++++++++
> >  migration/savevm.c      |  84 ++++++++++++++++++++
> >  migration/savevm.h      |   3 +
> >  7 files changed, 282 insertions(+)
> >  create mode 100644 docs/devel/snapshot.rst
> >  create mode 100644 hw/misc/snapshot.c
> > 
> 

