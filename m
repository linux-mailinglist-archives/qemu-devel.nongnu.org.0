Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D410A30225D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 08:17:01 +0100 (CET)
Received: from localhost ([::1]:39384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3w7Q-0000t6-Bh
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 02:17:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <natechancellor@gmail.com>)
 id 1l3w1c-00007j-St
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 02:11:00 -0500
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:39054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <natechancellor@gmail.com>)
 id 1l3w1Y-0008NM-LK
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 02:11:00 -0500
Received: by mail-qv1-xf2e.google.com with SMTP id s6so5750482qvn.6
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 23:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kwFxyBvsQK/TwhU+VrJy0F6bF6G22xoiKNurG2/nPYI=;
 b=u118dKG8lLdYA08hvOgPdVp4JWyf7ZSzbE0YuwrEvinfM98jbzur+m/uYZZW4bjA91
 wl/07HmEDJsL1WRZTuzsM1feRu2LMDP5aUU8dw6Rv+LJDAWT014cBP8ShbGXPjIiA2z/
 ws2XM/honSoJrYEXGdGVlL24bEKiA76MbE9xgRsFFC6EcRtThg31iV4K44CGKegfceKw
 wUAKZRYDT0Mz5+RLhibVAubSWwlYOiLhYCLdM4nTLTVH5mXE3CCD1MCuedv+wKux/Kw1
 EGAlw00+BobdlQVB/FYwdRRbjf8vofOFkXqwuRLmFeL/RD/WR/NUyUGWe4bAu2eqcZ86
 1T3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kwFxyBvsQK/TwhU+VrJy0F6bF6G22xoiKNurG2/nPYI=;
 b=oV7w0/qyrx/kAnf9DOXgn6OaAx2CRqnNkeSoEBSQVFH19LWIUcxaH6pRdxGnL28mBy
 eZCIDZZQ6DD9eFyxOuFF49wRqHqwGgSAdlN5SjSGOF22vDXSC1OPhJAdB5OD056lVYGf
 A7JF9SGRgyZhAC3rOZl94cZOZXBno7dZ4v88ho/HyZsRge2QesCcoHN7eXlIyvPxvivR
 7AMLE3PIXVHhQmgoGvJyolas+MKy3Jrl7dUhXj+CI2JK3f2WAnvcY1yln0ZL9Imz13hJ
 GQa3x3dFFKnX30q8UsXxXEEZISuuKP7nIer6llEO39XwGQnKSlEqOmZ2zqt6v6JN7Olp
 BK1g==
X-Gm-Message-State: AOAM5327eyaIS2UGo3jiTWb5J9gC4ZE2c6+UltE0n6dEy7uuMO0s7ePR
 Zts4bvkmzuhFEaFZj1c5iM0=
X-Google-Smtp-Source: ABdhPJz6J9z8fxr578uagKTfUDEaN39X5aC/3t4Ry1jUh2NIkaexmFIxrw9dOYp1KYnyHSXmCMxnUA==
X-Received: by 2002:a05:6214:7aa:: with SMTP id v10mr537943qvz.2.1611558654308; 
 Sun, 24 Jan 2021 23:10:54 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id c7sm10508274qtc.82.2021.01.24.23.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 23:10:53 -0800 (PST)
Date: Mon, 25 Jan 2021 00:10:52 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Yang Weijiang <weijiang.yang@intel.com>
Subject: Re: [Qemu-devel][PATCH] x86/cpu: Use max host physical address if
 -cpu max option is applied
Message-ID: <20210125071052.GA307708@ubuntu-m3-large-x86>
References: <20210113090430.26394-1-weijiang.yang@intel.com>
 <20210124210829.GA2238365@ubuntu-m3-large-x86>
 <20210125054150.GA4969@local-michael-cet-test.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125054150.GA4969@local-michael-cet-test.sh.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=natechancellor@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 25, 2021 at 01:41:50PM +0800, Yang Weijiang wrote:
> On Sun, Jan 24, 2021 at 02:08:29PM -0700, Nathan Chancellor wrote:
> > On Wed, Jan 13, 2021 at 05:04:30PM +0800, Yang Weijiang wrote:
> > > QEMU option -cpu max(max_features) means "Enables all features supported by
> > > the accelerator in the current host", this looks true for all the features
> > > except guest max physical address width, so add this patch to enable it.
> > > 
> > > Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
> > > ---
> > >  target/i386/cpu.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > > index 35459a38bb..b5943406f7 100644
> > > --- a/target/i386/cpu.c
> > > +++ b/target/i386/cpu.c
> > > @@ -6673,7 +6673,7 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
> > >                  warned = true;
> > >              }
> > >  
> > > -            if (cpu->host_phys_bits) {
> > > +            if (cpu->host_phys_bits || cpu->max_features) {
> > >                  /* The user asked for us to use the host physical bits */
> > >                  cpu->phys_bits = host_phys_bits;
> > >                  if (cpu->host_phys_bits_limit &&
> > > -- 
> > > 2.17.2
> > > 
> > > 
> > 
> > Hi,
> > 
> > This patch as commit 5a140b255d ("x86/cpu: Use max host physical address
> > if -cpu max option is applied") prevents me from using '-cpu host' while
> > booting an i386_defconfig kernel.
> > 
> > $ qemu-system-i386 \
> > -append console=ttyS0 \
> > -cpu host \
> > -display none \
> > -enable-kvm \
> > -initrd rootfs.cpio \
> > -kernel bzImage \
> > -serial mon:stdio
> > qemu-system-i386: phys-bits should be between 32 and 36  (but is 48)
> > 
> > Am I expected to pass "-cpu host,host-phys-bits=false" now or did this
> > do something unexpected?
> >
> Hi, Nathan,
> Could you try Paolo's latest patch?
> 
> [PULL 03/31] x86/cpu: Use max host physical address if -cpu max option is applied

Hi Yang,

That is the version of the patch I tried, which has been pulled into the
master branch.

Cheers,
Nathan

