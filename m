Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F46304A42
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 21:40:51 +0100 (CET)
Received: from localhost ([::1]:39524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4V8r-0007tp-N8
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 15:40:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l4V7g-0007OA-HG; Tue, 26 Jan 2021 15:39:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:39460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l4V7e-00015x-Vt; Tue, 26 Jan 2021 15:39:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19864221FC;
 Tue, 26 Jan 2021 20:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611693571;
 bh=bLyThdL1UyED0gL6XUv01OircAJJsj4NkuMU/Tnwgxs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X4d/hXaNu2MdXzEhIn0TWl2jufET2H80cRjE8ZQOndBxSnQ1hdX/ex84janJh06Hy
 vVo58pO25wxjNsy54E7G/dTIKO6KgWwY/7yRDR7hwkWwCN2C+V1mBpM/BWpKiBMYlo
 lsIKoB2VEDIZBG+ooWwHx5aNDhxvzGgv+8Mr3F0P8T6qwlGWXstfkVgehvUgws+W73
 BXpTZhfMODUyU8kz4Qj1f3Qs6q6RbFAdEKCvk8XNEZiU4jKgrLoAVMcWhcFNrPYp6s
 2W7UJFuQEecT0hVVlSQImgIV+9wxlKqJelOjE1IbWgiYsmIsx/136IolR5eywDkZ4Z
 yjgsP/RSU//Jg==
Date: Wed, 27 Jan 2021 05:39:29 +0900
From: Keith Busch <kbusch@kernel.org>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH V6 0/6] hw/block/nvme: support multi-path for ctrl/ns
Message-ID: <20210126203929.GB23059@redsun51.ssa.fujisawa.hgst.com>
References: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This came out looking cleaner than I had initially expected. Thanks for
seeing this feature through!

Reviewed-by: Keith Busch <kbusch@kernel.org>

