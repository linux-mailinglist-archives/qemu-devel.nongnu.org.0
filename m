Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3225678A7F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 23:13:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK53b-0000oe-Lv; Mon, 23 Jan 2023 17:12:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pK53Z-0000oD-Rc; Mon, 23 Jan 2023 17:12:49 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pK53X-0000aE-38; Mon, 23 Jan 2023 17:12:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fHokIFpdWzPY6a94EG1oyge/QdOgLErowzVq8gfuXIA=; b=B6IE0gsrq0d61YlXgQ5kNNVgvk
 v3/SE/nv9klSn2hwvj6m3Vv/XftIF02lzK2cRz6hJe4Mamtc6jTD5PATKZeda7bqolDChcxsyPOSV
 y/QLSFY0sALL0j7xmlerLeROTRYlBP2/j3cPuxP54aumkhg54ina5tojYV5PBZTOzfazoSNssM/PR
 tFwUGBbtSBDXWvxizqTjwuZZZgrq3Lts+BMz7w36GBgiayNeF1jnBo8b7vF2O5pfBqDI3y2Q2Qu0P
 JMmcFBZBC8yHpj/6qGeKUW3eEmoQU9lCDCsFGuWyu/jTL2Ied7DK314Q/FFo6u3xlkcAsrAAw4ATz
 nb1F3EM7yk0YANtaRP4pykwPMat/Gqe1JYvoI7CvwztHcXxY+/T9LXYbwELBGs7xsQ6Xu/dIXd1Gm
 H2+vjHGQyLATRRC5nnDHSUc6OAOhZbPtJ9XHkwFMJjysSUoqWywi7PKY1+cd+cRbhC6hGU7LrTQuC
 m0bvBEdGhvMn5FpxqwnrenhmqDhSPZDMqONAQTz0pjzzEN+GC7yi7NjM2QGy3EqtL5xwsXWT7g+u/
 0h/3GUBBsWND1VHIxO0VOM9S5vOuqnBiD3o6FEG5CEL64ChMJUU+OABVs0uQCOEQLvoOA6jiN3iUQ
 +eMjbJYODtttriwyp0kBJMtissoZkJDVO3CnifolQ=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pK535-0001N8-00; Mon, 23 Jan 2023 22:12:19 +0000
Message-ID: <3da914a8-ca58-e578-ae8d-0a82b28a6cbf@ilande.co.uk>
Date: Mon, 23 Jan 2023 22:12:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <e8d6aa41eeb0461d285fa4c12e0fff05d366e8fa.1672868854.git.balaton@eik.bme.hu>
 <8e775600-f394-0e9c-9ee9-15dd635275e9@ilande.co.uk>
 <a7d27169-97fd-2cb2-e6d1-a050dbf76e30@eik.bme.hu>
 <78fff8b3-d1c1-74ec-94bf-8d5ae220c4e2@ilande.co.uk>
 <8ef24b01-534a-fd8f-ad99-abebff6197c8@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <8ef24b01-534a-fd8f-ad99-abebff6197c8@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v7 3/7] mac_{old,new}world: Pass MacOS VGA NDRV in card
 ROM instead of fw_cfg
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 22/01/2023 22:16, BALATON Zoltan wrote:

>> The problem you are ultimately trying to solve though is that OpenBIOS is loading 
>> the NDRV for all VGA PCI devices, so why not just fix drivers/vga.fs so that the 
>> NDRV is loaded only for the QEMU VGA device?
>>
>>> So this patch neither adds new dependency to QEMU nor repends on any change in 
>>> OpenBIOS. It just gets rid of passing files via fw_cfg.
>>
>> Unfortunately that still doesn't solve the problem of building a self-contained 
>> OpenBIOS ROM, so this patch isn't the right way forward.
> 
> It does take a step to make it possible to eventually add a self contained ROM and 
> remove the vga.fs from OpenBIOS but it's not doing that fully. It just simplifies 
> QEMU and OpenBIOS vga.fs for now and making the ROM also contain the FCode will be a 
> further step but we can't get there if you don't allow to make smaller steps or don't 
> merge my patches for OpenBIOS which would allow it to run FCode ROMs. If you're 
> waiting for all this to be finished I'll give up and it will never be finished. If 
> you allow to progress in smaller steps then maybe we'll get there.

You can already add a self-contained rom using the romfile= property, so that's not 
preventing you from doing anything though? Even once OpenBIOS can read PCI option 
ROMs, the option ROM will still need to contain OpenBIOS's vga.fs as a payload, and 
it will still need to be able to inject qemu_vga.ndrv because OpenBIOS cannot have an 
external dependency upon QemuMacDrivers.


ATB,

Mark.

