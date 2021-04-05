Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198E43546E5
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 21:01:18 +0200 (CEST)
Received: from localhost ([::1]:33974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTUTM-0000L0-Kn
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 15:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lTURn-0008Gc-4S; Mon, 05 Apr 2021 14:59:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:54138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lTURl-0002cW-G6; Mon, 05 Apr 2021 14:59:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE66A6128A;
 Mon,  5 Apr 2021 18:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617649174;
 bh=L3PtYE2/0AkKFYMfZpt05IZazZBWtnqETtses0W2my8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TDyMOtAYy+3RZF8NbzQPr+9VDaRtq66dx5J2GSPN9beMw3HpU+XbNhFVh6NV/tP2O
 pNO6fhYjmm/NF0npz/J3vPJMV+5V+ilyAE6SbY7Gnl/GA4JrFwfnn1YGS8SnwGYweD
 vSshrdRpibL6Qjry2HXYjTbbajc3Sf51oSIQr42WzZheoK5z8m7dTz+XnCUoXYEj8R
 S3pE8yiwcFAVeNd1+o23WSQQX4zKsmaWgUbHbIGsHxLReQJ3slVenHPTwSdgMcOn/5
 Vb7fgWJyKrYyWm+L8BL5ToQwoTfWFYc/FzaCOaUL/us3sms/LidHGlfN8q4LVXMwx0
 qdXrECbZq2+yg==
Date: Tue, 6 Apr 2021 03:59:27 +0900
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH for-6.0 v2 0/8] hw/block/nvme: misc fixes
Message-ID: <20210405185927.GA21500@redsun51.ssa.fujisawa.hgst.com>
References: <20210405175452.37578-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210405175452.37578-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 05, 2021 at 07:54:44PM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Various fixes for 6.0.
> 
> v2:
>   - "hw/block/nvme: fix handling of private namespaces"
>     update documentation (Gollu)
>   - add a patch for missing copyright headers

Series looks fine.

Reviewed-by: Keith Busch <kbusch@kernel.org>

