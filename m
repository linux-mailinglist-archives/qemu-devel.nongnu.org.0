Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA31A52A3E2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:54:22 +0200 (CEST)
Received: from localhost ([::1]:39584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqxeX-0004JK-Ln
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nqxaR-0000eV-5x; Tue, 17 May 2022 09:50:07 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:43126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1nqxaP-0000wF-6C; Tue, 17 May 2022 09:50:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 76228B81890;
 Tue, 17 May 2022 13:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F377AC385B8;
 Tue, 17 May 2022 13:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652795393;
 bh=QULsBHlyE4PvEf8BilFqy5wW9+YMxEx4GlT8Ah5yC8A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dOGOhONdKtV9tJxkvoXP9LhcQVtS1/7MVb73vtaXnEwRDDRikjMPfxQSAMptxRLps
 HLkUj8acwHkFalHZBMjgCXMyUW95nN/7N3mmzXty9+d2n/te1tyHGPzy1CtSZFfvub
 jY7XKXg5nSpyjHdm82HlsMElkWQ9eZVKykrBT0nS5ehBGjMwuIiKUQjgfRCUxp8rlH
 pLpC6N81qQIJZei7csa3CcmnW3DMdRGSKpbgdnniWGTB40Dp1oascAod8NAr08gYq1
 M7ySLRRuIacghiI4mGC2lLkwlIIuZ4OhzZUo+5VTglXUZhoe7uwPF4wu4CIf1G2zPj
 yBtm3fBmKKYMQ==
Date: Tue, 17 May 2022 07:49:49 -0600
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, ani@anisinha.ca, armbru@redhat.com,
 f4bug@amsat.org, fam@euphon.net, hreitz@redhat.com,
 imammedo@redhat.com, k.jensen@samsung.com, kwolf@redhat.com,
 lukasz.gieryk@linux.intel.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, stefanha@redhat.com, xypron.glpk@gmx.de
Subject: Re: [PATCH v8 00/12] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <YoOn/Swxq79LvH+B@kbusch-mbp.dhcp.thefacebook.com>
References: <20220509141620.3868733-1-lukasz.maniak@linux.intel.com>
 <YoJs//DV4ZTW9tDv@pbrzezix-mobl.ger.corp.intel.com>
 <YoOBWMmnW2Lc5a+/@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoOBWMmnW2Lc5a+/@apples>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=kbusch@kernel.org;
 helo=ams.source.kernel.org
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

On Tue, May 17, 2022 at 01:04:56PM +0200, Klaus Jensen wrote:
> > 
> > Should we consider this series ready to merge?
> > 
> 
> Hi Lukasz and Lukasz :)
> 
> Yes, I'm queing this up.

FWIW, this looks good to me. I was hoping to give it a test run, but I don't
think I'll get to that for another week or two, so don't wait for me if you
think you've sorted out your recent observation.

