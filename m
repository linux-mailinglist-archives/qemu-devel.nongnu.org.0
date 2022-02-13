Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB364B3A08
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 08:51:59 +0100 (CET)
Received: from localhost ([::1]:53164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJ9fq-0005CA-6b
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 02:51:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nJ9dA-0004LC-75
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 02:49:12 -0500
Received: from [2a00:1450:4864:20::42f] (port=45637
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nJ9d7-0006H8-UB
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 02:49:11 -0500
Received: by mail-wr1-x42f.google.com with SMTP id p9so1473545wra.12
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 23:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4bmTh9GZj9o68Addo7kF7vLn5VgQlbeyVUoUC223w0U=;
 b=F/+5eIAS4INXlnCCuyyPUlhwrOg1dEoILRjNDlcAWVyGdSYm4s0aaCP+o8FbYGt6Pn
 xwkStTQ9QFITdPV6tZmMVa3gVsl6Fr6EvDyvZETsTlF0QfAhLK4NZkR+Vx2uhZfxAWKJ
 4ayxHcQhFL0byYCsMkEjrgxsyK4wzWUlKcm2H1NP0eKhwRUKxrDwiCt+SQSWml9AWGac
 qiklC5VfC6DxCz1kF/RgvwylA4gI9s2OdvEhlncK+5hcyUG3oiqS7Su/Rw5sNE9uLYPI
 5EyM9j8k8IMahO7CuodS72kXYYJV9qROgXKy0KTaNAOSs/4sC3zE39Q++mh/UzXTLLF+
 hJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4bmTh9GZj9o68Addo7kF7vLn5VgQlbeyVUoUC223w0U=;
 b=QGlLJIcawcit4IP5XfmF9kza2r0rvMAUf3EPh+KO/YA1mKVuhELhxwC73Duo14nGO3
 b/vRvcNiDwlow1gfvFetqRGq7VcrtnPW2sV3SfwT6DTtHd8LifAori+AorrwDd1wr5uy
 sjdd3/xbo+fatcdJntagmSR7wUSQ6JF2ng69cQF84fnxP0VQUyI/KboqNbHYBPZxbfej
 2CdGM7LqD6vJkvNJGNmA3iMt6ixpgnBOypK29cxBqPZTwJRecAwRoX1gTSJ0vkuDwxUr
 BZCv4gwmXvpj7yYfjoNtawIQRkQXo2qw4wbfbD7k0/gCnM6hsuIadD+eT75wV4ObA0Y2
 feiw==
X-Gm-Message-State: AOAM533uGrLZ3FD5A8IGLiyU2vwu8tdHNYPWvg257x/N8pxLnTJluFRt
 sf/f1aBKUJxdkum6j7mCMdvDujVqtkA=
X-Google-Smtp-Source: ABdhPJyRFAlY7n3Wd4RowVmDUtqgeuH1n8CBsae/vinFdQevzizWaoHsw1U4AsrQvB3PmaSzqLZTng==
X-Received: by 2002:a5d:64e5:: with SMTP id g5mr7213323wri.541.1644738546237; 
 Sat, 12 Feb 2022 23:49:06 -0800 (PST)
Received: from jondnuc ([2a0d:6fc2:4af1:7d00:5e41:a6ea:ffaa:548c])
 by smtp.gmail.com with ESMTPSA id u25sm8069828wmm.15.2022.02.12.23.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 23:49:05 -0800 (PST)
Date: Sun, 13 Feb 2022 09:49:04 +0200
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v1 0/4] HyperV: Synthetic Debugging device
Message-ID: <Ygi38JDSYmh0ALZ9@jondnuc>
References: <20220204100723.406121-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220204100723.406121-1-arilou@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=arilou@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, vkuznets@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/2022, Jon Doron wrote:

Ping

>This patchset adds support for the synthetic debugging device.
>
>HyperV supports a special transport layer for the kernel debugger when
>running in HyperV.
>
>This patchset add supports for this device so you could have a setup
>fast windows kernel debugging.
>
>At this point of time, DHCP is not implmeneted so to set this up few
>things need to be noted.
>
>The scenario I used to test is having 2 VMs in the same virtual network
>i.e a Debugger VM with the NIC:
>-nic tap,model=virtio,mac=02:ca:01:01:01:01,script=/etc/qemu-ifup
>And it's IP is going to be static 192.168.53.12
>And the VM we want to debug, to which we need to have the englightments
>and vmbus configured:
> -cpu host,hv-relaxed,hv_spinlocks=0x1fff,hv_time,+vmx,invtsc,hv-vapic,hv-vpindex,hv-synic,hv-syndbg \
> -device vmbus-bridge \
> -device hv-syndbg,host_ip=192.168.53.12,host_port=50000,use_hcalls=false \
> -nic tap,model=virtio,mac=02:ca:01:01:01:02,script=/etc/qemu-ifup \
>
>Then in the debuggee VM we would setup the kernel debugging in the
>following way:
>
>If the VM is older than Win8:
>* Copy the proper platform kdvm.dll (make sure it's called kdvm.dll even if platform is 32bit)
>bcdedit /set {GUID} dbgtransport kdvm.dll
>bcdedit /set {GUID} loadoptions host_ip="1.2.3.4",host_port="50000",nodhcp
>bcdedit /set {GUID} debug on
>bcdedit /set {GUID} halbreakpoint on
>
>Win8 and late:
>bcdedit /dbgsettings net hostip:7.7.7.7 port:50000 nodhcp
>
>This is all the setup that is required to get the synthetic debugger
>configured correctly.
>
>Jon Doron (4):
>  hyperv: SControl is optional to enable SynIc
>  hyperv: Add definitions for syndbg
>  hyperv: Add support to process syndbg commands
>  hw: hyperv: Initial commit for Synthetic Debugging device
>
> docs/hyperv.txt                  |  15 +
> hw/hyperv/Kconfig                |   5 +
> hw/hyperv/hyperv.c               | 475 +++++++++++++++++++++++++------
> hw/hyperv/meson.build            |   1 +
> hw/hyperv/syndbg.c               | 407 ++++++++++++++++++++++++++
> include/hw/hyperv/hyperv-proto.h |  52 ++++
> include/hw/hyperv/hyperv.h       |  60 ++++
> target/i386/cpu.c                |   2 +
> target/i386/cpu.h                |   7 +
> target/i386/kvm/hyperv-proto.h   |  37 +++
> target/i386/kvm/hyperv-stub.c    |   6 +
> target/i386/kvm/hyperv.c         |  52 +++-
> target/i386/kvm/kvm.c            |  76 ++++-
> 13 files changed, 1105 insertions(+), 90 deletions(-)
> create mode 100644 hw/hyperv/syndbg.c
>
>-- 
>2.34.1
>

