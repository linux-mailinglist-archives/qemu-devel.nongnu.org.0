Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EDB2B0251
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 10:54:58 +0100 (CET)
Received: from localhost ([::1]:55896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd9Jh-0004vd-9k
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 04:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1kd9Hu-00040m-C9
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 04:53:08 -0500
Received: from shirlock.uni-paderborn.de ([2001:638:502:c003::15]:52720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1kd9Hp-0001as-Je
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 04:53:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+sK0jrD/3XkWVnWPWfZzVzSgOf5RRMeLIn9zC/p1hLo=; b=MKdKMIPUIBezQcMl+NZbNRNws0
 PUyLpuwjpazXu5Z/rgMN0qpgMLBfFhHc7GBYo/qEfY15H48hE1hOavciFyNZ8nmQnS8UMuoQyEDym
 8tdJnJIjNVVFUDTn0qBu8glLmHtK/8P6bdh7168QF60CGkOZZB7mtex4oFOBamyaJV4k=;
Date: Thu, 12 Nov 2020 10:52:53 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: David Brenken <david.brenken@efs-auto.org>
Subject: Re: [PATCH v5 1/1] tricore: added triboard with tc27x_soc
Message-ID: <20201112095253.u72kotizsxbn2rt4@mustique.upb.de>
References: <20201109165055.10508-1-david.brenken@efs-auto.org>
 <20201109165055.10508-2-david.brenken@efs-auto.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109165055.10508-2-david.brenken@efs-auto.org>
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2020.11.12.94518, AntiVirus-Engine: 5.77.0,
 AntiVirus-Data: 2020.11.11.5770003
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::15;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=shirlock.uni-paderborn.de
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Lars Biermanski <lars.biermanski@efs-auto.de>,
 Georg Hofstetter <georg.hofstetter@efs-auto.de>,
 David Brenken <david.brenken@efs-auto.de>,
 Robert Rasche <robert.rasche@efs-auto.de>,
 Andreas Konopik <andreas.konopik@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 09, 2020 at 05:50:55PM +0100, David Brenken wrote:
> From: Andreas Konopik <andreas.konopik@efs-auto.de>
> 
> Signed-off-by: Andreas Konopik <andreas.konopik@efs-auto.de>
> Signed-off-by: David Brenken <david.brenken@efs-auto.de>
> Signed-off-by: Georg Hofstetter <georg.hofstetter@efs-auto.de>
> Signed-off-by: Robert Rasche <robert.rasche@efs-auto.de>
> Signed-off-by: Lars Biermanski <lars.biermanski@efs-auto.de>
> ---
>  default-configs/devices/tricore-softmmu.mak |   2 +-
>  hw/tricore/Kconfig                          |   8 +
>  hw/tricore/meson.build                      |   2 +
>  hw/tricore/tc27x_soc.c                      | 246 ++++++++++++++++++++
>  hw/tricore/triboard.c                       |  98 ++++++++
>  include/hw/tricore/tc27x_soc.h              | 129 ++++++++++
>  include/hw/tricore/triboard.h               |  50 ++++
>  7 files changed, 534 insertions(+), 1 deletion(-)
>  create mode 100644 hw/tricore/tc27x_soc.c
>  create mode 100644 hw/tricore/triboard.c
>  create mode 100644 include/hw/tricore/tc27x_soc.h
>  create mode 100644 include/hw/tricore/triboard.h

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

I applied this to my tricore.next tree.

Cheers,
Bastian

