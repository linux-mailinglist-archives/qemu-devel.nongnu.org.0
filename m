Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9DD3305A6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 02:34:17 +0100 (CET)
Received: from localhost ([::1]:42364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ4mm-00074P-1z
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 20:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lJ4kg-0005wJ-Od
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 20:32:06 -0500
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:33103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lJ4ke-0006m9-OP
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 20:32:06 -0500
Received: by mail-vs1-xe2d.google.com with SMTP id b189so4086892vsd.0
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 17:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jrNzXrlwhaAbZCzdwHbq1URMUaFtX8HUrOaW3Ftq/us=;
 b=kUOjlojtsfN5oesdUq4mkGmkry/rsOyiPMG8g4hS/b3bZA3mZtJ4bTj1vaofbATnSL
 3gEvTIb12XopAc5i26DJzAbkYs1XGvU/zwvTvH/3dBs5egmkGgeDNDNoLsS2vlBDpTgX
 n5PZrr6Vv84xwYH7BR2H0T1UgcgWEvYrEGRRu2o/CEaQMvYZr72qf3cMdZ+jUTxjLyVM
 apz4R61pGSmSfodOMmj2RhSPCqqABh/uuxNDItotycemPAUKivyF+aqgeEHLqU1nztXY
 hI7XD6CRySrInjv8SZbhfrSybu5rW/3jYnJzuNKm7FLxYE+ygW1ldkI+M5rq/yJjp2WL
 koFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jrNzXrlwhaAbZCzdwHbq1URMUaFtX8HUrOaW3Ftq/us=;
 b=JQYtlmX07r2yAJIfQ5ghDuZQRE5LaFdMH7ytVBUA0L5R2h7NQpihcUcRUFAwm0M4rG
 ayX8ix6yy3420jiVI6ugw9ZbtWrvGd8rJPzmMJlAaK5lmCFsDkImPIPjRTDc1En+RDJ5
 oZGeRWuoHSHrzBsPL6T5jzQhViEJpoEWGZkO0EJtGAdLNOzI41SWwvSO0iGoLTlaOrKP
 VcsQNbKqjVV0quxKd6FtPAPmYT/B1+EA5S020EpiCIdRS/u0JnyBYKCoiprLyNTa+T9V
 T6yuNHZNxtQG2DGJTKEfmKXUzJrrEdUR9AJ59L03J/Mv+OQr1xmciF/2pqD1I6zseNXI
 OQ3g==
X-Gm-Message-State: AOAM530AmRu+Q0jhaLbXjgioncjuMnQXzd1neJEsoydPsjlAg4cXLmEk
 rQQA+fTcpf9Ll6TMj34n3O1U6Wb+K0pm7uy2BFGS9w2qwvW/hA==
X-Google-Smtp-Source: ABdhPJyFu+LLxaPZEu25ToAaLGoSSc64VhUZHYzpzRByQSO/mlXCDqFVZQPNqEo5CjojWbZDJi9QK3t6MysLYQYVbls=
X-Received: by 2002:a67:1002:: with SMTP id 2mr12044316vsq.46.1615167121872;
 Sun, 07 Mar 2021 17:32:01 -0800 (PST)
MIME-Version: 1.0
References: <20210308002928.3385275-1-dje@google.com>
 <161516362431.11025.2679751497781286596@c667a6b167f6>
In-Reply-To: <161516362431.11025.2679751497781286596@c667a6b167f6>
From: Doug Evans <dje@google.com>
Date: Sun, 7 Mar 2021 17:31:24 -0800
Message-ID: <CADPb22R89=EcWFcuFABZP3=L3CbUEq1eKPqNJY=SqDSoZ+CDnQ@mail.gmail.com>
Subject: Re: [PATCH] inet_parse: Clarify IPv6 comment and error message
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000008dc6ae05bcfc66df"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=dje@google.com; helo=mail-vs1-xe2d.google.com
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

--0000000000008dc6ae05bcfc66df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Not sure how this "Author email address is mangled" happened.

$ git format-patch -o patches/error-parsing-ipv6 -1
$ git send-email --to=3D'qemu-devel@nongnu.org,Samuel Thibault <
samuel.thibault@ens-lyon.org>,"Daniel P. Berrang=C3=A9" <berrange@redhat.co=
m>' \
--smtp-server=3Dfoo
patches/error-parsing-ipv6/0001-inet_parse-Clarify-IPv6-comment-and-error-m=
essage.patch

It's possible my smtp-server arg munged things incorrectly, but I've done
the identical thing for previous patches and not seen this for at least
some of them.
Sigh.


On Sun, Mar 7, 2021 at 4:33 PM <no-reply@patchew.org> wrote:

> Patchew URL:
> https://patchew.org/QEMU/20210308002928.3385275-1-dje@google.com/
>
>
>
> Hi,
>
> This series seems to have some coding style problems. See output below fo=
r
> more information:
>
> Type: series
> Message-id: 20210308002928.3385275-1-dje@google.com
> Subject: [PATCH] inet_parse: Clarify IPv6 comment and error message
>
> =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> =3D=3D=3D TEST SCRIPT END =3D=3D=3D
>
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> From https://github.com/patchew-project/qemu
>  * [new tag]         patchew/20210308002928.3385275-1-dje@google.com ->
> patchew/20210308002928.3385275-1-dje@google.com
> Switched to a new branch 'test'
> 6e42a49 inet_parse: Clarify IPv6 comment and error message
>
> =3D=3D=3D OUTPUT BEGIN =3D=3D=3D
> ERROR: Author email address is mangled by the mailing list
> #2:
> Author: Doug Evans via <qemu-devel@nongnu.org>
>
> total: 1 errors, 0 warnings, 14 lines checked
>
> Commit 6e42a4981895 (inet_parse: Clarify IPv6 comment and error message)
> has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> =3D=3D=3D OUTPUT END =3D=3D=3D
>
> Test command exited with code: 1
>
>
> The full log is available at
>
> http://patchew.org/logs/20210308002928.3385275-1-dje@google.com/testing.c=
heckpatch/?type=3Dmessage
> .
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com

--0000000000008dc6ae05bcfc66df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Not=
 sure how this &quot;Author=C2=A0email address is mangled&quot; happened.</=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">$=C2=A0git format-patch -o=
 patches/error-parsing-ipv6 -1</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">$ git send-email --to=3D&#39;<a href=3D"mailto:qemu-devel@n=
ongnu.org">qemu-devel@nongnu.org</a>,Samuel Thibault &lt;<a href=3D"mailto:=
samuel.thibault@ens-lyon.org">samuel.thibault@ens-lyon.org</a>&gt;,&quot;Da=
niel P. Berrang=C3=A9&quot; &lt;<a href=3D"mailto:berrange@redhat.com">berr=
ange@redhat.com</a>&gt;&#39; \</div>--smtp-server=3D<span class=3D"gmail_de=
fault" style=3D"font-size:small">foo</span>=C2=A0 patches/error-parsing-ipv=
6/0001-inet_parse-Clarify-IPv6-comment-and-error-message.patch<div><br></di=
v><div><div class=3D"gmail_default" style=3D"font-size:small">It&#39;s poss=
ible my smtp-server arg munged things incorrectly, but I&#39;ve done the id=
entical thing for previous patches and not seen this for at least some of t=
hem.</div><div class=3D"gmail_default" style=3D"font-size:small">Sigh.</div=
><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Sun, Mar 7, 2021 at 4:33 PM &lt;<a href=3D"mailto:no-reply@pa=
tchew.org">no-reply@patchew.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Patchew URL: <a href=3D"https://patchew.or=
g/QEMU/20210308002928.3385275-1-dje@google.com/" rel=3D"noreferrer" target=
=3D"_blank">https://patchew.org/QEMU/20210308002928.3385275-1-dje@google.co=
m/</a><br>
<br>
<br>
<br>
Hi,<br>
<br>
This series seems to have some coding style problems. See output below for<=
br>
more information:<br>
<br>
Type: series<br>
Message-id: <a href=3D"mailto:20210308002928.3385275-1-dje@google.com" targ=
et=3D"_blank">20210308002928.3385275-1-dje@google.com</a><br>
Subject: [PATCH] inet_parse: Clarify IPv6 comment and error message<br>
<br>
=3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D<br>
#!/bin/bash<br>
git rev-parse base &gt; /dev/null || exit 0<br>
git config --local diff.renamelimit 0<br>
git config --local diff.renames True<br>
git config --local diff.algorithm histogram<br>
./scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_bl=
ank">checkpatch.pl</a> --mailback base..<br>
=3D=3D=3D TEST SCRIPT END =3D=3D=3D<br>
<br>
Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384<br>
From <a href=3D"https://github.com/patchew-project/qemu" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/patchew-project/qemu</a><br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/<a href=3D"mailt=
o:20210308002928.3385275-1-dje@google.com" target=3D"_blank">20210308002928=
.3385275-1-dje@google.com</a> -&gt; patchew/<a href=3D"mailto:2021030800292=
8.3385275-1-dje@google.com" target=3D"_blank">20210308002928.3385275-1-dje@=
google.com</a><br>
Switched to a new branch &#39;test&#39;<br>
6e42a49 inet_parse: Clarify IPv6 comment and error message<br>
<br>
=3D=3D=3D OUTPUT BEGIN =3D=3D=3D<br>
ERROR: Author email address is mangled by the mailing list<br>
#2: <br>
Author: Doug Evans via &lt;<a href=3D"mailto:qemu-devel@nongnu.org" target=
=3D"_blank">qemu-devel@nongnu.org</a>&gt;<br>
<br>
total: 1 errors, 0 warnings, 14 lines checked<br>
<br>
Commit 6e42a4981895 (inet_parse: Clarify IPv6 comment and error message) ha=
s style problems, please review.=C2=A0 If any of these errors<br>
are false positives report them to the maintainer, see<br>
CHECKPATCH in MAINTAINERS.<br>
=3D=3D=3D OUTPUT END =3D=3D=3D<br>
<br>
Test command exited with code: 1<br>
<br>
<br>
The full log is available at<br>
<a href=3D"http://patchew.org/logs/20210308002928.3385275-1-dje@google.com/=
testing.checkpatch/?type=3Dmessage" rel=3D"noreferrer" target=3D"_blank">ht=
tp://patchew.org/logs/20210308002928.3385275-1-dje@google.com/testing.check=
patch/?type=3Dmessage</a>.<br>
---<br>
Email generated automatically by Patchew [<a href=3D"https://patchew.org/" =
rel=3D"noreferrer" target=3D"_blank">https://patchew.org/</a>].<br>
Please send your feedback to <a href=3D"mailto:patchew-devel@redhat.com" ta=
rget=3D"_blank">patchew-devel@redhat.com</a></blockquote></div>

--0000000000008dc6ae05bcfc66df--

