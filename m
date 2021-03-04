Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4CE32DA70
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 20:34:53 +0100 (CET)
Received: from localhost ([::1]:35276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHtkK-0006Kt-Tz
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 14:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lHtjV-0005pO-7b; Thu, 04 Mar 2021 14:34:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:56714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lHtjR-00045K-QJ; Thu, 04 Mar 2021 14:34:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D573964F52;
 Thu,  4 Mar 2021 19:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614886434;
 bh=ryTv2AdKbT+V/lQvkZ+d0TFd7hv/K85zzOIcLs28VYw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AK+l8siVEPP3rX5sSNudvEC7fa04ZdJ/fmUVLAsSoGxdR9VhelqVzUK7eDshU49U0
 r1sOZBAwmAIWpF66UDDghqvKHjYjipAkoTY5YfieKsK9AY8xorIprUmbleH7ALDakU
 gETp4UWuNQUSIfSEma1s96cdnaSA3sMAzcgEydOS4Loo/Ac8pV2occ3trGtklOBZly
 UYfjfIzSFFJJM567si0MahY2MMlAeXqq+FVmGWe9BVPq+QYmT+qjoH8C0BktcbhXfd
 oJu3ZmRCCRoor3PYdeYnTEPHOUOIN7UdObu0UfmBcOVCRDaxGEc3K2YSYamAWLjswt
 G+TPWH0Rz/X4w==
Date: Fri, 5 Mar 2021 04:33:48 +0900
From: Keith Busch <kbusch@kernel.org>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH V4 0/8] hw/block/nvme: support namespace attachment
Message-ID: <20210304193348.GA32558@redsun51.ssa.fujisawa.hgst.com>
References: <20210302132617.18495-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210302132617.18495-1-minwoo.im.dev@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 02, 2021 at 10:26:09PM +0900, Minwoo Im wrote:
> Hello,
> 
> This series supports namespace attachment: attach and detach.  This is
> the fourth version of series with replacing changed namespace list to
> bitmap to indicate changed namespace IDs.
> 
> Please review.

Looks good to me.

Reviewed-by: Keith Busch <kbusch@kernel.org>

