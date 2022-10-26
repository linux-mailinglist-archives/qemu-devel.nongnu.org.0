Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBFE60E48B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 17:34:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oniJI-0004me-I1; Wed, 26 Oct 2022 11:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=RjEe=23=zx2c4.com=Jason@kernel.org>)
 id 1oniJG-0004mX-Sd
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 11:27:14 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=RjEe=23=zx2c4.com=Jason@kernel.org>)
 id 1oniJF-0004v6-4J
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 11:27:14 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F28EA61F58;
 Wed, 26 Oct 2022 15:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF822C433D6;
 Wed, 26 Oct 2022 15:27:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="afqI5lYX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666798020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eCihM+NiYnuwBvPcgpX6lbCor/9od8bvkb1Ri5seMvg=;
 b=afqI5lYX9ZkZix5Ny0y2bjdylsvAAnA1rLBsVTelYFCmdt5a13z1yE7XhcZNXxaetEBqhD
 Af24Bsw46vQZ2/j1ZT/gtNSiVnWzrXvfQ+buQRiLegsichvWZhfWRjberIGpRoiR73xxOx
 fyPndU27pNM6MnswcsJazp+LNHOBb2U=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eea6f2d3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 26 Oct 2022 15:26:59 +0000 (UTC)
Date: Wed, 26 Oct 2022 17:26:53 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PULL 00/30] target-arm queue
Message-ID: <Y1lRvYdD0z7RlWjd@zx2c4.com>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
 <CAJSP0QU0=S3SwRweGAt_dMcYLNZXw+F+umopgXAzVxduQHJYQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJSP0QU0=S3SwRweGAt_dMcYLNZXw+F+umopgXAzVxduQHJYQQ@mail.gmail.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=RjEe=23=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Oct 26, 2022 at 10:49:18AM -0400, Stefan Hajnoczi wrote:
> On Tue, 25 Oct 2022 at 12:51, Peter Maydell <peter.maydell@linaro.org> wrote:
> > target-arm queue:
> >  * Implement FEAT_E0PD
> >  * Implement FEAT_HAFDBS
> 
> This commit breaks CI:

Ah, so when this is respun, there'll be an opportunity for Peter to pull
in the left-out commit from my series now that I've posted a fixed
version of that. Pfiew! Count down til the soft freeze... :)

Jason

