Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E016A6C29
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 13:15:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXLM5-0007y8-Hn; Wed, 01 Mar 2023 07:14:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXLM4-0007vX-6y; Wed, 01 Mar 2023 07:14:44 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXLM1-0005QL-WE; Wed, 01 Mar 2023 07:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T5E7UcNVTPclzTPVV/O1+iT1ZUKIUuwbDDWPyXiVapc=; b=IYlJAfQZNhQbPpbkaFwB2MZyw0
 ccU8PGhDC7RFzKxrw0emgpJie5Bce4DsCBfuWCAbAs9Lxyt8F46lq55LANWkpXcrFurtUxrXzAlRD
 ky79RCPRonoSpXvA9U5Pzz39J1YdiJ65cB56CO8IHzkPfYwrPTFG5h790lZaCGoEtPQB5uUIyNhpp
 fUIbirPQsYu+OohWYNA1f+LMSNosyM6l1SK3cOkZkDN5T2vfIry9nyp4LXnYUYiMpIE1Gb2uUkIy0
 uf7y7jyiyltioFcK1mvlU3EiCXN/eTr+1yFpL5IHUSqsh83iQ4okw+BKWtelf5uCgx8x2R6w0wYLJ
 2jNeE5fxMfbNmTBP4aoe/AOW4h1wBysQEg+z/Ce2ViWbx6HhEIRRi9DQJXeFJJRxnwPgVCBpd3LaR
 Z7fL8JA+D0ci0ulJQT98YKBrTwssqNfC/GKUtadnFJOZzKUn53Cxk/IBB82AodV+CnMPfr6Yo2Dg+
 rX+IssJgASPUTB+e1NNGajoXUu62R8X3Z4GycfSPUOKL+bmvbsx1tdQOYyvuvBThed691u5JvD35h
 LKnrIVfRF1HyEbk7xecmgXDFpI1rs1RfXsdEBQJ/j92ph9Z6e7McB65no9jHwn3vlLfw0FDnLTgCg
 8ePQxGl6qMU1UC13IcoimaaRrAAKsiDeAOiIN06FQ=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXLLO-0000Zw-Io; Wed, 01 Mar 2023 12:14:02 +0000
Message-ID: <c312168c-ceec-f725-7eeb-be19e03a7273@ilande.co.uk>
Date: Wed, 1 Mar 2023 12:14:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>
References: <20230208000743.79415-1-philmd@linaro.org>
 <20230208000743.79415-6-philmd@linaro.org>
 <CAG4p6K4qnDXjM+7=B1iRjUNX1astmg0Pofco+aOOPWkJG2ajFQ@mail.gmail.com>
 <965A25A6-D963-4F0A-82AD-7EBD9B487F96@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <965A25A6-D963-4F0A-82AD-7EBD9B487F96@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 5/7] hw/ide/piix: Use generic ide_init_ioport()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 10/02/2023 16:34, Bernhard Beschow wrote:

> Fishing out the ISA bus is still a hack IMO, for two reasons: First, IIUC, QOM'ified devices shall only care about its children while looking up one's parent bus violates this rule. Second, using the global machine pointer to scan for the ISA bus just trades one global for another. That's why I'm only doing this for user-created instances. If we deprecated user-created piix IDE devices we could eventually get rid of this hack.

As far as I can tell the solution to QOMified devices finding their parent bus is 
easy: turn DeviceState::parent_bus into a QOM link property called "parent-bus" or 
similar which accepts TYPE_BUS, and then any object of TYPE_DEVICE can locate its 
parent bus using object_property_get_link() with a standardised property name.

I think it may be impossible to completely remove parent bus references, since buses 
like PCI currently make use of upwards hierarchy navigation for things like IRQ 
mapping and PCI-PCI bridge traversal.


ATB,

Mark.

