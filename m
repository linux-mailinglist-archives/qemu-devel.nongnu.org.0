Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852492E332E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 00:14:09 +0100 (CET)
Received: from localhost ([::1]:38460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktfEm-0006eB-4V
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 18:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <posteuca@mutex.one>)
 id 1ktfDX-00066B-EY; Sun, 27 Dec 2020 18:12:51 -0500
Received: from mail.mutex.one ([62.77.152.124]:35832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <posteuca@mutex.one>)
 id 1ktfDV-00074Q-Px; Sun, 27 Dec 2020 18:12:51 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id 4577CBF426F7;
 Mon, 28 Dec 2020 01:12:45 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5lUszS5YsjFg; Mon, 28 Dec 2020 01:12:44 +0200 (EET)
Received: [127.0.0.1] (localhost [127.0.0.1])nknown [109.103.89.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mutex.one (Postfix) with ESMTPSA id 580F9BF426BC;
 Mon, 28 Dec 2020 01:12:44 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1609110764; bh=xS/FIkdJMUsq++QyeLG4EutDW3emZ/ZZcdspCegkC5M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=B2gMQXZpuHAWmgeYVTeBlV3KvhmHi3E09VoFGO0zMnXdyeGXujvrIKwDTrDroiGOZ
 H8iztdTKIiBBWZUOMjvpkXI/fMNsGxUjAvrxiOVJJqxeI+ChLbYSTzvdIdY+o2T58X
 UuOqg8NADFsStj2WtTEi/wUD/q1LCZiVxBYxgN5I=
From: Marian Posteuca <posteuca@mutex.one>
To: Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2] acpi: Permit OEM ID and OEM table ID fields to be
 changed
In-Reply-To: <93c58d9d-63c6-b2d8-2b12-d7ed4aa1b171@redhat.com>
References: <20201222113353.31224-1-posteuca@mutex.one>
 <d04375f8-f6bc-91d6-cd6e-217a689002e3@msgid.tls.msk.ru>
 <87eejh4zpq.fsf@mutex.one>
 <93c58d9d-63c6-b2d8-2b12-d7ed4aa1b171@redhat.com>
Date: Mon, 28 Dec 2020 01:12:40 +0200
Message-ID: <87tus64zdj.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=62.77.152.124; envelope-from=posteuca@mutex.one;
 helo=mail.mutex.one
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 22/12/20 16:39, Marian Posteuca wrote:
>>>> Qemu's ACPI table generation sets the fields OEM ID and OEM table ID
>>>> to "BOCHS " and "BXPCxxxx" where "xxxx" is replaced by the ACPI
>>>> table name.
>>>>
>>>> Some games like Red Dead Redemption 2 seem to check the ACPI OEM ID
>>>> and OEM table ID for the strings "BOCHS" and "BXPC" and if they are
>>>> found, the game crashes(this may be an intentional detection
>>>> mechanism to prevent playing the game in a virtualized environment).
>>> This isn't a technical question/comment about the patch itself, but
>>> about something different.  Do we really want to play this whack-a-mole
>>> game? If we change ACPI table IDs, those who want to disallow running
>>> their software inside qemu/kvm will find some other way to check for
>>> this environment. We will change that, - just to be found again. And
>>> so on.. is it productive? I don't think so.
>>
>> My personal opinion is that as long as it's not too difficult to mask
>> that the guest is running in a virtualized environment we should try to
>> do these changes. But I guess this can only be judged on per change basis.
>
> I don't have any particular opinion against the "arms 
> race"/"whack-a-mole" situation.  We played the game (and sort of won, 
> they got tired of changing the drivers) against NVIDIA already.
>
> For 6.0 I'm already planning to revamp a bunch of machine properties, 
> for example making -acpitable file=xxx a synonym for "-machine 
> acpi.tables.N.file=xxx".  Perhaps we could plan for that and make the 
> option "-machine acpi.oem_id".
This looks like a great idea.
Noob question here, should I change my patch in any way for this to happen?
>
> Paolo

