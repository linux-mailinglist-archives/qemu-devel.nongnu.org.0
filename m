Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6D2205342
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 15:17:19 +0200 (CEST)
Received: from localhost ([::1]:48342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnind-0001q0-LU
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 09:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1jnimK-0001LB-Nx
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 09:15:56 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:39674 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1jnimI-0000FX-VE
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 09:15:56 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 615F14C89B;
 Tue, 23 Jun 2020 13:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1592918149;
 x=1594732550; bh=M/3F70WDmO2uu/pgfl2MLCgrlWmCZfHZH2atOkb5Tw4=; b=
 Oaa79o99UdNUCzTjMAWr51xqJ6SKApDUuBYRJGuFW42Cc1NoLJS5XKvnFbJUq8bZ
 nCA7tKb6ZcrTPvbz1F6wTaex+FG0xsD1xX/6MHhRsbkAwDYJBWlAWoDLUfadDsec
 i9P3smqzwpLeV+yXRJJ9+rkDERMlwvFgG0URCRfprAA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 542jZsCQ_9yN; Tue, 23 Jun 2020 16:15:49 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 4BD154C855;
 Tue, 23 Jun 2020 16:15:49 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 23
 Jun 2020 16:15:49 +0300
Date: Tue, 23 Jun 2020 16:15:48 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH] configure: Don't warn about lack of PIE on macOS
Message-ID: <20200623131548.GB25104@SPB-NB-133.local>
References: <20200601124257.32057-1-r.bolshakov@yadro.com>
 <20200623124857.GH36568@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200623124857.GH36568@stefanha-x1.localdomain>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 09:15:51
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 23, 2020 at 01:48:57PM +0100, Stefan Hajnoczi wrote:
> On Mon, Jun 01, 2020 at 03:42:57PM +0300, Roman Bolshakov wrote:
> > ld64 is making PIE executables for 10.7 and above by default, as
> > documented in ld(1).
> > 
> > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > ---
> >  configure | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/configure b/configure
> > index af2ba83f0e..6dddbca4b2 100755
> > --- a/configure
> > +++ b/configure
> > @@ -2137,6 +2137,8 @@ elif compile_prog "-Werror -fPIE -DPIE" "-pie"; then
> >    QEMU_CFLAGS="-fPIE -DPIE $QEMU_CFLAGS"
> >    QEMU_LDFLAGS="-pie $QEMU_LDFLAGS"
> >    pie="yes"
> > +elif test "$darwin" = "yes"; then
> > +  pie="yes"
> 
> Hi Roman,
> I'm wondering why the elif above doesn't detect the presence of PIE
> automatically?
> 
>   elif compile_prog "-Werror -fPIE -DPIE" "-pie"; then
>     QEMU_CFLAGS="-fPIE -DPIE $QEMU_CFLAGS"
>     QEMU_LDFLAGS="-pie $QEMU_LDFLAGS"
>     pie="yes"
> 
> Can this code be tweaked to cover macOS too?
> 
> Also CCing Peter Maydell in case he wants to merge this patch directly
> into qemu.git.
> 
> Stefan

Hi Stefan,

It's because clang does not accept -pie/-no-pie directly:
  $ cc -Werror -fPIE -DPIE -pie main.c
  clang: error: argument unused during compilation: '-pie' [-Werror,-Wunused-command-line-argument]

It has to be passed as linker option, i.e. -Wl,-pie or -Wl,-no_pie. pie
is also a default behaviour of clang/ld64.

I had a patch to enable proper support of pie/no-pie for macOS but I see
little value in it. I don't know where no_pie would be helfpul becuase
clang from Apple Developer Tools can't cross-compile option ROMs.

Thanks,
Roman

