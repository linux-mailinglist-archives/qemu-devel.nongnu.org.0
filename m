Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 794DF6A7911
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 02:39:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXXu9-0002NA-SG; Wed, 01 Mar 2023 20:38:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajaysjoshi1978@gmail.com>)
 id 1pXXa8-0001qd-M4
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 20:18:04 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajaysjoshi1978@gmail.com>)
 id 1pXXa5-0000p6-TF
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 20:18:03 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so658497wmb.3
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 17:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KUlICSsItzogtsE+dYcejxsa1xJXEIYNaUAlJE/kEm0=;
 b=ACR46OnbqMFt8tfJ//F7wfCxEcoQ+TXrRgq3KRKcLOd0od/ZsUseqoeYH2IO3rwN6P
 Mr+DbgEAkB8TiYsyFSYVELeeMpVrJM4xXRoNGnR/12mWUQaKUvLufj8GFtghMZAqwdD9
 Ji6VLn+3e8STjO8jc0Bm4p/sq5lBd20oAV3F1f0WzqSQlwFA8p6GxCMFFijXqqDcod08
 2GInK+b5GwxNVlU5FuDZKb5JAGAOfuELvcqJYNA/61meFlXcX5z5WDqKTqCjFl/juZCo
 wUhSD5+tE2ql+npIwdfHDtGXOANlBTwOt1rTVdAXaTJcfSEEeERq4L1pj/v3Ifr2N99n
 /2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KUlICSsItzogtsE+dYcejxsa1xJXEIYNaUAlJE/kEm0=;
 b=UA+bFTY7JjkYdmrI+w8NEeYDyvTXbUV/+X799KvMgzgGfH3Cu1QmobFWdx9b0jmZ6t
 HzdDFPPQM/ZAjWirPjnkZDylvHJ9x3QoBwdRqM6Cjt7nEm4QptOWxCSawljOQcHIDv1x
 bnqwJcLOFDxOa+Ah7u9p3EVOR8IOxhDtrvHWpiD1lNzFphLbDSCDHfX2i+XzIB4JTxKd
 mne+ellFzECL6Q7goyzW6zkzwP+H/ISdBjOp00W+kVc6BfSfwMey8bshE8hdS9CAXWM/
 XAxZWLJd7EIe48DIJV7D+1ipjaEJ0sWyofQmQjgTpkzhH2cD57GL8Bice/HDU15kPXhb
 ALZg==
X-Gm-Message-State: AO0yUKWzGj++fwingBkrYpJbDTf1SmHOmU5SgkfhGMPl6zzIoBtUuwNd
 SkkcEEerf9LSW0bKccG4sWHc3/2kVISCtQH6SNU=
X-Google-Smtp-Source: AK7set+QWhNMKWZY+9vXt4zAcZPVKgozO8BgB3yYArSjmnScbTlXwgAEjYP8oAwayV50wkrWYa0+wtUQmi0NLKww6Uw=
X-Received: by 2002:a05:600c:3c9b:b0:3df:97ed:dde8 with SMTP id
 bg27-20020a05600c3c9b00b003df97eddde8mr2411874wmb.5.1677719878772; Wed, 01
 Mar 2023 17:17:58 -0800 (PST)
MIME-Version: 1.0
References: <Y/Cm5nuJl3G2CG2p@memverge.com>
 <b066510e-8420-26ba-019b-fef2b255634e@wdc.com>
 <20230228104916.00003d9a@Huawei.com>
In-Reply-To: <20230228104916.00003d9a@Huawei.com>
From: Ajay Joshi <ajaysjoshi1978@gmail.com>
Date: Thu, 2 Mar 2023 06:47:47 +0530
Message-ID: <CAJmyj+CqfJY2kPQC5UzQWuHgnDfdrcAuPMdDj2REmHMcrmQyYA@mail.gmail.com>
Subject: Re: [RFC] CXL: TCG/KVM instruction alignment issue discussion default
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: =?UTF-8?Q?J=C3=B8rgen_Hansen?= <Jorgen.Hansen@wdc.com>, 
 Gregory Price <gregory.price@memverge.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=ajaysjoshi1978@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Mar 2023 20:38:43 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 28, 2023 at 4:54=E2=80=AFPM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Mon, 27 Feb 2023 11:06:47 +0000
> J=C3=B8rgen Hansen <Jorgen.Hansen@wdc.com> wrote:
>
> > On 2/18/23 11:22, Gregory Price wrote:
> > > Breaking this off into a separate thread for archival sake.
> > >
> > > There's a bug with handling execution of instructions held in CXL
> > > memory - specifically when an instruction crosses a page boundary.
> > >
> > > The result of this is that type-3 devices cannot use KVM at all at th=
e
> > > moment, and require the attached patch to run in TCG-only mode.
> > >
> > >
> > > CXL memory devices are presently emulated as MMIO, and MMIO has no
> > > coherency guarantees, so TCG doesn't cache the results of translating
> > > an instruction, meaning execution is incredibly slow (orders of
> > > magnitude slower than KVM).
> > >
> > >
> > > Request for comments:
> > >
> > >
> > > First there's the stability issue:
> > >
> > > 0) TCG cannot handle instructions across a page boundary spanning ram=
 and
> > >     MMIO. See attached patch for hotfix.  This basically solves the p=
age
> > >     boundary issue by reverting the entire block to MMIO-mode if the
> > >     problem is detected.
> > >
> > > 1) KVM needs to be investigated.  It's likely the same/similar issue,
> > >     but it's not confirmed.
> >
> > I ran into an issue with KVM as well. However, it wasn't a page boundar=
y
> > spanning issue, since I could hit it when using pure CXL backed memory
> > for a given application. It turned out that (at least) certain AVX
> > instructions didn't handle execution from MMIO when using qemu. This
> > generated an illegal instruction exception for the application. At that
> > point, I switched to tcg, so I didn't investigate if running a non-AVX
> > system would work with KVM.
>
> Short term I'm wondering if we should attempt to error out on KVM
> unless some override parameter is used alongside the main cxl=3Don
This seems like a good idea. Avoids the trouble of discovering a lot later
during the execution.
>
> >
> > > Second there's the performance issue:
> > >
> > > 0) Do we actually care about performance? How likely are users to
> > >     attempt to run software out of CXL memory?
> > >
> > > 1) If we do care, is there a potential for converting CXL away from t=
he
> > >     MMIO design?  The issue is coherency for shared memory. Emulating
> > >     coherency is a) hard, and b) a ton of work for little gain.
> > >
> > >     Presently marking CXL memory as MMIO basically enforces coherency=
 by
> > >     preventing caching, though it's unclear how this is enforced
> > >     by KVM (or if it is, i have to imagine it is).
> >
> > Having the option of doing device specific processing of accesses to a
> > CXL type 3 device (that the MMIO based access allows) is useful for
> > experimentation with device functionality, so I would be sad to see tha=
t
> > option go away. Emulating cache line access to a type 3 device would be
> > interesting, and could potentially be implemented in a way that would
> > allow caching of device memory in a shadow page in RAM, but that it a
> > rather large project.
>
> Absolutely agree.  Can sketch a solution that is entirely in QEMU and
> works with KVM on a white board, but it doesn't feel like a small job
> to actually implement it and I'm sure there are nasty corners
> (persistency is going to be tricky)
>
> If anyone sees this as a 'fun challenge' and wants to take it on though
> that would be great!
>
> Jonathan
>
> >
> > > It might be nice to solve this for non-shared memory regions, but
> > > testing functionality >>> performance at this point so it might not
> > > worth the investment.
> >
> > Thanks,
> > Jorgen
>

