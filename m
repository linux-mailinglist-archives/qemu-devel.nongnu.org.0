Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3632D366F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:48:02 +0100 (CET)
Received: from localhost ([::1]:56504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlm5-0004uf-RL
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:48:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kmlFM-0007r5-SN; Tue, 08 Dec 2020 17:14:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:54266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kmlFK-0006Qz-KL; Tue, 08 Dec 2020 17:14:12 -0500
Date: Wed, 9 Dec 2020 07:14:05 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607465648;
 bh=Z6bKGKjOzobP1unjWY2K5UhTaqpw5zb1YIBIbiapQj4=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=dzAzqRPxh0yVNFog5/vzElJayeqGXLE9KNEtXf9whMzyIYn38tDEpfDCij5rwavqI
 IcOJ7gO83E6ipmSKP6y6izkObVgDFm6F0Wro5dx2e1gB2NMAdsypQO1anUK365VPGH
 xYl+7Hm6Q1MaIOn+99kwRH6gd0n+ylMyoVMq4UF4+cOI0d359nllLj+97kWZLdZeU/
 O0yj8S6MB3/q1ZbbPgTqm7TUOV1/sWVdFpukcOfeZOC9lbGG+ok8PnWK+WnTuCI9Qv
 v0p7Wkdbw/8g1nbRloPbNS6n0SCn4BljHgM0itV46iDvVdLz6SOFXMSGhVWrhl3b02
 um6zs0KzxOqxg==
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2] hw/block/nvme: add compare command
Message-ID: <20201208221405.GI27155@redsun51.ssa.fujisawa.hgst.com>
References: <20201126185605.539311-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126185605.539311-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Minwoo Im <minwoo.im.dev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 07:56:05PM +0100, Klaus Jensen wrote:
> From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> 
> Add the Compare command.
> 
> This implementation uses a bounce buffer to read in the data from
> storage and then compare with the host supplied buffer.
> 
> Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> [k.jensen: rebased]
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

