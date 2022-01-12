Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3DE48C2AC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 11:59:46 +0100 (CET)
Received: from localhost ([::1]:52556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7bM1-00033i-HB
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 05:59:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_ggregory@quicinc.com>)
 id 1n7bJh-0000uK-1H
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:57:21 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:42496)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_ggregory@quicinc.com>)
 id 1n7bJX-00074X-Lq
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:57:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1641985031; x=1673521031;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Rua5swUCvs78LVBLrhiwjUDF7j4qlfS4RziK1K0XC04=;
 b=wQFhOcMyfWQ4iI7MXOhDQtd/AikoKzfLIQr95OPogrIncEN9T2jVW7Cc
 rp83PPZn0eou0edzZ6ATietwXn1ji2NI58WwWpARsLEjwPkKKUEIa/MV4
 MrHp4gsuvrOEdnqF1PAEq/J2lg4al2Y2RVxJrwk7E8YpKWm3eHRE2vX0T o=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Jan 2022 02:57:07 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 02:57:07 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 12 Jan 2022 02:57:07 -0800
Received: from quicinc.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 12 Jan
 2022 02:57:06 -0800
Date: Wed, 12 Jan 2022 10:57:04 +0000
From: Graeme Gregory <quic_ggregory@quicinc.com>
To: Troy Lee <troy_lee@aspeedtech.com>
Subject: Re: [PATCH v3 0/2] Aspeed I3C device model
Message-ID: <20220112105704.ovkq5yxl6phzeqi3@ggregory-linuxws>
References: <20220111084546.4145785-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220111084546.4145785-1-troy_lee@aspeedtech.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=quic_ggregory@quicinc.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: leetroy@gmail.com, qemu-devel@nongnu.org, hailin.wu@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 11, 2022 at 04:45:44PM +0800, Troy Lee wrote:
> This series of patch introduce a dummy implemenation of aspeed i3c
> model, and it provide just enough information for guest machine.
> However, the driver probing is still failed, but it will not cause
> kernel panic.
> 

These patches arrived just in time for our i3c testing. This stops
our CI halting due to kernel panic on i3c probing.

Reviewed-by: Graeme Gregory <quic_ggregory@quicinc.com>
Tested-by: Graeme Gregory <quic_ggregory@quicinc.com>

> v3:
> - Remove unused AspeedI3CClass
> - Refine memory region
> - Refine register reset
> - Remove unrelated changes to SPI2 address
> - Remove i3c controller irq line
> 
> v2:
> - Split i3c model into i3c and i3c_device
> - Create 6x i3c devices
> - Using register fields macro
> - Rebase to mainline QEMU
> 
> Troy Lee (2):
>   Introduce a dummy AST2600 I3C model.
>   This patch includes i3c instance in ast2600 soc.
> 
>  hw/arm/aspeed_ast2600.c      |  16 ++
>  hw/misc/aspeed_i3c.c         | 381 +++++++++++++++++++++++++++++++++++
>  hw/misc/meson.build          |   1 +
>  hw/misc/trace-events         |   6 +
>  include/hw/arm/aspeed_soc.h  |   3 +
>  include/hw/misc/aspeed_i3c.h |  48 +++++
>  6 files changed, 455 insertions(+)
>  create mode 100644 hw/misc/aspeed_i3c.c
>  create mode 100644 include/hw/misc/aspeed_i3c.h
> 
> -- 
> 2.25.1
> 
> 

