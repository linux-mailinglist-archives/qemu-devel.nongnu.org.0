Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E36328318
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:09:11 +0100 (CET)
Received: from localhost ([::1]:60852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGl6c-0006l8-JB
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:09:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lGl5V-0006Cc-Cb
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:08:02 -0500
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e]:40019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lGl5T-00025M-Fq
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:08:01 -0500
Received: by mail-vk1-xa2e.google.com with SMTP id s12so2086585vkh.7
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 08:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aHYT4GZCC6ve2Rk4CMzEzIuV0Aw8+WhooLStYyfh4DU=;
 b=v0TV24ztnJ6wwPFgQRYKKDjUQMzDr9/mNQsSkADY34IRlv1SWffANtX9+mXETazShu
 IWVDhyP+4HB6oDncb1aYCNY53rl+sTEj1t1ClbYOTT6TVcxZlo0QKa05bMeRs02zOu1w
 p3TaqkSDVaZMyaeF8sHYhCjdBOM0v+DHaZzN1WlD/4sqajBtNv2MqDgm463X7o3NfOtP
 Rrnbe0ZeRKYn18Hvk4npYD7c3GPOfJqeIX9fROG1XrG3RaPajBa9zinXaBjEqKkrnW6M
 IAQp0gwjOCp4dGBnvCj1Y19ayyzPQy3BMVuErZEa0YgA+ROrQ857dMoT036iUpz0VOZO
 IrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aHYT4GZCC6ve2Rk4CMzEzIuV0Aw8+WhooLStYyfh4DU=;
 b=JkBiFzh2G3BISxBo6PbengEapp9qqAjieS9jTUG8xpDsAWB7VzovUHSj+5VvYsOBOB
 DZaBcs26aF6Z9fwYmntUtfjNI3yftM0yeRFUijW7rm77Ixihrc1eRpLFkQ8lQexnHIiW
 r1MG1RGx3hWmG4QCnV38ZZ3wX1Dpir5hjPld8B749ydUiesVGHfX1TS/ZJi6h+jTu5lA
 ncFPDxEnCsPUYnz/lewFDNycHOhxacm7M5PAaOmyYy9xZ+d6YuBR3ghdgzqEGK8UkueM
 C/cAUO4fcStWwbFvMdnqCTL9pkwTORvEdiCi01GOPRQ4Nd5yNsaz+wpf8BQSLZAosOvH
 yP3w==
X-Gm-Message-State: AOAM533oHHqrjjNm5jWI9D7+33ne6UtLs+LCM3jOTd0d+6V/ZzHyVKNA
 NWZEIZnSHWEdZjlRj8wrsxwSsZVtQQzriHuZDiXG4A==
X-Google-Smtp-Source: ABdhPJzNtAVna5V4Z6cCK7XARYCLfC1W+WHdiuZb4H0rD4j8CA/uoK+2zhS8Y9ZR+JfmvjdauatmVwJM28MitsOj2vM=
X-Received: by 2002:a1f:a452:: with SMTP id n79mr4911300vke.8.1614614876748;
 Mon, 01 Mar 2021 08:07:56 -0800 (PST)
MIME-Version: 1.0
References: <CADPb22TNebyiYxc+gtNFD+=CfwtWP4heSYt+_=uBcZAeWoWHXw@mail.gmail.com>
 <YDN73SqaDQDtwlgZ@redhat.com> <20210228213957.xkc4cceh5o6rgd5n@begin>
In-Reply-To: <20210228213957.xkc4cceh5o6rgd5n@begin>
From: Doug Evans <dje@google.com>
Date: Mon, 1 Mar 2021 08:07:19 -0800
Message-ID: <CADPb22RMRfRAe1Wto1dH8WaCFuMXwkWVEsNo-kXCY607=v4J_w@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] util/qemu-sockets.c: Split host:port parsing out
 of inet_parse
To: Samuel Thibault <samuel.thibault@gnu.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002e91cc05bc7bd295"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=dje@google.com; helo=mail-vk1-xa2e.google.com
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

--0000000000002e91cc05bc7bd295
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 28, 2021 at 1:40 PM Samuel Thibault <samuel.thibault@gnu.org>
wrote:

> Hello,
>
> Daniel P. Berrang=C3=A9, le lun. 22 f=C3=A9vr. 2021 09:39:41 +0000, a ecr=
it:
>
> > The is_v6 flag is only needed
> > for the legacy compat needs in slirp, even that is only if we want to
> > have strict equivalence with historical behaviour, as opposed to changi=
ng
> > empty string to mean to listen on both IPv4+6 concurrently..
>
> I would say that empty address meaning ipv4+6 looks better to me.
>


It's not my call, but I have some questions.

Are there any users that this functional change would break?
[Previously the empty address meant qemu would only listen on ipv4
addr-any.]

What if a user wants only ipv4 addr-any (or only ipv6 addr-any) ?

What does hostfwd "::12345-6.7.8.9:10" mean?
Does the presence of the empty host address mean forward both ipv4 and ipv6
to guest ipv4 6.7.8.9?

--0000000000002e91cc05bc7bd295
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Sun, Feb 28, 2021 at 1:40 PM Samuel Thibault &lt;<a href=
=3D"mailto:samuel.thibault@gnu.org">samuel.thibault@gnu.org</a>&gt; wrote:<=
br></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hello,<br>
<br>
Daniel P. Berrang=C3=A9, le lun. 22 f=C3=A9vr. 2021 09:39:41 +0000, a ecrit=
:<br>
<br>
&gt; The is_v6 flag is only needed<br>
&gt; for the legacy compat needs in slirp, even that is only if we want to =
<br>
&gt; have strict equivalence with historical behaviour, as opposed to chang=
ing<br>
&gt; empty string to mean to listen on both IPv4+6 concurrently..<br>
<br>
I would say that empty address meaning ipv4+6 looks better to me.<br></bloc=
kquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">It&=
#39;s not my call, but I have some questions.</div></div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Are there any users that this functional ch=
ange would break?</div></div><div class=3D"gmail_default" style=3D"font-siz=
e:small">[Previously the empty address meant qemu would only listen on ipv4=
 addr-any.]</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">What if a use=
r wants only ipv4 addr-any (or only ipv6 addr-any) ?</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">What does hostfwd &quot;::12345-6.7.8.9:10&quot=
; mean?</div><div class=3D"gmail_default" style=3D"font-size:small">Does th=
e presence of the empty host address mean forward both ipv4 and ipv6 to gue=
st ipv4 6.7.8.9?</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div></div></div>

--0000000000002e91cc05bc7bd295--

