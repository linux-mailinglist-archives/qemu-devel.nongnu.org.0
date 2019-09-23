Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC28ABAFE9
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 10:48:57 +0200 (CEST)
Received: from localhost ([::1]:53802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCK1g-0006bQ-Kx
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 04:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45590)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sameid@google.com>) id 1iCJdU-0000Bg-C4
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:23:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sameid@google.com>) id 1iCJdS-0005zC-VO
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:23:56 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:36313)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sameid@google.com>) id 1iCJdS-0005yc-P6
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:23:54 -0400
Received: by mail-qk1-x741.google.com with SMTP id y189so14472153qkc.3
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 01:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zup5OGjRbCC5y3n0ahrU1EueS2lu3LX/Bqx9s4Gt/2g=;
 b=itq2CRxzraAJu+//qZiNpTMbhEXJSLP8V1lALxxFWSKAkS310btzkD70mLZ3lMFhah
 yFRspVPO4cteyqJPcoDhlIrcKPNKT7XJ3UCjdAB+qTwm1aqpWhM19mR4Ppe9BEnkQ/I8
 T37BLQdnkP4ZcHr/I5cakIbVnHAjcCbOlO3np+uITURD1jpx92GsMl4Axys1PDy4bglM
 PswXpHYCS2edC06nSuAsuCMSC2bOjB7k3HRDCY56DY/Uped9XcM3Ab+ezTGeiOLdfhcJ
 oEhd4wR5xIN8Z6QE1192VErk3bFAfCku4vnF7moGVhUfA+Dun9297g17PDMjWu8ecEp8
 1GJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zup5OGjRbCC5y3n0ahrU1EueS2lu3LX/Bqx9s4Gt/2g=;
 b=Kkm23akj5DQsIpqrgNmeCOylWBWPDj9aUCq21N0O39vYzl4a+odhG32OnBKNjMMr/G
 zTYpYxITagYRk7vPHWuViQJPxAs2N0FHFPeKs4lwcN1s0E50e/u5tTq6kOR8qpazZNvn
 VPDBRbB3bqCRTxQNuCQufIBJY9iEGrrRJzv9vrZqm5FAZL8V03CRicdFrNUxJYSStiAK
 6RDboFG/OoI+pHuPMTI8cCJkEkjaOpdk5R1oGHTYWeYT3wyktNa28fLuU9wv84x2XpjQ
 Vs726TGFVJKBygA97Jr9/a1MB3bz88NCOyEf3N0XlXH7D9KAU9zhKQdNFSOmwlsOd4O4
 xfnQ==
X-Gm-Message-State: APjAAAXe/d+oivDKtdyDXE2W8vx1ZtRKyEIsssM35reu1m3cE8+8gyey
 xrEVAISY4pc/TzAdB5zWZC8r3Pxk+JjZ5u6oRodWrEUU
X-Google-Smtp-Source: APXvYqyB6HCUztMzv7U2NekC9ZcVe5ksO/AStIyrWwFmODwWjwEd/pcZeN4AUc/n2zNrmELLSCtmoZsCAZMtJgU9Rvw=
X-Received: by 2002:a37:bd45:: with SMTP id n66mr15420969qkf.272.1569227032943; 
 Mon, 23 Sep 2019 01:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190827082427.64280-1-sameid@google.com>
 <CAFr6bUky8Au-v6Y4yF+Ucg6H7Upc619WLR6tPzp3d6qy80+bsg@mail.gmail.com>
In-Reply-To: <CAFr6bUky8Au-v6Y4yF+Ucg6H7Upc619WLR6tPzp3d6qy80+bsg@mail.gmail.com>
Date: Mon, 23 Sep 2019 11:23:41 +0300
Message-ID: <CAFr6bUmYT-U0eURtM5K=G0SNT7cRcW6jxUArUFqqEzxX5gbQFw@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] Add Qemu to SeaBIOS LCHS interface
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::741
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, seabios@seabios.org,
 Kevin OConnor <kevin@koconnor.net>, liran.alon@oracle.com, kraxel@redhat.com,
 Karl Heubaum <karl.heubaum@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Sam Eiderman <sameid@google.com>
From: Sam Eiderman via <qemu-devel@nongnu.org>

Gentle ping

On Wed, Sep 11, 2019 at 5:36 PM Sam Eiderman <sameid@google.com> wrote:
>
> Gentle ping
>
> On Tue, Aug 27, 2019, 11:24 Sam Eiderman <sameid@google.com> wrote:
>>
>> v1:
>>
>> Non-standard logical geometries break under QEMU.
>>
>> A virtual disk which contains an operating system which depends on
>> logical geometries (consistent values being reported from BIOS INT13
>> AH=08) will most likely break under QEMU/SeaBIOS if it has non-standard
>> logical geometries - for example 56 SPT (sectors per track).
>> No matter what QEMU will guess - SeaBIOS, for large enough disks - will
>> use LBA translation, which will report 63 SPT instead.
>>
>> In addition we can not enforce SeaBIOS to rely on phyiscal geometries at
>> all. A virtio-blk-pci virtual disk with 255 phyiscal heads can not
>> report more than 16 physical heads when moved to an IDE controller, the
>> ATA spec allows a maximum of 16 heads - this is an artifact of
>> virtualization.
>>
>> By supplying the logical geometies directly we are able to support such
>> "exotic" disks.
>>
>> We will use fw_cfg to do just that.
>>
>> v2:
>>
>> Fix missing parenthesis check in
>>     "hd-geo-test: Add tests for lchs override"
>>
>> v3:
>>
>> * Rename fw_cfg key to "bios-geometry".
>> * Remove "extendible" interface.
>> * Add cpu_to_le32 fix as Laszlo suggested or big endian hosts
>> * Fix last qtest commit - automatic docker tester for some reason does not have qemu-img set
>>
>> v4:
>>
>> * Change fw_cfg interface from mixed textual/binary to textual only
>>
>> v5:
>>
>> * Fix line > 80 chars in tests/hd-geo-test.c
>>
>> v6:
>>
>> * Small fixes for issues pointed by Max
>> * (&conf->conf)->lcyls to conf->conf.lcyls and so on
>> * Remove scsi_unrealize from everything other than scsi-hd
>> * Add proper include to sysemu.h
>> * scsi_device_unrealize() after scsi_device_purge_requests()
>>
>> Sam Eiderman (8):
>>   block: Refactor macros - fix tabbing
>>   block: Support providing LCHS from user
>>   bootdevice: Add interface to gather LCHS
>>   scsi: Propagate unrealize() callback to scsi-hd
>>   bootdevice: Gather LCHS from all relevant devices
>>   bootdevice: Refactor get_boot_devices_list
>>   bootdevice: FW_CFG interface for LCHS values
>>   hd-geo-test: Add tests for lchs override
>>
>>  bootdevice.c             | 148 ++++++++--
>>  hw/block/virtio-blk.c    |   6 +
>>  hw/ide/qdev.c            |   7 +-
>>  hw/nvram/fw_cfg.c        |  14 +-
>>  hw/scsi/scsi-bus.c       |  16 ++
>>  hw/scsi/scsi-disk.c      |  12 +
>>  include/hw/block/block.h |  22 +-
>>  include/hw/scsi/scsi.h   |   1 +
>>  include/sysemu/sysemu.h  |   4 +
>>  tests/Makefile.include   |   2 +-
>>  tests/hd-geo-test.c      | 582 +++++++++++++++++++++++++++++++++++++++
>>  11 files changed, 773 insertions(+), 41 deletions(-)
>>
>> --
>> 2.23.0.187.g17f5b7556c-goog
>>

