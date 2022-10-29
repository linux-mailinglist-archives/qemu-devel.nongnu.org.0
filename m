Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DE961211E
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 09:49:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oogaC-0005eE-2u; Sat, 29 Oct 2022 03:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ooga2-0005Wo-D4; Sat, 29 Oct 2022 03:48:34 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oogZw-0005LG-Kb; Sat, 29 Oct 2022 03:48:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Td39fwlfSMhhJbR4tPb9NNrNMQ9IWYGcLK26ULksXE=; b=y4mtyogUd/rjGs2tVCsylndQOe
 6WR03kYkxjXJbUuzntaWoOylc1uFf3ZU+3pHjfdnIOOsWdggc4tW0MGH5zAqYiO3HOLYOSrknWdkU
 gb66XUYKvAZHk3kTH8xDMOx/dPeGOHphz/ljeT6bMTZyFe2KwRL7zrDLJMymV/ggAXkPxSxvFr6Pk
 q3gP2Ja2k3FwK0CE8VtjRWqqA2HXdY99iGeXrhCpPGqAgJDz1KxBgniuEUzwlYHpDGZ2RrFb55eoQ
 oXfLoQo4WEvogKqY7I+0ew6yyRAwCcFqVLfyo2reI8oWNX5K+UZtzFjMfM8FTCqDVyzObBUn4LAnt
 bCXz4XmtOqRbnbxdJr2BeisWnpSesVm/9d/3QxFZMK8nyWhjU4AWe8TXkWTim/xYYvSBNh95zoKwQ
 S9QXPPuMShkS54Gx3qPMN/2Lt0xLiNNznG+Fv7bpfWX2AkDJ5R+Y4bjA70wkmueZMEfMoKamNetIp
 cB3cGEwXi50WskQ1Sxr3oCSIevWJ1tbtAHVD+OMcw6NUa9G63+IpEWXeEGkXjTf6Ti2IxoyKHZQTR
 heznAmtyiVmVQeKU3fZ8A7DD4Hi6XY9XPgAZ2MjReQ5xjqc005qjVnm2RnELkYc+mWcWSBrmIjj4g
 sv7uVgekCXsO4QEkvQsrsrtaZfRdNrG2O/7QQdaP4=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oogZm-0000a9-Ul; Sat, 29 Oct 2022 08:48:23 +0100
Message-ID: <d9cc2bd3-729a-82c8-eaf1-645e9af0d563@ilande.co.uk>
Date: Sat, 29 Oct 2022 08:48:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <cover.1666715145.git.balaton@eik.bme.hu>
 <7114fc8a10d7359f354a7dbee364a520dcf362df.1666715145.git.balaton@eik.bme.hu>
 <948ef9f2-452f-9c0a-11e1-4dcee3bac3ff@ilande.co.uk>
 <3f919172-4259-31a4-28ef-f87812238a21@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <3f919172-4259-31a4-28ef-f87812238a21@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 16/19] mac_newworld: Add machine types for different
 mac99 configs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 28/10/2022 13:18, BALATON Zoltan wrote:

> On Fri, 28 Oct 2022, Mark Cave-Ayland wrote:
>> On 25/10/2022 17:44, BALATON Zoltan wrote:
>>> The mac99 machine emulates different machines depending on machine
>>> properties or even if it is run as qemu-system-ppc64 or
>>> qemu-system-ppc. This is very confusing for users and many hours were
>>> lost trying to explain it or finding out why commands users came up
>>> with are not working as expected. (E.g. Windows users might think
>>> qemu-system-ppc64 is just the 64 bit version of qemu-system-ppc and
>>> then fail to boot a 32 bit OS with -M mac99 trying to follow an
>>> example that had qemu-system-ppc.) To avoid such confusion, add
>>> explicit machine types for the different configs which will work the
>>> same with both qemu-system-ppc and qemu-system-ppc64 and also make the
>>> command line clearer for new users.
>>
>> What was the outcome of the discussion re: having separate machines for 32-bit and 
>> 64-bit PPC targets? My understanding is the issue here was deciding what to do, 
>> rather than actually making the code changes.
> 
> Who do you think will or should decide about this? There are about 3 people who care 
> about Mac emulation on this list: you, Howard and me. You already have my and 
> Howard's vote to introduce these machines types. Who else should vote or decide on 
> this? Please apply this patch now and if it causes problem it can still be dropped 
> duting the freeze but if you don't apply it now it can't get into before next spring.

This is not restricted to qemu-system-ppc though: there was a discussion (which was 
still ongoing) as to how all of QEMU should handle 32-bit and 64-bit machines i.e. 
should qemu-system-ppc64 only contain 64-bit machines and qemu-system-ppc only 
contain 32-bit machines? If we wish to make a change here, we should wait for the 
outcome of this to ensure consistency here.

>> Also what was your motivation for choosing the machine names? I see you've used 
>> powerbook for via=pmu-adb, but I think quite a few people use pmu-adb for older OS 
>> X server hardware. At the very least some pointers to reference device trees and 
>> some rationale behind the decision is needed for review.
> 
> See my reply to Howard's message with some more info and links. My immediate 
> motivation was that we've lost about two days when somobody contacted me about VGA 
> pass through sending logs about all kinds of failures he got. After many logs I've 
> noticed that he was using qemu-system-ppc64 -M mac99,via=pmu thinking that on 64bit 
> host that's the executable he should use. Unfortunately the commands were not shared 
> just the logs so this took a while to notice. Also if you look at the forum Howard 
> runs you can see this problem is coming up frequently and I think the've also lost 
> countless hours due to this. It's about time to put an end on it and stop wasting 
> othet's time. As for The machines, the powermac ones are straight forward as those 
> are closest to what we emulate for G4 and G5 Mac. I've chosen the powerbook becuase 
> that's the only machine I know that had PMU and ADB but If someone knows a better 
> machine we can change this (even as bug fix during the freeze). Here's some info on 
> this powerbook: https://ppc.0penbsd.narkive.com/s49Kcx1u/x-on-powerbook-g4

In all my time working on QEMU this has happened to me once: yes, I agree it can be 
annoying but given how rare it happens I don't see a need to make a rushed decision now.

In terms of choosing the machines for QEMU we will need a full copy of the DT from 
real hardware for comparison with OpenBIOS, and ideally a Linux dmesg.


ATB,

Mark.

