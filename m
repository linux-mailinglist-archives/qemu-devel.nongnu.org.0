Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 163CB46D955
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 18:13:20 +0100 (CET)
Received: from localhost ([::1]:40266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv0VL-00015g-6h
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 12:13:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@colorremedies.com>)
 id 1mv0Rq-0006Z6-QF
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 12:09:43 -0500
Received: from [2607:f8b0:4864:20::b2a] (port=40792
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chris@colorremedies.com>)
 id 1mv0Rn-0005Hc-N5
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 12:09:42 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id 131so7494895ybc.7
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 09:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=colorremedies-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nUOCCwERsiAdkftIilxYjt7sMB07w0Aw7ZE6U72nToY=;
 b=ydwJqeSrwGb5kN9CFJL2J40jM6FNTAbaqRAmuH4a+1dG69EjKIjsUxoRr/3INzl/mh
 bvHj1l4mHw/40ly3ZpIw9jRw48NosBJgbQcDYLoPIpAvBDKxh+GGYw7bKRNcToISOnbc
 9L4p/wsWuEJvl0wk8qh/67ffFX8ZMXbpZkpPyoF8JROl0i0lMi2gM051+5bbcf/4uDIH
 TRi+Y9OYi3jeDYxZjiYAk4rZQ/aav9IwpwQIYyTL6NmTilQzlmXDm8hl4cJzo/OxpeEw
 iG1OnZwJR4Uc5+r0mkSw7hBO5zou99d/az2nm6gqwoIEdpgihoV4rWRJJyxtfxN3zQN6
 Vy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nUOCCwERsiAdkftIilxYjt7sMB07w0Aw7ZE6U72nToY=;
 b=EP5Hca6UL9jMwGDiTMeUTadv0pinchuP9vh/MaEx7eHAGcK6pZtpxtVHupLRmZNX8W
 1Fqot4sghfj2GLHyL9crkDCKITgVTFgrrmp3Sz9sIV4KjBqmc1lLutof346MZPflfBRa
 OwLlF5yAA1SIUncKezRJIzCdjszb2iEJBnGRnuKJxNqY//jRiArr4Raiao55RbnRnJjt
 au6XUnr/r4RjQu9L7q/wgnB2ACEbXEeCM2xwRzd/9YztdM4JxkQxN/sQMhHd/DuK1bau
 WkfLdYFmg2Vzes9yD0B2CTXeXS9UvyTgaN9h8CyXiN4Y0dGI2ypE60/7iZRjWD5lHtCj
 fsBA==
X-Gm-Message-State: AOAM533hHXfd2QHu1D8TQOB4Eq0CXYAHjDQfTnFFIDf8GJ05rOc8k9MI
 d739Tjgs5e7ExDjTDAvmoLvWbafsIWmk4FomP1KWUw==
X-Google-Smtp-Source: ABdhPJx1JNbWtK7HoaHftGxEdC8QXoFVlqqI4oL/Q7n9xsAzch2AQKRq4GthFfjo9C+wc8clvH9ZTMt9Tc0L2yGdiIU=
X-Received: by 2002:a25:287:: with SMTP id 129mr63010099ybc.524.1638983378187; 
 Wed, 08 Dec 2021 09:09:38 -0800 (PST)
MIME-Version: 1.0
References: <CAJCQCtSx_OFkN1csWGQ2-pP1jLgziwr0oXoMMb4q8Y=UYPGqAg@mail.gmail.com>
 <Ya/fb2Lc6OoHw7CP@google.com>
In-Reply-To: <Ya/fb2Lc6OoHw7CP@google.com>
From: Chris Murphy <lists@colorremedies.com>
Date: Wed, 8 Dec 2021 12:09:22 -0500
Message-ID: <CAJCQCtTzQAWdMOp_JKMw-UTocBg=qBhm2ZCU_ykiY5Epe9Bn_Q@mail.gmail.com>
Subject: Re: dozens of qemu/kvm VMs getting into stuck states since kernel
 ~5.13
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=chris@colorremedies.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Chris Murphy <lists@colorremedies.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 7, 2021 at 5:25 PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Tue, Dec 07, 2021, Chris Murphy wrote:
> > cc: qemu-devel
> >
> > Hi,
> >
> > I'm trying to help progress a very troublesome and so far elusive bug
> > we're seeing in Fedora infrastructure. When running dozens of qemu-kvm
> > VMs simultaneously, eventually they become unresponsive, as well as
> > new processes as we try to extract information from the host about
> > what's gone wrong.
>
> Have you tried bisecting?  IIUC, the issues showed up between v5.11 and v5.12.12,
> bisecting should be relatively straightforward.

We haven't tried bisecting. Due to limited access since it's a
production machine, and limited resources for those who have that
access, I think the chance of bisecting is low, but I've asked. We
could do something of a faux-bisect by running already built kernels
in Fedora infrastructure. We could start by running x.y.0 kernels to
see when it first appeared, then once hitting the problem, start
testing rc1, rc2, ... in that series. We also have approximately daily
git builds in between those rc's. That might be enough to deduce a
culprit, but I'm not sure. At the least this would get us a ~1-3 day
window within two rc's for bisecting.

>
> > Systems (Fedora openQA worker hosts) on kernel 5.12.12+ wind up in a
> > state where forking does not work correctly, breaking most things
> > https://bugzilla.redhat.com/show_bug.cgi?id=2009585
> >
> > In subsequent testing, we used newer kernels with lockdep and other
> > debug stuff enabled, and managed to capture a hung task with a bunch
> > of locks listed, including kvm and qemu processes. But I can't parse
> > it.
> >
> > 5.15-rc7
> > https://bugzilla-attachments.redhat.com/attachment.cgi?id=1840941
> > 5.15+
> > https://bugzilla-attachments.redhat.com/attachment.cgi?id=1840939
> >
> > If anyone can take a glance at those kernel messages, and/or give
> > hints how we can extract more information for debugging, it'd be
> > appreciated. Maybe all of that is normal and the actual problem isn't
> > in any of these traces.
>
> All the instances of
>
>   (&vcpu->mutex){+.+.}-{3:3}, at: kvm_vcpu_ioctl+0x77/0x720 [kvm]
>
> are uninteresting and expected, that's just each vCPU task taking its associated
> vcpu->mutex, likely for KVM_RUN.
>
> At a glance, the XFS stuff looks far more interesting/suspect.

Thanks for the reply.

-- 
Chris Murphy

