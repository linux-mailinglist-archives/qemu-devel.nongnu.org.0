Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CB93433E9
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 18:49:09 +0100 (CET)
Received: from localhost ([::1]:45026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO2CJ-0007A5-Oq
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 13:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lO2AR-0006Qg-JZ
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 13:47:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lO2AO-0002AM-9C
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 13:47:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616348827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NrCHJZvKCoC7SNioLyPo0GqS34HqMycBLYeeTUjRQaA=;
 b=IGhYLp59d79GRfxi3ZJfgiK8hCpoSd77DWulwxcdCkYYxrxfqKLOTDLCUxrzN+IwKlVnGY
 CdqbtQSIeU460SU0TIQz/Z3/UPpb4dXteQO46z+kCZhUIfvzg5rdT6EMN1+EDSP6m4nCMP
 qCSL5Xv/wmSDQ+linGSNuMR9tVUUvBk=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-vMeIrO3GNSCk-ek5bx5Sug-1; Sun, 21 Mar 2021 13:47:04 -0400
X-MC-Unique: vMeIrO3GNSCk-ek5bx5Sug-1
Received: by mail-pl1-f197.google.com with SMTP id f10so25589277plt.6
 for <qemu-devel@nongnu.org>; Sun, 21 Mar 2021 10:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NrCHJZvKCoC7SNioLyPo0GqS34HqMycBLYeeTUjRQaA=;
 b=CuyowhzzK1dx1Pk/uX8gOwDYO4Ms3JEBMONiGUk/eYMZyZbjSuMsW8rCShFKp+4g0g
 txqwGn2Y9SO0WVgQP7fZ0JdQbNHejZsKmMddNsv4wpMp1KYPDPaNx7dJm3UTl+suNh3c
 yI9TauU/ysqsMxizIsNAeOg0DmZmFfmcWBVCYwyzRjQGHcn+OYi8KeMSW7cUUPXqwbwZ
 pLlVHeXdy5njv28piXzVBB8ybUNfS1ESQk+avGOfBdua8CCYrgijzKnFahV6AGUZEBms
 +/4W6UWZZR4vGFFB+7QLoY3Y0AE+ciXiStBCsvwZ6Z3ZvXzx3IAOCGqC4Xhg9yfTWbUu
 TbCw==
X-Gm-Message-State: AOAM533YV3twQKKXWSa7YyAZfeZvb0UIsDRFk7KBtHhVoO1VG8PojqPn
 Azs4zN+w2ZoYzj3tzByOVzZ9aQSApWYWQBTtEIftOcJGQ1g3DxBWrFQ6q+DM8GKxuQNTT4T2sSP
 Id6zPeQFJuRL8tXMGLuNVZ1Ab8tTD2f0=
X-Received: by 2002:a63:e005:: with SMTP id e5mr19494319pgh.10.1616348823262; 
 Sun, 21 Mar 2021 10:47:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkXeKntCkeay/3zv7jnkfJnZUH0U6PwkX7h0OddileS+bP7eBxNzolHFnNYwZ4dDdwylQffwXwPYQI3f/5UM8=
X-Received: by 2002:a63:e005:: with SMTP id e5mr19494307pgh.10.1616348823067; 
 Sun, 21 Mar 2021 10:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210320042753.69297-1-gshan@redhat.com>
 <5a6e5d96-7b23-7a56-3096-fb80155cac26@redhat.com>
 <107a73a0-aafe-bfce-7c28-8ed5fe6c022f@linaro.org>
 <4c8d854e-a8a1-2a44-5a02-96a5ce5598bc@linaro.org>
 <CABgObfafUvCAriWa+mFQKL=Js4GGuMrNr3Gw8v2Z+Z=J3xT7XA@mail.gmail.com>
 <fefde0c1-5670-7cd5-4f7c-ab11af6aeb62@linaro.org>
 <CABgObfbG701a-_TB2v7irYe1DpPY-_zExgJ4SPMfyUEJD_2uXw@mail.gmail.com>
In-Reply-To: <CABgObfbG701a-_TB2v7irYe1DpPY-_zExgJ4SPMfyUEJD_2uXw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 21 Mar 2021 18:46:50 +0100
Message-ID: <CABgObfazrLonuARgBUOfOC-13qQ4riKQx14x7uDbWnVba9xzSQ@mail.gmail.com>
Subject: Re: [PATCH] configure: Improve alias attribute check
To: Richard Henderson <richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006eb42405be0f896c"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Aldy Hernandez <aldyh@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gavin Shan <gshan@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>,
 Shan Gavin <shan.gavin@gmail.com>, Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006eb42405be0f896c
Content-Type: text/plain; charset="UTF-8"

HRM, what about biting the bullet and making exec-vary.c a C++ source?...
Then instead of making it conditional an attribute((alias)), we make it
conditional on having a C++ compiler.

Making cpu-all.h compile as C++ would be complex, but we can isolate all
the required declarations in a separate header file that does not need
either osdep.h or glib-compat.h, and basically just have a global
constructor in exec-vary.cc that forwards to a function in exec.c.

Paolo

Il dom 21 mar 2021, 18:43 Paolo Bonzini <pbonzini@redhat.com> ha scritto:

>
>
> Il dom 21 mar 2021, 18:34 Richard Henderson <richard.henderson@linaro.org>
> ha scritto:
>
>> On 3/21/21 10:50 AM, Paolo Bonzini wrote:
>> >     Another workaround may be to avoid compiling exec-vary.c with
>> -flto.  I'm not
>> >     sure that my meson fu is up to that.  Paolo?
>> >
>> > You would have to define a static library.
>>
>> Ok.  With an extra -fno-lto flag, or can I somehow remove -flto from the
>> library's cflags?  Or unset the meson b_lto variable?
>>
>
> -fno-lto should work, yes. b_lto tries to cater to other compilers, but we
> don't support anything but gcc-like drivers.
>
> >     I have filed a gcc bug report:
>> >
>> >     https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99696
>> >
>> >     Hopefully someone can address that before gcc 11 gets released.  At
>> which
>> >     point we need do nothing in qemu.  Aldy?
>>
>> So, I've reproduced the testcase failure with gcc 9.3 (ubuntu 20.04) as
>> well.
>> Which means that there are at least two releases for which this has not
>> worked.
>>
>> I think Gavin's runtime test is unnecessary.  We don't have to check the
>> runtime results, we can just [ "$lto" = true ], and we fairly well know
>> it'll fail.
>>
>
> Yeah, if anything the test can be used to re-enable attribute((alias))
> once we know there are some fixed compilers. (Though it's quite ugly to
> have worse compilation when cross-compiling).
>
> Paolo
>
>
>>
>> r~
>>
>>

--0000000000006eb42405be0f896c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">HRM, what about biting the bullet and making exec-vary.c =
a C++ source?... Then instead of making it conditional an attribute((alias)=
), we make it conditional on having a C++ compiler.<div dir=3D"auto"><br></=
div><div dir=3D"auto">Making cpu-all.h compile as C++ would be complex, but=
 we can isolate all the required declarations in a separate header file tha=
t does not need either osdep.h or glib-compat.h, and basically just have a =
global constructor in exec-vary.cc that forwards to a function in exec.c.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il dom 21 mar =
2021, 18:43 Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzi=
ni@redhat.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Il dom 21 mar 2021, 18:34 Richard Henderson &lt;<a href=
=3D"mailto:richard.henderson@linaro.org" target=3D"_blank" rel=3D"noreferre=
r">richard.henderson@linaro.org</a>&gt; ha scritto:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">On 3/21/21 10:50 AM, Paolo Bonzini wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Another workaround may be to avoid compiling exec-v=
ary.c with -flto.=C2=A0 I&#39;m not<br>
&gt;=C2=A0 =C2=A0 =C2=A0sure that my meson fu is up to that.=C2=A0 Paolo?<b=
r>
&gt; <br>
&gt; You would have to define a static library.<br>
<br>
Ok.=C2=A0 With an extra -fno-lto flag, or can I somehow remove -flto from t=
he <br>
library&#39;s cflags?=C2=A0 Or unset the meson b_lto variable?<br></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">-fno-lto shou=
ld work, yes. b_lto tries to cater to other compilers, but we don&#39;t sup=
port anything but gcc-like drivers.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt;=
=C2=A0 =C2=A0 =C2=A0I have filed a gcc bug report:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cg=
i?id=3D99696" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">ht=
tps://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D99696</a><br>&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hopefully someone can address that before gcc 11 ge=
ts released.=C2=A0 At which<br>
&gt;=C2=A0 =C2=A0 =C2=A0point we need do nothing in qemu.=C2=A0 Aldy?<br><b=
r>
So, I&#39;ve reproduced the testcase failure with gcc 9.3 (ubuntu 20.04) as=
 well. <br>
Which means that there are at least two releases for which this has not wor=
ked.<br>
<br>
I think Gavin&#39;s runtime test is unnecessary.=C2=A0 We don&#39;t have to=
 check the <br>
runtime results, we can just [ &quot;$lto&quot; =3D true ], and we fairly w=
ell know it&#39;ll fail.<br></blockquote></div></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Yeah, if anything the test can be used to re-enable=
 attribute((alias)) once we know there are some fixed compilers. (Though it=
&#39;s quite ugly to have worse compilation when cross-compiling).</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<br>
<br>
r~<br>
<br>
</blockquote></div></div></div>
</blockquote></div>

--0000000000006eb42405be0f896c--


