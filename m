Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B8C313FFC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:10:45 +0100 (CET)
Received: from localhost ([::1]:40630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Crs-0005N4-Kj
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:10:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l98eF-0005M6-2Q; Mon, 08 Feb 2021 10:40:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:53298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l98eD-0008Ne-B1; Mon, 08 Feb 2021 10:40:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7AD6E64DFF;
 Mon,  8 Feb 2021 15:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612798815;
 bh=OlrULLF4l9xv4t/ERd/lcBVtR244j+vxz20nxHH/tlg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pIno+fF4WuspsGxjy953szUSJr0nUDa4zE2PIuaVQhKCv6Icz92GLHUn7S2W9F17G
 9ks7oKP8oJ+n3I6xMh3WfTjG9c1NufpnuO3UTHRzCsYVhFpQizn4Sh2E+5XdRm1HdC
 8/xXteeALKg7NtDuDIEnWdKqUdrf1is4wZBbDeIZ8Ztu8TYSWpg5/DUI+yIFTu5qZ8
 whooLVH9BKyClF+PLb0yFg2Ib8Brwnq+pZMQaSVIjMDUDZQmeh6EiLcnx6VBIDbG9O
 61lQK5+/4lQJ6st184wYVG40+hxehhTXXYRJtwiDIMboukh073Y0LDTlpCQEG/A23y
 a0KLxPOkyGigw==
Date: Tue, 9 Feb 2021 00:40:08 +0900
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 0/2] hw/block/nvme: add support for telemetry log pages
Message-ID: <20210208154008.GB16360@redsun51.ssa.fujisawa.hgst.com>
References: <20210208141012.377500-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210208141012.377500-1-its@irrelevant.dk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 08, 2021 at 03:10:10PM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> This adds support for the telemetry log pages and fixes up the
> controller IEEE OUI.

Patch 1 is fine.

I don't see the point for patch 2. We don't need an empty implementation
for every optional spec feature just because it's there. The features
we do implement ought to provide something useful, yeah?

