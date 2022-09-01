Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227FF5AA04C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 21:42:55 +0200 (CEST)
Received: from localhost ([::1]:54632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTq5Q-0002IQ-Nk
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 15:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oTq3T-0000oq-U7
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 15:40:49 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:36739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oTq3S-0004wq-Dx
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 15:40:47 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id p204so248560yba.3
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 12:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=hD/+2MIcQtUojuyvMVP/41JNzuu8gRSh5YY16EVJEJI=;
 b=TUrzz2skS6z+nNmb4GzQt1NhopSRreFxDLH//XZ9b0QDGGP1I+v1Qp1zajFBz8E9Sn
 oKl10tFLv4FXCBi31Tu48AT6fWUY5vUtYlImhw4YiLbtLAlKf5fD+kChF+6er+dkK2Qn
 +sX242JWhzQl7y5UfQL7zMuFojilHoG91OUEqYX4J4HWqvqX6uew4bLEp5/RvfeOq1nK
 n3ropR+d4TxcEhptAKRrtGdUxL354AjibFDF/uw0AFZCroQZIaIgZFlg6k1VGGFay9jx
 uBV5GanoBIZwhRJ8Yqo6PPJwn0+2Yxr35sejH7lwhqesLzOQq0UZPblux6W//6nSs0S6
 mdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=hD/+2MIcQtUojuyvMVP/41JNzuu8gRSh5YY16EVJEJI=;
 b=qE1yGuUnFPrsVn/36za2hWQCF5bf6dkKfriZ6pm/XlYup264bj5QjaQg6sxaueshGe
 XsTaI0ZfzOqNJ2Iku9Dc29mqM2X1U+mOZ605Vl1n3Gc4mWpr/UPp+fR6bciURiat1Es3
 FwM7ELhn0gcMSXW4iP9TrwQu6/eBomDx+4q5u9fxFRY2t3v4HlWulXB59IRfn1q3iKbj
 aWMmoaeMHrNy5N7GZpPm68GM44NrYhfncNmF6QsrUBD61QJY5+VGoE+MofUk39yD7xiu
 FUY/ygbRaFzJJ4fSUAVLt8VVNoQ4soAVHPrQKe7DnoHximn55XKb6RC2FD8Mk8f5I98Q
 uwaw==
X-Gm-Message-State: ACgBeo0DvmKEtQHes4tIcdDvffGxVU/TbeHGwQmbn9BvLzvNwJn66LF7
 2rThbrD+YcXwyH9vx+ACkOSlXwzQ67rZF2INIyc=
X-Google-Smtp-Source: AA6agR65Kw3tKjlArrjlx7GCumoOCAv8CkoidC86tVurmfm1HcCw2xq6PkpQI99/ESR9hw21kQkSsGCV/x7H6XbxtCw=
X-Received: by 2002:a5b:2cb:0:b0:688:ecfc:5865 with SMTP id
 h11-20020a5b02cb000000b00688ecfc5865mr20441145ybp.642.1662061244908; Thu, 01
 Sep 2022 12:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <Yw59JU3ja/EU3HL6@fedora>
 <c8393f90-1718-a2be-213b-2dcec6af7ed9@gmail.com>
In-Reply-To: <c8393f90-1718-a2be-213b-2dcec6af7ed9@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 1 Sep 2022 15:40:32 -0400
Message-ID: <CAJSP0QVOezYYjwzsUQFnXOiWw5=i56rjm99RiymND_H7RWdjuA@mail.gmail.com>
Subject: Re: QEMU 7.2 release schedule
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000001908db05e7a2cacf"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

--0000000000001908db05e7a2cacf
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 1, 2022, 14:09 Daniel Henrique Barboza <danielhb413@gmail.com>
wrote:

>
>
> On 8/30/22 18:12, Stefan Hajnoczi wrote:
> > Hi,
> > Richard Henderson has tagged QEMU 7.1 and handed over to me for the 7.2
> > release cycle. Thanks to Richard and Michael Roth their work on 7.1!
>
> Are you going to handle the pull requests for this release cycle? I saw
> that you've handled Thomas' PRs.
>
> If that's the case I'll CC you in the PRs instead of Peter/Richard.
>

Hi Daniel,
I will, but don't worry, I'm tracking all pull requests on qemu-devel so
it's not necessary to Cc me to get my attention.

Your latest pull requests is in the staging branch and will be merged once
CI has completed.

Stefan

>

--0000000000001908db05e7a2cacf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Sep 1, 2022, 14:09 Daniel Henrique Ba=
rboza &lt;<a href=3D"mailto:danielhb413@gmail.com">danielhb413@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 8/30/22 18:12, Stefan Hajnoczi wrote:<br>
&gt; Hi,<br>
&gt; Richard Henderson has tagged QEMU 7.1 and handed over to me for the 7.=
2<br>
&gt; release cycle. Thanks to Richard and Michael Roth their work on 7.1!<b=
r>
<br>
Are you going to handle the pull requests for this release cycle? I saw<br>
that you&#39;ve handled Thomas&#39; PRs.<br>
<br>
If that&#39;s the case I&#39;ll CC you in the PRs instead of Peter/Richard.=
<br></blockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto">Hi Dan=
iel,</div><div dir=3D"auto">I will, but don&#39;t worry, I&#39;m tracking a=
ll pull requests on qemu-devel so it&#39;s not necessary to Cc me to get my=
 attention.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Your latest =
pull requests is in the staging branch and will be merged once CI has compl=
eted.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Stefan</div><div c=
lass=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockq=
uote></div></div>

--0000000000001908db05e7a2cacf--

