Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453EE322110
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 22:02:21 +0100 (CET)
Received: from localhost ([::1]:49630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEILT-0005w6-RO
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 16:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lEIJs-0005FX-0T; Mon, 22 Feb 2021 16:00:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:45792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lEIJq-0004QE-E4; Mon, 22 Feb 2021 16:00:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B455464E15;
 Mon, 22 Feb 2021 21:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614027636;
 bh=Nvyg3POF11pORQz87VjPaRbeSZRllr52r2KVjnAs/vQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hpqRSTAKbrnCc6jq/3G044TWsblHD3fS5oFz18zux9ujX+RvkBh6VOzlQCs/qYjuB
 GlHIGkPXOQWMxDEJAFkfauJ5TxeeFQZoWJWsMOJ6kOZm5dPlB6MeLDoQrGt2YrAptf
 ZKc7ex0gtIhUxCGhubxGYHeP/8zmdxRHiJwNQw2MES8jz3P4I/Jea6y6x1oBiA5WoB
 TI3H6v6l0BTxtdkArgpOnELz0yszs3dW1xD4RO9ydbw1Ca0DtSB+If9uDfnAcw3N8p
 1YBf02lLnUIZaBFCpSepqdEeXVGOwJHe5aa+jUcPTow8ODDITZP1DV5drmOVyvb6xL
 uFPx6zCIwHePg==
Date: Tue, 23 Feb 2021 06:00:33 +0900
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 0/3] hw/block/nvme: mdts/zasl cleanup
Message-ID: <20210222210033.GC16253@redsun51.ssa.fujisawa.hgst.com>
References: <20210222202921.92774-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210222202921.92774-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These look good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

