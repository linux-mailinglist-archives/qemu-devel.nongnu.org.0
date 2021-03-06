Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED9A32F71E
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 01:07:33 +0100 (CET)
Received: from localhost ([::1]:44376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIKTk-0006RA-1G
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 19:07:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lIKS2-0005iV-KD
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 19:05:46 -0500
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936]:39020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lIKS0-00029M-Og
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 19:05:46 -0500
Received: by mail-ua1-x936.google.com with SMTP id t15so1348935ual.6
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 16:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wPcHwjFHzhaknJwXWBfjepRZv5hS2LaPuLnW9/L5GRQ=;
 b=vY9VnqTBnlnNzErIbSYBFOBHENXTOxJz/Z0Vf4lhremHWpnTtDasgK9mRC0olHJnG1
 pDMzfQ89UZahwmeqZkvtetiC5LexpBfcai0/S8fJc9BM7T9snSaULbcORm//BRJyd0iN
 usHRC3xnmH8PmuRUYtPWbF0Zl1q0hTLsHeiG2E9PB7wsILvsCaPOSce/3MaeY5dc8oUX
 BfnZ3SnkUWF02niYgF+Gz65AYId5tZL73VUQhM4VhGG5GLMSh+p/07wLMWCC0wDFwJEy
 Zxy8fnNrhb+qxKUW4AKxUkIkuc4ZJLwtEx2eFPaPKCdSJB5ITya2giPHO4oo1Mp4I5Kb
 tJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wPcHwjFHzhaknJwXWBfjepRZv5hS2LaPuLnW9/L5GRQ=;
 b=F8bOv8TqNqL3twSe938hxNWNpBLAg7b1YWFoe5Bf+IW4JSIkdt+Fo44wNx4i3V6F5i
 0bOFWLnVpJAKcmEGy8BrdKCy4ypQo/gPpi3sz1QgQXb//cgVjd78BszM5vPOkZ821+PH
 9kbmjVNmys9Qvmh3cN2Zi5qOAom+8j8z8P1exawaFf5LeKd4RLiR36AwQPSn+ZCcAqj6
 eUYaI1+kMDp2Wen1rUuu9/4LWX8YsCtbgI3NSDta73pbyV6jyL+43w+viWrU9mmfzna8
 1Ezro7YApO92LCFeBZ6T/KLRaP1xHCnOvjwPizq4ExHxhuRq8VboUt/jWH1tbhXSiB9s
 zlTA==
X-Gm-Message-State: AOAM532IkzhzonZChKsAGD7c4296lqJNn38l27bD+OFEQ/cI/yCL80wR
 hj8/5J5f6iUbt+GG3pfBq/S3JOVn3m1IlgNrnijGZw==
X-Google-Smtp-Source: ABdhPJwwF/JIfVkoDmax7yvTdwCd1fqBt/xq8rdxvvF2sF8OlnUtY3670CngTHaScTNmPofl5jKpbfziZlsv94K+NnE=
X-Received: by 2002:ab0:48c2:: with SMTP id y2mr8268954uac.22.1614989143596;
 Fri, 05 Mar 2021 16:05:43 -0800 (PST)
MIME-Version: 1.0
References: <CADPb22TNebyiYxc+gtNFD+=CfwtWP4heSYt+_=uBcZAeWoWHXw@mail.gmail.com>
 <YDN73SqaDQDtwlgZ@redhat.com> <20210228213957.xkc4cceh5o6rgd5n@begin>
 <CADPb22RAxehwfRRBdsRm1exU2D38FCcRv23XcS5VKdZfvDp+pQ@mail.gmail.com>
 <YD/RXfECJ4TshqsT@redhat.com> <20210305212806.kx62ycfr7k4wxdlq@begin>
In-Reply-To: <20210305212806.kx62ycfr7k4wxdlq@begin>
From: Doug Evans <dje@google.com>
Date: Fri, 5 Mar 2021 16:05:05 -0800
Message-ID: <CADPb22Tv0-oXhxu7Fke3hDq+yq1_n5RTcAC4efmZ0iniAUxVQg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] util/qemu-sockets.c: Split host:port parsing out
 of inet_parse
To: Samuel Thibault <samuel.thibault@gnu.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000038c76e05bcd2f65f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=dje@google.com; helo=mail-ua1-x936.google.com
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

--00000000000038c76e05bcd2f65f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 5, 2021 at 1:28 PM Samuel Thibault <samuel.thibault@gnu.org>
wrote:

> Daniel P. Berrang=C3=A9, le mer. 03 mars 2021 18:11:41 +0000, a ecrit:
> > On Wed, Mar 03, 2021 at 10:06:50AM -0800, Doug Evans wrote:
> > > On Sun, Feb 28, 2021 at 1:40 PM Samuel Thibault <
> samuel.thibault@gnu.org>
> > > wrote:
> > >
> > > > > +  Examples:
> > > > > +  hostfwd_add net0 tcp:127.0.0.1:10022-:22
> > > > > +  hostfwd_add net0 tcp:[::1]:10022-[fe80::1:2:3:4]:22
> > > >
> > > > Yep, that looks good to me.
> > >
> > > Daniel, you wanted me to use inet_parse().
> > > Is the above syntax ok with you?
> > > You must have had some expectation that at least some of
> > > the various flags that inet_parse() recognizes would be needed here.
> >
> > It feels like the ,ipv4=3Don|off,ipv6=3Don|off flags are relevant here,
> > especially in the empty address case. eg
> >
> >    tcp::10022          - attempt to listen on both ipv4 + ipv6
> >    tcp::10022,ipv4=3Doff - listen on default address, but only for ipv6
> >    tcp::10022,ipv6=3Doff - listen on default address, but only for ipv4
> >
> > Basically this ends up bringing the hostfwd stuff into alignment with
> > the way other backends deal with this
>
> I'm fine with this yes, better have a coherent user interface.
>


Hi. Questions regarding an empty *guest* address, e.g., either of
tcp::10022-:22
tcp::10022-[]:22

Given that the code is not supposed to be able to know brackets were presen=
t
(they're stripped off early on), what does the above mean w.r.t. the guest?
For the host we can have "" mean listen on both IPv4 and IPv6
(by default, absent extra options like ipv4=3Doff).
But what does a guest address of "" mean?
IPv4? IPv6? Both?
Does an empty guest address take on the IPvN of the host's spec?

--00000000000038c76e05bcd2f65f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Fri, Mar 5, 2021 at 1:28 PM Samuel Thibault &lt;<a href=3D=
"mailto:samuel.thibault@gnu.org">samuel.thibault@gnu.org</a>&gt; wrote:<br>=
</div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Daniel P. Berrang=C3=A9, le mer. 03 mars 2021 18:11:41 +0000,=
 a ecrit:<br>
&gt; On Wed, Mar 03, 2021 at 10:06:50AM -0800, Doug Evans wrote:<br>
&gt; &gt; On Sun, Feb 28, 2021 at 1:40 PM Samuel Thibault &lt;<a href=3D"ma=
ilto:samuel.thibault@gnu.org" target=3D"_blank">samuel.thibault@gnu.org</a>=
&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; +=C2=A0 Examples:<br>
&gt; &gt; &gt; &gt; +=C2=A0 hostfwd_add net0 tcp:127.0.0.1:10022-:22<br>
&gt; &gt; &gt; &gt; +=C2=A0 hostfwd_add net0 tcp:[::1]:10022-[fe80::1:2:3:4=
]:22<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Yep, that looks good to me.<br>
&gt; &gt; <br>
&gt; &gt; Daniel, you wanted me to use inet_parse().<br>
&gt; &gt; Is the above syntax ok with you?<br>
&gt; &gt; You must have had some expectation that at least some of<br>
&gt; &gt; the various flags that inet_parse() recognizes would be needed he=
re.<br>
&gt; <br>
&gt; It feels like the ,ipv4=3Don|off,ipv6=3Don|off flags are relevant here=
,<br>
&gt; especially in the empty address case. eg<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 tcp::10022=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - attempt to=
 listen on both ipv4 + ipv6<br>
&gt;=C2=A0 =C2=A0 tcp::10022,ipv4=3Doff - listen on default address, but on=
ly for ipv6<br>
&gt;=C2=A0 =C2=A0 tcp::10022,ipv6=3Doff - listen on default address, but on=
ly for ipv4<br>
&gt; <br>
&gt; Basically this ends up bringing the hostfwd stuff into alignment with<=
br>
&gt; the way other backends deal with this<br>
<br>
I&#39;m fine with this yes, better have a coherent user interface.<br></blo=
ckquote><div><br></div><div><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">Hi. Questions regarding an empty *guest* address, e.g., e=
ither of</div><div class=3D"gmail_default" style=3D"font-size:small">tcp::1=
0022-:22</div><div class=3D"gmail_default" style=3D"font-size:small">tcp::1=
0022-[]:22</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">Given that the=
 code is not supposed to be able to know brackets were present</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">(they&#39;re stripped off e=
arly on), what does the above mean w.r.t. the guest?</div><div class=3D"gma=
il_default" style=3D"font-size:small">For the host we can have &quot;&quot;=
 mean listen on both IPv4 and IPv6</div><div class=3D"gmail_default" style=
=3D"font-size:small">(by default, absent extra options like ipv4=3Doff).</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">But what does a g=
uest address of &quot;&quot; mean?</div><div class=3D"gmail_default" style=
=3D"font-size:small">IPv4? IPv6? Both?</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Does an empty guest address take on the IPvN of the=
 host&#39;s spec?</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div></div></div>

--00000000000038c76e05bcd2f65f--

