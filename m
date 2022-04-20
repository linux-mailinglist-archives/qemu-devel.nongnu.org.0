Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BDB50808D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 07:23:02 +0200 (CEST)
Received: from localhost ([::1]:45760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh2nt-0004h5-F0
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 01:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hch@lst.de>)
 id 1nh2le-0003Os-VN; Wed, 20 Apr 2022 01:20:44 -0400
Received: from verein.lst.de ([213.95.11.211]:41898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hch@lst.de>)
 id 1nh2la-0008N1-8d; Wed, 20 Apr 2022 01:20:41 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7DD6F68B05; Wed, 20 Apr 2022 07:20:22 +0200 (CEST)
Date: Wed, 20 Apr 2022 07:20:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 1/5] hw/nvme: enforce common serial per subsystem
Message-ID: <20220420052022.GA1901@lst.de>
References: <20220419121039.1259477-1-its@irrelevant.dk>
 <20220419121039.1259477-2-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419121039.1259477-2-its@irrelevant.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Received-SPF: none client-ip=213.95.11.211; envelope-from=hch@lst.de;
 helo=verein.lst.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Luis Chamberlain <mcgrof@kernel.org>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 19, 2022 at 02:10:35PM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> The Identify Controller Serial Number (SN) is the serial number for the
> NVM subsystem and must be the same across all controller in the NVM
> subsystem.
> 
> Enforce this.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

