Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6107242C47E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 17:08:36 +0200 (CEST)
Received: from localhost ([::1]:39570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mafrv-00059l-0y
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 11:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mafql-0004Rv-0V
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 11:07:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mafqi-00005I-75
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 11:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634137639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RyoZvs7+QsZGyoLDTy8ISIbCJjqH25SYWECNliZq90s=;
 b=N5HIu08TPimOp/mKdlBPQOs7rEIKOde1FxDlQrYkx5JAUNTEKrmEqyEEvlpNk7JQQyTfeu
 r4gS5jo05jIhLdlGxzE9Z1O3FTPPYb/uDk/zL0KMFSrkeNxmRsoRTgJK5zl/2D4yCkCLSM
 nq8gX2jy40KDgb3kBy07HHmlLLxnOYc=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-WXWevlR7Pn-YTLbu_0L1JQ-1; Wed, 13 Oct 2021 11:07:12 -0400
X-MC-Unique: WXWevlR7Pn-YTLbu_0L1JQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 u207-20020a1fabd8000000b002a468395665so421732vke.11
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 08:07:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RyoZvs7+QsZGyoLDTy8ISIbCJjqH25SYWECNliZq90s=;
 b=Lbu8qcwHE2hnKzFaIcUQplo82S5Q/ALGaHpZAodcyWVZ8aJ6QcJhh4IGE8XhtV0S+8
 zwLLC+mpEw9WeAdjUO8YeKOk3r1s/dkrgDX5IuaRpDDMxwXneHKjWd22a6UhTdFDZwSk
 mUzD9TX2UOokDqOJCdjYbxSQf34cqvfo5Rk0yIPfWtWvCU1T7608YYCUerReELUmIiFJ
 gxlZbR52BB9Y2JcfVV+oDUyjuR677Qxdwacb4p9HIdNXuqfd1g83oh0xc1AjYjqOqdHF
 uty5Udx7RW9isLwboVzeQucsR9JCTbRfExSOrFLBqsIobl0Pn2GpKB5WHmO2lPtXi4tb
 2ijA==
X-Gm-Message-State: AOAM533Fj6yeepTcvUezHlTngfxz+9FtUOBtBuCMrgvd29IWPIEfAVUk
 XCCrCMM/JF0ebcNZTuHs4q2lL2KAFQ5KlM06Os4BPk7i93e/JYTueVtgUw2vbSd+xNeajoeTNGF
 MYRDovoWSw0qpWy7a68tE0wrsyPfSvwg=
X-Received: by 2002:a67:f685:: with SMTP id n5mr39718343vso.31.1634137632094; 
 Wed, 13 Oct 2021 08:07:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjONqtbupl8IRwGlL3lLQA67ozLYTuWH4MVJbgC1nkqkdWhw6qI0EVKOvPm2CFEiCQ/UhB6zOnSiev2BdR8Js=
X-Received: by 2002:a67:f685:: with SMTP id n5mr39718306vso.31.1634137631853; 
 Wed, 13 Oct 2021 08:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211004210503.1455391-1-jsnow@redhat.com>
 <20211004210503.1455391-10-jsnow@redhat.com>
 <bbaa0613-3b95-84d8-52ae-c53b1175d096@redhat.com>
In-Reply-To: <bbaa0613-3b95-84d8-52ae-c53b1175d096@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 13 Oct 2021 11:07:01 -0400
Message-ID: <CAFn=p-YkCYr=jmBcSSpPBhDskPgWa5ATFUd-X-thCbK3Z=DJmQ@mail.gmail.com>
Subject: Re: [PATCH 09/13] iotests: split linters.py out from 297
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000fa3ab05ce3d5114"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000fa3ab05ce3d5114
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 7:50 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 04.10.21 23:04, John Snow wrote:
> > Now, 297 is just the iotests-specific incantations and linters.py is as
> > minimal as I can think to make it. The only remaining element in here
> > that ought to be configuration and not code is the list of skip files,
>
> Yeah...
>
> > but they're still numerous enough that repeating them for mypy and
> > pylint configurations both would be ... a hassle.
>
> I agree.
>
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/297        | 72 +++---------------------------
> >   tests/qemu-iotests/linters.py | 83 ++++++++++++++++++++++++++++++++++=
+
> >   2 files changed, 88 insertions(+), 67 deletions(-)
> >   create mode 100644 tests/qemu-iotests/linters.py
>
> I=E2=80=99d like to give an A-b because now the statuscode-returning func=
tion is
> in a library.  But I already gave an A-b on the last patch precisely
> because of the interface, and I shouldn=E2=80=99t be so grumpy.
>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>
>
I'm not entirely sure I understand your dislike(?) of status codes. I'm not
trying to ignore the feedback, but I don't think I understand it fully.

Would it be better if I removed check=3DFalse and allowed the functions to
raise an Exception on non-zero subprocess return? (Possibly having the
function itself print the stdout on the error case before re-raising.)

--js

--0000000000000fa3ab05ce3d5114
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 13, 2021 at 7:50 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 04.10.2=
1 23:04, John Snow wrote:<br>
&gt; Now, 297 is just the iotests-specific incantations and linters.py is a=
s<br>
&gt; minimal as I can think to make it. The only remaining element in here<=
br>
&gt; that ought to be configuration and not code is the list of skip files,=
<br>
<br>
Yeah...<br>
<br>
&gt; but they&#39;re still numerous enough that repeating them for mypy and=
<br>
&gt; pylint configurations both would be ... a hassle.<br>
<br>
I agree.<br>
<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/297=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 72 +++=
---------------------------<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/linters.py | 83 +++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 88 insertions(+), 67 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 tests/qemu-iotests/linters.py<br>
<br>
I=E2=80=99d like to give an A-b because now the statuscode-returning functi=
on is <br>
in a library.=C2=A0 But I already gave an A-b on the last patch precisely <=
br>
because of the interface, and I shouldn=E2=80=99t be so grumpy.<br>
<br>
Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D=
"_blank">hreitz@redhat.com</a>&gt;<br>
<br></blockquote><div><br></div><div>I&#39;m not entirely sure I understand=
 your dislike(?) of status codes. I&#39;m not trying to ignore the feedback=
, but I don&#39;t think I understand it fully.</div><div><br></div><div>Wou=
ld it be better if I removed check=3DFalse and allowed the functions to rai=
se an Exception on non-zero subprocess return? (Possibly having the functio=
n itself print the stdout on the error case before re-raising.)<br></div><d=
iv><br></div><div>--js<br></div></div></div>

--0000000000000fa3ab05ce3d5114--


