Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7BF3FB9B6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 18:06:16 +0200 (CEST)
Received: from localhost ([::1]:57728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKjnb-0002kG-43
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 12:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <msuchanek@suse.de>)
 id 1mKjm2-0000xn-So; Mon, 30 Aug 2021 12:04:38 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:52798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <msuchanek@suse.de>)
 id 1mKjm1-0004fE-45; Mon, 30 Aug 2021 12:04:38 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id B15AD200DA;
 Mon, 30 Aug 2021 16:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1630339473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NK0xPBZ4sn4TApmOjl+yIkGOOulqQsrQSV8IQToTd6U=;
 b=XucIDVmBQBLjCsdO8+LTOehh7sbO+zAJt/yyxdLw6QLzgiSNIavnGebU+WKDUEoIgFJaDe
 35jIxR5LlFEjQhWmK/lrLfRiYVqYBsO8AIBbgcc1nKWucYihu0F4hUMVZMdAuoCxNz7W+9
 66pVEBLuM96nb5cu1G3R3Sev5wUb/Io=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1630339473;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NK0xPBZ4sn4TApmOjl+yIkGOOulqQsrQSV8IQToTd6U=;
 b=1gVspRKs5ncF2WVLr7wPBHod7Hx/8/LXycHeoafcQ7RW1vSONyahxJFKzVXdNrnshQE3bV
 WT7F2An27pdjHJCQ==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 77A05A3BA5;
 Mon, 30 Aug 2021 16:04:32 +0000 (UTC)
Date: Mon, 30 Aug 2021 18:04:31 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: QEMU-KVM offers OPAL firmware interface? OpenBSD guest support?
Message-ID: <20210830160431.GC61714@kunlun.suse.cz>
References: <20210827170113.5f4ed260@bahia.lan>
 <HgtFZEnabNjIrsVI3x8MYs2QYSCG4IFStP0MR3qwPWBmXW9kDmQmIwQEWHMVdJbUCu-XvHdMpZGe3pr-B91s1D7y6cn9SVzhxEYms5c3p0o=@protonmail.com>
 <20210827180259.3720d58d@bahia.lan>
 <56141ff67838992a@bloch.sibelius.xs4all.nl>
 <20210827190053.6c68def5@bahia.lan>
 <25bfa81c-9498-4e82-a848-1fbb1c188ff1@kaod.org>
 <561422a20e4f9ae2@bloch.sibelius.xs4all.nl>
 <51bff28d-4779-b023-fee6-b3e9196b7ec5@kaod.org>
 <3QoYEEZauH3xXwC2NcJFnrHe4IaWwu2fqEvtR6tR3RHsY_b0bsyz0oQdcI0b1zdwnXbXhl6bCtaUiyWQjbYgnx5U-Ov_Lm3tMGdMkTwZC88=@protonmail.com>
 <YSyBUSxBiH+UYE/Y@yekko>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YSyBUSxBiH+UYE/Y@yekko>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=195.135.220.29; envelope-from=msuchanek@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: pjp@centroid.eu, gardask@gmail.com, rgcinjp@disroot.org, daniel@pocock.pro,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 kite@centroid.eu, Joseph <joseph.mayer@protonmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 siliconbadger@protonmail.com, qemu-ppc@nongnu.org,
 "ppc@openbsd.org" <ppc@openbsd.org>, Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 30, 2021 at 04:57:21PM +1000, David Gibson wrote:
> On Sun, Aug 29, 2021 at 04:09:54AM +0000, Joseph wrote:
> > Hi Mark, Cédric, Greg at the openbsd-ppc ML,

> 
> So.. if you want to run OpenBSD on POWER10 you will definitely need
> PAPR support, because POWER10 won't support bare metal OS access at
> all (it will be back to PowerVM always, like POWER5..POWER7).

Hello,

what is stopping powernv support other than lack of firmware support?

Doesn't PowerVM use teh very same vrtualization features that KVM does?

Thanks

Michal


