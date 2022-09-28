Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF965EE5A5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 21:26:24 +0200 (CEST)
Received: from localhost ([::1]:37908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odchL-0001c4-HG
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 15:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odcdI-0006Y8-HT
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 15:22:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odcdB-0003yg-VT
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 15:22:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664392922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PDSfN2jjLnThXUrqsG+/YnFjxt62VasGWuN7txclJQs=;
 b=g4E0w4nyOc/nzKuk76P0Q58c+NHOSi+zeRwwXGBOviPV+VKMegmP33dMQkBk/Rlajgtg7y
 VHUWm6SvdhqaiDVpUyN45dbJJZkMWiLMdkJsK6zQHiSBzFZbK0/YdBZ3Q+OZX2qDFmC47+
 6BGOf+aKSxQAmHjY4jRBRPK8YoMksBs=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-OmjXFU9XNaKnpDEz5T97Ag-1; Wed, 28 Sep 2022 15:21:58 -0400
X-MC-Unique: OmjXFU9XNaKnpDEz5T97Ag-1
Received: by mail-vk1-f200.google.com with SMTP id
 w6-20020a1f9406000000b00388997b8d31so4699686vkd.3
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 12:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=PDSfN2jjLnThXUrqsG+/YnFjxt62VasGWuN7txclJQs=;
 b=yt2GtpVSKW1VR0yT9QxwMmSC8emX3p9qE822KNyNf9dEWaEbW5WpCiZfPm40Xt4mY7
 zaJFCFGFEQ4ogMoHdk8cdlQz6FAvOAxI6TNbmhmQI7Hc2kGX6wDX+ZxPDhyK7+nNdlhU
 s7KHfhh9F3dJfRI5NihJ7WMgI+GRQVrywV0hDKNvikrL3m9bzVGlZmFRHxViJZeVCUYf
 BwXcXgotBoDNHlLpnLSoaDCSRtGlirrtOnpj7ZC6ZiHui41Nugta07k4KvqZePkZAAqr
 lBHXJA59TDxyeAbnAxDN/P1wVKoCuGpZrX+Qa1J3bfEzmkHgfdvS7gmVEUmC1SdXtBDH
 Q5XQ==
X-Gm-Message-State: ACrzQf1CmNq1FB/7U8nXv376P4eTM2VrCD7FWDGpnGpkxivrlvyjY81K
 CdsVPInTpnb0p1J6N/vMYRbETeQzIig4U6waJIDaeBYAkMhxwf2mDhYQKbUHlasLSYp+qXCIiyq
 rdFQcxsWwtsYY2s/t6vkQiG6lTnciDKA=
X-Received: by 2002:a67:fc44:0:b0:398:30ac:1c95 with SMTP id
 p4-20020a67fc44000000b0039830ac1c95mr15172513vsq.16.1664392918230; 
 Wed, 28 Sep 2022 12:21:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5kEqXLacni/RV0b0e7kVr7yH5BTW4c1L+lCIXZpj5rJWFuPqVTKkukuVGWzUo4RyvLAIsFAE5uP22NreHO8n8=
X-Received: by 2002:a67:fc44:0:b0:398:30ac:1c95 with SMTP id
 p4-20020a67fc44000000b0039830ac1c95mr15172503vsq.16.1664392917987; Wed, 28
 Sep 2022 12:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220927095921.261760-1-pbonzini@redhat.com>
 <20220927095921.261760-5-pbonzini@redhat.com>
 <afb177dc-ab07-5167-e559-5b5280150c46@linaro.org>
In-Reply-To: <afb177dc-ab07-5167-e559-5b5280150c46@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 28 Sep 2022 21:21:47 +0200
Message-ID: <CABgObfbPcy63-nZBzZe1Dtinm-h0FmoHYukZQY6uxLMsn8fesA@mail.gmail.com>
Subject: Re: [PATCH 4/5] configure,
 meson: move C++ compiler detection to meson.build
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a4c4fa05e9c1ac66"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a4c4fa05e9c1ac66
Content-Type: text/plain; charset="UTF-8"

Heh, I wanted to get it in for exactly that reason, so that a future revert
would not introduce the test in configure. But I guess having the patch out
there on the archives may also be enough.

Paolo

Il mer 28 set 2022, 18:25 Richard Henderson <richard.henderson@linaro.org>
ha scritto:

> On 9/27/22 02:59, Paolo Bonzini wrote:
> > The test is slightly weaker than before, because it does not
> > call an extern "C" function from a C source file.  However,
> > in practice what we seek to detect is ABI compatibility of the
> > various sanitizer flags, and for that it is enough to compile
> > anything with CC and link it with CXX.
>
> Maybe just wait a moment on this one?
> We have patches on list to remove the last use of C++.
>
>
>
> r~
>
>

--000000000000a4c4fa05e9c1ac66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Heh, I wanted to get it in for exactly that reason, so th=
at a future revert would not introduce the test in configure. But I guess h=
aving the patch out there on the archives may also be enough.<div dir=3D"au=
to"><br></div><div dir=3D"auto">Paolo</div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">Il mer 28 set 2022, 18:25 Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">On 9/27/22 02:59, Paolo Bonzini wrote:<br>
&gt; The test is slightly weaker than before, because it does not<br>
&gt; call an extern &quot;C&quot; function from a C source file.=C2=A0 Howe=
ver,<br>
&gt; in practice what we seek to detect is ABI compatibility of the<br>
&gt; various sanitizer flags, and for that it is enough to compile<br>
&gt; anything with CC and link it with CXX.<br>
<br>
Maybe just wait a moment on this one?<br>
We have patches on list to remove the last use of C++.<br>
<br>
<br>
<br>
r~<br>
<br>
</blockquote></div>

--000000000000a4c4fa05e9c1ac66--


