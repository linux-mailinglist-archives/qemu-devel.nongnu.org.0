Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF64403494
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 08:55:10 +0200 (CEST)
Received: from localhost ([::1]:52028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNrUD-0002cK-QJ
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 02:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mNrNt-0004Hx-IC
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:48:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mNrNr-00078W-DQ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:48:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631083713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H0J++FRXITJbVqF8CMZksy4YVEgG1MSzkz+IaxXGCvE=;
 b=XmjsWMUtnSEtb65WMq6LlXsu/iCEQuAlgFg4hwHXWgvPOXkv+XqZA9KZg/2EkCNZdy0+Lf
 dDBTIeWRq85lRW834PGOnOCUVGpp0Zwl+hB+p2PyLFquG6IRY1xUljuTURVgtizRyRsWIg
 RFkhjvlk0CO6XCjVxH4FCIB5hxwFjyQ=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-OYIALhp-NDq-6ToX3iTpzQ-1; Wed, 08 Sep 2021 02:48:32 -0400
X-MC-Unique: OYIALhp-NDq-6ToX3iTpzQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 mh10-20020a17090b4aca00b00196c3691d66so696101pjb.5
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 23:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H0J++FRXITJbVqF8CMZksy4YVEgG1MSzkz+IaxXGCvE=;
 b=IoBpDk8DAKQtSpPAKNMoy21Cies5JrJ6hCaRTg00etFvTsUFbPExk3ICGbLdYSzcsr
 UQw9AObRBk8RQ49HCZL6Z+69NN33+pEG0IR39LMJymhBGcKzmmF1YplyBcciMHuc/j0L
 jGRHF6cpNIUkyHiwXsT1BWQKmWT0DBY7TfMa6MMyEng8tvYAAed6x9Ew5CgvWX+EZ4jg
 CZMlrMNveUnCkV5M4H0nf5SZo9VZZgHz1EGWzxK8cHkh+TxXvL5IsJwbZt2IdnwpZspj
 1HDgFPp7Rt0MwbkO+YCQ4ETayc8hNtxJPMMy87chy+6lBBkIvD4rvOIR/qd3fzLyyF5C
 FiJw==
X-Gm-Message-State: AOAM533nE211HWxJ+syKzf1Sv2b5Aqg2o2dqknR1na/OHI8x+t74cuF6
 BRh13X3VQs0Te9I4UWbv2Sm+CSP4OY/WhrTGJZ3rJcZRdc3qoCqPgHwMey8oQBCZqkO2NpJ6Dpb
 /dsltdJEhCtZpbF/DhFYWAz/KZoCcqq0=
X-Received: by 2002:a17:90b:224f:: with SMTP id
 hk15mr2538453pjb.134.1631083711250; 
 Tue, 07 Sep 2021 23:48:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwx57r54uuTwRI6mdUI1ezdh22IUuIgmcPboV/vbk2LE6akAzt0WPTa4YRB5kTYhKjpvV/ABCErAniLFQq0I1I=
X-Received: by 2002:a17:90b:224f:: with SMTP id
 hk15mr2538425pjb.134.1631083710927; 
 Tue, 07 Sep 2021 23:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210908045428.2689093-1-armbru@redhat.com>
In-Reply-To: <20210908045428.2689093-1-armbru@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 8 Sep 2021 10:48:20 +0400
Message-ID: <CAMxuvazziB+Qu3PCtXC5byVCy52SNmV58O4gZnjPfqNkshNGnQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] qapi: Another round of minor fixes and cleanups
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000306c7e05cb7645fd"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000306c7e05cb7645fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Sep 8, 2021 at 8:54 AM Markus Armbruster <armbru@redhat.com> wrote:

> Markus Armbruster (5):
>   qapi: Fix a botched type annotation
>   qapi: Drop Indentation.__bool__()
>   qapi: Bury some unused code in class Indentation
>   tests/qapi-schema: Cover 'not' condition with empty argument
>   qapi: Fix bogus error for 'if': { 'not': '' }
>
>  scripts/qapi/common.py            | 19 ++++++-------------
>  scripts/qapi/expr.py              | 21 +++++++++++++--------
>  tests/qapi-schema/bad-if-not.err  |  2 ++
>  tests/qapi-schema/bad-if-not.json |  3 +++
>  tests/qapi-schema/bad-if-not.out  |  0
>  tests/qapi-schema/meson.build     |  1 +
>  6 files changed, 25 insertions(+), 21 deletions(-)
>  create mode 100644 tests/qapi-schema/bad-if-not.err
>  create mode 100644 tests/qapi-schema/bad-if-not.json
>  create mode 100644 tests/qapi-schema/bad-if-not.out
>
>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--000000000000306c7e05cb7645fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Sep 8, 2021 at 8:54 AM Markus Armbrus=
ter &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Markus Armbru=
ster (5):<br>
=C2=A0 qapi: Fix a botched type annotation<br>
=C2=A0 qapi: Drop Indentation.__bool__()<br>
=C2=A0 qapi: Bury some unused code in class Indentation<br>
=C2=A0 tests/qapi-schema: Cover &#39;not&#39; condition with empty argument=
<br>
=C2=A0 qapi: Fix bogus error for &#39;if&#39;: { &#39;not&#39;: &#39;&#39; =
}<br>
<br>
=C2=A0scripts/qapi/common.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 19 =
++++++-------------<br>
=C2=A0scripts/qapi/expr.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 21 +++++++++++++--------<br>
=C2=A0tests/qapi-schema/bad-if-not.err=C2=A0 |=C2=A0 2 ++<br>
=C2=A0tests/qapi-schema/bad-if-not.json |=C2=A0 3 +++<br>
=C2=A0tests/qapi-schema/bad-if-not.out=C2=A0 |=C2=A0 0<br>
=C2=A0tests/qapi-schema/meson.build=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A06 files changed, 25 insertions(+), 21 deletions(-)<br>
=C2=A0create mode 100644 tests/qapi-schema/bad-if-not.err<br>
=C2=A0create mode 100644 tests/qapi-schema/bad-if-not.json<br>
=C2=A0create mode 100644 tests/qapi-schema/bad-if-not.out<br>
<br></blockquote><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &l=
t;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.co=
m</a>&gt;</div><div><br></div></div></div>

--000000000000306c7e05cb7645fd--


