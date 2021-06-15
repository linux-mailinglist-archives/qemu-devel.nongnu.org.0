Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006AF3A73D0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 04:24:57 +0200 (CEST)
Received: from localhost ([::1]:59452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsyl7-0007XK-3D
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 22:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lsyk6-0005om-WD
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 22:23:55 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:33535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lsyk4-0000y0-Q8
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 22:23:54 -0400
Received: by mail-qv1-xf33.google.com with SMTP id l3so14543831qvl.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 19:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version; bh=syI+cnapake0XX/ydILee5A0SqQbDPJtmn9YckFmLKc=;
 b=NtIM0xV42nM9DvFgt/ZEmtRtkpD0H/f3in9Mnlynls2DdmAzaTH5BHhsyzgz8h6vpB
 8X8/u2pV/G+VsE4QoPFG1RqwxRINxW85U681pgIqz9K3UsRfwhQrUhZ4G2QnKqYKfdvR
 vsbj092zZvLmH3LpwRwIqfzHBUPS+q01LdwHZ3j2vUrGcG95DefIljpzX/u0ZmajDDlN
 a+VS3mSWDIVkb6zUB3JofGmbnrmzZNqbeHVshWavWvRbuPcpPKCQnUlavYj7bQOo4sQm
 MTS9mnpsicOb5D34DYmI6ZEtXeWYSRLnsoAJoaukKABGZgIXm2jFtrljg7iiDWdFThoQ
 LtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version;
 bh=syI+cnapake0XX/ydILee5A0SqQbDPJtmn9YckFmLKc=;
 b=N5YG4sI9NCI4FnP4J7zqGHM2zHdA8FrSKDfX0ztRzOkY4VYkg/4/tfu2dCxzWWwgD1
 +CNHa3RCDWo6Z/N0SpoE9go4sHgPJ2LkRfdykHq2Sc4Jz+qLp6sYYCsD8g3AMArRJQ81
 au0dqHCfEeaRQ8jQGpNR1/sRamCB410CMFgjVwi3fJspGmja3TpXFclZhu+idiFHaLyd
 UptDA2zFJh8WJojS3axA2V2ETqsLMT4z88JA3Niotj/TkgdcvAWNDbIyCyfnahADPT3d
 YBq0d+wSyME98H+KLASJ5iWroLTmQyQomWQi4ORCvqFnVyTdLDA5mXIO6JUHJMVPvrin
 pw3Q==
X-Gm-Message-State: AOAM531az1DSxtKDRJrV6srIIvpQ3gttVTI4YTqW9WJ2Qgy/r5UtAxvl
 RjIU7zVHvb2lOMDssGjGwZdFRA==
X-Google-Smtp-Source: ABdhPJwV8eIKR8qYyo6syIeibLGkmqIXgZdMjT9YJ2en9YpEY9VgqMOvoHY4fA3z6rm9yDNzzDghrw==
X-Received: by 2002:ad4:40cf:: with SMTP id x15mr2469700qvp.50.1623723831161; 
 Mon, 14 Jun 2021 19:23:51 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.gmail.com with ESMTPSA id g5sm10840564qth.39.2021.06.14.19.23.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 14 Jun 2021 19:23:50 -0700 (PDT)
Date: Mon, 14 Jun 2021 22:23:50 -0400
From: Shashi Mallela <shashi.mallela@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <BF660B3F-8EB4-4EA3-B584-14D43D18B487@getmailspring.com>
In-Reply-To: <CAFEAcA8aPy9kwLhSOk+VjBf_44ktS_VhTAAah_N2nOH_gJuOkw@mail.gmail.com>
References: <CAFEAcA8aPy9kwLhSOk+VjBf_44ktS_VhTAAah_N2nOH_gJuOkw@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] hw/intc: GICv3 redistributor ITS processing
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="60c80f36_1e2025b0_14c0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--60c80f36_1e2025b0_14c0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline



On Jun 11 2021, at 4:30 am, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Fri, 11 Jun 2021 at 00:39, Shashi Mallela <shashi.mallela@linaro.org> wrote:
> >
> > Have addressed all comments except the ones with responses(inline) below:-
> >
> > On Jun 8 2021, at 9:57 am, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > > + cs->lpivalid = false;
> > > + cs->hpplpi.prio = 0xff;
> > > + gicv3_redist_update_lpi(cs);
> >
> > You can avoid doing a full update a lot of the time:
> > * if this LPI is worse than the current value in hpplpi
> > (where by "worse" I mean lower-priority by the same kind of
> > comparison irqbetter() does) then we haven't changed the best-available
> > pending LPI, so we don't need to do an update
> > * if we set the pending bit to 1 and the LPI is enabled and the priority
> > of this LPI is better than the current hpplpi, then we know this LPI
> > is now the best, so we can just set hpplpi.prio and .irq without
> > doing a full rescan
> > * if we didn't actually change the value of the pending bit, we
> > don't need to do an update (you get this for free if you take the
> > simplification suggestion I make above, which does an early-return
> > in the "no change" case)
> >
> > > Accepted the code simplification,but by not calling gicv3_redist_update_lpi(cs) here ,the scenario of an activated LPI fails because
> > this LPI's priority (which could be lower than current hpplpi) is never checked/updated and gicv3_redist_update_noirqset() fails to present a valid active high priority LPI(if applicable) to the cpu,since it is always checking against a stale hpplpi info.
>
> If the LPI is lower priority (higher number) than the current
> hpplpi then it would not change the existing hpplpi info in
> a full-scan. If the LPI being activated is higher priority
> (lower number) than the current hpplpi then that is my point 2 above,
> and we set it as the hpplpi without needing the full-scan. And for
> the other cases (eg highest-priority LPI being deactivated) we
> should fall through to the default "call update_lpi" case.
>
> So I don't really understand why this wouldn't work.
> -- PMM

Have got this working as per comments.Please ignore my last comment.
--60c80f36_1e2025b0_14c0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<br><br><div class=3D=22gmail=5Fquote=5Fattribution=22>On Jun 11 2021, at=
 4:30 am, Peter Maydell &lt;peter.maydell=40linaro.org&gt; wrote:</div><b=
lockquote><div><div>On =46ri, 11 Jun 2021 at 00:39, Shashi Mallela &lt;sh=
ashi.mallela=40linaro.org&gt; wrote:</div><div>&gt;</div><div>&gt; Have a=
ddressed all comments except the ones with responses(inline) below:-</div=
><div>&gt;</div><div>&gt; On Jun 8 2021, at 9:57 am, Peter Maydell &lt;pe=
ter.maydell=40linaro.org&gt; wrote:</div><div>&gt;</div><div>&gt; &gt; + =
cs-&gt;lpivalid =3D false;</div><div>&gt; &gt; + cs-&gt;hpplpi.prio =3D 0=
xff;</div><div>&gt; &gt; + gicv3=5Fredist=5Fupdate=5Flpi(cs);</div><div>&=
gt;</div><div>&gt; You can avoid doing a full update a lot of the time:</=
div><div>&gt; * if this LPI is worse than the current value in hpplpi</di=
v><div>&gt; (where by =22worse=22 I mean lower-priority by the same kind =
of</div><div>&gt; comparison irqbetter() does) then we haven't changed th=
e best-available</div><div>&gt; pending LPI, so we don't need to do an up=
date</div><div>&gt; * if we set the pending bit to 1 and the LPI is enabl=
ed and the priority</div><div>&gt; of this LPI is better than the current=
 hpplpi, then we know this LPI</div><div>&gt; is now the best, so we can =
just set hpplpi.prio and .irq without</div><div>&gt; doing a full rescan<=
/div><div>&gt; * if we didn't actually change the value of the pending bi=
t, we</div><div>&gt; don't need to do an update (you get this for free if=
 you take the</div><div>&gt; simplification suggestion I make above, whic=
h does an early-return</div><div>&gt; in the =22no change=22 case)</div><=
div>&gt;</div><div>&gt; &gt; Accepted the code simplification,but by not =
calling gicv3=5Fredist=5Fupdate=5Flpi(cs) here ,the scenario of an activa=
ted LPI fails because</div><div>&gt; this LPI's priority (which could be =
lower than current hpplpi) is never checked/updated and gicv3=5Fredist=5F=
update=5Fnoirqset() fails to present a valid active high priority LPI(if =
applicable) to the cpu,since it is always checking against a stale hpplpi=
 info.</div><br><div>If the LPI is lower priority (higher number) than th=
e current</div><div>hpplpi then it would not change the existing hpplpi i=
nfo in</div><div>a full-scan. If the LPI being activated is higher priori=
ty</div><div>(lower number) than the current hpplpi then that is my point=
 2 above,</div><div>and we set it as the hpplpi without needing the full-=
scan. And for</div><div>the other cases (eg highest-priority LPI being de=
activated) we</div><div>should fall through to the default =22call update=
=5Flpi=22 case.</div><br><div>So I don't really understand why this would=
n't work.</div><br><div>-- PMM</div></div></blockquote><div><br><div>Have=
 got this working as per comments.Please ignore my last comment.</div></d=
iv>
--60c80f36_1e2025b0_14c0--


