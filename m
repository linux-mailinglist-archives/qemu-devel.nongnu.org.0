Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C733126A3
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 19:21:50 +0100 (CET)
Received: from localhost ([::1]:59944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8ogr-0004Vs-1H
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 13:21:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <posteuca@mutex.one>)
 id 1l8off-0003bK-5X; Sun, 07 Feb 2021 13:20:31 -0500
Received: from mail.mutex.one ([62.77.152.124]:47078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <posteuca@mutex.one>)
 id 1l8ofd-0002qg-Ju; Sun, 07 Feb 2021 13:20:30 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id 3C8B4BF441E3;
 Sun,  7 Feb 2021 20:20:25 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRUtSAJ81Slr; Sun,  7 Feb 2021 20:20:24 +0200 (EET)
Received: [127.0.0.1] (localhost [127.0.0.1])nknown [79.112.103.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mutex.one (Postfix) with ESMTPSA id 7CD0BBF441E2;
 Sun,  7 Feb 2021 20:20:24 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1612722024; bh=693iw3gbALaml7e0wrgJtTtezq/JTq5YEQaiIrvzsBI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KR4iZygl7T51qvE3oM4697+fBxAd95K8QoPDrMgog+13tyKEFDHEvrdlTcize02s7
 NePXnkVYUaPVH3mzqtYopc61CPHt0E5rSbZIrRDVMQPp3n1UqFh3G4Ad+9VUyj1tyo
 SO4qprBojlpiQR69/kZ4TAbb6nB/T7iV54LES194=
From: Marian Postevca <posteuca@mutex.one>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 2/5] acpi: Permit OEM ID and OEM table ID fields to
 be changed
In-Reply-To: <20210205082049-mutt-send-email-mst@kernel.org>
References: <20210119003216.17637-1-posteuca@mutex.one>
 <20210119003216.17637-3-posteuca@mutex.one>
 <20210205082049-mutt-send-email-mst@kernel.org>
Date: Sun, 07 Feb 2021 20:23:33 +0200
Message-ID: <87h7mnzqhm.fsf@mutex.one>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Michael S. Tsirkin" <mst@redhat.com> writes:

>
>
> I queued this but there's a lot of code duplication with this.
> Further, the use of g_strdup adds unnecessary dynamic memory
> management where it's not needed.
> I'd prefer
> -   a new struct AcpiBuildOem including the correct strings
> -   use sizeof of fields in above instead of 8/6
> -   move shared strings and code into a common header
>

So how should I approach this since the patches are queued? A new patch
with the suggested changes, or resending the original patches?

