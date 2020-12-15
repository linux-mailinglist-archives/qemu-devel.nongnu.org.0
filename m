Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829222DB04E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:43:17 +0100 (CET)
Received: from localhost ([::1]:47610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCTs-0005fl-IB
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:43:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dann.frazier@canonical.com>)
 id 1kpCDs-0007Yu-A2
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:26:51 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:53369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.90_1) (envelope-from <dann.frazier@canonical.com>)
 id 1kpCDn-0003A3-0t
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:26:42 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <dann.frazier@canonical.com>) id 1kpCDk-0000tJ-Cv
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 15:26:36 +0000
Received: by mail-il1-f197.google.com with SMTP id x10so16749351ilq.12
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 07:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dHbeUpDTvHLTGmUYV9hlyZMrHd/PWo/QslZGPSdBn7Y=;
 b=Kyt4HfAWD6Diyqzcmo5xY8h9wgJMwVx9gDg1yoqvQK92htZFLmoSCVatQxgo1CeyLV
 vEaPGMbxaGBtSIuSRoBVZlik2H83Hnknmd/7QO+sZZlUWgjCCktsVT1xE47E9JyEDfMs
 8jHo2dPfu1Yi/q/BUUQ3jy5iFkpwu5egHzUB5LRm//LKcZh2YgwCTszUo9chgjrAgKjz
 XRsqFHyIFjAv6xrXFp8FR+feYemxNhTDIPk+mnr/7v0XHXnT09ymhW1AwzVjtETS4scG
 d9gsUfWp8C3EtYqjl20iDN62d/RgzY41QYUAY9RYJ53rlCCZD9+hPnhGKwOpM/Flciuq
 J1/w==
X-Gm-Message-State: AOAM533AuXsQqLZv2wbIM5xzGz5b7D8Qe4Rq1hMOwPV+PzGV5w5Egv7Z
 QLl6go2gxBGSkB4GpE3r1+i34GVDltbXX3a2iC3P9oLoAY8nvuY2cWnQzsjMWhjI/yy4eNS2YPY
 nS+FY10MqSS304LniVmn3ZUgXFBhf65c5
X-Received: by 2002:a05:6602:106:: with SMTP id
 s6mr38232616iot.17.1608045995028; 
 Tue, 15 Dec 2020 07:26:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgZBR80YF7xqgWIKOnisVp4oiXr8eQDRJ4dt5vCF4Fq1ewxnWr+a7ZDKiovjKmYM2L3ihbtQ==
X-Received: by 2002:a05:6602:106:: with SMTP id
 s6mr38232599iot.17.1608045994685; 
 Tue, 15 Dec 2020 07:26:34 -0800 (PST)
Received: from xps13.dannf (c-71-56-235-36.hsd1.co.comcast.net. [71.56.235.36])
 by smtp.gmail.com with ESMTPSA id w9sm13237284ilq.43.2020.12.15.07.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 07:26:33 -0800 (PST)
Date: Tue, 15 Dec 2020 08:26:31 -0700
From: dann frazier <dann.frazier@canonical.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/2] audio: remove qemu_spice_audio_init()
Message-ID: <X9jVp5qVK+asn33s@xps13.dannf>
References: <20200916084117.21828-1-kraxel@redhat.com>
 <20200916084117.21828-2-kraxel@redhat.com>
 <CALdTtnsBpZ1fyB=dJMdO7Oq=swHw5AsmZxVru_tf6iZZouC=5g@mail.gmail.com>
 <20201215080719.qnr2lgoi3l5iaogq@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201215080719.qnr2lgoi3l5iaogq@sirius.home.kraxel.org>
Received-SPF: none client-ip=91.189.89.112;
 envelope-from=dann.frazier@canonical.com; helo=youngberry.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 15, 2020 at 09:07:19AM +0100, Gerd Hoffmann wrote:
> > > +    if (using_spice) {
> > > +        /*
> > > +         * When using spice allow the spice audio driver being picked
> > > +         * as default.
> > > +         *
> > > +         * Temporary hack.  Using audio devices without explicit
> > > +         * audiodev= property is already deprecated.  Same goes for
> > > +         * the -soundhw switch.  Once this support gets finally
> > > +         * removed we can also drop the concept of a default audio
> > > +         * backend and this can go away.
> > > +         */
> > > +        driver = audio_driver_lookup("spice");
> > > +        driver->can_be_default = 1;
> > 
> > fyi, one of my libvirt/QEMU guests now segfaults here.
> > See: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=977301
> 
> Hmm, surely doesn't hurt to add a "if (driver)" check here.
> 
> I'm wondering though how you end up with spice being enabled
> but spiceaudio driver not being available.  There is no separate
> config switch so you should have both spice + spiceaudio or
> none of them ...

Beats me. I'm seeing this for all of my guests, which I believe were
just created with virt-install or virtinst. Here's the log, in
case it helps:

2020-12-13 17:49:15.028+0000: starting up libvirt version: 6.9.0, package: 1+b2 (amd64 / i386 Build Daemon (x86-ubc-01) <buildd_amd64-x86-ubc-01@buildd.debian.org> Mon, 07 Dec 2020 09:45:52 +0000), qemu version: 5.2.0Debian 1:5.2+dfsg-2, kernel: 5.9.0-1-amd64, hostname: xps13.dannf
LC_ALL=C \
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin \
HOME=/var/lib/libvirt/qemu/domain-4-debian10 \
XDG_DATA_HOME=/var/lib/libvirt/qemu/domain-4-debian10/.local/share \
XDG_CACHE_HOME=/var/lib/libvirt/qemu/domain-4-debian10/.cache \
XDG_CONFIG_HOME=/var/lib/libvirt/qemu/domain-4-debian10/.config \
QEMU_AUDIO_DRV=spice \
/usr/bin/qemu-system-x86_64 \
-name guest=debian10,debug-threads=on \
-S \
-object secret,id=masterKey0,format=raw,file=/var/lib/libvirt/qemu/domain-4-debian10/master-key.aes \
-machine pc-q35-5.0,accel=kvm,usb=off,vmport=off,dump-guest-core=off,memory-backend=pc.ram \
-cpu Skylake-Client-IBRS,ss=on,vmx=on,pdcm=on,hypervisor=on,tsc-adjust=on,clflushopt=on,umip=on,md-clear=on,stibp=on,arch-capabilities=on,ssbd=on,xsaves=on,pdpe1gb=on,ibpb=on,amd-stibp=on,amd-ssbd=on,skip-l1dfl-vmentry=on,pschange-mc-no=on,hle=off,rtm=off \
-m 1024 \
-object memory-backend-ram,id=pc.ram,size=1073741824 \
-overcommit mem-lock=off \
-smp 2,sockets=2,cores=1,threads=1 \
-uuid 623816ab-33f1-420d-9fc6-2a11afb5715d \
-no-user-config \
-nodefaults \
-chardev socket,id=charmonitor,fd=36,server,nowait \
-mon chardev=charmonitor,id=monitor,mode=control \
-rtc base=utc,driftfix=slew \
-global kvm-pit.lost_tick_policy=delay \
-no-hpet \
-no-shutdown \
-global ICH9-LPC.disable_s3=1 \
-global ICH9-LPC.disable_s4=1 \
-boot menu=on,strict=on \
-device pcie-root-port,port=0x10,chassis=1,id=pci.1,bus=pcie.0,multifunction=on,addr=0x2 \
-device pcie-root-port,port=0x11,chassis=2,id=pci.2,bus=pcie.0,addr=0x2.0x1 \
-device pcie-root-port,port=0x12,chassis=3,id=pci.3,bus=pcie.0,addr=0x2.0x2 \
-device pcie-root-port,port=0x13,chassis=4,id=pci.4,bus=pcie.0,addr=0x2.0x3 \
-device pcie-root-port,port=0x14,chassis=5,id=pci.5,bus=pcie.0,addr=0x2.0x4 \
-device pcie-root-port,port=0x15,chassis=6,id=pci.6,bus=pcie.0,addr=0x2.0x5 \
-device pcie-root-port,port=0x16,chassis=7,id=pci.7,bus=pcie.0,addr=0x2.0x6 \
-device qemu-xhci,p2=15,p3=15,id=usb,bus=pci.2,addr=0x0 \
-device virtio-serial-pci,id=virtio-serial0,bus=pci.3,addr=0x0 \
-blockdev '{"driver":"file","filename":"/var/lib/libvirt/images/debian10.raw","node-name":"libvirt-3-storage","auto-read-only":true,"discard":"unmap"}' \
-blockdev '{"node-name":"libvirt-3-format","read-only":false,"driver":"raw","file":"libvirt-3-storage"}' \
-device virtio-blk-pci,bus=pci.4,addr=0x0,drive=libvirt-3-format,id=virtio-disk0,bootindex=1 \
-blockdev '{"driver":"file","filename":"/var/lib/libvirt/images/debian10-seed.img","node-name":"libvirt-2-storage","auto-read-only":true,"discard":"unmap"}' \
-blockdev '{"node-name":"libvirt-2-format","read-only":false,"driver":"raw","file":"libvirt-2-storage"}' \
-device virtio-blk-pci,bus=pci.7,addr=0x0,drive=libvirt-2-format,id=virtio-disk1 \
-device ide-cd,bus=ide.0,id=sata0-0-0 \
-netdev tap,fd=38,id=hostnet0,vhost=on,vhostfd=39 \
-device virtio-net-pci,netdev=hostnet0,id=net0,mac=52:54:00:86:da:65,bus=pci.1,addr=0x0 \
-chardev pty,id=charserial0 \
-device isa-serial,chardev=charserial0,id=serial0 \
-chardev socket,id=charchannel0,fd=40,server,nowait \
-device virtserialport,bus=virtio-serial0.0,nr=1,chardev=charchannel0,id=channel0,name=org.qemu.guest_agent.0 \
-chardev spicevmc,id=charchannel1,name=vdagent \
-device virtserialport,bus=virtio-serial0.0,nr=2,chardev=charchannel1,id=channel1,name=com.redhat.spice.0 \
-device usb-tablet,id=input0,bus=usb.0,port=1 \
-spice port=5900,addr=127.0.0.1,disable-ticketing,image-compression=off,seamless-migration=on \
-device qxl-vga,id=video0,ram_size=67108864,vram_size=67108864,vram64_size_mb=0,vgamem_mb=16,max_outputs=1,bus=pcie.0,addr=0x1 \
-device ich9-intel-hda,id=sound0,bus=pcie.0,addr=0x1b \
-device hda-duplex,id=sound0-codec0,bus=sound0.0,cad=0 \
-chardev spicevmc,id=charredir0,name=usbredir \
-device usb-redir,chardev=charredir0,id=redir0,bus=usb.0,port=2 \
-chardev spicevmc,id=charredir1,name=usbredir \
-device usb-redir,chardev=charredir1,id=redir1,bus=usb.0,port=3 \
-device virtio-balloon-pci,id=balloon0,bus=pci.5,addr=0x0 \
-object rng-random,id=objrng0,filename=/dev/urandom \
-device virtio-rng-pci,rng=objrng0,id=rng0,bus=pci.6,addr=0x0 \
-sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny \
-msg timestamp=on
char device redirected to /dev/pts/20 (label charserial0)
2020-12-13T17:49:15.239179Z qemu-system-x86_64: warning: host doesn't support requested feature: MSR(48FH).vmx-exit-load-perf-global-ctrl [bit 12]
2020-12-13T17:49:15.239377Z qemu-system-x86_64: warning: host doesn't support requested feature: MSR(490H).vmx-entry-load-perf-global-ctrl [bit 13]
2020-12-13T17:49:15.243722Z qemu-system-x86_64: warning: host doesn't support requested feature: MSR(48FH).vmx-exit-load-perf-global-ctrl [bit 12]
2020-12-13T17:49:15.243785Z qemu-system-x86_64: warning: host doesn't support requested feature: MSR(490H).vmx-entry-load-perf-global-ctrl [bit 13]
2020-12-13 17:49:16.145+0000: shutting down, reason=failed

