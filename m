Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D1A609ECA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 12:14:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omuMw-00012L-Tb; Mon, 24 Oct 2022 06:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@mailbox.org>)
 id 1omuMq-0000zj-4S; Mon, 24 Oct 2022 06:07:36 -0400
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@mailbox.org>)
 id 1omuMi-0006z9-PN; Mon, 24 Oct 2022 06:07:35 -0400
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4MwrNC3s4hz9sQL;
 Mon, 24 Oct 2022 12:07:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1666606043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ueZWkgiN6q84vZxtlOPUuigInb+cBK5bvPh0BYZYRfE=;
 b=N7RqVPEAEx8+UexlImptZQeXhVSW7p1Zj/mEU6rrCEmJT4JOzPRQk/BjFwWSO1YLh1CEe4
 pFXeKz+ofap+UywhyDVU/v4gVchULQU1E6xrG0WeJm9u/Zm2Yh1Kdq6FYLJy78FRha/DA4
 KHsFgtV0eNIiP1waBYa1gCILhrzuQXN6A1r5jhs5lmDzLelj4i41XjvF6Xuj/m2Je+5lhk
 JfHBzOGiRKRH/ZLLEEbdhG+/08oLJ1vYI3mnQpyQmAwBVlwtm7x4t2cZbhifFc5B3HX7sU
 2aTmL56fuTNnMi+N2mvbnBQSMwooqxm9n3jvLsOgzpvEg/zGIcWWn8Wk+21qbg==
X-Hashcash: 1:24:221024:mst@redhat.com::qdb8dbEg3sS+hePa:001VMOC
X-Hashcash: 1:24:221024:qemu-devel@nongnu.org::wsqelqbhY+GipP7P:0000000000000000000000000000000000000001DXWe
X-Hashcash: 1:24:221024:qemu-block@nongnu.org::ZEwLgvdctTnZREFs:000000000000000000000000000000000000000103eD
X-Hashcash: 1:24:221024:lvivier@redhat.com::yhHlXz9F2Bqp4oT/:0000000000000000000000000000000000000000003kI4u
X-Hashcash: 1:24:221024:thuth@redhat.com::4kciBpShvJH9LaC/:3kUwe
X-Hashcash: 1:24:221024:pbonzini@redhat.com::QsA+lSQFhEvMJDb1:0000000000000000000000000000000000000000015H68
X-Hashcash: 1:24:221024:jsnow@redhat.com::gA13aPrDhz3ekYUp:2qxI+
References: <20220922060325-mutt-send-email-mst@kernel.org>
 <20220925093759.1598617-1-lkujaw@mailbox.org>
 <20220925093759.1598617-2-lkujaw@mailbox.org>
 <20221007095122-mutt-send-email-mst@kernel.org>
From: Lev Kujawski <lkujaw@mailbox.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Laurent Vivier
 <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 1/2] qpci_device_enable: Allow for command bits
 hardwired to 0
Message-ID: <87eduxfskb.fsf@bromine.uucp>
In-reply-to: <20221007095122-mutt-send-email-mst@kernel.org>
X-PGP-Key: https://meta.sr.ht/~lkujaw.pgp
X-PGP-Fingerprint: AC2ADB1BEE410BB0B791E393441828874091B824
Date: Mon, 24 Oct 2022 10:07:19 +0000
MIME-Version: 1.0
Content-Type: text/plain
X-MBO-RS-ID: e02940b1acef7ecfb13
X-MBO-RS-META: esuq8z5utw44hw8dzbrjmuameoom7143
Received-SPF: pass client-ip=2001:67c:2050:0:465::102;
 envelope-from=lkujaw@mailbox.org; helo=mout-p-102.mailbox.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Michael S. Tsirkin writes:

> On Sun, Sep 25, 2022 at 09:37:58AM +0000, Lev Kujawski wrote:
>> Devices like the PIIX3/4 IDE controller do not support certain modes
>> of operation, such as memory space accesses, and indicate this lack of
>> support by hardwiring the applicable bits to zero.  Extend the QEMU
>> PCI device testing framework to accommodate such devices.
>> 
>> * tests/qtest/libqos/pci.h: Add the command_disabled word to indicate
>>   bits hardwired to 0.
>> * tests/qtest/libqos/pci.c: Verify that hardwired bits are actually
>>   hardwired.
>> 
>> Signed-off-by: Lev Kujawski <lkujaw@mailbox.org>
>> ---
>>  tests/qtest/libqos/pci.c | 13 +++++++------
>>  tests/qtest/libqos/pci.h |  1 +
>>  2 files changed, 8 insertions(+), 6 deletions(-)
>> 
>> diff --git a/tests/qtest/libqos/pci.c b/tests/qtest/libqos/pci.c
>> index b23d72346b..4f3d28d8d9 100644
>> --- a/tests/qtest/libqos/pci.c
>> +++ b/tests/qtest/libqos/pci.c
>> @@ -220,18 +220,19 @@ int qpci_secondary_buses_init(QPCIBus *bus)
>>  
>>  void qpci_device_enable(QPCIDevice *dev)
>>  {
>> -    uint16_t cmd;
>> +    const uint16_t enable_bits =
>> +        PCI_COMMAND_IO | PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER;
>> +    uint16_t cmd, new_cmd;
>>  
>>      /* FIXME -- does this need to be a bus callout? */
>>      cmd = qpci_config_readw(dev, PCI_COMMAND);
>> -    cmd |= PCI_COMMAND_IO | PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER;
>> +    cmd |= enable_bits;
>>      qpci_config_writew(dev, PCI_COMMAND, cmd);
>>  
>>      /* Verify the bits are now set. */
>> -    cmd = qpci_config_readw(dev, PCI_COMMAND);
>> -    g_assert_cmphex(cmd & PCI_COMMAND_IO, ==, PCI_COMMAND_IO);
>> -    g_assert_cmphex(cmd & PCI_COMMAND_MEMORY, ==, PCI_COMMAND_MEMORY);
>> -    g_assert_cmphex(cmd & PCI_COMMAND_MASTER, ==, PCI_COMMAND_MASTER);
>> +    new_cmd = qpci_config_readw(dev, PCI_COMMAND);
>> +    new_cmd &= enable_bits;
>> +    g_assert_cmphex(new_cmd, ==, enable_bits & ~dev->command_disabled);
>>  }
>>  
>>  /**
>> diff --git a/tests/qtest/libqos/pci.h b/tests/qtest/libqos/pci.h
>> index 8389614523..eaedb98588 100644
>> --- a/tests/qtest/libqos/pci.h
>> +++ b/tests/qtest/libqos/pci.h
>> @@ -68,6 +68,7 @@ struct QPCIDevice
>>      bool msix_enabled;
>>      QPCIBar msix_table_bar, msix_pba_bar;
>>      uint64_t msix_table_off, msix_pba_off;
>> +    uint16_t command_disabled;
>
>
> Can we get this from device's wmask?
>

I have not seen any way to pass the wmask from the underlying PCI device
without violating the abstraction of the driver testing framework.

Another approach might be to omit the verification of the PCI command
bits in the assumption that some filtering mechanism like wmask is
active, but I think the advantage of this patch is that it makes the
expected (albeit abnormal) behavior explicit in the device test.

Kind regards,
Lev Kujawski

