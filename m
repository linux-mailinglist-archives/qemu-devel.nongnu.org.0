Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6E8306264
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 18:45:08 +0100 (CET)
Received: from localhost ([::1]:51662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4osN-0007X9-BU
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 12:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l4ops-0006HY-Jq; Wed, 27 Jan 2021 12:42:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:57734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l4opq-0000rm-Td; Wed, 27 Jan 2021 12:42:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8034D64DAD;
 Wed, 27 Jan 2021 17:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611769345;
 bh=PNShJu6B3eSyz+Fsk4tHqry67bsoWWNic1zOD46SDf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XQohyDakMqkmOZNu3Un9waP/qAUmabulIauTD4upy13vggVZN66RSiBuRMMN0nkHC
 XtxvoH00MDk1g1kSaTNiXQglWWVE6hAYUZxKmjGjc/6/Yx/n1uqwArafKvfxe4WRei
 71PMvDfSdli/Fyo1PuxOsNd767igivGXIVbHZ3MgPL+o++C39dQV4h39WwE8liEJl1
 L4ismecx7LLqGG0GQnN14AOO5z2fuwlJkGt3aXiYQijMaHkB1zk78R7RSP29etk38I
 9DBZNagi27SbRnRQdrWEI6M1uzMxbjJT/yXDNLcSAynu9MdYj6GHfakmnQmm8NQBWZ
 YZpfHOvcBu8lg==
Date: Wed, 27 Jan 2021 09:42:22 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 0/2] hw/block/nvme: zoned fixes
Message-ID: <20210127174222.GB1816249@dhcp-10-100-145-180.wdc.com>
References: <20210119135500.265403-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119135500.265403-1-its@irrelevant.dk>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 02:54:58PM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Patch [1/2] fixes the zone append bug reported by Niklas. [2/2]
> refactors the zone write check function to return status codes in a
> different order if there are multiple zone write violations that apply.

Looks good to me.

Reviewed-by: Keith Busch <kbusch@kernel.org>

