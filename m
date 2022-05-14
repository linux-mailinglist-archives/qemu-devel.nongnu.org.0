Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDC05272C1
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 17:57:33 +0200 (CEST)
Received: from localhost ([::1]:52270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npu96-0001ua-B9
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 11:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npu7l-0008Fc-9K
 for qemu-devel@nongnu.org; Sat, 14 May 2022 11:56:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npu7g-0004Mx-37
 for qemu-devel@nongnu.org; Sat, 14 May 2022 11:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652543762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l1iI/oEOJwAG9iSQ1HbkQVtsy68QYzXePuBN3Cc/Ve0=;
 b=UXeSxu+mNbmFRK28s7lWUa5x0nJ58k+MDkysmrhAh9gfIElIBAE0+M8OEMwW9sLgrj+Cmu
 z9AX07cdSjfcIJSbO9FvT1Shk/FGkx5Hiv5sGCAnFloHV0qThXroR8T83VGjrytlbet1di
 rlNmSqHuxKDipBMeZj0cl2EZiOgAjAg=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-1zerij4ZNpyTgWpALWPaWg-1; Sat, 14 May 2022 11:56:01 -0400
X-MC-Unique: 1zerij4ZNpyTgWpALWPaWg-1
Received: by mail-ua1-f71.google.com with SMTP id
 a1-20020ab02301000000b00368a30ad1d3so250959uao.23
 for <qemu-devel@nongnu.org>; Sat, 14 May 2022 08:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l1iI/oEOJwAG9iSQ1HbkQVtsy68QYzXePuBN3Cc/Ve0=;
 b=iwIjHFrL1vRm0NC2aXvJkLOttj78GGFLQCH5NMtC/OSY71KFYx6Iihxr0WQWMK0b4F
 XF6Bl0JfJhwjy1wD4mVnKiN3/HGV9zP5Lg40TJNNhQxxHGiXoLz+yNn3BPzM2ka+j5Nk
 gE4m5MmOH8ZJYSLK14p9fYtIw/EPLLBeuFx6tjB0YwkfZgZ93cahUpPmUXi5+UmbIRHe
 X89QMBxsRlbGjio8buFltUDp20GOB3P8OT9NviCSPDZoYg+gdELbtctHvkz6AK+4cysW
 meby3JhDB4tx5xXxpnJvUDpeEyAF0kyNHTZaqdyKJemCPiplAqU0Dj9w9f+8r0d/k6Pn
 5Rag==
X-Gm-Message-State: AOAM5324eoXofB1VWzY4myHd9ZtGBjAyF1jqj5/EWd8p2VX6NzWmr9JX
 wZjVdnA74KN4VNF3pNHfElJfOcdcQW7Z1IpSyEqb5VhJYCSjMv2AEJcAwrZkrOBTeWOhcw+k52p
 1+3hXKuQH7ykpqamlMN9dEd5uEA9i1+g=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr4385723vsa.38.1652543760424; 
 Sat, 14 May 2022 08:56:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzE9/NS2aqiJh7/CuFbX1sbK3x30lPRbW/f98mRGG9fvxxfvt7oQSL4ta1WsGjcgY5BbpOpkzQpl1cbUNKylzo=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr4385711vsa.38.1652543760220; Sat, 14 May
 2022 08:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220513000609.197906-1-jsnow@redhat.com>
 <20220513000609.197906-10-jsnow@redhat.com>
 <ab6d4171-74f0-3b6c-9ffc-1ed8f4fb0493@redhat.com>
 <CAFn=p-b19dDshg7ShuNqhH+1h_ptYL4qpZSkTvnVnZOPT3g8HQ@mail.gmail.com>
 <b30dd93b-0ced-0aea-5e84-57fa4294f4ad@redhat.com>
In-Reply-To: <b30dd93b-0ced-0aea-5e84-57fa4294f4ad@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Sat, 14 May 2022 11:55:49 -0400
Message-ID: <CAFn=p-bqbcXBLLmT3Fqu1b7Y0Hu=M6B5oKT7J9idXn=tmrt4UA@mail.gmail.com>
Subject: Re: [RFC PATCH 9/9] iotests: use tests/venv for running tests
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000cdd4ed05defad3f7"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

--000000000000cdd4ed05defad3f7
Content-Type: text/plain; charset="UTF-8"

On Fri, May 13, 2022, 11:33 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 5/13/22 16:38, John Snow wrote:
> > It *should*, because "#!/usr/bin/env python3" is the preferred shebang
> > for Python scripts.
> >
> > https://peps.python.org/pep-0394/ <https://peps.python.org/pep-0394/>
> >
> > 'python3' "should" be available. 'python' may not be.
> >
> > Probably the "python" name in Makefile for TESTS_PYTHON should actually
> > be "python3" as well. In practice, all permutations (python, python3,
> > python3.9, etc.) are symlinks* to the binary used to create the venv.
> > Which links are present may be site configurable, but pep394 should
> > guarantee that python3 is always available.
>
> IIRC we have some cases (FreeBSD?) where only the python3.x executable
> is available.  This is why we 1) default to Meson's Python 3 if neither
> --meson nor --python are passed, and 2) use the shebang you mention but
> with *non-executable* files, which Meson treats magically as "invoke
> with the Python interpreter that was used to launch me".
>
> Paolo
>

pkg install python3 on fbsd 13.0-R gives you /usr/bin/python3 fwiw. do you
know in what circumstances you get only a point release binary?

Creating a venv on fbsd with "python3 -m venv testvenv" created a python3
binary link, but not a python3.8 link, also.

Still leaning towards the idea that "python3" is safest, but maybe it
depends on how you install from ports etc. I'd still say that it's
reasonable to expect that a system with python pays heed to PEP0394, I
think you've got a broken python install if you don't.

(But, what's the use case that forced your hand otherwise?)

--js

>

--000000000000cdd4ed05defad3f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, May 13, 2022, 11:33 AM Paolo Bonzini &lt;<a hr=
ef=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">On 5/13/22 16:38, John Snow wrote:<br>
&gt; It *should*, because &quot;#!/usr/bin/env python3&quot; is the preferr=
ed shebang <br>
&gt; for Python scripts.<br>
&gt; <br>
&gt; <a href=3D"https://peps.python.org/pep-0394/" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">https://peps.python.org/pep-0394/</a> &lt;<a href=
=3D"https://peps.python.org/pep-0394/" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://peps.python.org/pep-0394/</a>&gt;<br>
&gt; <br>
&gt; &#39;python3&#39; &quot;should&quot; be available. &#39;python&#39; ma=
y not be.<br>
&gt; <br>
&gt; Probably the &quot;python&quot; name in Makefile for TESTS_PYTHON shou=
ld actually <br>
&gt; be &quot;python3&quot; as well. In practice, all permutations (python,=
 python3, <br>
&gt; python3.9, etc.)=C2=A0are symlinks* to the binary used to create the v=
env. <br>
&gt; Which links are present may be site configurable, but pep394 should <b=
r>
&gt; guarantee that python3 is always available.<br>
<br>
IIRC we have some cases (FreeBSD?) where only the python3.x executable <br>
is available.=C2=A0 This is why we 1) default to Meson&#39;s Python 3 if ne=
ither <br>
--meson nor --python are passed, and 2) use the shebang you mention but <br=
>
with *non-executable* files, which Meson treats magically as &quot;invoke <=
br>
with the Python interpreter that was used to launch me&quot;.<br>
<br>
Paolo<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">pkg install python3 on fbsd 13.0-R gives you /usr/bin/python3 fwiw. do=
 you know in what circumstances you get only a point release binary?<br></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Creating a venv on fbsd wi=
th &quot;python3 -m venv testvenv&quot; created a python3 binary link, but =
not a python3.8 link, also.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Still leaning towards the idea that &quot;python3&quot; is safest, but =
maybe it depends on how you install from ports etc. I&#39;d still say that =
it&#39;s reasonable to expect that a system with python pays heed to PEP039=
4, I think you&#39;ve got a broken python install if you don&#39;t.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">(But, what&#39;s the use case t=
hat forced your hand otherwise?)</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">--js</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
</blockquote></div></div></div>

--000000000000cdd4ed05defad3f7--


