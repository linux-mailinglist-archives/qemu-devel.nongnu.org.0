Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559CF4181DB
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 14:14:03 +0200 (CEST)
Received: from localhost ([::1]:60142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU6Z7-00021x-Vq
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 08:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mU6XE-0001BO-BT
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 08:12:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mU6XB-0000M1-5t
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 08:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632571919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x0qDlty/TfgmwyShlWsF9KPlYPLsLmsMs+kiMkmN5iw=;
 b=aul+7l3SSsj6NdNoNcIxp9xAEvR+Tixx3E2lgEx+Kz3ZhC/gmHJxfCE7H5GyX7sHeBu5h8
 lsCC6HIPdTK2ucYzTaqbfzFF/M9fCJ4cTkNm16FHd1J5CybqeeV87+3dmVb4FqGM9g8sO/
 InT717G1GnMRv/QglrtHVxBBtHjaHMc=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-Zf7nrlDvP5Gdn1o1nPjrgg-1; Sat, 25 Sep 2021 08:11:57 -0400
X-MC-Unique: Zf7nrlDvP5Gdn1o1nPjrgg-1
Received: by mail-pj1-f69.google.com with SMTP id
 d2-20020a17090a2a4200b001994a2b5092so12096946pjg.3
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 05:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x0qDlty/TfgmwyShlWsF9KPlYPLsLmsMs+kiMkmN5iw=;
 b=IbaK9Gac9MzHgnj/ZK+U6CezUIcHbuPeLhqcOfGGT84UgkTjBlJEXOXgfiHhMwltaO
 P6lL16b1siLlP3/VNw/CBRnBE4i4aM3ydj3idR3JeVbZTpQoNVaDYinlNSrGj6V+jMYa
 T5s/YGFsUV+wm6FNNFp9zjecqHgt8QZ9/9k9Q9hVus4T6HNLFfH8t+xShYcGlRqKJYGq
 qp5wuEqNev6G8yUoC8tvg3LJThD9HqT3kBwjU+nlYSe0BwH/AYBKNAifCU1l/YjdK7cG
 x2fSf08RXyX1FmzAZdXRccb3XsoaBGXBeKFo0z0gYnCkm+aiPbmuy5jKakggCipyR0XM
 0EiA==
X-Gm-Message-State: AOAM530Mc7FaJdodJfoYP97PFcAWod8IUm1k96S8PU+FJKcdRFAcYrtK
 ZfEaGhcqX5Y3C88LidbMp4Zy8VnT1LeOqjUpmMKv2oY4TOlYC8nT6F6+XsD1JOqC3uKBVZd9n+G
 qQ9dTzBCIbLPDH499kgBJmNYZSkxn0m8=
X-Received: by 2002:a17:902:7ec2:b0:13d:b563:c39 with SMTP id
 p2-20020a1709027ec200b0013db5630c39mr13420619plb.14.1632571916248; 
 Sat, 25 Sep 2021 05:11:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwP9s7T+QnxNLVTIX/M5NmB88/AqkWLyIO+nejCb03bRYq1ClXncGzLA18qfqlYQM/IcCuYevQshY0mnmkS2tE=
X-Received: by 2002:a17:902:7ec2:b0:13d:b563:c39 with SMTP id
 p2-20020a1709027ec200b0013db5630c39mr13420605plb.14.1632571915947; Sat, 25
 Sep 2021 05:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210724085453.16791-1-pbonzini@redhat.com>
 <20210724085453.16791-9-pbonzini@redhat.com>
 <CAFEAcA9eNFoZ5p8A1hneJ7kZ=9HOSjFMxR_9C1tuMA20sFhDZw@mail.gmail.com>
In-Reply-To: <CAFEAcA9eNFoZ5p8A1hneJ7kZ=9HOSjFMxR_9C1tuMA20sFhDZw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 25 Sep 2021 14:11:42 +0200
Message-ID: <CABgObfYATyd9Afi10w9oi5s9vcJGUeiimg7ycGfdAz+QMGjiiw@mail.gmail.com>
Subject: Re: [PULL 8/9] qapi: introduce forwarding visitor
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000001eed3a05ccd0c5a1"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.482,
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
Cc: Eric Blake <eblake@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001eed3a05ccd0c5a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El lun., 9 ago. 2021 12:40, Peter Maydell <peter.maydell@linaro.org>
escribi=C3=B3:

> Is it right, or is this its "looks like this is returning an error
> indication" heuristic misfiring again ?
>
> My guess is the latter and it's caused by a mismatch
> between the prototype of visit_optional() (returns a
> status both by setting *present and in its return value)
> and the Visitor::optional method (returns a status only
> by setting *present, return void). I guess ideally we'd
> standardize on whether these things were intended to return
> a value or not.
>

Yeah, it's a false positive and the fix would be make Visitor::optional
return a bool: if the visitor implements it, it's mandatory to overwrite
*present, while non-input visitors (including the clone visitor) need not
implement it at all and visit_optional will just return *present.

Paolo


> thanks
> -- PMM
>
>

--0000000000001eed3a05ccd0c5a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">El lun., 9 ago. 2021 12:40, Peter Maydell &lt;<a href=
=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; escri=
bi=C3=B3:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Is it right, or is this i=
ts &quot;looks like this is returning an error<br>
indication&quot; heuristic misfiring again ?<br>
<br>
My guess is the latter and it&#39;s caused by a mismatch<br>
between the prototype of visit_optional() (returns a<br>
status both by setting *present and in its return value)<br>
and the Visitor::optional method (returns a status only<br>
by setting *present, return void). I guess ideally we&#39;d<br>
standardize on whether these things were intended to return<br>
a value or not.<br></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Yeah, it&#39;s a false positive and the fix would be make Vi=
sitor::optional return a bool: if the visitor implements it, it&#39;s manda=
tory to overwrite *present, while non-input visitors (including the clone v=
isitor) need not implement it at all and visit_optional will just return *p=
resent.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div></div></div>

--0000000000001eed3a05ccd0c5a1--


