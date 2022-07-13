Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3EB573C57
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 20:08:13 +0200 (CEST)
Received: from localhost ([::1]:51546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBgmR-0005bN-LW
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 14:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mauricio@mailbox.org>)
 id 1oBgkt-00045w-0h; Wed, 13 Jul 2022 14:06:35 -0400
Received: from mout-p-202.mailbox.org ([80.241.56.172]:39152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <mauricio@mailbox.org>)
 id 1oBgkq-0005ef-W8; Wed, 13 Jul 2022 14:06:34 -0400
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4LjltW2jQ3z9sZG;
 Wed, 13 Jul 2022 20:06:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1657735587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i3JvM08/p53aTVUIQuKMssiXYn1Eh7CFcXyc1wSl11Q=;
 b=qZAzbhNme9/c7yoR0XX5R5ZesDVN1Zhc9NR+CjT0lq/dVdwx7YgKguJXgsiZV4F6MgxmOP
 SeNxjXrMh89k/dXPhrs9c8kBCnQp3gZfvHVpFpd6EBLJwKKxvgRzkMuI04EudLAQgjAPf0
 WbMkCiMHP1RX+EEwF2rFtFj6AxhvPVAG9vFOxcBDYleYplz6LNovanmL6IKttgqojlr390
 KKVaDsJgtIqKIjwSwMh68uwLTkHMYa1rW4tRZgtMQktKZPHdWrG6zLP4vKO7xpfGjA50LQ
 yqxKGyiNFhbqwIjF95bDsqQyk91bWOsNMDfPlOhq/7oKMOsHa/AYi8axZUUMmA==
Message-ID: <6d623fbd-65ee-b74f-15f8-9e35ffb3fd0d@mailbox.org>
Date: Wed, 13 Jul 2022 20:06:26 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] hw/nvme: Add options to override hardcoded values
Content-Language: en-US
To: Keith Busch <kbusch@kernel.org>
Cc: qemu-devel@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org
References: <20220611223509.32280-1-mauricio@mailbox.org>
 <Ys76yHpwdm4eyTbs@kbusch-mbp.dhcp.thefacebook.com>
From: Mauricio Sandt <mauricio@mailbox.org>
In-Reply-To: <Ys76yHpwdm4eyTbs@kbusch-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 64e52221a5ae880332a
X-MBO-RS-META: o4kdfo6w6yj5qg7zfh3yrgcm37fid1sc
Received-SPF: pass client-ip=80.241.56.172; envelope-from=mauricio@mailbox.org;
 helo=mout-p-202.mailbox.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

I want to argue the other way around. Why shouldn't those values
be tunable by the user? You are right; if misconfigured, it could 
potentially
break stuff on the driver side, but unless you manually set values for model
and firmware, the default is used (just like it is now), so this patch
wouldn't break any existing setups.
In my opinion, having more freedom in the values being used for model names
and similar is much better than hardcoding values. The previously hardcoded
values should remain the default if no custom value is provided.
My specific use case that required this patch is a piece of malware that 
used
several IOCTLs to read model, firmware, and nqn from the NVMe attached to
the VM. Modifying that info at the hypervisor level was a much better 
approach
than loading an (unsigned) driver into windows to intercept said IOCTLs.
Having this patch in the official qemu version would help me a lot in my 
test
lab, and I'm pretty sure it would also help other people.

I guess there could be a warning about potential problems with drivers 
in the
description for model, firmware, and nqn, but I haven't experienced any 
issues
when changing the values (for all of them). If you encountered any problems,
how did they manifest?

On 13/07/2022 19:03, Keith Busch wrote:
> On Sun, Jun 12, 2022 at 12:35:09AM +0200, Mauricio Sandt wrote:
>> This small patch is the result of some recent malware research I did
>> in a QEMU VM. The malware used multiple ways of querying info from
>> the VM disk and I needed a clean way to change those values from the
>> hypervisor.
>>
>> I believe this functionality could be useful to more people from multiple
>> fields, sometimes you just want to change some default values and having
>> them hardcoded in the sourcecode makes that much harder.
>>
>> This patch adds three config parameters to the nvme device, all of them
>> are optional to not break anything. If any of them are not specified,
>> the previous (before this patch) default is used.
>>
>> -model - This takes a string and sets it as the devices model name.
>> If you don't specify this parameter, the default is "QEMU NVMe Ctrl".
>>
>> -firmware - The firmware version string, max 8 ascii characters.
>> The default is whatever `QEMU_VERSION` evaluates to.
>>
>> -nqn_override - Allows to set a custom nqn on the nvme device.
>> Only used if there is no subsystem. This string should be in the same
>> format as the default "nqn.2019-08.org.qemu:...", but there is no
>> validation for that. Its up to the user to provide a valid string.
> I guess the nqn can be user tunable just like it is when used with subsystems,
> but what's the point of messing with model and firmware? That could mess with
> host drivers' ability to detect what quirks it needs to apply to specific
> instances of this virtual controller.


