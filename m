Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409BAEC347
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Nov 2019 13:55:09 +0100 (CET)
Received: from localhost ([::1]:38864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQWSJ-0006y3-Mj
	for lists+qemu-devel@lfdr.de; Fri, 01 Nov 2019 08:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46087)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iQWRB-0006Rl-To
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 08:53:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iQWRA-00026m-LG
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 08:53:57 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:33398)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iQWRA-00026d-Fb
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 08:53:56 -0400
Received: by mail-ot1-x343.google.com with SMTP id u13so8285183ote.0
 for <qemu-devel@nongnu.org>; Fri, 01 Nov 2019 05:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pRFndJFLOUaqMtfY76Brboh+jZoQQcbPk7lfMACRyWI=;
 b=bDrJddtZbLF/exz3aqleRzftQACDqhgh6+h31t4QFweHEdpm9o23cb3Ek1ac8yu2wj
 mxpIFSOg4h/9fhdqW5NjpVT0HVcmTe24kulDAoPB06qwfKyxffUck9ZW9pt1m+Yp944k
 wNt52Nlmjfw6DnuwsJPly5xIpeCHMa59BBf0za13RF/ZYqr6DvwI6+a4eXHbCc1Mf949
 5cO9L58fhUVKSSHRbSWSq4zE6OcpXMmUjacqNQFNy1ilk4rtQdnU8cTrKFwCEWpsrRWg
 JFBCPJaOvo7td6n3oNlAxOOrv5TS97FVUOaBQA1w0eamWHNzi4MKlVHczZwPtMMsHs0t
 XyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pRFndJFLOUaqMtfY76Brboh+jZoQQcbPk7lfMACRyWI=;
 b=thk6U4uLW3+T/fgACEeAloobW/GUwdeUncEDSO25jifbAfyV6LS6IbPEcq40zFAkHt
 AppDd+A2y1+FISmnUaojTjFDrEyYbsuG9OvsVef9HPsoyNDlBUyD52Hap0OXuD/0Q1TC
 b/d+8ergLpyxUcKGo6BmqzjyiC6Si5JQanfn5cypFrfaqXFTBr77yJMDgOgEs9P9l46g
 xeaTiNKxqKy06QANg2R1Xiz5kqlmvki8FQgqQMddmiFY+7w46CSwkcvsqmR7McrRNL4H
 4GDdROdPYaHBtzEIxeA+Fu8sWQpgmFodZ3GCSoc3xE855NP+zBUhy42nnCjQT2EmfRZH
 ArVw==
X-Gm-Message-State: APjAAAVNg6no6GWRFoe9Ntlmpv52vrjKFUNVrsbhBQkteD6eQcAp5hjj
 nUMxabhTJGzXKIMuxO2/Uo2l4pTPb00hq9jsPe6pdQ==
X-Google-Smtp-Source: APXvYqwfRP0Rgt2pyrICPfTrjII4hEuzgRrwuuFnHcWWa1WgbaGYNyybFTAal2UkQvDhVly/cDC96l348T1XEdMXBdc=
X-Received: by 2002:a9d:7385:: with SMTP id j5mr8515934otk.135.1572612835377; 
 Fri, 01 Nov 2019 05:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20191101085140.5205-1-peter.maydell@linaro.org>
 <CAFEAcA-N-Fh7+NCHGPXuK-H6DUTOwjfCU6rmZGz4k8n+tkKdxw@mail.gmail.com>
 <20191101095438.a6wd2mal4w75irvg@kamzik.brq.redhat.com>
 <CAFEAcA9_PMjhEgMn3qnr1xsiGU5YkNr1KeCvez6pFm=93EzTpA@mail.gmail.com>
In-Reply-To: <CAFEAcA9_PMjhEgMn3qnr1xsiGU5YkNr1KeCvez6pFm=93EzTpA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Nov 2019 12:53:42 +0000
Message-ID: <CAFEAcA9iTS8SXTFyGPwk+Wn_Aw-2rd9Wb_N3cH8iAxSOzzYyVg@mail.gmail.com>
Subject: Re: [PULL 00/11] target-arm queue
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Nov 2019 at 10:34, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 1 Nov 2019 at 09:54, Andrew Jones <drjones@redhat.com> wrote:
> > Darn it. Sorry about that, but if it's still failing then I think QEMU
> > must believe KVM is enabled, i.e. kvm_enabled() in QEMU must be true.
> > I can try to confirm that and fix it, but I'll need to set up this
> > environment first.
>
> Yeah, it looks like trying to run with KVM in an aarch32 chroot
> doesn't work but we don't notice it -- in qemu kvm_init() succeeds
> but then we fail when we try to actually create CPUs, so:
> $ ./arm-softmmu/qemu-system-arm -M virt -M accel=kvm:tcg
> qemu-system-arm: kvm_init_vcpu failed: Invalid argument
>
> we barf rather than falling back to tcg the way we ought to.

I spoke to Christoffer and Marc about this, and they reckoned
this was basically a kernel bug (and ideally a 64-bit kernel
should just refuse to open /dev/kvm for an aarch32-compat
userspace process, because it doesn't provide the aarch32 KVM
interface, only the aarch64 one).

In the meantime, we should just bodge whatever we need to
in this test to cause us not to bother to try to run the test,
in whatever is the most expedient way.

thanks
-- PMM

