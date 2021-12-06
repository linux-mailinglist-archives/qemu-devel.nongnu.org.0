Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD9246A3B8
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 19:02:57 +0100 (CET)
Received: from localhost ([::1]:43788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muIKG-0005dQ-Ch
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 13:02:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1muIH6-0003G1-9X
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 12:59:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1muIH0-0000JG-MC
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 12:59:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638813573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LrVMGfxLZs6kYp57GqFMnSDG4PMJmyMyMa4hEGYaOtM=;
 b=TehmcTtcSsnonqQyieBC6z+EkWS0MHvyOp5+pH3jmqCySgKpP75D3MqLOi5SLVNQSE39so
 p70FZfUYQld3/gcE1+49gpW5CJZC/d6oYhjgbg8ke07KoqOEY7ySAv2XlXB1m2LdrHGkG/
 OOEAMtJwjgZ6t9yLOvsUOJyN9qj7HUs=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-pevxettbN4OlpGNLV6HhpQ-1; Mon, 06 Dec 2021 12:59:32 -0500
X-MC-Unique: pevxettbN4OlpGNLV6HhpQ-1
Received: by mail-vk1-f198.google.com with SMTP id
 j194-20020a1f6ecb000000b002f4c0eb8185so4502195vkc.6
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 09:59:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LrVMGfxLZs6kYp57GqFMnSDG4PMJmyMyMa4hEGYaOtM=;
 b=124YJAsfyaPlr56ll1AbPdT0/YRZhziwo1pnKepFFMiCqJqt0xg+ltyugAtPH0OfvX
 ka1g1pKl9ZWsYklJ8DEStHGy+i+zPSH8kQ6zZ3qMEW6LT3/YUqs+AKyEv4vh7/j8UQye
 4QtmIlUd/4DlqyX2jO0+oxSV48X76ADVuUHFmn6qVoDHzlqAL18BQ7zdD8Vjze5+bhqn
 NkoYXmCLH269UQ7XgUgYjX8rrm13RAs8CMVg179HXn1OVX8NuBSWqjyX0+qVix1nam9V
 0ZKpDWsWtZ0I4DdyW+iViTBCp3/bCMfdLGBHjZBUmjc4SY6zFdx4eTmEZU/FghaNYBiT
 xTVw==
X-Gm-Message-State: AOAM533noz/zxSUXzmIehTNOr03PP3jig2C1InXZ+7jW5BacF9TYnVZz
 mUOSbbaS9FV++MP3jR2lesntq+g9ZBy0Lyf8DkdC9YNslrWthiGPCOiRnVjJJF6yb1v38hqZY+g
 ZlwweiwMj6rNPtlQRe8AkIfXFPWVAuhM=
X-Received: by 2002:a67:e40d:: with SMTP id d13mr37741851vsf.11.1638813570903; 
 Mon, 06 Dec 2021 09:59:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnGzPBVVdSGBjD77UG1T+ehkfqkUWgJq88v++M12Tw0NmOSlH/NV8u7BS++uNy34Sfj/9Pa3eYUnfqW0MpUpk=
X-Received: by 2002:a67:e40d:: with SMTP id d13mr37741699vsf.11.1638813569471; 
 Mon, 06 Dec 2021 09:59:29 -0800 (PST)
MIME-Version: 1.0
References: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
 <20211203122223.2780098-3-vsementsov@virtuozzo.com>
In-Reply-To: <20211203122223.2780098-3-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 6 Dec 2021 12:59:18 -0500
Message-ID: <CAFn=p-aAB9TXcJkm_cNtAowz_AjWeTvFgyL8kZ7E4zyDqMxF_Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] iotests/testrunner.py: move updating last_elapsed to
 run_tests
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a96ffd05d27e04fd"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, den@openvz.org,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a96ffd05d27e04fd
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 3, 2021 at 7:22 AM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> We are going to use do_run_test() in multiprocessing environment, where
> we'll not be able to change original runner object.
>
> Happily, the only thing we change is that last_elapsed and it's simple
> to do it in run_tests() instead. All other accesses to self in
> do_runt_test() and in run_test() are read-only.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/testrunner.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tests/qemu-iotests/testrunner.py
> b/tests/qemu-iotests/testrunner.py
> index fa842252d3..a9f2feb58c 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -287,7 +287,6 @@ def do_run_test(self, test: str) -> TestResult:
>                                diff=diff, casenotrun=casenotrun)
>          else:
>              f_bad.unlink()
> -            self.last_elapsed.update(test, elapsed)
>              return TestResult(status='pass', elapsed=elapsed,
>                                casenotrun=casenotrun)
>
> @@ -353,6 +352,9 @@ def run_tests(self, tests: List[str]) -> bool:
>                      print('\n'.join(res.diff))
>              elif res.status == 'not run':
>                  notrun.append(name)
> +            elif res.status == 'pass':
> +                assert res.elapsed is not None
> +                self.last_elapsed.update(t, res.elapsed)
>
>              sys.stdout.flush()
>              if res.interrupted:
> --
> 2.31.1
>
>
(I continue to be annoyed by the "None" problem in mypy, but I suppose it
really can't be helped. Nothing for you to change with this patch or
series. I just wish we didn't need so many assertions ...)

Reviewed-by: John Snow <jsnow@redhat.com>

--000000000000a96ffd05d27e04fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 3, 2021 at 7:22 AM Vladim=
ir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vsem=
entsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">We are going to use do_run_test() in multiprocessing en=
vironment, where<br>
we&#39;ll not be able to change original runner object.<br>
<br>
Happily, the only thing we change is that last_elapsed and it&#39;s simple<=
br>
to do it in run_tests() instead. All other accesses to self in<br>
do_runt_test() and in run_test() are read-only.<br>
<br>
Signed-off-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementso=
v@virtuozzo.com" target=3D"_blank">vsementsov@virtuozzo.com</a>&gt;<br>
---<br>
=C2=A0tests/qemu-iotests/testrunner.py | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunn=
er.py<br>
index fa842252d3..a9f2feb58c 100644<br>
--- a/tests/qemu-iotests/testrunner.py<br>
+++ b/tests/qemu-iotests/testrunner.py<br>
@@ -287,7 +287,6 @@ def do_run_test(self, test: str) -&gt; TestResult:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff=3Ddiff, casenotrun=3Dcasenotrun)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f_bad.unlink()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.last_elapsed.update(test, e=
lapsed)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return TestResult(status=3D=
&#39;pass&#39;, elapsed=3Delapsed,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0casenotrun=3Dcasenotrun)<br>
<br>
@@ -353,6 +352,9 @@ def run_tests(self, tests: List[str]) -&gt; bool:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0print(&#39;\n&#39;.join(res.diff))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif res.status =3D=3D &#39=
;not run&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0notrun.append=
(name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif res.status =3D=3D &#39;pass=
&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert res.elapsed=
 is not None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.last_elapsed.=
update(t, res.elapsed)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.stdout.flush()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if res.interrupted:<br>
-- <br>
2.31.1<br>
<br></blockquote><div><br></div><div>(I continue to be annoyed by the &quot=
;None&quot; problem in mypy, but I suppose it really can&#39;t be helped. N=
othing for you to change with this patch or series. I just wish we didn&#39=
;t need so many assertions ...)<br></div><div><br></div><div>Reviewed-by: J=
ohn Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt;</=
div></div></div>

--000000000000a96ffd05d27e04fd--


