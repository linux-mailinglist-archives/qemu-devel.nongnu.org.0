Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD5157B787
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 15:30:58 +0200 (CEST)
Received: from localhost ([::1]:44054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE9my-0001bR-TA
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 09:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oE9e6-00025B-IL
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 09:21:46 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oE9e3-0000Ch-Vv
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 09:21:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F+OglXyQJRva7sHVZKIOykeWFiM+G3l1CkRHV0Dlggg=; b=RgPzxbN1P3VJcVjyTJ1prKm9uY
 Y8jMhhDHaLaIZFA2TEnCjgvvrvo2j5MD6CWP/XpAxIsejlNmJWzypIQnokgwZyemvdrLMEJQ7TTmv
 O+XEmeVZHB5Y7A+QLE6APGyqMsWAOGRss5T4AY1bHYalD+l7F1thIl03OenpgNlEY0HOGJpOJECpg
 4/bBLFlT33GOpm8VrERJO0wb8ffo6GWLfhPra6T5OHThzc1sZXdGjhRgx7I8N4YP4XeKjSwVllI7x
 G7SqY7KkAYnPcKvvg0p7ufPg4J/+SgKLN8mfxvf8nG9jmRHbnEoNfKIoO6HxDsyguVTi2GBYvSGML
 4mb9ih880SuKW54/1NwGOSpluQUI3xfMEB78OWyqhO6xBIKQS8J9BmYcM0gbh7GkLOHhLv7y1Vv7S
 PsoC5Jd0GWhHF6G+5ztw22K+i2rBnDHgVsUNk7bpQehiZnLXk3txea5QxWHV7LSppeIjtnzdvzXcu
 5KPsLG5zaT387QLlUCsOfeFI6i/x3pS42WH7sfXr0ryzMVkYcDnPP3Y5Y7Us7jJEmgg8NfIl1EhFK
 qJPIZEFsWSWZhhgZ0COdNKrLGQw0J4h8sm4WpPuvUejxFVop2YVH8K7swRYBe+gGbQHk9YxzdO55t
 5ow+Fi7N0Gy4kbFmAnv2Edc2C3T7zQ+LYM5s4gMAQ=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oE9ci-000APr-EQ; Wed, 20 Jul 2022 14:20:20 +0100
Message-ID: <5bc2fcee-2c5d-c400-5992-e2b4ce828477@ilande.co.uk>
Date: Wed, 20 Jul 2022 14:21:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Roman Kagan <rvkagan@yandex-team.ru>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20220720102555.874394-1-rvkagan@yandex-team.ru>
 <Ytfcivbtj8+JnLfz@redhat.com> <YtfgQN+BQ8Egn0ha@rvkaganb>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <YtfgQN+BQ8Egn0ha@rvkaganb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3] hw/pci/pci_bridge: ensure PCIe slots have only one slot
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 20/07/2022 12:00, Roman Kagan wrote:

> On Wed, Jul 20, 2022 at 11:44:26AM +0100, Daniel P. Berrangé wrote:
>> On Wed, Jul 20, 2022 at 01:25:55PM +0300, Roman Kagan wrote:
>>> It's possible to create non-working configurations by attaching a device
>>> to a derivative of PCIe slot (pcie-root-port, ioh3420, etc) and
>>> specifying a slot number other that zero, e.g.:
>>>
>>>      -device pcie-root-port,id=s0,... \
>>>      -device virtio-blk-pci,bus=s0,addr=4,...
>>>
>>> Make QEMU reject such configurations and only allow addr=0 on the
>>> secondary bus of a PCIe slot.
>>
>> What do you mean by 'non-working' in this case.  The guest OS boots
>> OK, but I indeed don't see the device in the guest, but IIUC it was
>> said that was just because Linux doesn't scan for a non-zero slot.
> 
> Right.  I don't remember if it was Linux or firmware or both but indeed
> at least Linux guests don't see devices if attached to a PCIe slot at
> addr != 0.  (Which is kinda natural for a thing called "slot", isn't it?)
> 
>> That wouldn't be a broken config from QEMU's POV though, merely a
>> guest OS limitation ?
> 
> Strictly speaking it wouldn't, indeed.  But we've had created such a
> configuration (due to a bug in our management layer) and spent
> non-negligible time trying to figure out why the attached device didn't
> appear in the guest.  So I thought it made sense to reject a
> configuration which is known to confuse guests.  Doesn't it?

This does seem a bit odd. What does the output of "info qtree" look like for your 
non-working configuration?


ATB,

Mark.

