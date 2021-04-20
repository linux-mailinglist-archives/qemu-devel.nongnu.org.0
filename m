Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF39F365E72
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 19:24:55 +0200 (CEST)
Received: from localhost ([::1]:37722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYu7K-0003m4-CU
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 13:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lYu4h-0003Fn-Np; Tue, 20 Apr 2021 13:22:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:46192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lYu4g-00068B-3a; Tue, 20 Apr 2021 13:22:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C013613B8;
 Tue, 20 Apr 2021 17:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618939327;
 bh=A5UuRNUKi8PXICg/NnisftEXLkP+POC4boDHcgQPaN8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FZEW75ySFTrjS9lpojHtcLRzSM9mLYMJQ3pUoQg1+fg5FPEfIEIpJnKmA9h7Vud/S
 YG399qOZaob4IYYqdPWRqwpSKhySVs7It3d796MPxNA3DdgfE7LrGWuVqVmeRXogcp
 cOxEFLm/+a4a6IY2SXm6y3bj05hPsCjmHquRxbLZ+R3RfRPHOIFjYRk848uEZoLv2a
 0ak7ZGIiht7fPppC/1QtxMGPi9ZwU7bpMfEiQte3Sqj8lmLQ11iAGA82KOy6OIm/ZQ
 +p/3xpKaT02lRjaw6+/5Xye9vdLxJYXhXpVC8Stlm2LTGMyICRdOCs5TWT3ncL3IZH
 27PuwzWOBHS3g==
Date: Wed, 21 Apr 2021 02:22:04 +0900
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 00/14] hw(/block/)nvme: spring cleaning
Message-ID: <20210420172204.GA18079@redsun51.ssa.fujisawa.hgst.com>
References: <20210419192801.62255-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210419192801.62255-1-its@irrelevant.dk>
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

On Mon, Apr 19, 2021 at 09:27:47PM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> This series consists of various clean up patches.
> 
> The final patch moves nvme emulation from hw/block to hw/nvme.

Series looks good to me.

Reviewed-by: Keith Busch <kbusch@kernel.org>

