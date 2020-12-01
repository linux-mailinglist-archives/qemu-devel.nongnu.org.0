Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4C02CAF32
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 22:55:03 +0100 (CET)
Received: from localhost ([::1]:36782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkDbx-0000PK-QA
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 16:55:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1kkDaG-0007Yc-Po
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 16:53:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:39516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1kkDa9-0006on-DE
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 16:53:16 -0500
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9899920709;
 Tue,  1 Dec 2020 21:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606859584;
 bh=+8j5Cr7Udl646H33AE6LGGuJTu/n6y5ALxWeOYIfQ+0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=PjNRIymDYEBOwfOS/Hgq4r4yiuh3blmeDIJoTqaToQm+oiXjRkgtYsPmHw/OqO/KS
 n0Jul98zpEBxsipmxakN7DOAaP2+i2ZNkeBMYyU9Z09dap7N7t/KeLLRmRMt5QgjY3
 T2Jw0J2Yi7bYnYc96w1kZ875TpkGkE/fhiN162rM=
Date: Tue, 1 Dec 2020 13:53:02 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 11/13] xen: remove GNUC check
In-Reply-To: <CAFEAcA96h-06YHhugeq5NLg9_yvJ033Sy0GKqU=oKJoXQPnWpQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2012011352020.1100@sstabellini-ThinkPad-T480s>
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-12-marcandre.lureau@redhat.com>
 <CAFEAcA96h-06YHhugeq5NLg9_yvJ033Sy0GKqU=oKJoXQPnWpQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1809873567-1606859584=:1100"
Received-SPF: pass client-ip=198.145.29.99;
 envelope-from=sstabellini@kernel.org; helo=mail.kernel.org
X-Spam_score_int: -85
X-Spam_score: -8.6
X-Spam_bar: --------
X-Spam_report: (-8.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1809873567-1606859584=:1100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 26 Nov 2020, Peter Maydell wrote:
> On Thu, 26 Nov 2020 at 11:30, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> >
> > QEMU requires Clang or GCC, that define and support __GNUC__ extensions
> >
> > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/hw/xen/interface/io/ring.h | 9 ---------
> >  1 file changed, 9 deletions(-)
> 
> >From QEMU's POV this change is good, but this header seems to have
> originally been an import from the Xen public headers -- are we
> happy to diverge from that original or do we prefer to stay as
> close as possible to the upstream header? Cc'ing the Xen maintainers
> for their opinion.

Small divergences are not a problem. I think this is OK.


> > diff --git a/include/hw/xen/interface/io/ring.h b/include/hw/xen/interface/io/ring.h
> > index 5d048b335c..115705f3f4 100644
> > --- a/include/hw/xen/interface/io/ring.h
> > +++ b/include/hw/xen/interface/io/ring.h
> > @@ -206,21 +206,12 @@ typedef struct __name##_back_ring __name##_back_ring_t
> >  #define RING_HAS_UNCONSUMED_RESPONSES(_r)                               \
> >      ((_r)->sring->rsp_prod - (_r)->rsp_cons)
> >
> > -#ifdef __GNUC__
> >  #define RING_HAS_UNCONSUMED_REQUESTS(_r) ({                             \
> >      unsigned int req = (_r)->sring->req_prod - (_r)->req_cons;          \
> >      unsigned int rsp = RING_SIZE(_r) -                                  \
> >          ((_r)->req_cons - (_r)->rsp_prod_pvt);                          \
> >      req < rsp ? req : rsp;                                              \
> >  })
> > -#else
> > -/* Same as above, but without the nice GCC ({ ... }) syntax. */
> > -#define RING_HAS_UNCONSUMED_REQUESTS(_r)                                \
> > -    ((((_r)->sring->req_prod - (_r)->req_cons) <                        \
> > -      (RING_SIZE(_r) - ((_r)->req_cons - (_r)->rsp_prod_pvt))) ?        \
> > -     ((_r)->sring->req_prod - (_r)->req_cons) :                         \
> > -     (RING_SIZE(_r) - ((_r)->req_cons - (_r)->rsp_prod_pvt)))
> > -#endif
> >
> >  /* Direct access to individual ring elements, by index. */
> >  #define RING_GET_REQUEST(_r, _idx)                                      \
--8323329-1809873567-1606859584=:1100--

