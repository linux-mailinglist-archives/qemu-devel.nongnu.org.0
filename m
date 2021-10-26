Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED1C43BA15
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 21:00:44 +0200 (CEST)
Received: from localhost ([::1]:37118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRgh-0005rW-Fb
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 15:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfRXY-0001ru-01
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:51:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfRXR-0006vH-TD
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635274268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CZX0czu5tjSAtvBdeNOx1IBjkZo/7/LlOEbPQOO82T0=;
 b=Ij7wU15rncV3t41AAO+e1yZpqzYhXw+6mpX80r+kjiDODGDm23sysqctBm0sWJ8+bnP8j8
 vb5xfhtgs4HqpFf+W7/p9iyFlpZ6LnGBi0lc6T5W6D7hZUsR7PoX4koH4W6t4EzbYFOfdc
 l2am8n96VPR/iqBAR+7zltxF9HCDpZo=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-9ElPC1fCOFi6MqmDT3Keug-1; Tue, 26 Oct 2021 14:51:06 -0400
X-MC-Unique: 9ElPC1fCOFi6MqmDT3Keug-1
Received: by mail-vk1-f199.google.com with SMTP id
 r17-20020ac5cb11000000b002dcd7f5e560so172810vkl.15
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 11:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CZX0czu5tjSAtvBdeNOx1IBjkZo/7/LlOEbPQOO82T0=;
 b=e+1jw3hVXqLZb2wtP1amdS1sj4UiZ5o6dmkvU05ddYDVYwq2cxL0+d5+kSzvR9Op3O
 Qs/XsFpcTHf8Yhp7eFxh6l45q5++/MHG2mIHUbZ9IzafzjGNdJnEpnEHxoXH75OeIcwF
 2e8uIg8rwbP/HmJ7FA0h+yeU63oOpfmbuyNHbYOcqd8K/IfKHMV858WUu3nH4BdebTan
 Hyf4CYgA0Mtwa63njcQvx+2+ci9sR+cJI2eTTmbg7c+mSAYfWRAhWvuK1QJNYgW7kZe4
 KMr3lceRHEUR1MOJylSkDdwFLFDUsplG2v7RwIbxjkRAMmoHPsb6Xvg0jYDDlUspoHQn
 3Caw==
X-Gm-Message-State: AOAM5329TGD0yG9jjspOpw6s6yeHyFAMYXt+fK7l/gRjolSmu2ok9WwO
 dIPT5VmbW4k7B6MpZ/6cALFmSj2lqYP6sCn5uWbeZIIDwIBkJ6h3+DGhvCzWTzqRnXctAaArQNp
 vIqsLcKpxxRvom+AS90tEUhNr77T069k=
X-Received: by 2002:a67:ed07:: with SMTP id l7mr25424015vsp.40.1635274265847; 
 Tue, 26 Oct 2021 11:51:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTMzU7bAQ9o8qHX6JalzUFKT8SAu97V4N+cJR6gcJlHyF8+ThVKSYhY1MOD9aopqqENVIjNItgR5ONdenpw3E=
X-Received: by 2002:a67:ed07:: with SMTP id l7mr25423983vsp.40.1635274265615; 
 Tue, 26 Oct 2021 11:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211008062821.1010967-1-eesposit@redhat.com>
 <ec26842c-27a7-4f3a-3eab-7f2096581101@redhat.com>
 <10dd6939-4199-0974-a4e6-0c9a45a7c721@redhat.com>
In-Reply-To: <10dd6939-4199-0974-a4e6-0c9a45a7c721@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Oct 2021 14:50:55 -0400
Message-ID: <CAFn=p-aA9di4KiE4X729JFCo4SAbuEbPk-5nQ7H1B4pA4vp2fA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pylint: fix new errors and warnings in qemu-iotests
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b6742005cf45f572"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b6742005cf45f572
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 5:58 AM Emanuele Giuseppe Esposito <
eesposit@redhat.com> wrote:

>
>
> On 11/10/2021 11:29, Hanna Reitz wrote:
> > On 08.10.21 08:28, Emanuele Giuseppe Esposito wrote:
> >> There are some warnings and errors that we either miss or
> >> are new in pylint. Anyways, test 297 of qemu-iotests fails
> >> because of that, so we need to fix it.
> >>
> >> All these fixes involve just indentation or additional spaces
> >> added.
> >>
> >> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> >> ---
> >> v2:
> >> * temporarly enable and then disable "bad whitespace" error in
> >> image-fleecing
> >> * better indentation for a fix in test 129 in patch one
> >
> > So the changes look good to me, but I can=E2=80=99t get my pylint to ge=
nerate a
> > bad-whitespace warning no matter how hard I try.  (When you asked on IR=
C
> > whether others see pylint warnings, I thought you meant the
> > consider-using-f-string warnings that John disabled in
> > 3765315d4c84f9c0799744f43a314169baaccc05.)
> >
> > I have pylint 2.11.1, which should be the newest version.  So I tried t=
o
> > look around what might be the cause and found this:
> > https://pylint.pycqa.org/en/latest/whatsnew/2.6.html =E2=80=93 it seems=
 that as
> > of pylint 2.6, bad-whitespace warnings are no longer emitted.  If that=
=E2=80=99s
> > the reason why I can=E2=80=99t see the warning, then I think we should =
take only
> > patch 1 (because it just makes sense), but skip patch 2.
> >
>
> Yes you are right. I had 2.4.4, and now that I upgraded to 2.11.1 I
> don't see bad-whitespace errors anymore (actually pylint does not seem
> to complain at all). So I agree we can just take patch 1, as formatting
> is wrong anyways.
>
>
FWIW, the minimum version of pylint supported by the python/ tests is
2.8.0, for other reasons -- see commit b4d37d81. I no longer test or check
for compatibility with older versions of pylint on any of our codebase.
I've also authored a series to add iotest 297 to the Python CI directly,
see https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg04329.html --
this gives a sense of "canonically supported linter versions" to that test.

Currently, that support matrix is:

Python 3.6 to Python 3.10
mypy >=3D 0.770 (Known to work with current latest, 0.910)
pylint >=3D 2.8.0 (Known to work with current latest, 2.11.1)

The "check-python-pipenv" test is the one Python CI test that will actually
gate a build -- that test runs Python 3.6 with the oldest possible linter
versions we support to ensure we don't accidentally start using new
features.
"check-python-tox" tests all python versions, 3.6 through 3.10, with
bleeding edge packages. That CI test is "allowed to fail with a warning"
and serves to alert me to new incompatible changes in updated Python
dependencies.

--js

--000000000000b6742005cf45f572
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 11, 2021 at 5:58 AM Emanu=
ele Giuseppe Esposito &lt;<a href=3D"mailto:eesposit@redhat.com">eesposit@r=
edhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
<br>
On 11/10/2021 11:29, Hanna Reitz wrote:<br>
&gt; On 08.10.21 08:28, Emanuele Giuseppe Esposito wrote:<br>
&gt;&gt; There are some warnings and errors that we either miss or<br>
&gt;&gt; are new in pylint. Anyways, test 297 of qemu-iotests fails<br>
&gt;&gt; because of that, so we need to fix it.<br>
&gt;&gt;<br>
&gt;&gt; All these fixes involve just indentation or additional spaces<br>
&gt;&gt; added.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Emanuele Giuseppe Esposito &lt;<a href=3D"mailto:ee=
sposit@redhat.com" target=3D"_blank">eesposit@redhat.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; v2:<br>
&gt;&gt; * temporarly enable and then disable &quot;bad whitespace&quot; er=
ror in <br>
&gt;&gt; image-fleecing<br>
&gt;&gt; * better indentation for a fix in test 129 in patch one<br>
&gt; <br>
&gt; So the changes look good to me, but I can=E2=80=99t get my pylint to g=
enerate a <br>
&gt; bad-whitespace warning no matter how hard I try.=C2=A0 (When you asked=
 on IRC <br>
&gt; whether others see pylint warnings, I thought you meant the <br>
&gt; consider-using-f-string warnings that John disabled in <br>
&gt; 3765315d4c84f9c0799744f43a314169baaccc05.)<br>
&gt; <br>
&gt; I have pylint 2.11.1, which should be the newest version.=C2=A0 So I t=
ried to <br>
&gt; look around what might be the cause and found this: <br>
&gt; <a href=3D"https://pylint.pycqa.org/en/latest/whatsnew/2.6.html" rel=
=3D"noreferrer" target=3D"_blank">https://pylint.pycqa.org/en/latest/whatsn=
ew/2.6.html</a> =E2=80=93 it seems that as <br>
&gt; of pylint 2.6, bad-whitespace warnings are no longer emitted.=C2=A0 If=
 that=E2=80=99s <br>
&gt; the reason why I can=E2=80=99t see the warning, then I think we should=
 take only <br>
&gt; patch 1 (because it just makes sense), but skip patch 2.<br>
&gt; <br>
<br>
Yes you are right. I had 2.4.4, and now that I upgraded to 2.11.1 I <br>
don&#39;t see bad-whitespace errors anymore (actually pylint does not seem =
<br>
to complain at all). So I agree we can just take patch 1, as formatting <br=
>
is wrong anyways.<br>
<br></blockquote><div><br></div><div>FWIW, the minimum version of pylint su=
pported by the python/ tests is 2.8.0, for other reasons -- see commit b4d3=
7d81. I no longer test or check for compatibility with older versions of py=
lint on any of our codebase.<br></div><div>I&#39;ve also authored a series =
to add iotest 297 to the Python CI directly, see <a href=3D"https://lists.g=
nu.org/archive/html/qemu-devel/2021-10/msg04329.html">https://lists.gnu.org=
/archive/html/qemu-devel/2021-10/msg04329.html</a> -- this gives a sense of=
 &quot;canonically supported linter versions&quot; to that test.<br><br></d=
iv><div>Currently, that support matrix is:<br><br></div><div>Python 3.6 to =
Python 3.10<br></div><div>mypy &gt;=3D 0.770 (Known to work with current la=
test, 0.910)<br></div><div>pylint &gt;=3D 2.8.0 (Known to work with current=
 latest, 2.11.1)<br></div><div><br></div><div>The &quot;check-python-pipenv=
&quot; test is the one Python CI test that will actually gate a build -- th=
at test runs Python 3.6 with the oldest possible linter versions we support=
 to ensure we don&#39;t accidentally start using new features.</div><div>&q=
uot;check-python-tox&quot; tests all python versions, 3.6 through 3.10, wit=
h bleeding edge packages. That CI test is &quot;allowed to fail with a warn=
ing&quot; and serves to alert me to new incompatible changes in updated Pyt=
hon dependencies.<br></div><div><br></div><div>--js<br></div></div></div>

--000000000000b6742005cf45f572--


