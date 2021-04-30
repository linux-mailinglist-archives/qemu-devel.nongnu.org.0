Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7767436FE2D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 17:57:51 +0200 (CEST)
Received: from localhost ([::1]:47036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcVWY-0005R1-Jk
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 11:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcVUw-0003v1-2Y
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:56:10 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:37612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcVUt-00034C-Ij
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:56:09 -0400
Received: by mail-qk1-x733.google.com with SMTP id t17so42664281qkg.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version; bh=2I7MhnhFDXeBr9l6HPYDzdWjfdkPS7Q5DRF5ootVzNA=;
 b=BNntTL58erEpl0GACiUHqqf24oMPyA+yKeSBLimpgaggnrGHPYxi/brdLN8zLKPu3z
 VTeABAbuwP7s/oP8fpqNbueShFMxyJqS1xahHbbZWgbFVcuX3a1a72sZfsmVwD2TlsxS
 ssU+g4Fc/luPhslgBZOB62An7s/58pLkcX4hpakX1JPLU4WFnVxQ/Lm+VSV4blo715k7
 noFZ70EbjrV/6Gr3KUQUhZVRWJAybdRVXdbKiXmbQZ1LPVipY5AaTKs7lTv/7H6lMZyJ
 jDMLjjBugwDfoTNFIWgIA0FA7zhsFqnG4/bQIYK7vcHafFOA6M3q44JujbsHvb3kKP+j
 eGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version;
 bh=2I7MhnhFDXeBr9l6HPYDzdWjfdkPS7Q5DRF5ootVzNA=;
 b=P3H70dsvvy8K08WuMpjKzjJ8MOEw9S/3nybJHmgL3L+VJ5eBusMyRfcMMNsaC6vQl8
 LJoiU8MoZNbuDfN8raO+Oh0p6keNkyLF7x9ee4WHqa7PZpa2wylkZ1FIZiSL+XkeRRW8
 7CHgBV/Umig4FaZxCmw5jcbrhJf5KqKW5Hl0puv6REw9e9KTNcZFFNvaD2EO4xJODiAQ
 cNGlJ9pEn1w+QP+mJZXNdD7SVSXEYV7J7fneo+sqYg3I8tFynG3bc2O3xcLoVeUjsxNw
 wo3vOMKA7bkuk6nI2XpRWBqvWn4A5GwYP6tPaiKxxCQ62GGxqZ3U6O83XSqO5asZvTmm
 Jh3w==
X-Gm-Message-State: AOAM531NK/Y/cLZk2MJtCfxWda5arogUEILsm/oHuu9z3RXVjoGrTjl0
 YgChcl8jQoouqT9GeRpSioMV/9DXO5UUJw==
X-Google-Smtp-Source: ABdhPJx7+4fLbxuLzoUIzCGF0XyJcvlKymq7OwyB1x8KfIxdzSQn8i+BPEJlGwYBiuX1ZvGRja9RTA==
X-Received: by 2002:a05:620a:1657:: with SMTP id
 c23mr5979833qko.264.1619798164527; 
 Fri, 30 Apr 2021 08:56:04 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.gmail.com with ESMTPSA id a21sm1763024qkk.45.2021.04.30.08.56.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 30 Apr 2021 08:56:04 -0700 (PDT)
Date: Fri, 30 Apr 2021 11:56:00 -0400
From: Shashi Mallela <shashi.mallela@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <4B93C023-32E5-468F-80A8-DF58C8CD442F@getmailspring.com>
In-Reply-To: <CAFEAcA8EXUu8nfqz2Xn_Rke4Nk+cvdOuZOoFSfGkN6FFeTJ=yQ@mail.gmail.com>
References: <CAFEAcA8EXUu8nfqz2Xn_Rke4Nk+cvdOuZOoFSfGkN6FFeTJ=yQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] hw/intc: GICv3 ITS initial framework
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="608c2890_3c7f7cc7_12a1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x733.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_IMAGE_ONLY_20=1.546, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--608c2890_3c7f7cc7_12a1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Have taken care of it.please ignore PIDR2 changes in the current patchset ,will update the latest changes in the next patchset version

Thanks
Shashi

On Apr 30 2021, at 6:09 am, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Fri, 30 Apr 2021 at 00:36, <shashi.mallela@linaro.org> wrote:
> >
> > On Fri, 2021-04-16 at 18:21 +0100, Peter Maydell wrote:
> > > On Thu, 1 Apr 2021 at 03:41, Shashi Mallela <
> > > shashi.mallela@linaro.org> wrote:
> > > > +#define GITS_PIDR2 0xFFE8
> > >
> > > You probably don't want an offset for GITS_PIDR2 specifically.
> > > Compare handling of GICD_IDREGS in the distributor emulation.
> > > Tried re-using the GICD_IDREGS offset for GITS_PIDR2,but from testing
> > > observed that the linux kernel driver and kvm-unit-tests both relied
> > > on using the 0xFFE8 offset instead of 0xFFD0 (used by GICD & GICR) to
> > > complete ITS initialization and setup
>
> I didn't mean "just put PIDR2 at the GICD_IDREGS offset", which
> obviously won't work, I meant "implement the whole set of ID registers
> (of which PIDR2 is one in the middle) in the same way we implement that
> set on the other GIC components".
>
> -- PMM
--608c2890_3c7f7cc7_12a1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Have taken care of it.please ignore PIDR2 changes in the current pat=
chset&nbsp; ,will update the latest changes in the next patchset version<=
/div><br><div>Thanks</div><div>Shashi</div><br><div class=3D=22gmail=5Fqu=
ote=5Fattribution=22>On Apr 30 2021, at 6:09 am, Peter Maydell &lt;peter.=
maydell=40linaro.org&gt; wrote:</div><blockquote><div><div>On =46ri, 30 A=
pr 2021 at 00:36, &lt;shashi.mallela=40linaro.org&gt; wrote:</div><div>&g=
t;</div><div>&gt; On =46ri, 2021-04-16 at 18:21 +0100, Peter Maydell wrot=
e:</div><div>&gt; &gt; On Thu, 1 Apr 2021 at 03:41, Shashi Mallela &lt;</=
div><div>&gt; &gt; shashi.mallela=40linaro.org&gt; wrote:</div><div>&gt; =
&gt; &gt; +=23define GITS=5FPIDR2 0x=46=46E8</div><div>&gt; &gt;</div><di=
v>&gt; &gt; You probably don't want an offset for GITS=5FPIDR2 specifical=
ly.</div><div>&gt; &gt; Compare handling of GICD=5FIDREGS in the distribu=
tor emulation.</div><div>&gt; &gt; Tried re-using the GICD=5FIDREGS offse=
t for GITS=5FPIDR2,but from testing</div><div>&gt; &gt; observed that the=
 linux kernel driver and kvm-unit-tests both relied</div><div>&gt; &gt; o=
n using the 0x=46=46E8 offset instead of 0x=46=46D0 (used by GICD &amp; G=
ICR) to</div><div>&gt; &gt; complete ITS initialization and setup</div><b=
r><div>I didn't mean =22just put PIDR2 at the GICD=5FIDREGS offset=22, wh=
ich</div><div>obviously won't work, I meant =22implement the whole set of=
 ID registers</div><div>(of which PIDR2 is one in the middle) in the same=
 way we implement that</div><div>set on the other GIC components=22.</div=
><br><div>-- PMM</div></div></blockquote><img class=3D=22mailspring-open=22=
 alt=3D=22Sent from Mailspring=22 width=3D=220=22 height=3D=220=22 style=3D=
=22border:0; width:0; height:0;=22 src=3D=22https://link.getmailspring.co=
m/open/4B93C023-32E5-468=46-80A8-D=4658C8CD442=46=40getmailspring.com=3Fm=
e=3D2a4b90d6&amp;recipient=3DcWVtdS1kZXZlbEBub25nbnUub3Jn=22>
--608c2890_3c7f7cc7_12a1--


