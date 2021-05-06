Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CE037552A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 15:53:06 +0200 (CEST)
Received: from localhost ([::1]:35248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeR7-00088j-6M
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 09:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sh_def@163.com>)
 id 1leZB5-00076v-F5; Thu, 06 May 2021 04:16:11 -0400
Received: from m12-16.163.com ([220.181.12.16]:32848)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sh_def@163.com>)
 id 1leZAz-0005Ds-BS; Thu, 06 May 2021 04:16:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=tMxxD
 QjkLj5uIEFQHWQp6/JeKBo2KPu9LfRSI/P1wbM=; b=nZm30qRlEIN9SR2/Ls7m3
 Ir4Hyhfu8ZDTk5gBFNJYHjnfkxv8Cz20AL1nXeLnU10Wm7fq1hjqwRGwh6fXvE0N
 1Y2BS41zoWnwqFbP9SLhPnFqJPmIURYMgxjgzN5UfJh9xSsDtF8y2xguefOiJnML
 6m8RhGWuTwQDHwVh0lOWUw=
Received: from localhost (unknown [49.235.41.28])
 by smtp12 (Coremail) with SMTP id EMCowAA3LI0dopNgKyxLpg--.2420S2;
 Thu, 06 May 2021 16:00:29 +0800 (CST)
Date: Thu, 6 May 2021 16:00:29 +0800
From: Hui Su <sh_def@163.com>
To: sh_def@163.com, qemu-discuss@nongnu.org, qemu-devel@nongnu.org
Subject: qemu support for aarch64 big.LITTLE architure
Message-ID: <20210506080029.GA1643985@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID: EMCowAA3LI0dopNgKyxLpg--.2420S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU1eOGUUUUU
X-Originating-IP: [49.235.41.28]
X-CM-SenderInfo: xvkbvvri6rljoofrz/1tbith2KX1r7tTcivwAAsA
Received-SPF: pass client-ip=220.181.12.16; envelope-from=sh_def@163.com;
 helo=m12-16.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 May 2021 09:48:46 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, all:

I was trying to find some ways to simulate aarch64 big.LITTLE
architecture these days, and i haven't find a way with qemu(i want to
do some test about linux eas scheduler, that's why i need to simulate
aarch64 big.LITTLE architecture board.)

Can any one do me a favor?

Thanks!


