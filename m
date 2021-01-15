Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8E82F7E7F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:47:46 +0100 (CET)
Received: from localhost ([::1]:45374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0QO9-0003QQ-9N
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:47:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l0QM9-0002Uh-5y
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 09:45:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l0QM7-0005iP-JO
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 09:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610721938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ToAIqk2qaeZtfn2mKExLdHL1HAUzXAqQ6WW0ojl6qZU=;
 b=RuDJcJ+pnA0It5dzGiAE5xA9MP/WzU3RIcjmeTBebpbeYIa9cDrS2EJQYabp+0EZeMSqyF
 o0wD/aZmDMF3wWhzxFSRjiF4XdWpjYrNi4pkC/eFDhl8qlCb50ZCwh5r10bccynzViYXcK
 VTyvVBz3s5CmIeBzXu2zLE33Uy/RHM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-x0-fIDW3NxSlejaYUe5qRw-1; Fri, 15 Jan 2021 09:45:36 -0500
X-MC-Unique: x0-fIDW3NxSlejaYUe5qRw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1060180A097;
 Fri, 15 Jan 2021 14:45:34 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-114-80.rdu2.redhat.com
 [10.10.114.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5E3A61461;
 Fri, 15 Jan 2021 14:45:32 +0000 (UTC)
Date: Fri, 15 Jan 2021 09:45:30 -0500
From: Andrew Jones <drjones@redhat.com>
To: Yifei Jiang <jiangyifei@huawei.com>
Subject: Re: [PATCH v3 1/1] target-riscv: support QMP dump-guest-memory
Message-ID: <20210115144530.jlexzqf3vefeeiyi@kamzik.brq.redhat.com>
References: <20210115012819.2053-1-jiangyifei@huawei.com>
 <20210115012819.2053-2-jiangyifei@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210115012819.2053-2-jiangyifei@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu, limingwang@huawei.com,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 Alistair.Francis@wdc.com, palmer@dabbelt.com, fanliang@huawei.com,
 dengkai1@huawei.com, wu.wubin@huawei.com, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 09:28:19AM +0800, Yifei Jiang wrote:
> Add the support needed for creating prstatus elf notes. Now elf notes
> only contains user_regs. This allows us to use QMP dump-guest-memory.
> 
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> ---
>  target/riscv/arch_dump.c | 202 +++++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.c       |   2 +
>  target/riscv/cpu.h       |   4 +
>  target/riscv/cpu_bits.h  |   1 +
>  target/riscv/meson.build |   1 +
>  5 files changed, 210 insertions(+)
>  create mode 100644 target/riscv/arch_dump.c
>

I gave my r-b on the last review and the only change in this version
is the suggestion I made. Anyway, here's my r-b again

Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew


