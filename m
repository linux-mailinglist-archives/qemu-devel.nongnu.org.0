Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CD6326298
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 13:19:56 +0100 (CET)
Received: from localhost ([::1]:46708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFc66-00056q-Mt
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 07:19:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lFc4x-0004Ru-TN
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 07:18:43 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:37981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lFc4o-0005V3-Ak
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 07:18:43 -0500
Received: by mail-ej1-x630.google.com with SMTP id n20so14484855ejb.5
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 04:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s9BDe/+sLWIP6jmbfau2Y65Iggc2Fw3I6FxKz5W++gQ=;
 b=tNvOkDyHXBrfSEH3X2l0zKG9Cx2bJ0gc2hMB/bkZNxDhfpfJSJ053P1Ixk/cNjD9Qv
 pZQVTn2/fskdubla58/BfwB+a9yF7YP64wiE2NROYloH2bb9KCeA1F7ct0E8RDhefGPR
 Y9yDTmZumFYdGxSl05LgVelgGpUJBBV//+LvclGSkdycZYF/ToYf3cdmmZHdDw5Qp/+3
 gCvzfhoCtX6TqtngUCw5dLVfFYkqKBi331y8w5D31TIQ/KyENRJBBw7ciKOP1fHp15Ra
 Z/q4O3pOKrkHtA+RUu/zWBcNJswz4lf8jeOeVvAYXNdiTt2d3JvOAPJzK+MDmUqgM3Tl
 ZR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s9BDe/+sLWIP6jmbfau2Y65Iggc2Fw3I6FxKz5W++gQ=;
 b=ooMhYnB77WPToARTvsunNCp9JNvq2iapo7fCRqXHunoSbhZBEXUrOxaYYTkcLurzp6
 r3WYx3B4CLwBBZ8Z4IqikovGtWPhRNX+Bos99iAjqFaQH3rsi7T6hZTmcqpdpVtUTEvv
 xyzyfb7MVG6KY/0dj5qxjVtqVBpjXd8wwdB9qB3mSoe0fwOc06nqCdRHgXCKbCQHaeAh
 xATv3IHp9pEs10zlNAsjpAuOMvt7smWXsUON9n6IFmY1kEcHeq+14MxOIYHbMS+sOBLN
 OyfqLOAUYhjaCXTNVxD68hRcIYB4a/He8ktjnxyLPdwqOnD1mdrD65kkd1PRs304sqKV
 mr5w==
X-Gm-Message-State: AOAM533PU0sR0gdnViBSLNqg3J1MsqpxlTUjYZguTjMkAI+CJQmKMG32
 ZDZpM/nIZhUzVGxU0pBLX0aDyWjeyF/VhbzIJ+8=
X-Google-Smtp-Source: ABdhPJw27usp2qPIzS8ySgDpjdOMiXIVIWJEhkG6W/yGRfqSgNhpFGpKkb3DtFhBisFzKXpdQUzZSBnfuuNvq1BFO7U=
X-Received: by 2002:a17:907:2953:: with SMTP id
 et19mr2940718ejc.527.1614341911835; 
 Fri, 26 Feb 2021 04:18:31 -0800 (PST)
MIME-Version: 1.0
References: <20210220001322.1311139-1-dje@google.com>
 <20210220001322.1311139-2-dje@google.com>
 <858a59f8-a97e-3d9b-3e19-16b73f93ca4c@redhat.com>
 <CADPb22SOSK=PV0fypfB72jUgWG01D80XhJ5LJLCqgo9ozqaDXA@mail.gmail.com>
In-Reply-To: <CADPb22SOSK=PV0fypfB72jUgWG01D80XhJ5LJLCqgo9ozqaDXA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 26 Feb 2021 16:18:20 +0400
Message-ID: <CAJ+F1C++7rVJs9aJB7_vR7EaDdrnwp9+aSOnnaj8YH2EALonVA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] slirp: Advance libslirp submodule to add ipv6
 host-forward support
To: Doug Evans <dje@google.com>
Content-Type: multipart/alternative; boundary="00000000000033784505bc3c4473"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x630.google.com
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000033784505bc3c4473
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Feb 24, 2021 at 12:20 AM Doug Evans <dje@google.com> wrote:

> On Fri, Feb 19, 2021 at 4:20 PM Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com>
> wrote:
>
>> Hi Doug,
>>
>> On 2/20/21 1:13 AM, Doug Evans via wrote:
>>
>> When updating submodules, the commit description is a good
>> good place to include the output of:
>>
>>   $ git shortlog 8f43a99..26ae658
>>
>> See for example QEMU commit f350d78f102 ("Update SLOF").
>>
>> Anyhow up to the maintainer merging your patch.
>>
>
>
> Thanks, that helps a little.
> The issue here is that qemu is using branch 4.2 of libslirp, whereas the
> patch is currently just on libslirp's master branch.
> Part of the problem is the commit description, which you've helped with.
> But what about the functional part of the patch?
> I can only get git format-patch to include a commit id, and the only
> commit id available is on the libslirp master branch.
>
> Is there an additional step I need to do like submit libslirp changes in
> three parts?
> Step 1: Submit patch to libslirp's repo (not qemu's copy, but the
> libslirp master repo)
> Step 2: Submit a patch to libslirp's repo to add the patch to its 4.2
> branch
> Step 2b: Wait for qemu's copy of libslirp's 4.2 branch to appear in
> qemu's libslirp repo
> Step 3: Submit patch to advance qemu's libslirp submodule
>
> I've done steps 1,3, it's just effecting the equivalent of step2 that I'm
> fuzzy on.
>

Only bug fixes should go in libslirp 4.2 branch. You can submit MR against
the stable-4.2 branch in gitlab.

We may update qemu to libslirp master while not in freeze (as long as
feature versioning is handled correctly, which may be error prone).

I tried to update QEMU to libslirp master some time ago, unfortunately it
failed to pass the merge because of the next commit changing the build
system (
https://patchew.org/QEMU/20210125073427.3970606-1-marcandre.lureau@redhat.c=
om/20210125073427.3970606-2-marcandre.lureau@redhat.com/).
But just updating libslirp to master should be fine. You can see in the
commit message that I use a git tool "cherry-diff" to highlight the
differences between the branches.




>
>> > Signed-off-by: Doug Evans <dje@google.com>
>> > ---
>> >
>> > Changes from v4:
>> > NOTE TO REVIEWERS: I need some hand-holding to know what The Right
>> > way to submit this particular patch is.
>> >
>> > - no change
>> >
>> > Changes from v3:
>> > - pick up latest libslirp patch to reject ipv6 addr-any for guest
>> address
>> >   - libslirp currently only provides a stateless DHCPv6 server, which
>> means
>> >     it can't know in advance what the guest's IP address is, and thus
>> >     cannot do the "addr-any -> guest ip address" translation that is
>> done
>> >     for ipv4
>> >
>> > Changes from v2:
>> > - this patch is new in v3, split out from v2
>> >
>> >  slirp | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/slirp b/slirp
>> > index 8f43a99191..26ae658a83 160000
>> > --- a/slirp
>> > +++ b/slirp
>> > @@ -1 +1 @@
>> > -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
>> > +Subproject commit 26ae658a83eeca16780cf5615c8247cbb151c3fa
>> >
>>
>>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000033784505bc3c4473
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 24, 2021 at 12:20 AM Do=
ug Evans &lt;<a href=3D"mailto:dje@google.com">dje@google.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div dir=3D"ltr"><div style=3D"font-size:small">On Fri, Feb 19, 2021 at =
4:20 PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com=
" target=3D"_blank">philmd@redhat.com</a>&gt; wrote:<br></div></div><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Do=
ug,<br>
<br>
On 2/20/21 1:13 AM, Doug Evans via wrote:<br>
<br>
When updating submodules, the commit description is a good<br>
good place to include the output of:<br>
<br>
=C2=A0 $ git shortlog 8f43a99..26ae658<br>
<br>
See for example QEMU commit f350d78f102 (&quot;Update SLOF&quot;).<br>
<br>
Anyhow up to the maintainer merging your patch.<br></blockquote><div><br></=
div><div><br></div><div style=3D"font-size:small">Thanks, that helps a litt=
le.</div><div style=3D"font-size:small">The issue here is that qemu is usin=
g branch 4.2 of libslirp, whereas the patch is currently just on libslirp&#=
39;s master branch.</div><div style=3D"font-size:small">Part of the problem=
 is the commit description, which you&#39;ve helped with.</div><div style=
=3D"font-size:small">But what about the functional part of the patch?</div>=
<div style=3D"font-size:small">I can only get git format-patch to include a=
 commit id, and the only commit id available is on the libslirp=C2=A0master=
 branch.</div><div style=3D"font-size:small"><br></div><div style=3D"font-s=
ize:small">Is there an additional step I need to do like submit libslirp=C2=
=A0changes in three parts?</div><div style=3D"font-size:small">Step 1: Subm=
it patch to libslirp&#39;s=C2=A0repo (not qemu&#39;s copy, but the libslirp=
=C2=A0master repo)</div><div style=3D"font-size:small">Step 2: Submit a pat=
ch to libslirp&#39;s=C2=A0repo to add the patch to its 4.2 branch</div><div=
 style=3D"font-size:small">Step 2b: Wait for qemu&#39;s=C2=A0copy of libsli=
rp&#39;s=C2=A04.2 branch to appear in qemu&#39;s=C2=A0libslirp repo</div><d=
iv style=3D"font-size:small">Step 3: Submit patch to advance qemu&#39;s lib=
slirp=C2=A0submodule</div><div style=3D"font-size:small"><br></div><div sty=
le=3D"font-size:small">I&#39;ve done steps 1,3, it&#39;s just effecting the=
 equivalent of step2 that I&#39;m fuzzy on.</div></div></div></blockquote><=
div><br></div><div>Only bug fixes should go in libslirp 4.2 branch. You can=
 submit MR against the stable-4.2 branch in gitlab.<br></div><div><br></div=
><div>We may update qemu to libslirp master while not in freeze (as long as=
 feature versioning is handled correctly, which may be error prone).</div><=
div><br></div><div>I tried to update QEMU to libslirp master some time ago,=
 unfortunately it failed to pass the merge because of the next commit chang=
ing the build system (<a href=3D"https://patchew.org/QEMU/20210125073427.39=
70606-1-marcandre.lureau@redhat.com/20210125073427.3970606-2-marcandre.lure=
au@redhat.com/">https://patchew.org/QEMU/20210125073427.3970606-1-marcandre=
.lureau@redhat.com/20210125073427.3970606-2-marcandre.lureau@redhat.com/</a=
>). But just updating libslirp to master should be fine. You can see in the=
 commit message that I use a git tool &quot;cherry-diff&quot; to highlight =
the differences between the branches.<br></div><div><br></div><div><br></di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><div style=3D"font-size:small"><br></di=
v><div style=3D"font-size:small"></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
&gt; Signed-off-by: Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=
=3D"_blank">dje@google.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; Changes from v4:<br>
&gt; NOTE TO REVIEWERS: I need some hand-holding to know what The Right<br>
&gt; way to submit this particular patch is.<br>
&gt; <br>
&gt; - no change<br>
&gt; <br>
&gt; Changes from v3:<br>
&gt; - pick up latest libslirp patch to reject ipv6 addr-any for guest addr=
ess<br>
&gt;=C2=A0 =C2=A0- libslirp currently only provides a stateless DHCPv6 serv=
er, which means<br>
&gt;=C2=A0 =C2=A0 =C2=A0it can&#39;t know in advance what the guest&#39;s I=
P address is, and thus<br>
&gt;=C2=A0 =C2=A0 =C2=A0cannot do the &quot;addr-any -&gt; guest ip address=
&quot; translation that is done<br>
&gt;=C2=A0 =C2=A0 =C2=A0for ipv4<br>
&gt; <br>
&gt; Changes from v2:<br>
&gt; - this patch is new in v3, split out from v2<br>
&gt; <br>
&gt;=C2=A0 slirp | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/slirp b/slirp<br>
&gt; index 8f43a99191..26ae658a83 160000<br>
&gt; --- a/slirp<br>
&gt; +++ b/slirp<br>
&gt; @@ -1 +1 @@<br>
&gt; -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece<br>
&gt; +Subproject commit 26ae658a83eeca16780cf5615c8247cbb151c3fa<br>
&gt; <br>
<br>
</blockquote></div></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000033784505bc3c4473--

