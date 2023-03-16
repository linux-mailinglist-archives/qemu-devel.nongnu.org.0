Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE6A6BD39E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 16:29:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcpWG-0003bl-V0; Thu, 16 Mar 2023 11:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pcpWE-0003bT-S3; Thu, 16 Mar 2023 11:27:54 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pcpWD-00070J-8Q; Thu, 16 Mar 2023 11:27:54 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so5749428pjg.4; 
 Thu, 16 Mar 2023 08:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678980471;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VP/Y73yDtFhgviX/LeizPEFg+ajadc2lBP6Xt4JJgBw=;
 b=F6cZB0piIIWCAnBppgzVjpMugm4syEWx8zoAafFxgGyFil0RR1Kpo9LW6nmVHr4U70
 C81KYG1ye+Y7Dai8oMD74+M9hBygn0qgLIoio7n+uig8LknTeF4zLf9SB+EOaAJx+91n
 uvVuxbDCVQwjkY8eD+Ety5sFNwocGFAXUxu80KP+8d9kh37P5byBOUYr/0/6ndTrRXvZ
 eWCDSl48Fh7J92yem970eLEcAlHReJpUHmRkZALB6Jw8LKOv9P176Tl6fK/URx6l5O8a
 k7rdglevXU7IDGECe7a++m0ZBuY4nxjq+AESmsa8qygzzXUNU0KGsg8loSwkFsiDQI76
 mD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678980471;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VP/Y73yDtFhgviX/LeizPEFg+ajadc2lBP6Xt4JJgBw=;
 b=ryxSXABzSjZ2CA4WGlEmWiA6BaofYzMFUy/x/IrjcXe9hXF9njt5Tz9vwk1RebGTeT
 A/+wWC6Tt/h7urBtfJX1J5lGgIJl1BeG3UUIJZYrAyh/WZ9mh6Hx2qxiaoMx+xqGUZnO
 PLf0Ik2ClTqXJWwJk7dZhfLnVlpoRtFYkUBUrKWPS0krcgY1nAbcuf/dHfsN1StWGzbb
 9vqz5W0tWeupChPU2gEK1UytBzBynkGujgry9w1KmkJgrEHPt8y4pB8XLQZCRyL7QuDd
 S5mQ1aqNRilH6Hq5PU0J5KaBNRTY0RiDtxg60k7DlsEXezCL9wc0cMR16fkdaOxZU7q0
 Edbw==
X-Gm-Message-State: AO0yUKWr74Nb9Hi3pmDIf6tzj8IKGoFhjjYK+fXFVOJoGjiosUglzByx
 A3Ncp5iAW6Etl9VMuq817nv82zVng+78RFMO71A=
X-Google-Smtp-Source: AK7set/XJldzqSXHtHKMEMQJpPq6gzD1SRhU5Bi0uG9ePwndAAK/M123qjOH6oGFjRKW1rxmJfYb8lSxe7fTUbZUrwE=
X-Received: by 2002:a17:903:1ca:b0:1a0:7630:8ef4 with SMTP id
 e10-20020a17090301ca00b001a076308ef4mr1639275plh.2.1678980471488; Thu, 16 Mar
 2023 08:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
 <CA+rFky5=kc0Pwf3RRhuKrBqtRVkmtm=NDKhrVgJV2_Ame2nUOQ@mail.gmail.com>
 <c33b0e07-5c46-6ebe-fe4c-5308ce508a70@linaro.org>
 <632e7256-34f5-ca87-ff60-a5c11aa1dd7f@redhat.com>
 <CA+rFky6WqdLjNpeU3sCXwjwMEuEK+XVHE5BBCKYC=umRGK81eg@mail.gmail.com>
 <CA+rFky4su7ZEo8pNQGk3qEkTOLEkFAqO2Tsrh6VyDaNOf7w=_Q@mail.gmail.com>
 <ac632c34-42e0-d715-52d9-b70ead6296a7@redhat.com>
 <CA+rFky6Tt0hcv9TuthS7Q-5SMXtPi+3W8B5qX5itJ0A+meh_Ew@mail.gmail.com>
 <ZBMNEdz9WnUsckd7@redhat.com>
 <CA+rFky6hnaCxF10ST=qsLsBjH6=M__kQPA=yoZhdCoB8sH96ug@mail.gmail.com>
 <0e06c704-40d7-b511-8353-0218c3d45d3b@redhat.com>
In-Reply-To: <0e06c704-40d7-b511-8353-0218c3d45d3b@redhat.com>
From: Andrew Randrianasulu <randrianasulu@gmail.com>
Date: Thu, 16 Mar 2023 18:27:37 +0300
Message-ID: <CA+rFky5RWH5nJDLCq1aN_0BXuK1gvT1TAsaHT_mejcMzq3ABUQ@mail.gmail.com>
Subject: Re: dropping 32-bit host support
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000096869505f7061a03"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=randrianasulu@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000096869505f7061a03
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 16:32 Thomas Huth <thuth=
@redhat.com>:

> On 16/03/2023 14.01, Andrew Randrianasulu wrote:
> ...
> > Well, this language about "market" and "investment"  not just figures o=
f
> the
> > speech, sadly? Because paid developers work on  areas they paid to
> develop,
> > by boss with big bucks.
>
> Sorry for getting more explicit now, but: Can you please stop making such
> aggressive assertions which are obviously wrong and where you apparently
> have no clue about about?
>

I usually read much more than I write, thank you very much.



> If you'd followed the QEMU project, you'd know that there are very helpfu=
l
> people around, from all kind of companies, Linaro guys who help with
> reviewing and merging non-ARM patches, Red Hatters who help with BSD and
> Haiku patches, etc.
>
> Anyway, if you're not happy with the way the project is evolving, then
> start
> contributing instead of grumbling.
>


Is there any point to contributing to project that happily will told you to
.....go smoke in a corner?

>
>   Thomas
>
>

--00000000000096869505f7061a03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 16:=
32 Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>=
&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">On 16/03/2023 14.01, Andrew R=
andrianasulu wrote:<br>
...<br>
&gt; Well, this language about &quot;market&quot; and &quot;investment&quot=
;=C2=A0 not just figures of the <br>
&gt; speech, sadly? Because paid developers work on=C2=A0 areas they paid t=
o develop, <br>
&gt; by boss with big bucks.<br>
<br>
Sorry for getting more explicit now, but: Can you please stop making such <=
br>
aggressive assertions which are obviously wrong and where you apparently <b=
r>
have no clue about about?<br></blockquote></div></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">I usually read much more than I write, thank you v=
ery much.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
If you&#39;d followed the QEMU project, you&#39;d know that there are very =
helpful <br>
people around, from all kind of companies, Linaro guys who help with <br>
reviewing and merging non-ARM patches, Red Hatters who help with BSD and <b=
r>
Haiku patches, etc.<br>
<br>
Anyway, if you&#39;re not happy with the way the project is evolving, then =
start <br>
contributing instead of grumbling.<br></blockquote></div></div><div dir=3D"=
auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Is there any =
point to contributing to project that happily will told you to .....go smok=
e in a corner?</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
=C2=A0 Thomas<br>
<br>
</blockquote></div></div></div>

--00000000000096869505f7061a03--

