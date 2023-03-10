Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84F36B3FF4
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 14:08:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pacTt-0005qt-7r; Fri, 10 Mar 2023 08:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pacTq-0005qN-Hk
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 08:08:18 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pacTo-00023g-ET
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 08:08:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gW9Qn1AsBfSakypTHQQYO5XQPi9e7jh4adxkwqzFL4U=; b=D7CslRot5SD23e9+bN0846nh90
 DEFhFjRhTqfZnrpqKdCp7UUk56xp8MMIOQCubtJ2J9V2j/iFssa8VxINAWOhGLRjPvV4P6p9p2zXj
 ww4kBN4vlZmzOhPzQy8t3LDxbI53Zs+km+oi7MI1e8FwJxL29l3mQ5jSQx9JOKjm9HabxndlgWOqn
 6rBztTSji7DgwLBaF7CoubeZU1zNwxulxqDbhr8xj8B4+fB59VzRCG7wqHkCF6xMuka7CeqwuMn2d
 O/rvVCyuqcL24c/7lQM4gElAzyOIt1RYuAE/eSh9lnIIOVIdiQmlrKOG9OQ9UV1cgqG7tqZ+D26oB
 bvn8wmLKThy7opUkRA+RulXd7/QMW78VGOcXXWNMh0m7kYf0z8tDSCrG3sIqqOSRfRUNbd1fKmn/i
 AAffy/qU+MyvLpOTOJz6dRRQvE3tGD+xqQTxwsOh4FRPkQUYaugkOvQWqKGMplGXxSd5qNvDf24lj
 Ek/iZiZY46FdVe4u++Dpuj6xJqUvb3lcW4yEbaFYc9vq76WuLmByjuDQpfEIIm/EYhX+9DtaZAsNM
 9xCgUtrjDu0LDDFYNqSXbfuWiHUnHcJuBcUgqpuMkYj1sVnaCtnAgY11ToG4KqNLOopu5lIb23v9T
 FxarZx02C6O2anwNdHBTRg2z+7+q70Mb2JwQBMvAI=;
Received: from host86-130-37-175.range86-130.btcentralplus.com
 ([86.130.37.175] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pacSr-0006qc-0T; Fri, 10 Mar 2023 13:07:21 +0000
Message-ID: <9edfe0f7-be73-a76b-a352-b8dcbfcbbf0f@ilande.co.uk>
Date: Fri, 10 Mar 2023 13:07:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Alexander Bulekov <alxndr@bu.edu>
Cc: Fiona Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Fam Zheng <fam@euphon.net>
References: <20230205040737.3567731-1-alxndr@bu.edu>
 <20230205040737.3567731-2-alxndr@bu.edu>
 <9cfa0cc8-01c7-cf79-72ef-3224d1276e16@proxmox.com>
 <20230310122347.hghmijad7wajiqne@mozz.bu.edu>
 <20230310123117.d2uxze7zqtigmg44@mozz.bu.edu>
 <CAFEAcA8YLrr0Ltt-CAdTDrh2zyzzyqWgfx39fy0zJwLFqdGQGg@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA8YLrr0Ltt-CAdTDrh2zyzzyqWgfx39fy0zJwLFqdGQGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.130.37.175
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v6 1/4] memory: prevent dma-reentracy issues
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/03/2023 12:45, Peter Maydell wrote:

> On Fri, 10 Mar 2023 at 12:32, Alexander Bulekov <alxndr@bu.edu> wrote:
>> This MR seems to be "lsi-ram".
>>
>>  From hw/scsi/lsi53c895a.c:
>>
>> memory_region_init_io(&s->ram_io, OBJECT(s), &lsi_ram_ops, s,
>>          "lsi-ram", 0x2000);
>>
>> So the LSI device is reading an LSI "Script" from its own IO region.. In
>> this particular case, I think there was no reason to use
>> memory_region_init_io rather than memory_region_init_ram, but this makes
>> me worried that there are other devices that use something like this.
> 
> This particular device predates the entire MemoryRegion set of
> abstractions, so it might have seemed easier at the time.
> The endianness handling of the current code is also a bit
> confusing and might make it tricky to convert to a RAM MR.

Since the LSI controller is attached to a PCI BAR then the accesses from the host to 
the RAM should all be little endian (you can see the conversions in the driver I 
wrote for the 40p machine to allow it to boot Linux: 
https://github.com/openbios/openbios/blob/master/drivers/lsi.c).

I'm mildly curious that read_dword() which reads the SCRIPTS program internally 
returns the value via cpu_to_le32(), as at first glance I would expect that to be the 
other way around...



ATB,

Mark.

