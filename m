Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0759F30299A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:08:57 +0100 (CET)
Received: from localhost ([::1]:51536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l46IJ-0007Dt-Us
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:08:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l46CP-0001lG-Dk; Mon, 25 Jan 2021 13:02:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:42274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l46CN-0006s1-1t; Mon, 25 Jan 2021 13:02:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0EC322583;
 Mon, 25 Jan 2021 18:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611597760;
 bh=R1W6RGM8Q3EkeScndtBTKp1h8oUZS9mKuE40qOol5E4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y7nK/kDJDiRCZbRt+NkaK7ZV81a4OpjJLTGfpUfMs7NYXAvWwd/0/pUAc1vVbsfuz
 isxbsluWZN+g4buP+XVUB3p1jbJZUT9Jr2bOSXLJTa7NdCWyv0IWjqYydaowmfBKlC
 rraZagsJjE+fRTQ/vyrRWM9Xm8gPhewgPeIpRYWDkIjo5j0PmmlnxyGTtmdi9HJVDL
 UYWWk3SzQyNAmZxRJHTiG0hy75y4lQegrW+wgONijrZG9WidKH1jA0mttACc7ehu84
 cY/cKlOeTYCjeJVxMvBIsyIQhASBN/fHmRCA8fal6tRVLd3gWoAQb+pk0MDPH/fhAZ
 DmYp3dXxiq9Zw==
Date: Mon, 25 Jan 2021 10:02:37 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 0/3] hw/block/nvme: misc fixes
Message-ID: <20210125180237.GB1732047@dhcp-10-100-145-180.wdc.com>
References: <20210125082227.20160-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125082227.20160-1-its@irrelevant.dk>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 25, 2021 at 09:22:24AM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Misc fixes from Gollu.

Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

