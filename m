Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90531677123
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 18:41:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJeJs-0004k7-FN; Sun, 22 Jan 2023 12:39:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pJeJq-0004jd-FK; Sun, 22 Jan 2023 12:39:50 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pJeJo-0004QU-69; Sun, 22 Jan 2023 12:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j8WreAP2aoLEc8bKtoiKsaawaMzHLTIHrdVHPGqn8u0=; b=JlUhrjw1Rknp7C4DefbLKwGqT7
 qelpckcNGvbfkOYyigIVz5ffXlu+Ro8XXgTT5M1eRXEju21elSVJx+i2idfMglvkYCP47qSq+nq2t
 8GNTv8MQ7XtaEF9MMcKbYH/koti5pmmtrMFXlW5KnhBKU2PAI4EcD693JFVAlMZipfYyKSsYPLq/J
 k3iI4muEo9UXksG+R7yDII3p3iFhAuNHgmRuhQ2sIawKxtKEfvPR9D6nNakdOkaqzibmfIU6Rxev+
 mHoSB0WuXVRDLkYYNxEtdh/Ft1XlI27KnkKM4njqpPA4OjmVBepONgyUo6AqbH9OQ2WQrUOq0oqzx
 JPcr+fHkqupKi9wApe5eMaICOW50t9q/bw3xt6T/qAGqQZLVfuH+FEsPFTOcrAPlH61M7DFjPcBk1
 pWEqI+ASegHv8IIiZWTHQYcbciGZSw69gTVe5m2s9RbqHcXrXi2Syo0Sd6rrvjtkswx7xZcaHGGqa
 PIBI3c2C6FNfRr0In6hkBjPlW4ztn9LCXsZik0FQV5aDyYAOnjYLqYt3NJ6EWsi8RrzIkfTrDOxp5
 w9rEJoJOMZ2LNdB/70mCERuW2q6Lwj54nFwjMmmaVxTe02rYKHLoSx0LG4zq7EhAGFn+YJK6jvFjj
 byQmucwiOHITmQMA+T6vjONYATSsqrNm39LdtU8w8=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pJeJH-00063W-A5; Sun, 22 Jan 2023 17:39:19 +0000
Message-ID: <23f2ba9b-97b3-25f2-2642-667238f79d11@ilande.co.uk>
Date: Sun, 22 Jan 2023 17:39:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <b8aa89c354027fc71cdb93b697b139e93ac05e25.1672868854.git.balaton@eik.bme.hu>
 <ece23a2e-33a9-d2e2-14fd-097878acfa1f@ilande.co.uk>
 <61305eda-439b-800e-2265-c2c48bc21be9@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <61305eda-439b-800e-2265-c2c48bc21be9@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v7 4/7] mac_newworld: Add machine types for different
 mac99 configs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 11/01/2023 00:36, BALATON Zoltan wrote:

> On Tue, 10 Jan 2023, Mark Cave-Ayland wrote:
>> On 04/01/2023 21:59, BALATON Zoltan wrote:
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
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>
>> Some thoughts on this: the first is that not everyone agrees that for qemu-system-X 
>> that X represents the target. There were previous discussion where some KVM people 
>> assumed X represented the host, i.e. ppc64 was the binary that ran all PPC guests 
>> but with hardware acceleration for ppc64 guests on ppc64 hosts. This was a while 
>> ago, so it may be worth starting a thread on qemu-devel to see what the current 
>> consensus is.
> 
> I don't see how this is relevant to this series, Also likely not the case any more as 
> qemu-system-ppc and qemu-system-ppc64 share most of the code since a while with ppc64 
> including the config of ppc and adding more machines.

Well the patch defines the powermac 7.3 machine just for TARGET_PPC64, no? So you're 
making the assumption qemu-system-ppc64 represents a 64-bit target rather than a 
64-bit host.

>> Secondly it's not clear to me why you've chosen names like "powermac_3_1" instead 
>> of "g4agp"? Does powermac_3_1 uniquely identify the G4 AGP Sawtooth model? For QEMU 
>> it is always best to emulate real machines, and whilst I understand you want to 
>> separate out the two versions of the mac99 machine, having "powermac_X_Y" seems 
>> less clear to me.
> 
> These machine model identifiers are used by Apple to uniquely identify (all of) their 
> machines since new-world Macs (even modern iPads and Macs have them) so for Mac 
> people this should be clearer than the informal names that could get a bit long and 
> confusing as there may be slight differences within a family. In any case, 
> qemu-system-ppc -M mac99 is not corresponding to any real Mac so I'd like the options 
> which do emulate real Macs to be called in a name that show which Mac is that. For 
> the PPC Macs there's some info here for example:
> 
> https://en.wikipedia.org/wiki/Power_Mac_G4
> 
> And everymac.com also has info on all Macs. There were actually more than one G4 
> PowerMac with AGP but the other one was informally called gigabit ethernet. So the 
> model ID is a shorter and better way to clearly identify which hardware is it (and 
> it's also referenced in the device-tree of these Macs).

Are you planning to work on different types of G4 Mac where this could be confusing? 
Even to me "PowerMac 3.1" doesn't really tell me what model of Mac is being emulated, 
whereas "g4agp" (much in the same way as g3beige) is much more friendlier to people 
interested in using QEMU for Mac emulation.

>> Finally can you post links to the device trees that you are using for each of the 
>> new machine types so that we have a clear reference point for future changes to the 
>> QEMU Mac machines? Even better include the links in the comments for each machine 
>> so that the information is easily visible for developers.
> 
> I still have those I've posted over the past 8 years when I made changes to OpenBIOS 
> to make the device-tree closer to real machine. I've downloaded it back then, don't 
> know where to find it now but searching for e.g. "PowerMac3,1" "device-tree" should 
> get some results.

Nothing shows up for me, I'm afraid (remember that Google searches are unique to each 
user). If you want argue for changing the QEMU machines, then we should agree on the 
reference device model for future changes.


ATB,

Mark.

