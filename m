Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129CE46A37E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 18:54:32 +0100 (CET)
Received: from localhost ([::1]:38126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muIC6-0000zM-Lb
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 12:54:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1muIAy-00009T-7J
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 12:53:21 -0500
Received: from usb-smtp-delivery-124.mimecast.com ([170.10.151.124]:44101
 helo=us-smtp-delivery-124.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1muIAu-00040y-SX
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 12:53:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638813195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bhbxHpouW8Kxo3OV7ZWFpalfCtG4tjBvq/LYnOCiC2M=;
 b=fmSAbzX9o5fbO4s7xcW93TXPRBUbktsixqq0qtEiGC9ccsaMBqJMZnU8UdGCUXgIOQZ2Z5
 VE0EjTI8dL5Ih151EnVKjkfPrqi+Ykr2cEWzzmq828hdcqe3zG7DHWriTIDa5DDpd3bhAG
 /VZRYHCOuXn9GLLrIlAFeukzgFNRgVw=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-YB3fom0BMtmRRCVm-zShqw-1; Mon, 06 Dec 2021 12:53:14 -0500
X-MC-Unique: YB3fom0BMtmRRCVm-zShqw-1
Received: by mail-vk1-f198.google.com with SMTP id
 m5-20020ac5cfc5000000b002fafbc93a15so4460610vkf.16
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 09:53:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bhbxHpouW8Kxo3OV7ZWFpalfCtG4tjBvq/LYnOCiC2M=;
 b=AG3QjDVr06VcVtSXPqmxlkY2TVA89WZ6/UTVmKKO/9gl5+Bf3Hn3mwKVz3vLZg5Vyl
 YGX7vCo5vjfosYQYMF4Cq/IfxS+F5xCdGfpBj/LgKY7oCAY54mcxb4Q2vZlZ2owNzjdQ
 EAPkzTrOdEMk+//M6FgIMiMFDOz5fPYQO4thHmxiHBovaRQYGAxMDQQxt5cJG1+VErU/
 VPbYwS2XnMBAie7eQU2nY21TRCS9LNBt1TwjpmNLugmHipLd+gMN75oWgvXjzRs3FvvT
 N4BPUK5gSMeDnXNme/AMov148xqQekqHT7X0eoGuU2mq4qDx/W5WSbJsXcsgTYliOM2x
 xutQ==
X-Gm-Message-State: AOAM532mQE6TYumkDktiIPM7lEDyXbJ+th0G9bQQRBc0eIFrxvIR0skH
 BfcJreHTrjTkg9H7PlYlvFEeckLQLEdzzNobfezu0dn1wdJHFxOqNzNO0rBI7fgDAzCf8lINdNo
 Kb3x0XlWDwWKF/0or23H7FhuPI2lFIzE=
X-Received: by 2002:a05:6102:c86:: with SMTP id
 f6mr38005887vst.38.1638813193747; 
 Mon, 06 Dec 2021 09:53:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtX8DbUUBHGQToY9soV9gZQx6A1LFpVaHzUNCb8Gm8ptfvYOATIW0T5OJq/rccUBKbf3up//N32ntqo55T660=
X-Received: by 2002:a05:6102:c86:: with SMTP id
 f6mr38005855vst.38.1638813193536; 
 Mon, 06 Dec 2021 09:53:13 -0800 (PST)
MIME-Version: 1.0
References: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
 <20211203122223.2780098-2-vsementsov@virtuozzo.com>
In-Reply-To: <20211203122223.2780098-2-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 6 Dec 2021 12:52:27 -0500
Message-ID: <CAFn=p-b+SQcF=aNGVF0oo-t1P9uwZWz5Spfxg=LOhy7tn-zyZg@mail.gmail.com>
Subject: Re: [PATCH 1/3] iotests/testrunner.py: add doc string for run_test()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000041273905d27dee62"
Received-SPF: pass client-ip=170.10.151.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, den@openvz.org,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000041273905d27dee62
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 3, 2021 at 7:22 AM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> We are going to modify these methods and will add more documentation in
> further commit. As a preparation add basic documentation.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/testrunner.py | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/tests/qemu-iotests/testrunner.py
> b/tests/qemu-iotests/testrunner.py
> index 0e29c2fddd..fa842252d3 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -220,6 +220,12 @@ def find_reference(self, test: str) -> str:
>          return f'{test}.out'
>
>      def do_run_test(self, test: str) -> TestResult:
> +        """
> +        Run one test
> +
> +        :param test: test file path
> +        """
> +
>          f_test = Path(test)
>          f_bad = Path(f_test.name + '.out.bad')
>          f_notrun = Path(f_test.name + '.notrun')
> @@ -287,6 +293,13 @@ def do_run_test(self, test: str) -> TestResult:
>
>      def run_test(self, test: str,
>                   test_field_width: Optional[int] = None) -> TestResult:
> +        """
> +        Run one test and print short status
> +
> +        :param test: test file path
> +        :param test_field_width: width for first field of status format
> +        """
> +
>          last_el = self.last_elapsed.get(test)
>          start = datetime.datetime.now().strftime('%H:%M:%S')
>
> --
> 2.31.1
>
>
Reviewed-by: John Snow <jsnow@redhat.com>

--00000000000041273905d27dee62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 3, 2021 at 7:22 AM Vladim=
ir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vsem=
entsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">We are going to modify these methods and will add more =
documentation in<br>
further commit. As a preparation add basic documentation.<br>
<br>
Signed-off-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementso=
v@virtuozzo.com" target=3D"_blank">vsementsov@virtuozzo.com</a>&gt;<br>
---<br>
=C2=A0tests/qemu-iotests/testrunner.py | 13 +++++++++++++<br>
=C2=A01 file changed, 13 insertions(+)<br>
<br>
diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunn=
er.py<br>
index 0e29c2fddd..fa842252d3 100644<br>
--- a/tests/qemu-iotests/testrunner.py<br>
+++ b/tests/qemu-iotests/testrunner.py<br>
@@ -220,6 +220,12 @@ def find_reference(self, test: str) -&gt; str:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return f&#39;{test}.out&#39;<br>
<br>
=C2=A0 =C2=A0 =C2=A0def do_run_test(self, test: str) -&gt; TestResult:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Run one test<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param test: test file path<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f_test =3D Path(test)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f_bad =3D Path(<a href=3D"http://f_test.n=
ame" rel=3D"noreferrer" target=3D"_blank">f_test.name</a> + &#39;.out.bad&#=
39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f_notrun =3D Path(<a href=3D"http://f_tes=
t.name" rel=3D"noreferrer" target=3D"_blank">f_test.name</a> + &#39;.notrun=
&#39;)<br>
@@ -287,6 +293,13 @@ def do_run_test(self, test: str) -&gt; TestResult:<br>
<br>
=C2=A0 =C2=A0 =C2=A0def run_test(self, test: str,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_field_w=
idth: Optional[int] =3D None) -&gt; TestResult:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Run one test and print short status<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param test: test file path<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param test_field_width: width for first field=
 of status format<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0last_el =3D self.last_elapsed.get(test)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start =3D datetime.datetime.now().strftim=
e(&#39;%H:%M:%S&#39;)<br>
<br>
-- <br>
2.31.1<br>
<br></blockquote><div><br></div><div>Reviewed-by: John Snow &lt;<a href=3D"=
mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt;</div><div> <br></div></di=
v></div>

--00000000000041273905d27dee62--


