Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6E948C818
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 17:19:27 +0100 (CET)
Received: from localhost ([::1]:58606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7gLO-0005DP-UA
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 11:19:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_ggregory@quicinc.com>)
 id 1n7fx4-00055l-O3
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:54:18 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:34583)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_ggregory@quicinc.com>)
 id 1n7fx2-0007ni-VD
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642002857; x=1673538857;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4SnzFdXqm26p0UncEmQmMRW6ulJs6MLdJIqvD4CBO+w=;
 b=fDXyaQqqNNWrWoDAFM94HDNaswUg2C8nCpBQXBHyk9gvGVwfsML0qCzB
 GDe6+Jrl5XN7ighJLgX/SCqYt2kEvuMbfAB5N6O5qhXAV5BLl3+SD/TnU
 jv+rOOMpO1I05/Q5Ofxi+5YKGkwRh5EEBfQSGK00Lv4203CAh0FPxFwGl Q=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Jan 2022 07:54:15 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 07:54:15 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 12 Jan 2022 07:54:14 -0800
Received: from quicinc.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 12 Jan
 2022 07:54:14 -0800
Date: Wed, 12 Jan 2022 15:54:11 +0000
From: Graeme Gregory <quic_ggregory@quicinc.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v3 0/2] Aspeed I3C device model
Message-ID: <20220112155411.g7l33t7u7tc7ods6@ggregory-linuxws>
References: <20220111084546.4145785-1-troy_lee@aspeedtech.com>
 <20220112105704.ovkq5yxl6phzeqi3@ggregory-linuxws>
 <dcda4d71-d6a1-f45a-f465-8ec881dc2b7a@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcda4d71-d6a1-f45a-f465-8ec881dc2b7a@kaod.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=quic_ggregory@quicinc.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: leetroy@gmail.com, Troy Lee <troy_lee@aspeedtech.com>,
 qemu-devel@nongnu.org, hailin.wu@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 01:45:05PM +0100, Cédric Le Goater wrote:
> Hello Gregory,
> 
> On 1/12/22 11:57, Graeme Gregory wrote:
> > On Tue, Jan 11, 2022 at 04:45:44PM +0800, Troy Lee wrote:
> > > This series of patch introduce a dummy implemenation of aspeed i3c
> > > model, and it provide just enough information for guest machine.
> > > However, the driver probing is still failed, but it will not cause
> > > kernel panic.
> > > 
> > 
> > These patches arrived just in time for our i3c testing. This stops
> > our CI halting due to kernel panic on i3c probing.
> > 
> > Reviewed-by: Graeme Gregory <quic_ggregory@quicinc.com>
> > Tested-by: Graeme Gregory <quic_ggregory@quicinc.com>
> 
> Excellent !
> 
> Are you using the Aspeed image from :
> 
>  https://github.com/AspeedTech-BMC/openbmc/releases/tag/v07.02
> 
> or your custom ones ?
> 
We are using the drivers from the v5.4 based SDK currently. Hacked
into the v5.15 kernel of openbmc upstream! We needed something quick
to test a new PCB.

Graeme


