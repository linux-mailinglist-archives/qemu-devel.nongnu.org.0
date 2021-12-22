Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F8B47D925
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 23:06:53 +0100 (CET)
Received: from localhost ([::1]:60030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n09l6-0007WE-9H
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 17:06:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1n09jl-0006KN-5e
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 17:05:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1n09ji-0002ve-9e
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 17:05:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640210724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UyKNPG8ufuEjp7fFr3OJArg/ninU3HaheNkD+AQzh/4=;
 b=FghgSfV1keEGEPPOSoFWSKrd6J4X4CzoCmFogPW8mOq5gezKs1ePbrflvNKpkcxqLStJcR
 0e7986dOru3NhM9YL7VSacID3P2p/yBu+gh4IOWQgMLS/PMpq//jvfGoqhgXTSj1UzehOH
 yAXqxbI3CIXnRM0oNAUMarZHx3Tdykg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-B_Z1bDUHMnWrbPYORkTRbA-1; Wed, 22 Dec 2021 17:05:23 -0500
X-MC-Unique: B_Z1bDUHMnWrbPYORkTRbA-1
Received: by mail-pj1-f70.google.com with SMTP id
 j1-20020a17090a694100b001b1044f134aso2304102pjm.6
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 14:05:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UyKNPG8ufuEjp7fFr3OJArg/ninU3HaheNkD+AQzh/4=;
 b=0BjZx+ggmIppLa39NNqj1CvOaltHgJYmGX2rAdG0PO4ejFzQgnzFbbLVMEioV6jrrb
 f41uNGatq4X0roW34PTVLiin7MPcM/TWgzaz5pZewBVUCROz9NH6uP26faagB2vT9vKm
 BK8/tuXrkHEBAVbHZCvAC+B/eq/yGa9KUmwN112QjKF4nFFG+70FEZ7VVXWdV7P9wTji
 OK8WPywkbVEabmQH2n2MRvf9uZlqYpcKuhntugv4z1WL58W+/3wJ4MBJ16BeWin79MyM
 PSlYpkZGva9VSmBwKe9RnICLWoBfTk+IFY1SGUwjRkXE0mwYxwMA5kp8Dz+0Dio9IFTy
 UfQg==
X-Gm-Message-State: AOAM532RfP3Tp1YlmDqEJ7c+vv+BrQ2ylFnWSbkSMONW6x8Q/xz4e8J0
 SGDsWxJ10sFS/b+2rgUfFi5sUBxOEriN/TUdCQqi9fkZ7DJ3Vsa2tpqqyOpiEpJJiMYrC9V/ybB
 UyXIDGp0rJzrGxhtZZrFEeEDt1/puxq0=
X-Received: by 2002:a17:903:1104:b0:148:a3f5:6492 with SMTP id
 n4-20020a170903110400b00148a3f56492mr4731323plh.156.1640210722092; 
 Wed, 22 Dec 2021 14:05:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8kZSs+RkynCt0OanbnvLgj4wTfWypsCMMWab+HJpcbX3M8pBKP+WDBDFBz7A704m9kpwTWIVS56yEp7srbDw=
X-Received: by 2002:a17:903:1104:b0:148:a3f5:6492 with SMTP id
 n4-20020a170903110400b00148a3f56492mr4731300plh.156.1640210721795; Wed, 22
 Dec 2021 14:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20211221163300.453146-1-pbonzini@redhat.com>
 <20211221163300.453146-4-pbonzini@redhat.com>
 <b94b5e23-6e34-d948-2f06-71c1da0ec120@linaro.org>
In-Reply-To: <b94b5e23-6e34-d948-2f06-71c1da0ec120@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 22 Dec 2021 23:05:08 +0100
Message-ID: <CABgObfa4xH55T+SUzN2uVCsvDNwcDOAsME13DA17scH63RebNQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] meson: cleanup common-user/ build
To: Richard Henderson <richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006e08a005d3c3516d"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006e08a005d3c3516d
Content-Type: text/plain; charset="UTF-8"

Il mar 21 dic 2021, 21:32 Richard Henderson <richard.henderson@linaro.org>
ha scritto:

> On 12/21/21 8:33 AM, Paolo Bonzini wrote:
> > Do not go through a static_library, which is only necessary in order to
> reuse
> > some source files between emulators and tests.
>
> That's not true, is it.  Anyway, you're moving the file to a different
> static_library.  I
> though I had tried this myself, but I don't remember the details now.
>

Right, I will change the commit message to "a static_library just for
common_user files, since the one that covers all of common_ss is enough".

Paolo


>
>
> Tested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~
>
>

--0000000000006e08a005d3c3516d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 21 dic 2021, 21:32 Richard Henderson &lt;<a hre=
f=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&=
gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 12/21/21 8:33 AM=
, Paolo Bonzini wrote:<br>
&gt; Do not go through a static_library, which is only necessary in order t=
o reuse<br>
&gt; some source files between emulators and tests.<br>
<br>
That&#39;s not true, is it.=C2=A0 Anyway, you&#39;re moving the file to a d=
ifferent static_library.=C2=A0 I <br>
though I had tried this myself, but I don&#39;t remember the details now.<b=
r></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Ri=
ght, I will change the commit message to &quot;a static_library just for co=
mmon_user files, since the one that covers all of common_ss is enough&quot;=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<br><br><br>
Tested-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro=
.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.org</a>=
&gt;<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.org</=
a>&gt;<br>
<br>
<br>
r~<br>
<br>
</blockquote></div></div></div>

--0000000000006e08a005d3c3516d--


