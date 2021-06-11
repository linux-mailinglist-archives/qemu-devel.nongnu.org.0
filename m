Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 537FE3A4A98
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 23:27:11 +0200 (CEST)
Received: from localhost ([::1]:48372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrogH-0005DA-SS
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 17:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nirsof@gmail.com>)
 id 1lroct-00079h-Mg; Fri, 11 Jun 2021 17:23:39 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:33629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nirsof@gmail.com>)
 id 1lroce-0008AU-LT; Fri, 11 Jun 2021 17:23:39 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id 126so4588709vsi.0;
 Fri, 11 Jun 2021 14:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KdRm5HvKaa81Uj8xNcnuC3v7v6N07SgTqBRxECrLDBQ=;
 b=AXkpSUogIQ+LzmtULry99RjmYT/LWMWLBwsswJfTDPY/zlRTCaQiIaeuDAMufl0h4i
 4UjfQ+G9KMf1nYsmN1SujUKpvvfOa1k3Wjz8ruIn7pWmLfDYL0EdY5SjqUmElP+pvypS
 gO58Zu6opmhpejtTeNcVdu5aHul0CO6I82bfrIm80IcbHT9D47wRrAvI0ZkVJ7Kvv8Ls
 Cq+x70XsZOsqhLzlhdq40sZaB5jVO7ZPoSBhdMOO1qzrxbF5EmFC7Zl8u70K17clDCRd
 PQS/uCLtv/H2kRHvU/LpVenQwqHRW7EqSROGc8PuP86FP5Epz2mknyEnP1SLGiifGaVR
 MsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KdRm5HvKaa81Uj8xNcnuC3v7v6N07SgTqBRxECrLDBQ=;
 b=PdHBKzCwav91CxCYjW4B0HxXuuuUBEDRZlSndskW/CW3G6MtDgxWnxInEEI8m5V6jA
 jxZigi61bvxerjHQ0z4Wx9gZ1lk90TIiDI9WqwepibeokI5G6lQNJejtaqUEhgQ/dMhO
 maPeLFY1GDuEdmc7TyRd9MaPDeeOXoAuNP3hn7D1Ofca/05JfPMNvfjAXYIy20MHuIWy
 AV2bUkNkPr9Oo+QabMYbCKHIcNm1lQJxIZQFrtmc+vYE4zS56IXEs+xWKu4R/CO2/qsU
 1EnNhBAAqojdJk0AWm6IQucrs8+HxJj1Bv4hTBB1Ag0ZmVZZgqY/sK0JxuHgKSeXkXFb
 2HZw==
X-Gm-Message-State: AOAM530P/6UXqu35v091vSLi8GYMtjmDO59JwjkgC44+vcLdk1zzdNeX
 SlWBWLIhLw1TMN7BNaX8ibbCraNogWt8V5Ui4js=
X-Google-Smtp-Source: ABdhPJxDOnZ1aVmIT5/NX+kkHSp5iPa9Jldvo5NG+LWO6XDmbJzmmC49fLjYoFBiOEfTYB+YjmscGfWL7GSFX2Y/yuo=
X-Received: by 2002:a67:334c:: with SMTP id z73mr12240981vsz.44.1623446602944; 
 Fri, 11 Jun 2021 14:23:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210607202204.1805199-1-nsoffer@redhat.com>
 <20210607212224.tiqjvvdwosvhrvz7@redhat.com>
 <CAMRbyyukE9iTmM6OB_xAA1n6tRiRRxwKojaO5wzRwAR-8-FX3g@mail.gmail.com>
 <20210610183443.clk43ngkobzyjopy@redhat.com>
 <CAMRbyysoYhcyiP2mWubfZsj09k=Ea_3-RPr+Tt7KvoE1z3jrNA@mail.gmail.com>
 <20210610204617.fuj4ivqrixpz4qfj@redhat.com> <YMMaJcKYe8nHDdjU@redhat.com>
 <20210611132830.i6wwm3fvytri6czu@redhat.com>
 <CAMRbyytDeniKkg4Bjcqry8203RHWzAKmAMdSELnLquBkXJNXvQ@mail.gmail.com>
 <20210611183443.bnw6npo53lbvfp2h@redhat.com>
In-Reply-To: <20210611183443.bnw6npo53lbvfp2h@redhat.com>
From: Nir Soffer <nirsof@gmail.com>
Date: Sat, 12 Jun 2021 00:23:06 +0300
Message-ID: <CAMr-obsNTUzEf96U=Fgqwa1cOqpC8q8cTJ78cm1Yx3c+PbhvMg@mail.gmail.com>
Subject: Re: [PATCH] qemu-{img,nbd}: Don't report zeroed cluster as a hole
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=nirsof@gmail.com; helo=mail-vs1-xe2b.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11, 2021 at 9:34 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Fri, Jun 11, 2021 at 08:35:01PM +0300, Nir Soffer wrote:
> > On Fri, Jun 11, 2021 at 4:28 PM Eric Blake <eblake@redhat.com> wrote:
> > >
> > > On Fri, Jun 11, 2021 at 10:09:09AM +0200, Kevin Wolf wrote:
> > > > > Yes, that might work as well.  But we didn't previously document
> > > > > depth to be optional.  Removing something from output risks breaking
> > > > > more downstream tools that expect it to be non-optional, compared to
> > > > > providing a new value.
> > > >
> > > > A negative value isn't any less unexpected than a missing key. I don't
> > > > think any existing tool would be able to handle it. Encoding different
> > > > meanings in a single value isn't very QAPI-like either. Usually strings
> > > > that are parsed are the problem, but negative integers really isn't that
> > > > much different. I don't really like this solution.
> > > >
> > > > Leaving out the depth feels like a better suggestion to me.
> > > >
> > > > But anyway, this seems to only happen at the end of the backing chain.
> > > > So if the backing chain consistents of n images, why not report 'depth':
> > > > n + 1? So, in the above example, you would get 1. I think this has the
> > > > best chances of tools actually working correctly with the new output,
> > > > even though it's still not unlikely to break something.
> > >
> > > Ooh, I like that.  It is closer to reality - the file data really
> > > comes from the next depth, even if we have no filename at that depth.
> > > v2 of my patch coming up.
> >
> > How do you know the number of the layer? this info is not presented in
> > qemu-img map output.
...
> Otherwise, you do have a point: "depth":1 in isolation is ambiguous
> between "not allocated anywhere in this 1-element chain" and
> "allocated at the first backing file in this chain of length 2 or
> more".  At which point you can indeed use "qemu-img info" to determine
> the backing chain depth.  How painful is that extra step?  Does it
> justify the addition of a new optional "backing":true to any portion
> of the file that was beyond the end of the chain (and omit that line
> for all other regions, rather than printing "backing":false)?

Dealing with depth: N + 1 is not that painful, but also not great.

I think it is worth a little more effort, and it will save time in the long term
for users and for developers. Better APIs need simpler and shorter
documentation and require less support.

I'm not sure about backing: false, maybe absent: true to match libnbd?

Nir

