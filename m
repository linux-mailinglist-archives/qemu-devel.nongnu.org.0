Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB1F3C69C9
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 07:39:50 +0200 (CEST)
Received: from localhost ([::1]:50546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3B92-000695-Bj
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 01:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+5ed7718f52b0c846131f+6533+infradead.org+hch@casper.srs.infradead.org>)
 id 1m3B0V-0002r9-7y; Tue, 13 Jul 2021 01:30:59 -0400
Received: from casper.infradead.org ([2001:8b0:10b:1236::1]:49750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+5ed7718f52b0c846131f+6533+infradead.org+hch@casper.srs.infradead.org>)
 id 1m3B0S-0008HL-TO; Tue, 13 Jul 2021 01:30:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sB+NFj9NADKAxiEcRKRS7St86v6A8h4ntYhh2hdlodA=; b=LN1XKIoPELsBvXzKzzaBw4VzYF
 iGXLvwamc+iMaAunMrBmSmdhd2dRIXVTPAN/MkZ6y5Jbxh5aqZ1SLwj6/M/pwpid9QNOhrgk/Qp1N
 3/LdjyhgIT8skCpgoyLVGs6D+rf5ZGeh3q3uSm+10AX2Ggz6YC0fZRI8IyXM7mOk4kBBgDrJuhHMP
 UeMD9oMHg5cJJp2Jo2DNgBjR2fnVbUo+zGi1aQFiZ/ezofsjVovKXnA91B8c6NSiAYTe9pYPQMqy7
 9lSuMil0vUTRrO8bIGEZfI6YkPlxXIWxbcM3bKxfzQIP3pOJyTW8fxMIl2S/0htVDo0xrqdGMoYAQ
 7DMbl95g==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m3B00-000lln-Nl; Tue, 13 Jul 2021 05:30:30 +0000
Date: Tue, 13 Jul 2021 06:30:28 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH 1/2] hw/nvme: add mi device
Message-ID: <YO0k9JFO93EMaFIj@infradead.org>
References: <CGME20210709135651epcas5p1c544dec5377413bfa4b2eeab6ee43f26@epcas5p1.samsung.com>
 <20210709135545.GA11148@test-zns>
 <YOwhf59Xb/9IkZ9K@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOwhf59Xb/9IkZ9K@stefanha-x1.localdomain>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+5ed7718f52b0c846131f+6533+infradead.org+hch@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, jg123.choi@samsung.com,
 qemu-block@nongnu.org, k.jensen@samsung.com, d.palani@samsung.com,
 qemu-devel@nongnu.org, linux-nvme@lists.infradead.org, mreitz@redhat.com,
 its@irrelevant.dk, u.kishore@samsung.com,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>, kbusch@kernel.org,
 javier.gonz@samsung.com, prakash.v@samsung.com, mohit.kap@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 12, 2021 at 12:03:27PM +0100, Stefan Hajnoczi wrote:
> Why did you decide to implement -device nvme-mi as a device on
> TYPE_NVME_BUS? If the NVMe spec somehow requires this then I'm surprised
> that there's no NVMe bus interface (callbacks). It seems like this could
> just as easily be a property of an NVMe controller -device
> nvme,mi=on|off or -device nvme-subsys,mi=on|off? I'm probably just not
> familiar enough with MI and NVMe architecture...

I'm too far away from qemu these days to understand what TYPE_NVME_BUS
is.  Bt NVMe-MI has tree possible transports:

 1) out of band through smbus.  This seems something that could be
    trivially modelled in qemu
 2) out of band over MCTP / PCIe VDM.
 3) in band using NVMe admin commands that pass through MI commands

