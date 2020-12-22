Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633E02E0CDD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 16:44:50 +0100 (CET)
Received: from localhost ([::1]:52496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krjqC-0002sr-UC
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 10:44:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <posteuca@mutex.one>)
 id 1krjoZ-0001po-9J; Tue, 22 Dec 2020 10:43:07 -0500
Received: from mail.mutex.one ([62.77.152.124]:46758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <posteuca@mutex.one>)
 id 1krjoX-0008Bh-LM; Tue, 22 Dec 2020 10:43:07 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id 3F81FBF40375;
 Tue, 22 Dec 2020 17:43:01 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id moyrh-Txwy5l; Tue, 22 Dec 2020 17:43:00 +0200 (EET)
Received: [127.0.0.1] (localhost [127.0.0.1])nknown [79.112.42.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mutex.one (Postfix) with ESMTPSA id 72086BF402FC;
 Tue, 22 Dec 2020 17:43:00 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1608651780; bh=4c0z7GikZQtp0+kQ7r75UvNRsiKRmFYSiLZyq241zTw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=DeMVnAvOL9Cj5FJaRlCgo+1tLSeJUjy9xBr8Lkob8kLuAh6RQ7ipyKVGSh++1q2dE
 NiCrSN99gr3aFPz2YxVuolvoULFKH4XQTnsTipP9NkepxrAQROWPv/HVMUsyCEURN8
 NILlK0E5+3G5+83MnEitJUpw7PgT2sp84pdgf3+Y=
From: Marian Posteuca <posteuca@mutex.one>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] acpi: Permit OEM ID and OEM table ID fields to be
 changed
In-Reply-To: <d04375f8-f6bc-91d6-cd6e-217a689002e3@msgid.tls.msk.ru>
References: <20201222113353.31224-1-posteuca@mutex.one>
 <d04375f8-f6bc-91d6-cd6e-217a689002e3@msgid.tls.msk.ru>
Date: Tue, 22 Dec 2020 17:39:29 +0200
Message-ID: <87eejh4zpq.fsf@mutex.one>
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
 Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
 "Michael S.
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Michael Tokarev <mjt@tls.msk.ru> writes:

> 22.12.2020 14:33, Marian Posteuca wrote:
>> Qemu's ACPI table generation sets the fields OEM ID and OEM table ID
>> to "BOCHS " and "BXPCxxxx" where "xxxx" is replaced by the ACPI
>> table name.
>> 
>> Some games like Red Dead Redemption 2 seem to check the ACPI OEM ID
>> and OEM table ID for the strings "BOCHS" and "BXPC" and if they are
>> found, the game crashes(this may be an intentional detection
>> mechanism to prevent playing the game in a virtualized environment).
>
> This isn't a technical question/comment about the patch itself, but
> about something different.  Do we really want to play this whack-a-mole
> game? If we change ACPI table IDs, those who want to disallow running
> their software inside qemu/kvm will find some other way to check for
> this environment. We will change that, - just to be found again. And
> so on.. is it productive? I don't think so.

My personal opinion is that as long as it's not too difficult to mask
that the guest is running in a virtualized environment we should try to
do these changes. But I guess this can only be judged on per change basis.

>
> I'm not against this patch in any way, not at all, - having this ability
> is good for other purpose too. But I think we can't won in this "detect
> if we're running under qemu" battle easily. And the next version of the
> same game will have a more sofisticated detection method and we won't
> even know which way they used.
People gaming in a virtualized environment, are a very small fraction of windows
gamers, so I would assume that these companies do the bare minimum to
detect QEMU(an exception might be online games where they have an
incentive to prevent cheating).

Also I suppose this change could also be helpful for malware
analysis(since it prevents one way of detecting if windows is running in
a VM)?

Would you like a more generic commit message which doesn't references gaming?

>
> Thanks,
>
> /mjt

