Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC89A307BFC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:17:09 +0100 (CET)
Received: from localhost ([::1]:34908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Auq-0000dG-NB
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:17:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l5AqH-0007Gy-Bx; Thu, 28 Jan 2021 12:12:26 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:38076 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l5AqC-0005VX-13; Thu, 28 Jan 2021 12:12:25 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 5F84641279;
 Thu, 28 Jan 2021 17:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1611853935;
 x=1613668336; bh=vqstYAQyEx9Op7OzbbJqBv83k1ndlIG2eEZM76UKHL8=; b=
 SADyM2cPiRJwf9HkD2hjcX1bDBjw0AOBkuMNUTLa7Emg+BEUGhy8DnKebKVbmnLk
 AVk20ln3DEb17EB/UpBk6Kx6M3k2ARIXQue6VPWgCEeiAFFn8bVeMgKg6IhB+8WF
 uqrGr4kXwC/plAr79do8UVPJSazIK9rFtKUxw/GdWIc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CUx1SYK8zSeC; Thu, 28 Jan 2021 20:12:15 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 2159C4126E;
 Thu, 28 Jan 2021 20:12:15 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 28
 Jan 2021 20:12:15 +0300
Date: Thu, 28 Jan 2021 20:12:14 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH v6 00/11] hvf: Implement Apple Silicon Support
Message-ID: <YBLwbuXQeHChhg0M@SPB-NB-133.local>
References: <20210120224444.71840-1-agraf@csgraf.de>
 <CAFEAcA_jAWPO09K_O2SceAmcbNDSaNvL3yp3D_=tsY6QeaKMZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_jAWPO09K_O2SceAmcbNDSaNvL3yp3D_=tsY6QeaKMZw@mail.gmail.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Alexander Graf <agraf@csgraf.de>, Frank Yang <lfy@google.com>,
 Peter Collingbourne <pcc@google.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 28, 2021 at 04:59:47PM +0000, Peter Maydell wrote:
> On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
> >
> > Now that Apple Silicon is widely available, people are obviously excited
> > to try and run virtualized workloads on them, such as Linux and Windows.
> >
> > This patch set implements a fully functional version to get the ball
> > going on that. With this applied, I can successfully run both Linux and
> > Windows as guests. I am not aware of any limitations specific to
> > Hypervisor.framework apart from:
> >
> >   - Live migration / savevm
> >   - gdbstub debugging (SP register)
> >
> 
> I've gone through making code review comments.
> 
> Since patch 1 is also required for Big Sur support on x86 Macs,
> I'll take that via target-arm.next now (unless anybody would rather
> it went in via a different route).
> 

Hi Peter,

I wonder if patch 1 and patch 2 should go via Paolo's i386 or misc tree?
(IMO whatever the fastest way to master works).

Both are reviewed and nobody raised objections to them.

Thanks,
Roman

