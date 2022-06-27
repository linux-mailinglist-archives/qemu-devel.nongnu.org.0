Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F025655BB90
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 20:16:46 +0200 (CEST)
Received: from localhost ([::1]:36624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5tHw-0007Gm-0x
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 14:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+327ef3b6ae2033f48346+6882+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1o5t1v-0001vD-O9; Mon, 27 Jun 2022 14:00:13 -0400
Received: from bombadil.infradead.org ([2607:7c80:54:3::133]:40810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+327ef3b6ae2033f48346+6882+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1o5t1n-0000N7-BY; Mon, 27 Jun 2022 14:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=S3shiQsr2bdQegLbq1xcg6L6YNiALGbu66pEL97tBno=; b=F5DyFNN7C4LBHwnuipPFV2II3U
 ZkpiKIs+FIkua2YpdJGTXKA/DbNCUoEQjZaVSRir16M0QYAiUrYIX/TZRAnn/aVuqEvh9oS4HBupi
 0v2Z/qOJGMeblDj2wk5zAIxJnWyRPqqH0jMo8CA3s6KM85WZSlr4RgJ4ewT159twy8whUQAuLWmPU
 Y4B2+8ibloDCMEoJcKG2BdpE5QFfWbftZhAJS90zmUefiuoBySbjqmn9y5qzRJjrBMLypFtyN2k2H
 vSTB0zrzLvIPbOs6CJiN2vJuXEsoA5b3hVzFeGFmA5ixChcDPaCVuM7KXZBIFqFE05PsAIIar2/pr
 xkl+8OaQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o5t1Z-002JDb-TF; Mon, 27 Jun 2022 17:59:49 +0000
Date: Mon, 27 Jun 2022 10:59:49 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: kbusch@kernel.org, its@irrelevant.dk, damien.lemoal@wdc.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/4] hw/nvme: claim NVMe 2.0 compliance
Message-ID: <YrnwFTnGdSpKipWA@infradead.org>
References: <20220627114731.356462-1-niklas.cassel@wdc.com>
 <20220627114731.356462-2-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627114731.356462-2-niklas.cassel@wdc.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2607:7c80:54:3::133;
 envelope-from=BATV+327ef3b6ae2033f48346+6882+infradead.org+hch@bombadil.srs.infradead.org;
 helo=bombadil.infradead.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 27, 2022 at 01:47:28PM +0200, Niklas Cassel via wrote:
> CRMS.CRWMS bit shall be set to 1 on controllers compliant with versions
> later than NVMe 1.4.
> 
> The first version later than NVMe 1.4 is NVMe 2.0
> 
> Let's claim compliance with NVMe 2.0 such that a follow up patch can
> set the CRMS.CRWMS bit.
> 
> This is needed since CC.CRIME is only writable when both CRMS.CRIMS
> and CRMS.CRWMS is set.

You can also always support newer features without claiming
compliance for the new version.  I'd suggest to go through the
mandatory changes list first before upgrading the compliance.
(And one day it would be neat if someone tried to run the official
but commercial compliance tests on qemu a well..)

