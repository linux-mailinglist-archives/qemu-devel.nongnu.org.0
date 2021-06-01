Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B7B39740C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 15:23:59 +0200 (CEST)
Received: from localhost ([::1]:43824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo4NC-0007lz-CJ
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 09:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <astrauss11@gmail.com>)
 id 1lo21C-0006Iv-74; Tue, 01 Jun 2021 06:53:06 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <astrauss11@gmail.com>)
 id 1lo218-0004e1-IZ; Tue, 01 Jun 2021 06:53:05 -0400
Received: by mail-ed1-x530.google.com with SMTP id dg27so6981299edb.12;
 Tue, 01 Jun 2021 03:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6qR9r8ygB9T3Jj0GgCbCYrrWcpUrucASbP0orSW8qAw=;
 b=DblQSFLGWcbneD22C0eBcMb1phFwLr4SpC50pg15P+NAcXeU3ESC4zerZsqDhP54I7
 0C+CSKsEisKS7Vdw1iRFKxNEbpgNEfg6+FdZRJDVTGhU22X4ei+LWqowhfdWMfT/xXjk
 sLHA+5BMTVcSMRCP30oZh2NfcO+1PTu45yZklEQOO9JyiqGXREViHqBKhc6j236dPXDx
 TfEkBR9UDt7WH9+ZcibI1HuRjQ2xmFMBUG1C4NZ4sa2CGAuL92lCQBMqFPPYRShnQt65
 j/S9Yyaev0Mp3W6HmmwXfZP4FKdFGp38aLD6uOGgICuW4NDLa42ZDg+yZgyujts84o9r
 dorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6qR9r8ygB9T3Jj0GgCbCYrrWcpUrucASbP0orSW8qAw=;
 b=PddqUyd6Trpjvn855Tfxsr7EBuE7EMyCkcrpqoPqucj+fpQvaZIGoCEZtvck7yjJub
 Bqm/B75ypPR0r7v9AOawfhfqbf+pr4kFgyEUI+vxrTj7sBKkvTTjcEk4Pi8CNC4FsclY
 bUTSjVBng3IXQda0Tdb4NKexim9f6FCe0v/B+limfCe71+r+iww9Wzl2BdFhIeGeZ/VE
 3FW9PmMJVF5pNWT50B1/k9eg7wzb+Xp7jEcgg327B2iCjUrIbLWKGhlfio95Ec7zcuid
 i4PcRw9FuQHIED7iEh5n0Aafb26nwakd/al+cFAZYQtqcMynpsbj26JWFH4COpbasXt2
 VWAw==
X-Gm-Message-State: AOAM530tmh5uTbY34EAr/WnyBjaJeWkJBKZaATog9oP0oF5f4fiimExV
 qNtifgucDBSxVHqkN1p0UTcXrueFBLFGs4ZmxhQ=
X-Google-Smtp-Source: ABdhPJyeTQebog2vCkGABsje4gRa9J04GXNrpXPFwY7XUD0Bo0vwMDq+kDa/r/dUy+mS3kxzgIIHMFA1HpuQbGq/pxg=
X-Received: by 2002:aa7:dc17:: with SMTP id b23mr31221754edu.359.1622544779680; 
 Tue, 01 Jun 2021 03:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210601090715.22330-1-alex.bennee@linaro.org>
 <CAFEAcA-zzg4Yh0pX2q-9OfFKEbX_uGkVb_8kZbQJJETLRo_zOQ@mail.gmail.com>
 <87fsy1dhke.fsf@linaro.org>
 <CAFEAcA8rre_ADS_x0TJpgeBOx=KeEzs1Q-pSiAtVK77G2tDLxg@mail.gmail.com>
In-Reply-To: <CAFEAcA8rre_ADS_x0TJpgeBOx=KeEzs1Q-pSiAtVK77G2tDLxg@mail.gmail.com>
From: Andrew Strauss <astrauss11@gmail.com>
Date: Tue, 1 Jun 2021 06:52:48 -0400
Message-ID: <CAP=E3JhXeG-eyrVifAZBv4A05rxCsm_eihe1pXJ8Zi=jTiENcQ@mail.gmail.com>
Subject: Re: [RFC PATCH] semihosting/arm-compat: remove heuristic softmmu
 SYS_HEAPINFO
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000039a15d05c3b225ce"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=astrauss11@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 01 Jun 2021 09:22:09 -0400
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000039a15d05c3b225ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yeah, newlib falls back to using the symbols __stack and end to figure out
where to start the stack and heap if 0 is returned by SYS_HEAPINFO.

-- Andrew Strauss

On Tue, Jun 1, 2021 at 6:31 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 1 Jun 2021 at 11:07, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
> >
> >
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> > > On Tue, 1 Jun 2021 at 10:12, Alex Benn=C3=A9e <alex.bennee@linaro.org=
>
> wrote:
> > >>
> > >> The previous numbers were a guess at best. While we could extract th=
e
> > >> information from a loaded ELF file via -kernel we could still get
> > >> tripped up by self decompressing or relocating code. Besides sane
> > >> library code has access to the same symbols in run time to make a
> > >> determination of the location of the heap.
> > >>
> > >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > >> Cc: Andrew <astrauss11@gmail.com>
> > >> ---
> > >>  semihosting/arm-compat-semi.c | 19 ++++++++++---------
> > >>  1 file changed, 10 insertions(+), 9 deletions(-)
> > >
> > > This seems like a pretty good candidate for breaking existing
> > > working binaries. How much testing against different varieties of
> > > guest-code-using-semihosting have you done ?
> >
> > None, which is why it's an RFC - but at least one user reported newlib
> > attempts to use the numbers we gave it rather than falling back to
> > numbers it knew from the build and getting it wrong. I suspect any code
> > that doesn't have a fallback path is getting it right more by luck than
> > judgement though. I'd be curious to hear of code that relies on the
> > numbers it gets from QEMU.
>
> Well, newlib is the main one I had in mind -- does it have a fallback
> codepath?
>
> -- PMM
>

--00000000000039a15d05c3b225ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Yeah, newlib falls back to using the symb=
ols __stack and end to figure out where to start the stack and heap if 0 is=
 returned by SYS_HEAPINFO.</div><div dir=3D"ltr"><br></div><div>-- Andrew S=
trauss<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Tue, Jun 1, 2021 at 6:31 AM Peter Maydell &lt;<a href=3D"mailt=
o:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 1 Jun 2021 at 1=
1:07, Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" target=
=3D"_blank">alex.bennee@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=
=3D"_blank">peter.maydell@linaro.org</a>&gt; writes:<br>
&gt;<br>
&gt; &gt; On Tue, 1 Jun 2021 at 10:12, Alex Benn=C3=A9e &lt;<a href=3D"mail=
to:alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;=
 wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The previous numbers were a guess at best. While we could ext=
ract the<br>
&gt; &gt;&gt; information from a loaded ELF file via -kernel we could still=
 get<br>
&gt; &gt;&gt; tripped up by self decompressing or relocating code. Besides =
sane<br>
&gt; &gt;&gt; library code has access to the same symbols in run time to ma=
ke a<br>
&gt; &gt;&gt; determination of the location of the heap.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.be=
nnee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
&gt; &gt;&gt; Cc: Andrew &lt;<a href=3D"mailto:astrauss11@gmail.com" target=
=3D"_blank">astrauss11@gmail.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 semihosting/arm-compat-semi.c | 19 ++++++++++---------<=
br>
&gt; &gt;&gt;=C2=A0 1 file changed, 10 insertions(+), 9 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; This seems like a pretty good candidate for breaking existing<br>
&gt; &gt; working binaries. How much testing against different varieties of=
<br>
&gt; &gt; guest-code-using-semihosting have you done ?<br>
&gt;<br>
&gt; None, which is why it&#39;s an RFC - but at least one user reported ne=
wlib<br>
&gt; attempts to use the numbers we gave it rather than falling back to<br>
&gt; numbers it knew from the build and getting it wrong. I suspect any cod=
e<br>
&gt; that doesn&#39;t have a fallback path is getting it right more by luck=
 than<br>
&gt; judgement though. I&#39;d be curious to hear of code that relies on th=
e<br>
&gt; numbers it gets from QEMU.<br>
<br>
Well, newlib is the main one I had in mind -- does it have a fallback<br>
codepath?<br>
<br>
-- PMM<br>
</blockquote></div></div>

--00000000000039a15d05c3b225ce--

