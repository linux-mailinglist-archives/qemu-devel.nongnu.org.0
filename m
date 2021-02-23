Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D76633228D1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 11:27:59 +0100 (CET)
Received: from localhost ([::1]:58124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEUv8-000689-TZ
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 05:27:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lEUtp-000559-KG
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 05:26:38 -0500
Received: from zuban.uni-paderborn.de ([2001:638:502:c003::17]:59356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lEUtm-0002e6-Vt
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 05:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=636Q7rfqo3ZsAz0L0fwEqkBzQ0SiKEr4XNqjQetIg5Q=; b=anxH3fIx45IiWM7aeDeH/RBzKy
 s3F4yM7gCYU4QNe1U5Xv00R0PGckLv5GmQUNe55A7vGYK91WudG0FFLugqA1cKZ88fHIpwiefSJIZ
 HIN4cn1RS9nZWQq97yplLhpgmdKpHnPwgq6JNd4l3hrEuy6822YmIgcJ6lXpx1c2XVcE=;
Date: Tue, 23 Feb 2021 11:25:55 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 00/15] tests/tcg: Add TriCore tests
Message-ID: <20210223102555.fyrrlg24vuk7urxj@schnipp-desktop>
References: <20200604085441.103087-1-kbastian@mail.uni-paderborn.de>
 <29328969-9f3a-182f-4fa8-08643f4afab4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29328969-9f3a-182f-4fa8-08643f4afab4@redhat.com>
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.2.23.101817, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.2.8.5800000
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::17;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=zuban.uni-paderborn.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

On Mon, Feb 22, 2021 at 10:23:23AM +0100, Thomas Huth wrote:
> On 04/06/2020 10.54, Bastian Koppelmann wrote:
> > Hi Alex,
> > 
> > I managed to update the series to successfully run make check-tcg. This required
> > some changes to the makefiles. I tried running the riscv64 and arm tests and so
> > far I didn't break anything.
> > 
> > You can find the full tree here:
> > https://github.com/bkoppelmann/qemu/tree/tricore-tcg-tests
> > 
> > Cheers,
> > Bastian
> > 
> > Bastian Koppelmann (15):
> >    docker/tricore: Use stretch-slim as a base image
> >    tests/tcg: Add docker_as and docker_ld cmds
> >    tests/tcg: Run timeout cmds using --foreground
> >    hw/tricore: Add testdevice for tests in tests/tcg/
> >    tests/tcg/tricore: Add build infrastructure
> >    tests/tcg/tricore: Add macros to create tests and first test 'abs'
> >    tests/tcg/tricore: Add bmerge test
> >    tests/tcg/tricore: Add clz test
> >    tests/tcg/tricore: Add dvstep test
> >    tests/tcg/tricore: Add fadd test
> >    tests/tcg/tricore: Add fmul test
> >    tests/tcg/tricore: Add ftoi test
> >    tests/tcg/tricore: Add madd test
> >    tests/tcg/tricore: Add msub test
> >    tests/tcg/tricore: Add muls test
> 
>  Hi Bastian,
> 
> I'm currently looking at the containers that we build in the gitlab-CI, and
> it seems that the "debian-tricore-cross" container is currently always built
> though it is never used.
> So I'm wondering: Do you still plan to finish this series here and get it
> merged, or could we remove the "debian-tricore-cross" container from the
> gitlab-CI again?

yes, I'm still working on it. However, right now I have limited time. I plan
work on it again in the beginning of March.

Cheers,
Bastian

