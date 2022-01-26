Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F15C49D096
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 18:21:35 +0100 (CET)
Received: from localhost ([::1]:54624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nClzB-0003Kn-So
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 12:21:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nClkQ-0006OR-Pf; Wed, 26 Jan 2022 12:06:19 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:59862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nClkN-0000Wc-JH; Wed, 26 Jan 2022 12:06:18 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C4F71B81AC2;
 Wed, 26 Jan 2022 17:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB83C340E3;
 Wed, 26 Jan 2022 17:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643216771;
 bh=WYBwn2wD+T0b4yS49bUjxCBzvqFiyOAQmTQEyppWOWM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R7RvIPQ/zM1NS+ZYfMHNS7AkO8mxh/78t+VhkJBqFP1LacueikqRC81dW17ekIdR2
 uiJLRrMtnxOMDUYXhXn0Ie/vLtPt+OzlMlBcm2vJMA+dAfjrTUuWdGHyK8jukl9SM7
 dDMMZWzyHsOjpI8OhGvaZ0UlZwRstzJOb9IsNo9SlbPAIBi6RLukVRaSZHipoJ1mcu
 D5K45TbJIu3ZzM1s1qmnA5fBfF/g5rTmMBOsZaURVpY772IIVEZsAyvgI6lz7WChsJ
 HCsZexRwORp6ah3hOeAtT1K1rlGT2EaB50rAPNgaX7Lkgd3+ra8/wmXGvwuh3SYYqI
 6Jh/d0tnGve1Q==
Date: Wed, 26 Jan 2022 09:06:09 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH for-7.0 3/4] hw/nvme: add ozcs enum
Message-ID: <20220126170609.GC1885300@dhcp-10-100-145-180.wdc.com>
References: <20211125073735.248403-1-its@irrelevant.dk>
 <20211125073735.248403-4-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125073735.248403-4-its@irrelevant.dk>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=kbusch@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 25, 2021 at 08:37:34AM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add enumeration for OZCS values.

Looks good. 

Reviewed-by: Keith Busch <kbusch@kernel.org>

