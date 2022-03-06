Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E174CEDE0
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 22:02:23 +0100 (CET)
Received: from localhost ([::1]:42666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQy1G-0002Gt-4z
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 16:02:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nQxzB-0001Qo-IW
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 16:00:16 -0500
Received: from [2a00:1450:4864:20::133] (port=33588
 helo=mail-lf1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nQxz7-0004Y4-Ln
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 16:00:11 -0500
Received: by mail-lf1-x133.google.com with SMTP id bu29so23175001lfb.0
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 13:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GTf/jOqFfmESprD5DDhp/0kLPhj2Pv4wsfM000zeBQA=;
 b=RqMCetPIcLN1Mw5kXcOls9Mh8PQCPKoo2PZPPYGowJZLkOpYTWVcNoR6rXhtkpGYJN
 pD6xeckgTL7yZUTii2+1Y+YxhnhNhr1Xktl8fZOZqd6DyuX9qO4yeJ9udS3T8wpw35P/
 +JOigqMEoNdzPDW3CBi2+dFtjPOqTl/mOweY5dXgzdY7Jo0QedRcnP4933e372cWLiyo
 tH0QwKmkYdnfAjVQZNhmK5WXLhYfYdC6sWq64/RNODBIsDPyOhsi3oby269pi27yEmty
 dFcHaAWljQB+27djg9JTmC8vJgLnpe2jOE5Ma7S9jS+jai3dzCVHG53hjfdLENEyF/Dy
 T4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GTf/jOqFfmESprD5DDhp/0kLPhj2Pv4wsfM000zeBQA=;
 b=BYW9tFGWANv4oM9rZyYqQX2LBMOWRsu/rj6ssqZk+LHfnwoXVeteOI56G+VoB2KqoQ
 25PXY0nGh8sM4XL+EYjDs746MRteERoA/fAi9Gp5mtRAYqwVRksmWcwXOauoITHzgC/r
 EDO3S7OD4qAxfXAybG6CFgG4zEd5aZxsGo9TAC7vopn+sBChh4kfl40XVtuwVcl7HBW9
 nsTkVbgSxObHgzaJyBDS4/Hm9621mNSadSVEZt6STqUKhdFDUhac3XJI3sG1e9Xw4nVU
 +j1N5anZUUhwJiKclmTZOZOviSs7K0oSOXyv2avMKGJRORcCT1L90lSxe5YjpawzfS6Y
 0anQ==
X-Gm-Message-State: AOAM532zhe1Zcn2kpc6d1g1PjjD7GgcE/Ln0FY2TZxasr49ET8moB3SM
 PLJgyMJTJ3eQNR02Wf4RUH4CjlmXg0iRzM4rUVQ=
X-Google-Smtp-Source: ABdhPJwxct8tyOIRBemfksJ+EJKmlt5LSqf7DLag/crkoNQjl1kEkESsmQeljlTLQEPww6X5lv0nFUKdGeBW3VjSl5A=
X-Received: by 2002:a05:6512:ac3:b0:443:d3e3:db0a with SMTP id
 n3-20020a0565120ac300b00443d3e3db0amr5895808lfu.298.1646600407264; Sun, 06
 Mar 2022 13:00:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1646396869.git.qemu_oss@crudebyte.com>
 <CAFEAcA8EN8sSSYYMh=u68-a7qXGaG-oSnAz2hT8kXXGtnDLnww@mail.gmail.com>
 <11201492.CjeqJxXfGd@silver>
 <CAB26zV0PP1Pv0wHBk+qp4C+v-Ykh22VnU5Ridw6WD8rZft7o_Q@mail.gmail.com>
In-Reply-To: <CAB26zV0PP1Pv0wHBk+qp4C+v-Ykh22VnU5Ridw6WD8rZft7o_Q@mail.gmail.com>
From: Will Cohen <wwcohen@gmail.com>
Date: Sun, 6 Mar 2022 15:59:55 -0500
Message-ID: <CAB26zV061-xniKvdO5x0r9WpLE3Gu2gVjyrp1TWJqQZjcKd9-Q@mail.gmail.com>
Subject: Re: [PULL 00/19] 9p queue 2022-03-04
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="0000000000005cb28f05d993084e"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::133
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Keno Fischer <keno@juliacomputing.com>, Greg Kurz <groug@kaod.org>,
 qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005cb28f05d993084e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 4, 2022 at 4:31 PM Will Cohen <wwcohen@gmail.com> wrote:

> On Fri, Mar 4, 2022 at 3:16 PM Christian Schoenebeck <
> qemu_oss@crudebyte.com> wrote:
>
>> On Freitag, 4. M=C3=A4rz 2022 19:42:18 CET Peter Maydell wrote:
>> > On Fri, 4 Mar 2022 at 12:32, Christian Schoenebeck
>> >
>> > <qemu_oss@crudebyte.com> wrote:
>> > > The following changes since commit
>> 5959ef7d431ffd02db112209cf55e47b677256fd:
>> > >   Merge remote-tracking branch
>> > >   'remotes/alistair/tags/pull-riscv-to-apply-20220303' into staging
>> > >   (2022-03-03 19:59:38 +0000)>
>> > > are available in the Git repository at:
>> > >   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220304
>> > >
>> > > for you to fetch changes up to
>> 39edfe337c418995b2932a9a14a612fb0c329dc5:
>> > >   fsdev/p9array.h: convert Doxygen -> kerneldoc format (2022-03-04
>> > >   13:07:39 +0100)>
>> > > ----------------------------------------------------------------
>> > > 9pfs: introduce macOS host support and cleanup
>> > >
>> > > * Add support for Darwin (a.k.a. macOS) hosts.
>> > >
>> > > * Code cleanup (move qemu_dirent_dup() from osdep -> 9p-util).
>> > >
>> > > * API doc cleanup (convert Doxygen -> kerneldoc format).
>> >
>> > This fails to build on my OSX box:
>> >
>> > In file included from ../../hw/9pfs/9p-util-darwin.c:12:
>> > ../../hw/9pfs/9p-util.h:57:1: error: unused label 'again'
>> > [-Werror,-Wunused-label]
>> > again:
>> > ^~~~~~
>> >
>> > because the use of the label is inside a #ifndef CONFIG_DARWIN
>> > but the definition is not.
>> >
>> > thanks
>> > -- PMM
>>
>> So basically it needs this change:
>>
>> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
>> index cfa7af43c5..97e681e167 100644
>> --- a/hw/9pfs/9p-util.h
>> +++ b/hw/9pfs/9p-util.h
>> @@ -54,7 +54,9 @@ static inline int openat_file(int dirfd, const char
>> *name,
>> int flags,
>>  {
>>      int fd, serrno, ret;
>>
>> +#ifndef CONFIG_DARWIN
>>  again:
>> +#endif
>>      fd =3D openat(dirfd, name, flags | O_NOFOLLOW | O_NOCTTY | O_NONBLO=
CK,
>>                  mode);
>>      if (fd =3D=3D -1) {
>>
>> Will, can you check why this did not fail there and whether there are
>> probably
>> more issues?
>>
>> If that's the only one, let me know, then I would fix this on my end and
>> resend a PR ASAP. Thanks!
>
>
> These were just warnings for me so I didn=E2=80=99t worry about them. Wil=
l check
> where else it appears when building!
>

When building using 9p.next, here's the full extent of warnings I see. It
appears it's just that one again at 9p-util.h:57.

In file included from ../hw/9pfs/9p-xattr.c:23:
../hw/9pfs/9p-util.h:57:1: warning: unused label 'again' [-Wunused-label]
again:
^~~~~~
1 warning generated.
[3690/6798] Compiling C object libcommon.fa.p/hw_9pfs_9p-synth.c.o
[3691/6798] Compiling C object libcommon.fa.p/hw_9pfs_9p-local.c.o
In file included from ../hw/9pfs/9p-local.c:22:
../hw/9pfs/9p-util.h:57:1: warning: unused label 'again' [-Wunused-label]
again:
^~~~~~
1 warning generated.
[3692/6798] Compiling C object libcommon.fa.p/hw_9pfs_codir.c.o
In file included from ../hw/9pfs/codir.c:26:
../hw/9pfs/9p-util.h:57:1: warning: unused label 'again' [-Wunused-label]
again:
^~~~~~
1 warning generated.
[3693/6798] Compiling C object libcommon.fa.p/hw_9pfs_coth.c.o
[3694/6798] Compiling C object libcommon.fa.p/hw_9pfs_cofile.c.o
[3695/6798] Compiling C object libcommon.fa.p/hw_9pfs_9p-proxy.c.o
[3696/6798] Compiling C object libcommon.fa.p/hw_9pfs_9p-util-darwin.c.o
In file included from ../hw/9pfs/9p-util-darwin.c:12:
../hw/9pfs/9p-util.h:57:1: warning: unused label 'again' [-Wunused-label]
again:
^~~~~~
1 warning generated.
In file included from ../hw/9pfs/9p.c:30:
../hw/9pfs/9p-util.h:57:1: warning: unused label 'again' [-Wunused-label]
again:
^~~~~~
1 warning generated.


>
>>
>> Best regards,
>> Christian Schoenebeck
>>
>>
>>

--0000000000005cb28f05d993084e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Mar 4, 2022 at 4:31 PM Will Cohen=
 &lt;<a href=3D"mailto:wwcohen@gmail.com">wwcohen@gmail.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div>On Fri, Mar 4, 2022 at 3:16 PM Christian Schoenebeck &lt;<a=
 href=3D"mailto:qemu_oss@crudebyte.com" target=3D"_blank">qemu_oss@crudebyt=
e.com</a>&gt; wrote:<br></div><div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Freitag, 4. M=C3=A4rz 2022 19:42:18=
 CET Peter Maydell wrote:<br>
&gt; On Fri, 4 Mar 2022 at 12:32, Christian Schoenebeck<br>
&gt; <br>
&gt; &lt;<a href=3D"mailto:qemu_oss@crudebyte.com" target=3D"_blank">qemu_o=
ss@crudebyte.com</a>&gt; wrote:<br>
&gt; &gt; The following changes since commit <br>
5959ef7d431ffd02db112209cf55e47b677256fd:<br>
&gt; &gt;=C2=A0 =C2=A0Merge remote-tracking branch<br>
&gt; &gt;=C2=A0 =C2=A0&#39;remotes/alistair/tags/pull-riscv-to-apply-202203=
03&#39; into staging<br>
&gt; &gt;=C2=A0 =C2=A0(2022-03-03 19:59:38 +0000)&gt; <br>
&gt; &gt; are available in the Git repository at:<br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://github.com/cschoenebeck/qemu.git" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/cschoenebeck/qemu.g=
it</a> tags/pull-9p-20220304<br>
&gt; &gt; <br>
&gt; &gt; for you to fetch changes up to 39edfe337c418995b2932a9a14a612fb0c=
329dc5:<br>
&gt; &gt;=C2=A0 =C2=A0fsdev/p9array.h: convert Doxygen -&gt; kerneldoc form=
at (2022-03-04<br>
&gt; &gt;=C2=A0 =C2=A013:07:39 +0100)&gt; <br>
&gt; &gt; ----------------------------------------------------------------<=
br>
&gt; &gt; 9pfs: introduce macOS host support and cleanup<br>
&gt; &gt; <br>
&gt; &gt; * Add support for Darwin (a.k.a. macOS) hosts.<br>
&gt; &gt; <br>
&gt; &gt; * Code cleanup (move qemu_dirent_dup() from osdep -&gt; 9p-util).=
<br>
&gt; &gt; <br>
&gt; &gt; * API doc cleanup (convert Doxygen -&gt; kerneldoc format).<br>
&gt; <br>
&gt; This fails to build on my OSX box:<br>
&gt; <br>
&gt; In file included from ../../hw/9pfs/9p-util-darwin.c:12:<br>
&gt; ../../hw/9pfs/9p-util.h:57:1: error: unused label &#39;again&#39;<br>
&gt; [-Werror,-Wunused-label]<br>
&gt; again:<br>
&gt; ^~~~~~<br>
&gt; <br>
&gt; because the use of the label is inside a #ifndef CONFIG_DARWIN<br>
&gt; but the definition is not.<br>
&gt; <br>
&gt; thanks<br>
&gt; -- PMM<br>
<br>
So basically it needs this change:<br>
<br>
diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h<br>
index cfa7af43c5..97e681e167 100644<br>
--- a/hw/9pfs/9p-util.h<br>
+++ b/hw/9pfs/9p-util.h<br>
@@ -54,7 +54,9 @@ static inline int openat_file(int dirfd, const char *name=
, <br>
int flags,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int fd, serrno, ret;<br>
<br>
+#ifndef CONFIG_DARWIN<br>
=C2=A0again:<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0fd =3D openat(dirfd, name, flags | O_NOFOLLOW | O_NOCTT=
Y | O_NONBLOCK,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mode);<br>
=C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>
<br>
Will, can you check why this did not fail there and whether there are proba=
bly <br>
more issues?<br>
<br>
If that&#39;s the only one, let me know, then I would fix this on my end an=
d <br>
resend a PR ASAP. Thanks!</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">These were just warnings for me so I didn=E2=80=99t worry about t=
hem. Will check where else it appears when building!</div></div></div></blo=
ckquote><div><br></div><div>When building using 9p.next, here&#39;s the ful=
l extent of warnings I see. It appears it&#39;s just that one again at 9p-u=
til.h:57.<br></div><div><br></div><div>In file included from ../hw/9pfs/9p-=
xattr.c:23:<br>../hw/9pfs/9p-util.h:57:1: warning: unused label &#39;again&=
#39; [-Wunused-label]<br>again:<br>^~~~~~<br>1 warning generated.<br>[3690/=
6798] Compiling C object libcommon.fa.p/hw_9pfs_9p-synth.c.o<br>[3691/6798]=
 Compiling C object libcommon.fa.p/hw_9pfs_9p-local.c.o<br>In file included=
 from ../hw/9pfs/9p-local.c:22:<br>../hw/9pfs/9p-util.h:57:1: warning: unus=
ed label &#39;again&#39; [-Wunused-label]<br>again:<br>^~~~~~<br>1 warning =
generated.<br>[3692/6798] Compiling C object libcommon.fa.p/hw_9pfs_codir.c=
.o<br>In file included from ../hw/9pfs/codir.c:26:<br>../hw/9pfs/9p-util.h:=
57:1: warning: unused label &#39;again&#39; [-Wunused-label]<br>again:<br>^=
~~~~~<br>1 warning generated.<br>[3693/6798] Compiling C object libcommon.f=
a.p/hw_9pfs_coth.c.o<br>[3694/6798] Compiling C object libcommon.fa.p/hw_9p=
fs_cofile.c.o<br>[3695/6798] Compiling C object libcommon.fa.p/hw_9pfs_9p-p=
roxy.c.o<br>[3696/6798] Compiling C object libcommon.fa.p/hw_9pfs_9p-util-d=
arwin.c.o<br>In file included from ../hw/9pfs/9p-util-darwin.c:12:<br>../hw=
/9pfs/9p-util.h:57:1: warning: unused label &#39;again&#39; [-Wunused-label=
]<br>again:<br>^~~~~~<br>1 warning generated.</div><div>In file included fr=
om ../hw/9pfs/9p.c:30:<br>../hw/9pfs/9p-util.h:57:1: warning: unused label =
&#39;again&#39; [-Wunused-label]<br>again:<br>^~~~~~<br>1 warning generated=
.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v><div class=3D"gmail_quote"><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex" dir=3D"auto"><br>
<br>
Best regards,<br>
Christian Schoenebeck<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--0000000000005cb28f05d993084e--

