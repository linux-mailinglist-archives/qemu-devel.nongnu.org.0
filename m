Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB3A53BD80
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 19:45:32 +0200 (CEST)
Received: from localhost ([::1]:46462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwot1-0006dM-O0
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 13:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nwor3-0005HJ-8S
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 13:43:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nwor1-0000fS-Kd
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 13:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654191797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZuPdrkE+RZ/Ch35s9ZBa0T8wqDQVtLXuvpIG9LcAO0Q=;
 b=PYuUpDbBS3/3NuQTNFMkmQliegxidO4wx7LbQ5RuNComzUorv/9Sb4wREh8vhj4UstRXIW
 NE+laPMsILbhv1oN2mMjeewm1GmGWQ+4qg4UXWykHIu5nYGJsw0ncFucrGJD3gxkQyyQ7Z
 z6IekRuIaq7EoYDxQ3AjLLv8PAPO12M=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-OAuZi_urMpa_AttuWEE16Q-1; Thu, 02 Jun 2022 13:43:16 -0400
X-MC-Unique: OAuZi_urMpa_AttuWEE16Q-1
Received: by mail-vk1-f198.google.com with SMTP id
 v145-20020a1f2f97000000b0035c517f81ecso987948vkv.7
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 10:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZuPdrkE+RZ/Ch35s9ZBa0T8wqDQVtLXuvpIG9LcAO0Q=;
 b=a9B7CzeP2AOakj/HPJk7PhlEKAbsD2g8KD9ND300WwGBJGQxe9KbAh0ss1KNCmC+JB
 xc3/z3L51tj6BFCXLI3TdH+mWp9RKsPap3EJDPciSkkamkhHWoHTgX82jT/7SXJw6W7U
 yBRb+JJ/5SHgIo1XONs23suNjP6HUj+8Wj71EyC13Fg/qYZvGNiAiG4Se2JhbOIFlf0y
 lLAq3dIExC+E4qG3L/ZU/IBnKjUnAcRpGPmm/hbHX8SSMYd1ho3gIRcx99ONy/eYGU+K
 31tqSHLQjYd2tuEFTnRrl/EJBlVBntZ0cdPdjprxCtjdfli7F+DTRlGJcU/nrE6Jc0PC
 41UA==
X-Gm-Message-State: AOAM5329fshjy5wKvRjhNTDwVwM3CKROnUgumH6SqtkxZdMGwQ61DUXC
 gy6et7Uu5Qi/fRulmufBnPss47GNglRs/21wed8eQqXC5Zl3j6Xql3pO8w14m8fLVAi+objevgE
 tbaNUucZuE2gwf1VzH2FdLnm6FUfppFY=
X-Received: by 2002:a67:dc14:0:b0:34a:8564:a99e with SMTP id
 x20-20020a67dc14000000b0034a8564a99emr1660899vsj.61.1654191795109; 
 Thu, 02 Jun 2022 10:43:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTDgSDZcH5fAmb+qJ3zkvUo+yM6KMTguIgNKAbS/mQ0bJwJYFliR2YC3Ju775azxQLtxjibttJ5iUJMnalTSY=
X-Received: by 2002:a67:dc14:0:b0:34a:8564:a99e with SMTP id
 x20-20020a67dc14000000b0034a8564a99emr1660891vsj.61.1654191794948; Thu, 02
 Jun 2022 10:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220526000921.1581503-1-jsnow@redhat.com>
 <CAFn=p-bqUqEZW0wcccCOHut=wXQTcVsWX5kRkAPe2u6eSM0DPA@mail.gmail.com>
 <8df98517-56f6-f7b0-2af8-6dec404ece79@redhat.com>
In-Reply-To: <8df98517-56f6-f7b0-2af8-6dec404ece79@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 2 Jun 2022 13:43:04 -0400
Message-ID: <CAFn=p-aPaXw8=pjaAKhm50GTOo-9zM24wUWYJYE_ELmh0Za8ug@mail.gmail.com>
Subject: Re: [PATCH 0/9] tests, python: prepare to expand usage of test venv
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000541d2905e07a8a83"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000541d2905e07a8a83
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 1, 2022, 6:06 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 5/27/22 16:27, John Snow wrote:
> > Paolo: I assume this falls under your jurisdiction...ish, unless Cleber
> > (avocado) or Alex (tests more broadly) have any specific inputs.
> >
> > I'm fine with waiting for reviews, but don't know whose bucket this goes
> to.
> >
>
> I thought it was yours, but I've queued it now.
>
> Paolo
>

I wanted to be polite since it was build system and tests as well - I don't
technically maintain most of these files :)

Thank you!

>

--000000000000541d2905e07a8a83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Jun 1, 2022, 6:06 AM Paolo Bonzini &lt;<a href=
=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On 5/27/22 16:27, John Snow wrote:<br>
&gt; Paolo: I assume this falls under your jurisdiction...ish, unless Clebe=
r <br>
&gt; (avocado) or Alex (tests more broadly) have any specific inputs.<br>
&gt; <br>
&gt; I&#39;m fine with waiting for reviews, but don&#39;t know whose bucket=
 this goes to.<br>
&gt; <br>
<br>
I thought it was yours, but I&#39;ve queued it now.<br>
<br>
Paolo<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">I wanted to be polite since it was build system and tests as well - I =
don&#39;t technically maintain most of these files :)</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Thank you!</div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000541d2905e07a8a83--


