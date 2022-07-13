Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A4E573D0A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 21:14:39 +0200 (CEST)
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBhok-0005Gs-17
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 15:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mauricio@mailbox.org>)
 id 1oBhm2-000374-LB; Wed, 13 Jul 2022 15:11:51 -0400
Received: from mout-p-103.mailbox.org ([80.241.56.161]:44166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <mauricio@mailbox.org>)
 id 1oBhm0-0001SN-6a; Wed, 13 Jul 2022 15:11:49 -0400
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4LjnKq3xXLz9sR8;
 Wed, 13 Jul 2022 21:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1657739503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GJjD+jnwcS6bMAtaYLBBBwTa/R1iCjTHzKDCJ4z+Skg=;
 b=HgH0KVLxCspvwxrvJ3P/GMttBub3vi+c2bjOkFxPWN3wFrEZwvpLY819UxQTdaJKzW2eNp
 AY5z0vOl3+M4jFEoAyzFcbOC2ATvJAOICcFqPLH+QzoSZKJb5M5MC3U0arUe5+MW3GhvPu
 6282/jdRlacxKNLZ934Pq5hFGzGPIaD5lvDNfjI05D20Pn+1qtRN6dy4bskl1PWR2diKCU
 FAXvn01ZNNEY3HY/+HhJpwX9uF+CMvU69DL6fUNMSRxVxzGzlZ+EBd9mej+RW1F+jAw0Vt
 c+gTqI1Vp2LjjWVvDksWM5R1YELCAQ1GE1q/UgrhfKb0TQ97PcnNx/vDKIVQZA==
Message-ID: <599d4629-5d33-512a-0630-b75cd96d1d81@mailbox.org>
Date: Wed, 13 Jul 2022 21:11:41 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] hw/nvme: Add options to override hardcoded values
Content-Language: en-US
To: Keith Busch <kbusch@kernel.org>
Cc: qemu-devel@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org
References: <20220611223509.32280-1-mauricio@mailbox.org>
 <Ys76yHpwdm4eyTbs@kbusch-mbp.dhcp.thefacebook.com>
 <6d623fbd-65ee-b74f-15f8-9e35ffb3fd0d@mailbox.org>
 <Ys8Tel0PFYODk8Rj@kbusch-mbp.dhcp.thefacebook.com>
From: Mauricio Sandt <mauricio@mailbox.org>
In-Reply-To: <Ys8Tel0PFYODk8Rj@kbusch-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 9eb9343f3cc8d4b2438
X-MBO-RS-META: mg3mjbtbeaixd8jf5yizopayyh8kdx17
X-Rspamd-Queue-Id: 4LjnKq3xXLz9sR8
Received-SPF: pass client-ip=80.241.56.161; envelope-from=mauricio@mailbox.org;
 helo=mout-p-103.mailbox.org
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

On 13/07/2022 20:48, Keith Busch wrote:
> I guess I'm missing the bigger picture here. You are supposed to be able to
> retrieve these fields with ioctl's, so not sure what this has to do with
> malware. Why does the firmware revision matter to this program?
Oh I'm sorry, I forgot to explain properly. Malware usually checks if it is
being run in a sandbox environment like a VM, and if it detects such a
sandbox, it doesn't run or doesn't unleash its full potential. This makes my
life as a researcher much harder.

Hiding the VM by overriding the model, firmware, and nqn strings to either
random values or names of existing hardware in the hypervisor is a much
cleaner solution than intercepting the IOCTLs in the VM and changing the
result with a kernel driver.


> Older qemu nvme wasn't reliably generating unique identifiers, so linux quirks
> them to ignore. They are reliable now, so the quirk can be changed to firmware
> specific when the version number updates with the next release.
If I understand you correctly, that means that changing the model and
firmware version to something that doesn't identify the device as a
qemu device would work just fine provided that you're running a recent
qemu version?

