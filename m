Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DDF30E166
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:49:25 +0100 (CET)
Received: from localhost ([::1]:43566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7MHM-00085e-Ck
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l7Lw7-00048F-UX; Wed, 03 Feb 2021 12:27:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:60420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l7Lvv-0004uN-Pf; Wed, 03 Feb 2021 12:27:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07BF664F86;
 Wed,  3 Feb 2021 17:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612373232;
 bh=GI3gqjyKLkEt/Hnc/hL9DSk6pudwKBKr2ISvv7W4DOM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lr8CImh5RuOm7BlC087WG/k2bvCefD0fZ8TXqUgT14a8oqzlOEhFfSEEKN7edTBQ/
 XtePoYSACA3sXH7Q7H1Ex8XY/dM8FHKscmuRlqjW/W2Oqut/k03uWPyjFSt83VZHTP
 ovVdYPiGlLV6ijdlk/NDjNlNtZDk7jHrFZgKhza4ULW8MdCDlXyBF1R1ENR3mtRyYJ
 U+OuT60FTVyijewKdUVMqA66J7gpV+fsMbnPbC4SQKWDwdHn0L/ut0laqgFMn/NiP4
 Us6m9rtUAdf+xbAmJOzCm1uHj6CkanysNLF+KmQKfvMeI/mfeGy+z1MyPtbX0+EiT5
 VgPAcMKz3twdA==
Date: Wed, 3 Feb 2021 09:27:09 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v5 0/5] hw/block/nvme: add simple copy command
Message-ID: <20210203172709.GD2182779@dhcp-10-100-145-180.wdc.com>
References: <20210129091541.566330-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210129091541.566330-1-its@irrelevant.dk>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just had the one comment on patch 4, which is really no big deal. I need
to integrate tooling and/or kernel support in order to properly test
this, but just from code inspection, I think it's good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

