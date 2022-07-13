Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EBC573D54
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 21:47:48 +0200 (CEST)
Received: from localhost ([::1]:38988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBiKo-0004p3-U3
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 15:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1oBiJK-0003BH-EC; Wed, 13 Jul 2022 15:46:14 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:55876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1oBiJH-0003Tn-Lj; Wed, 13 Jul 2022 15:46:13 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C5A21B82130;
 Wed, 13 Jul 2022 19:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0A7C34114;
 Wed, 13 Jul 2022 19:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657741567;
 bh=DM8FAe5DB8371rSlRzF4Z/ouXZMZJI5NcIMpqVavIRo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ml1h7LJOvLaPGadO4Od9c2jk9TRzZgkAlko1AZnFv+Zn7YzzbmjswHN3CD3d2mT24
 ygh/QmXuR6B1SfyisB+hA0p/cLtPK/79w10O2jDh7v8L5zzcQs/fuDiqs1iYhA3p0V
 IRkS5Ulc1JlgPIMZ1oAIIha8ItNarTjmn+UxofDh/JTmDv3HBqjKnHVwflhJmbmfa0
 gj/d0kso+rMyVSb553qSeP7J3xfNmtqkdhqu/hePZBczmrnUO4O/59UmOl5B7dEcZu
 GsUCHbHGOsbfFqSlOt8o2WBjITpE7vZ7pHPhGMpu4OL17jvklP1Psjq4lIRbbPtyxn
 GLz89AYFACzSg==
Date: Wed, 13 Jul 2022 13:46:04 -0600
From: Keith Busch <kbusch@kernel.org>
To: Mauricio Sandt <mauricio@mailbox.org>
Cc: qemu-devel@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org
Subject: Re: [PATCH] hw/nvme: Add options to override hardcoded values
Message-ID: <Ys8g/ORqpTRfDZ4f@kbusch-mbp.dhcp.thefacebook.com>
References: <20220611223509.32280-1-mauricio@mailbox.org>
 <Ys76yHpwdm4eyTbs@kbusch-mbp.dhcp.thefacebook.com>
 <6d623fbd-65ee-b74f-15f8-9e35ffb3fd0d@mailbox.org>
 <Ys8Tel0PFYODk8Rj@kbusch-mbp.dhcp.thefacebook.com>
 <599d4629-5d33-512a-0630-b75cd96d1d81@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <599d4629-5d33-512a-0630-b75cd96d1d81@mailbox.org>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=kbusch@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Jul 13, 2022 at 09:11:41PM +0200, Mauricio Sandt wrote:
> On 13/07/2022 20:48, Keith Busch wrote:
> > I guess I'm missing the bigger picture here. You are supposed to be able to
> > retrieve these fields with ioctl's, so not sure what this has to do with
> > malware. Why does the firmware revision matter to this program?
> Oh I'm sorry, I forgot to explain properly. Malware usually checks if it is
> being run in a sandbox environment like a VM, and if it detects such a
> sandbox, it doesn't run or doesn't unleash its full potential. This makes my
> life as a researcher much harder.
> 
> Hiding the VM by overriding the model, firmware, and nqn strings to either
> random values or names of existing hardware in the hypervisor is a much
> cleaner solution than intercepting the IOCTLs in the VM and changing the
> result with a kernel driver.

IIUC, this program is trying to avoid being studied, and uses indicators like
nvme firmware to help determine if it is running in such an environment. If so,
I suspect defeating all possible indicators will be a fun and time consuming
process. :)

