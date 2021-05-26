Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82299391BFE
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 17:29:23 +0200 (CEST)
Received: from localhost ([::1]:53836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llvTG-0001nS-Kc
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 11:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1llvRC-0000Xw-1d
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:27:14 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33]:35424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1llvR9-00087J-Vt
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:27:13 -0400
Received: by mail-vs1-xe33.google.com with SMTP id x22so885532vsn.2
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 08:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H/5/mzsurpQX7qO9L20cgJKbFVh/Xg66iA43D9I4zX0=;
 b=jM4TukvvFInAKqw6JsnwCxkhiTZ0NeBEZ1BIBtXz4nGe4qlaeH2deM+WnwSdE/KEfv
 mBn44w4TKhe+PvCudickydgIeghX+duIsAodZgTyUIh/KYzzkM7R7i8x3HdHW8bPuiIB
 SA580TrilwAOOk+yx/4UBfToD3f7TFQPTL8RFNPHak5g8fPmoWgSNxWNNQLaIEwVMrcG
 0NVxNw0gxzOPnsJSTKeZY18qUun406U69b+iy1NRTeR80kuyABMy/HISH7pVTAKl7kwH
 oOiSpAfWES9CgsSlwBFrEEL8ohKw5f3ui0xsTLIWbkodEEEkm2qauUn4gpwS2od8pS76
 B4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H/5/mzsurpQX7qO9L20cgJKbFVh/Xg66iA43D9I4zX0=;
 b=atTVqvBcHzaM3AqejentP4cQMTWBDbHMQwMJRahi0R6QSK4U/bhukx99W0ysgczLfr
 4JKzxsJOYaxx5ir5r6BeogQ9FtWfL0hE+CBNT4XG277eBIFm2Y/a3z56DM9YOrqMX2Ub
 e6aTcsmJNafDi/iyIfXqTsFcCPyU9qM/pYuvHXgoGg7H00dj90j0Jm9QOERjAtdkjq6H
 aNYJphhf6XUXW8lpFO7/RkLBedfyPzLF2vi3iO4RAADaACr8swEUnqmb8oDEFMLGQtrZ
 age/Qt8PvmCxLmOSV/hB9e3tV/vPgouq1TuPkpLx4iVMYwWYSPd4PvVaju69SyjDKC4F
 lbCQ==
X-Gm-Message-State: AOAM530hNjnKir3DVPr6A1TXli2sRlKhQzqpUXW9LDNBjUfm0GDHRlaC
 couWt3yUY3JO6IGin/DNTRVlMR5I34+dWK88UNlHBA==
X-Google-Smtp-Source: ABdhPJzxyXXIuRE2PTZxxuA7+qw8l5Qj5xFg1D5jZmNklUCzgg5gnTyi9x555yYQpdJuCYOjgCDLAy1XQ0JHZTf5Vgs=
X-Received: by 2002:a67:7fd8:: with SMTP id a207mr12764937vsd.46.1622042830574; 
 Wed, 26 May 2021 08:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210415033925.1290401-1-dje@google.com>
 <20210415033925.1290401-3-dje@google.com>
 <CAJ+F1CJUzAbZmfY59x6YYLWba-TMyZYwW7Pqu75zs93qbscr3Q@mail.gmail.com>
 <CADPb22TW5GkwcF_08R1KBr+NKBGLOHBwFqHPOJKVgiDa6w2VKA@mail.gmail.com>
 <YK5TweOui5bwJ6vl@redhat.com>
In-Reply-To: <YK5TweOui5bwJ6vl@redhat.com>
From: Doug Evans <dje@google.com>
Date: Wed, 26 May 2021 08:26:33 -0700
Message-ID: <CADPb22Qw8y3szjsGSD=ZmS9SgiSbjjckn+ZZfVMvXrKjTREfKQ@mail.gmail.com>
Subject: Re: RFC: IPv6 hostfwd command line syntax [was Re: [PATCH v6 2/4]
 util/qemu-sockets.c: Split host:port parsing out of inet_parse]
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>, QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000baacdc05c33d4611"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=dje@google.com; helo=mail-vs1-xe33.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000baacdc05c33d4611
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 6:57 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Tue, May 25, 2021 at 12:37:21PM -0700, Doug Evans wrote:
> > Hi.
> >
> > I want to confirm the command line syntax y'all want for ipv6 host
> > forwarding.
> >
> > IIUC, the command line syntax is required to be consistent with the use
> of
> > "ipv6=3Don|off" elsewhere.
> > Can you confirm that's correct?
> >
> > If so, how does one apply "ipv6=3Don" to the "::60022-:22" hostfwd spec=
 in
> > the following example:
> >
> > $ qemu-system-x86_64 [...] --nic
> user,id=3Dn1,model=3De1000,hostfwd=3D::60022-:22
> >
> > ?
>
> Probably easier if we start from the HMP  hostfwd_add command which takes
>
>   hostfwd_add  ::60022-:22
>
> With that, adding the flags is obvious
>
>   hostfwd_add  ::60022-:22,ipv6=3Don|off,ipv4=3Don|off
>


Data point:

There's been discussion of supporting ipv6->ipv4 and ipv4->ipv6.
If we want to provide for this then the ipv4/6 flags need to apply to the
host/guess address.

E.g.,

hostfwd_add ::60022,ipv6=3Don-:22,ipv4=3Don
[for ipv6->ipv4]


> IIUC, that can be handled in the slirp_hostfwd() method impl.
>
> The question is then how this works on the CLI. IIUC ,the "hostfwd=3DXXX"
> ARG value is passed to slirp_hostfwd() eventually, so the change for
> the HMP parsing will "just work".
>
> The complication is that the comma is ambiguous between the --net arg
> parsing, and the hostfwd parsing. So you would end up having to escape
> the commas (ie replace , with ,,):
>
>  --nic user,id=3Dn1,model=3De1000,hostfwd=3D::60022-:22,,ipv6=3Don,,ipv4=
=3Don
>
> If you forget to escape the commas, then the flag ends up applying
> to the --nic instead, where ipv4/ipv6 are indeed value for other
> reasons.
>
> This kind of sucks, but that's where we are with the old fashioned
> design of --nic parsing
>
>
> Not sure if someone else has better ideas here ?
>
>

--000000000000baacdc05c33d4611
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Wed, May 26, 2021 at 6:57 AM Daniel P. Berrang=C3=A9 &lt;<=
a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote:<br=
></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Tue, May 25, 2021 at 12:37:21PM -0700, Doug Evans wrote:<=
br>
&gt; Hi.<br>
&gt; <br>
&gt; I want to confirm the command line syntax y&#39;all want for ipv6 host=
<br>
&gt; forwarding.<br>
&gt; <br>
&gt; IIUC, the command line syntax is required to be consistent with the us=
e of<br>
&gt; &quot;ipv6=3Don|off&quot; elsewhere.<br>
&gt; Can you confirm that&#39;s correct?<br>
&gt; <br>
&gt; If so, how does one apply &quot;ipv6=3Don&quot; to the &quot;::60022-:=
22&quot; hostfwd spec in<br>
&gt; the following example:<br>
&gt; <br>
&gt; $ qemu-system-x86_64 [...] --nic user,id=3Dn1,model=3De1000,hostfwd=3D=
::60022-:22<br>
&gt; <br>
&gt; ?<br>
<br>
Probably easier if we start from the HMP=C2=A0 hostfwd_add command which ta=
kes<br>
<br>
=C2=A0 hostfwd_add=C2=A0 ::60022-:22<br>
<br>
With that, adding the flags is obvious<br>
<br>
=C2=A0 hostfwd_add=C2=A0 ::60022-:22,ipv6=3Don|off,ipv4=3Don|off<br></block=
quote><div><br></div><div><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Data point:</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">There&#39;s been discussion of supporting ipv6-&gt;ipv4 and ipv4-&gt;ipv=
6.</div><div class=3D"gmail_default" style=3D"font-size:small">If we want t=
o provide for this then the ipv4/6 flags need to apply to the host/guess ad=
dress.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">E.g.,</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">hostfwd_add ::60022,ipv6=3Don-:22,ipv=
4=3Don</div><div class=3D"gmail_default" style=3D"font-size:small">[for ipv=
6-&gt;ipv4]</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small"></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
IIUC, that can be handled in the slirp_hostfwd() method impl.<br>
<br>
The question is then how this works on the CLI. IIUC ,the &quot;hostfwd=3DX=
XX&quot;<br>
ARG value is passed to slirp_hostfwd() eventually, so the change for<br>
the HMP parsing will &quot;just work&quot;.<br>
<br>
The complication is that the comma is ambiguous between the --net arg<br>
parsing, and the hostfwd parsing. So you would end up having to escape<br>
the commas (ie replace , with ,,):<br>
<br>
=C2=A0--nic user,id=3Dn1,model=3De1000,hostfwd=3D::60022-:22,,ipv6=3Don,,ip=
v4=3Don<br>
<br>
If you forget to escape the commas, then the flag ends up applying<br>
to the --nic instead, where ipv4/ipv6 are indeed value for other<br>
reasons.<br>
<br>
This kind of sucks, but that&#39;s where we are with the old fashioned<br>
design of --nic parsing<br>
<br>
<br>
Not sure if someone else has better ideas here ?<br><br>
</blockquote></div></div>

--000000000000baacdc05c33d4611--

