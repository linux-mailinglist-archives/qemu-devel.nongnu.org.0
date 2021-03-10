Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483AE3344E7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:14:09 +0100 (CET)
Received: from localhost ([::1]:51726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2PQ-0003dd-9r
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <famforupstream@gmail.com>)
 id 1lK1o6-0004kQ-JF; Wed, 10 Mar 2021 11:35:36 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:33265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <famforupstream@gmail.com>)
 id 1lK1o1-0006Os-RQ; Wed, 10 Mar 2021 11:35:33 -0500
Received: by mail-lj1-x244.google.com with SMTP id h4so26408890ljl.0;
 Wed, 10 Mar 2021 08:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YvKtrIw0FIIhHhSI23r41XQpJRwQGrRal092u+0FyY4=;
 b=FZpY4uhR8Z+ctYrSwTHSk90xo24Edlgyn55VYRZP0Ina5+PR/yTLWrWmR0BeNbu8tG
 qNk1oLKwz/6Bk2HHrn+dJl016VRfcoyUemYUnvwpinrOe7i1YtiGnelKjMXmj0TsB+XY
 H7dayHWiD2C0+5wfJfOVHQ5EtmN4XgJ8raON/7TMZc5nJeNlSmmTkPRdKib1Y2mbq1gg
 iceSaDRhiuINdp2mIkcoKtfpkycIzCS/jd4fqB1IjqbRzF7NIsIs22SO+ynTdMj3cGXW
 Gw8nQ1sxbSW6OSL1kv7gnyYA2Yti6UtLJl6sMtOQ+XJga/fjIxOEP+BwnqNopi8l9s61
 mPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YvKtrIw0FIIhHhSI23r41XQpJRwQGrRal092u+0FyY4=;
 b=VG9CEvUixeTwobKR9cF96blk29pkUDRnnaD7GUjjH1oK+G3ejcCaSLcdfTVGalmBWi
 fB98ZE1rjNk3/ZuWQ231sN0zrmYiciZDGq+WXEwCzAx1TYvYBBYcufRYy3CbkKxIBDdz
 koKi4c7xLxg6No+/L2jUdaUUr0SYoe13JnsfvwLLnvzIJZ5XpmQ5o1aE448VXHNGURbU
 pkt2N4/2gwqATigEkuPjjyvRPBOZS8aL6mso+qQbMFTbaEcKtKLA+Adu1Shwc8rDrX7K
 E82v0kP1U/olf8FC+QAHWqzZAdbc8BvNLn2Fcr/yfPvZbIzfX4+zPqssyILUZngndfKB
 hHfQ==
X-Gm-Message-State: AOAM5307eWLjUDQIEpyfltsOmiDz95cA4WvINYwkXGZNZmZcq8k/evT9
 cWO4dmlTblOvriEbcYBsz+Ad7tY9zaogUV1TS2w=
X-Google-Smtp-Source: ABdhPJytFz1UXLbqQMKrnKt0yLo7z9zWpMnsQcmTWfDOLzs69x1iQ9o8fZdaGEhZArdK9Zs81emuSmYcqdZ+siZya/M=
X-Received: by 2002:a2e:6e0c:: with SMTP id j12mr2294536ljc.365.1615394127376; 
 Wed, 10 Mar 2021 08:35:27 -0800 (PST)
MIME-Version: 1.0
References: <20210310141752.5113-1-fam@euphon.net>
 <8aeb8f65-d467-958d-6434-152d758c3d7a@redhat.com>
In-Reply-To: <8aeb8f65-d467-958d-6434-152d758c3d7a@redhat.com>
From: Fam Zheng <famforupstream@gmail.com>
Date: Wed, 10 Mar 2021 16:35:16 +0000
Message-ID: <CAGNx5+3HSEFxEhzGicF5n5g53KnZJ=5GxKN_QAhL7cMhj+oKAA@mail.gmail.com>
Subject: Re: [PATCH] block: Introduce zero-co:// and zero-aio://
To: Max Reitz <mreitz@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000022737105bd314148"
Received-SPF: pass client-ip=2a00:1450:4864:20::244;
 envelope-from=famforupstream@gmail.com; helo=mail-lj1-x244.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000022737105bd314148
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Mar 2021 at 15:02, Max Reitz <mreitz@redhat.com> wrote:

> On 10.03.21 15:17, fam@euphon.net wrote:
> > From: Fam Zheng <famzheng@amazon.com>
> >
> > null-co:// has a read-zeroes=3Doff default, when used to in security
> > analysis, this can cause false positives because the driver doesn't
> > write to the read buffer.
> >
> > null-co:// has the highest possible performance as a block driver, so
> > let's keep it that way. This patch introduces zero-co:// and
> > zero-aio://, largely similar with null-*://, but have read-zeroes=3Don =
by
> > default, so it's more suitable in cases than null-co://.
> >
> > Signed-off-by: Fam Zheng <fam@euphon.net>
> > ---
> >   block/null.c | 91 +++++++++++++++++++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 91 insertions(+)
>
> You=E2=80=99ll also need to make all tests that currently use null-{co,ai=
o} use
> zero-{co,aio}, because none of those are performance tests (as far as
> I=E2=80=99m aware), so they all want a block driver that memset()s.
>
> (And that=E2=80=99s basically my problem with this approach; nearly every=
one who
> uses null-* right now probably wants read-zeroes=3Don, so keeping null-*
> as it is means all of those users should be changed.  Sure, they were
> all wrong to not specify read-zeroes=3Don, but that=E2=80=99s how it is. =
 So while
> technically this patch is a compatible change, in contrast to the one
> making read-zeroes=3Don the default, in practice it absolutely isn=E2=80=
=99t.)
>
> Another problem arising from that is I can imagine that some
> distributions might have whitelisted null-co because many iotests
> implicitly depend on it, so the iotests will fail if they aren=E2=80=99t
> whitelisted.  Now they=E2=80=99d need to whitelist zero-co, too.  Not
> impossible, sure, but it=E2=80=99s work that would need to be done.
>
>
> My problem is this: We have a not-really problem, namely =E2=80=9Cvalgrin=
d and
> other tools complain=E2=80=9D.  Philippe (and I guess me on IRC) proposed=
 a
> simple solution whose only drawbacks (AFAIU) are:
>
> (1) When writing performance tests, you=E2=80=99ll then need to explicitl=
y
> specify read-zeroes=3Doff.  Existing performance tests using null-co will
> probably wrongly show degredation.  (Are there such tests, though?)
>
> (2) null will not quite conform to its name, strictly speaking.
> Frankly, I don=E2=80=99t know who=E2=80=99d care other than people who wr=
ite those
> performance tests mentioned in (1).  I know I don=E2=80=99t care.
>
> (Technically: (3) We should look into all qemu tests that use null-co to
> see whether they test performance.  In practice, they don=E2=80=99t, so w=
e don=E2=80=99t
> need to.)
>
> So AFAIU change the read-zeroes default would affect very few people, if
> any.  I see you care about (2), and you=E2=80=99re the maintainer, so I c=
an=E2=80=99t
> say that there is no problem.  But it isn=E2=80=99t a practical one.
>
> So on the practical front, we get a small benefit (tools won=E2=80=99t co=
mplain)
> for a small drawback (having to remember read-zeroes=3Doff for performanc=
e
> tests).
>
>
> Now you propose a change that has the following drawbacks, as I see it:
>
> (1) All non-performance tests using null-* should be changed to zero-*.
>   And those are quite a few tests, so this is some work.
>
> (2) Distributions that have whitelisted null-co now should whitelist
> zero-co, too.
>
> Not impossible, but I consider these much bigger practical drawbacks
> than making read-zeroes=3Don the default.  It=E2=80=99s actual work that =
must be
> done.  To me personally, these drawbacks far outweigh the benefit of
> having valgrind and other tools not complain.
>
>
> I can=E2=80=99t stop you from updating this patch to do (1), but it doesn=
=E2=80=99t make
> sense to me from a practical perspective.  It just doesn=E2=80=99t seem w=
orth it
> to me.
>

But using null-co:// in tests is not wrong, the problem is the caller
failed to initialize its buffer. IMO the valgrind issue should really be
fixed like this:

diff --git a/hw/block/hd-geometry.c b/hw/block/hd-geometry.c
index dcbccee294..9078718445 100644
--- a/hw/block/hd-geometry.c
+++ b/hw/block/hd-geometry.c
@@ -55,7 +55,7 @@ struct partition {
static int guess_disk_lchs(BlockBackend *blk,
                           int *pcylinders, int *pheads, int *psectors)
{
-    uint8_t buf[BDRV_SECTOR_SIZE];
+    uint8_t buf[BDRV_SECTOR_SIZE] =3D {};
    int i, heads, sectors, cylinders;
    struct partition *p;
    uint32_t nr_sects;

--00000000000022737105bd314148
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 10 Mar 2021 at 15:02, Max Rei=
tz &lt;<a href=3D"mailto:mreitz@redhat.com">mreitz@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 10.03.21 15=
:17, <a href=3D"mailto:fam@euphon.net" target=3D"_blank">fam@euphon.net</a>=
 wrote:<br>
&gt; From: Fam Zheng &lt;<a href=3D"mailto:famzheng@amazon.com" target=3D"_=
blank">famzheng@amazon.com</a>&gt;<br>
&gt; <br>
&gt; null-co:// has a read-zeroes=3Doff default, when used to in security<b=
r>
&gt; analysis, this can cause false positives because the driver doesn&#39;=
t<br>
&gt; write to the read buffer.<br>
&gt; <br>
&gt; null-co:// has the highest possible performance as a block driver, so<=
br>
&gt; let&#39;s keep it that way. This patch introduces zero-co:// and<br>
&gt; zero-aio://, largely similar with null-*://, but have read-zeroes=3Don=
 by<br>
&gt; default, so it&#39;s more suitable in cases than null-co://.<br>
&gt; <br>
&gt; Signed-off-by: Fam Zheng &lt;<a href=3D"mailto:fam@euphon.net" target=
=3D"_blank">fam@euphon.net</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0block/null.c | 91 ++++++++++++++++++++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 91 insertions(+)<br>
<br>
You=E2=80=99ll also need to make all tests that currently use null-{co,aio}=
 use <br>
zero-{co,aio}, because none of those are performance tests (as far as <br>
I=E2=80=99m aware), so they all want a block driver that memset()s.<br>
<br>
(And that=E2=80=99s basically my problem with this approach; nearly everyon=
e who <br>
uses null-* right now probably wants read-zeroes=3Don, so keeping null-* <b=
r>
as it is means all of those users should be changed.=C2=A0 Sure, they were =
<br>
all wrong to not specify read-zeroes=3Don, but that=E2=80=99s how it is.=C2=
=A0 So while <br>
technically this patch is a compatible change, in contrast to the one <br>
making read-zeroes=3Don the default, in practice it absolutely isn=E2=80=99=
t.)<br>
<br>
Another problem arising from that is I can imagine that some <br>
distributions might have whitelisted null-co because many iotests <br>
implicitly depend on it, so the iotests will fail if they aren=E2=80=99t <b=
r>
whitelisted.=C2=A0 Now they=E2=80=99d need to whitelist zero-co, too.=C2=A0=
 Not <br>
impossible, sure, but it=E2=80=99s work that would need to be done.<br>
<br>
<br>
My problem is this: We have a not-really problem, namely =E2=80=9Cvalgrind =
and <br>
other tools complain=E2=80=9D.=C2=A0 Philippe (and I guess me on IRC) propo=
sed a <br>
simple solution whose only drawbacks (AFAIU) are:<br>
<br>
(1) When writing performance tests, you=E2=80=99ll then need to explicitly =
<br>
specify read-zeroes=3Doff.=C2=A0 Existing performance tests using null-co w=
ill <br>
probably wrongly show degredation.=C2=A0 (Are there such tests, though?)<br=
>
<br>
(2) null will not quite conform to its name, strictly speaking. <br>
Frankly, I don=E2=80=99t know who=E2=80=99d care other than people who writ=
e those <br>
performance tests mentioned in (1).=C2=A0 I know I don=E2=80=99t care.<br>
<br>
(Technically: (3) We should look into all qemu tests that use null-co to <b=
r>
see whether they test performance.=C2=A0 In practice, they don=E2=80=99t, s=
o we don=E2=80=99t <br>
need to.)<br>
<br>
So AFAIU change the read-zeroes default would affect very few people, if <b=
r>
any.=C2=A0 I see you care about (2), and you=E2=80=99re the maintainer, so =
I can=E2=80=99t <br>
say that there is no problem.=C2=A0 But it isn=E2=80=99t a practical one.<b=
r>
<br>
So on the practical front, we get a small benefit (tools won=E2=80=99t comp=
lain) <br>
for a small drawback (having to remember read-zeroes=3Doff for performance =
<br>
tests).<br>
<br>
<br>
Now you propose a change that has the following drawbacks, as I see it:<br>
<br>
(1) All non-performance tests using null-* should be changed to zero-*. <br=
>
=C2=A0 And those are quite a few tests, so this is some work.<br>
<br>
(2) Distributions that have whitelisted null-co now should whitelist <br>
zero-co, too.<br>
<br>
Not impossible, but I consider these much bigger practical drawbacks <br>
than making read-zeroes=3Don the default.=C2=A0 It=E2=80=99s actual work th=
at must be <br>
done.=C2=A0 To me personally, these drawbacks far outweigh the benefit of <=
br>
having valgrind and other tools not complain.<br>
<br>
<br>
I can=E2=80=99t stop you from updating this patch to do (1), but it doesn=
=E2=80=99t make <br>
sense to me from a practical perspective.=C2=A0 It just doesn=E2=80=99t see=
m worth it <br>
to me.<br></blockquote><div><br></div><div>But using null-co:// in tests is=
 not wrong, the problem is the caller failed to initialize its buffer. IMO =
the valgrind issue should really be fixed like this:</div><div><br></div><d=
iv><span style=3D"font-family:monospace"><span style=3D"font-weight:bold;co=
lor:rgb(0,0,0)">diff --git a/hw/block/hd-geometry.c b/hw/block/hd-geometry.=
c</span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0)">index dcbccee2=
94..9078718445 100644</span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0)">--- a/hw/block=
/hd-geometry.c</span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0)">+++ b/hw/block=
/hd-geometry.c</span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"color:rgb(24,178,178)">@@ -55,7 +55,7 @@</span><s=
pan style=3D"color:rgb(0,0,0)"> struct partition {
</span><br> static int guess_disk_lchs(BlockBackend *blk,
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0int *pcylinders, int *pheads, int *psectors)
<br> {
<br><span style=3D"color:rgb(178,24,24)">- =C2=A0=C2=A0=C2=A0uint8_t buf[BD=
RV_SECTOR_SIZE];</span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"color:rgb(24,178,24)">+ =C2=A0=C2=A0=C2=A0uint8_t=
 buf[BDRV_SECTOR_SIZE] =3D {};</span><span style=3D"color:rgb(0,0,0)">
</span><br> =C2=A0=C2=A0=C2=A0=C2=A0int i, heads, sectors, cylinders;
<br> =C2=A0=C2=A0=C2=A0=C2=A0struct partition *p;
<br> =C2=A0=C2=A0=C2=A0=C2=A0uint32_t nr_sects;
<br><br></span></div></div></div>

--00000000000022737105bd314148--

