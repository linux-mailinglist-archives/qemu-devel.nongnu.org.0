Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018354281A3
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Oct 2021 16:05:47 +0200 (CEST)
Received: from localhost ([::1]:45928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZZST-0001a3-SY
	for lists+qemu-devel@lfdr.de; Sun, 10 Oct 2021 10:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mZZQc-0000sU-31
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 10:03:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mZZQY-0007Aw-3M
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 10:03:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633874623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OXH9/DFDFHTKiTCKHxJXuz9Hiv1zOCmsQULZ9qiPRC0=;
 b=aJc9XMbGcN7jF3rTaRezZFYgHrc+ck0kA5U1c2KRUthmqGyl8tRCPDnzkrxr0jO10CdB2m
 XOt/gvsIrLDV7KejZgQDvWiNGoy3Ud8/PGIhsMZrrwl3EtgJkottniiI1cPv1OxLzxsmZ1
 Hxva5hp/A7utjS3H8btdRa6aMRuXscg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-Uc6yST9vPN6a3uUAV3STOw-1; Sun, 10 Oct 2021 10:03:41 -0400
X-MC-Unique: Uc6yST9vPN6a3uUAV3STOw-1
Received: by mail-wr1-f69.google.com with SMTP id
 v15-20020adfa1cf000000b00160940b17a2so11109629wrv.19
 for <qemu-devel@nongnu.org>; Sun, 10 Oct 2021 07:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OXH9/DFDFHTKiTCKHxJXuz9Hiv1zOCmsQULZ9qiPRC0=;
 b=WMCAszFdz+c3BPEJs6ZT/aieijIlIEIpj2dy2kb4dcJnikMYDJAz/xiqjEFNmIEh0P
 CBQozlJetJwEgkG0+VfQpOknkQPPn1Ew533Ca9O0eZvpoxb9XhHgY5NS+IBvOxMzRiML
 aJsR8W4BgeoPk7iTAWH/GlnmQIV38mLSQWb0rkbgYW/U8KpQAHrxuvYZB/sAt7MJHACd
 g8Y22QXkLbNgcR8jePb0ALrgu3/GOqcVx3KKVHa/8j9QQU+1UMnqGUGzpebRASSbTcWg
 lBWgIqvum1F2BW6FbBw0sjvne8oKd6Tnr9H/ExIt5pK38UB8y4jlhMLLBzrfLIw9kW0y
 A9yA==
X-Gm-Message-State: AOAM530jCJo4+GvspLOdvOWeJa0ExzuvaGwpoHXb7trdrLa6uKgkvFiZ
 Nql8R9XEjzZEG2PyjPHbknEFgcHEXYZrvd/2LMtGrg4yPdlYiEslDhTIKmN5VObmacFiq7LXdQu
 Q9XetjtKJG0faMc0=
X-Received: by 2002:a05:600c:3585:: with SMTP id
 p5mr15790138wmq.88.1633874620750; 
 Sun, 10 Oct 2021 07:03:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwS5Fvtli7QhI0CcjLo8u4iKfafHbReVOP6ZdBNeNbpYJlxL9xiMofEDyX5EmS8lA98PVBXiw==
X-Received: by 2002:a05:600c:3585:: with SMTP id
 p5mr15790123wmq.88.1633874620580; 
 Sun, 10 Oct 2021 07:03:40 -0700 (PDT)
Received: from redhat.com ([2a10:800c:ce9e:0:d3e8:b9af:2219:373a])
 by smtp.gmail.com with ESMTPSA id c14sm5003322wrd.50.2021.10.10.07.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 07:03:39 -0700 (PDT)
Date: Sun, 10 Oct 2021 10:03:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: ACPI endianness
Message-ID: <20211010100318-mutt-send-email-mst@kernel.org>
References: <957db5ec-fc70-418-44d9-da4f81f5b98@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <957db5ec-fc70-418-44d9-da4f81f5b98@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 10, 2021 at 03:24:32PM +0200, BALATON Zoltan wrote:
> Hello,
> 
> I'm trying to fix shutdown and reboot on pegasos2 which uses ACPI as part of
> the VIA VT8231 (similar to and modelled in hw/isa/vt82c686b.c) and found
> that the guest writes to ACPI PM1aCNT register come out with wrong
> endianness but not shure why. I have this:
> 
> $ qemu-system-ppc -M pegasos2 -monitor stdio
> (qemu) info mtree
> [...]
> memory-region: pci1-io
>   0000000000000000-000000000000ffff (prio 0, i/o): pci1-io
> [...]
>     0000000000000f00-0000000000000f7f (prio 0, i/o): via-pm
>       0000000000000f00-0000000000000f03 (prio 0, i/o): acpi-evt
>       0000000000000f04-0000000000000f05 (prio 0, i/o): acpi-cnt
>       0000000000000f08-0000000000000f0b (prio 0, i/o): acpi-tmr
> 
> memory-region: system
>   0000000000000000-ffffffffffffffff (prio 0, i/o): system
>     0000000000000000-000000001fffffff (prio 0, ram): pegasos2.ram
>     0000000080000000-00000000bfffffff (prio 0, i/o): alias pci1-mem0-win @pci1-mem 0000000080000000-00000000bfffffff
>     00000000c0000000-00000000dfffffff (prio 0, i/o): alias pci0-mem0-win @pci0-mem 00000000c0000000-00000000dfffffff
>     00000000f1000000-00000000f100ffff (prio 0, i/o): mv64361
>     00000000f8000000-00000000f8ffffff (prio 0, i/o): alias pci0-io-win @pci0-io 0000000000000000-0000000000ffffff
>     00000000f9000000-00000000f9ffffff (prio 0, i/o): alias pci0-mem1-win @pci0-mem 0000000000000000-0000000000ffffff
>     00000000fd000000-00000000fdffffff (prio 0, i/o): alias pci1-mem1-win @pci1-mem 0000000000000000-0000000000ffffff
>     00000000fe000000-00000000feffffff (prio 0, i/o): alias pci1-io-win @pci1-io 0000000000000000-0000000000ffffff
>     00000000ff800000-00000000ffffffff (prio 0, i/o): alias pci1-mem3-win @pci1-mem 00000000ff800000-00000000ffffffff
>     00000000fff00000-00000000fff7ffff (prio 0, rom): pegasos2.rom
> 
> The guest (which is big endian PPC and I think wotks on real hardware)
> writes to 0xf05 in the io region which should be the high byte of the little
> endian register but in the acpi code it comes out wrong, instead of 0x2800 I
> get in acpi_pm1_cnt_write: val=0x28
> 
> The memory regions involved are:
> 
> acpi-cnt (hw/acpi/core.c):
> 
> static const MemoryRegionOps acpi_pm_cnt_ops = {
>     .read = acpi_pm_cnt_read,
>     .write = acpi_pm_cnt_write,
>     .impl.min_access_size = 2,
>     .valid.min_access_size = 1,
>     .valid.max_access_size = 2,
>     .endianness = DEVICE_LITTLE_ENDIAN,
> };
> 
> via-pm (hw/isa/vt82c686.c):
> 
> static const MemoryRegionOps pm_io_ops = {
>     .read = pm_io_read,
>     .write = pm_io_write,
>     .endianness = DEVICE_NATIVE_ENDIAN,
>     .impl = {
>         .min_access_size = 1,
>         .max_access_size = 1,
>     },
> };
> 
> Also tried removing .impl from pm_io_ops but that does not help. Changing
> acpi_pm_cnt_ops to DEVICE_NATIVE_ENDIAN fixes it but not sure what else
> could that break. Should these ACPI regions be native endian or how else to
> fix this for the vt82xx case?
> 
> Regards,
> BALATON Zoltan

Does it help if you change via to DEVICE_LITTLE_ENDIAN?

-- 
MST


