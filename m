Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671BB4439FC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:46:39 +0100 (CET)
Received: from localhost ([::1]:37334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi3UE-0006Sc-HS
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mi3Lj-000124-Gn
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 19:37:51 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f]:43879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mi3Lh-0002zC-27
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 19:37:51 -0400
Received: by mail-ua1-x92f.google.com with SMTP id v3so1121365uam.10
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 16:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M9rLxj9W4lNN3DQkgrDo6yVxgRa4gAyzykq7OQRpmwg=;
 b=bg/B2lDwJ7sKqvJ0UVfJ7l1PXSlWic+1WRRBfa/ZF2jRPBzqYQWnPNVbdkBEsbYPF4
 79bpkUp8FNMXxzLfx2um+9THb6eWm7eKdWn8uyHWYgmkdGCpXSP4N5rcfkEhY7oY9rCa
 /5EmIIGwGgWeV8PQsyWFVa1FKqGj4Kr/pNVrRzUGpLyANgUG0myW6JS0CSPiMiunsAAw
 ez1japuLvly08BOqWsE5Wj8vGRRNf/MuN5s99519qWo320OI6GonUSh6VcEJ+cQMAsmg
 JJxlmyOBik1VWijBMOpAdMDy7oMGVlQQ2jwC/INkbTPp3G4xHFPJZwaA73XsRoM+Opv8
 yfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M9rLxj9W4lNN3DQkgrDo6yVxgRa4gAyzykq7OQRpmwg=;
 b=G5O4tvhICnk1aMUdj612rWZe/kc73RwaW98lOIYspgOHH/N/IMApLq8qWGSx4GEvpV
 XrAHQVB76UTsKA1+RHRjrXZlp7ymc1QH/bcd1G5KldfJE7SojU6zzGT+zRqFRxqTilBH
 On4KX9uvsalYDokn8g9zPIORD7VOj7o2spsjdQBXnmPYu93AAzxEIq8Q/SVsWzr7qamC
 IBuQ4Vm3FlUOosxUZ7kFKRI6qU0QzbPYBlx6x6+IIkpcE0CkIpjWLgA5euqIWZxzrxP3
 3QUaRK8UKYBOFCILB284E26OJl4oZsN80Gt7bVVEFmWh/y5gRstqt3un9NYYRiL9U2nN
 vt7A==
X-Gm-Message-State: AOAM530bEVXpsGJobpgr6LrlVfv5kcnGQGKd0TqrD+g9XgOykkPv58wi
 ANec9msHggnJQ59CgjifDWkMUbHV81dYK+VLvBmn+Q==
X-Google-Smtp-Source: ABdhPJwoxLIUT5G0z2AqRb2khxyNvgBQ25OjZaUuXf8RZHuL1n4kFv+el0aDJmsgPh3W3oLgzHL4tF9fVmiQtHyBrCQ=
X-Received: by 2002:ab0:3d07:: with SMTP id f7mr21611545uax.11.1635896267676; 
 Tue, 02 Nov 2021 16:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211102110740.215699-1-richard.henderson@linaro.org>
 <a155ebce-e2ec-974f-355c-6bca26b22c80@linaro.org>
 <B2EB83EC-D491-4C42-91A4-CA95BF50E63B@gmail.com>
 <2838fdfb-017d-504b-d98d-aefd50efbf00@linaro.org>
In-Reply-To: <2838fdfb-017d-504b-d98d-aefd50efbf00@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 2 Nov 2021 17:37:36 -0600
Message-ID: <CANCZdfq16CyuzmMdvfjhoSWHDXSMRBGhO0vcP_fHRSeweM40ww@mail.gmail.com>
Subject: Re: [PULL 00/60] accel/tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ecb33005cfd6c77f"
Received-SPF: none client-ip=2607:f8b0:4864:20::92f;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ecb33005cfd6c77f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 2, 2021 at 5:35 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/2/21 7:27 PM, Warner Losh wrote:
> > This breaks bsd-user building. That=E2=80=99s OK, imho, for two reasons=
: First
> it only runs =E2=80=98hello world=E2=80=99. Second, I=E2=80=99ve updated =
my patch train which will
> fix this (message-id 20211019164447.16359-1-imp@bsdimp.com).
> >
> > If there=E2=80=99s urgency to this, I can pull patch 1 out and submit i=
t.
>
> Dangit.  I shouldn't have broken the build, even with signals still
> disabled in bsd-user.
>   I let my guard down because the cirrus bsd build has gone wonky, and th=
e
> shared machine
> I'm doing other cross-testing on has got some temporary resource conflict=
.
>
> Let's fix the build asap.
>

The fix is simple. If you review the first patch 01/30 of my series, I can
create a pull request with that one change (or you can, I'm not
territorial, so long as we know who is doing it).

Warner

--000000000000ecb33005cfd6c77f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 2, 2021 at 5:35 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 11/2/21 7:27 PM, Warner Losh wrote:<br>
&gt; This breaks bsd-user building. That=E2=80=99s OK, imho, for two reason=
s: First it only runs =E2=80=98hello world=E2=80=99. Second, I=E2=80=99ve u=
pdated my patch train which will fix this (message-id <a href=3D"mailto:202=
11019164447.16359-1-imp@bsdimp.com" target=3D"_blank">20211019164447.16359-=
1-imp@bsdimp.com</a>).<br>
&gt; <br>
&gt; If there=E2=80=99s urgency to this, I can pull patch 1 out and submit =
it.<br>
<br>
Dangit.=C2=A0 I shouldn&#39;t have broken the build, even with signals stil=
l disabled in bsd-user. <br>
=C2=A0 I let my guard down because the cirrus bsd build has gone wonky, and=
 the shared machine <br>
I&#39;m doing other cross-testing on has got some temporary resource confli=
ct.<br>
<br>
Let&#39;s fix the build asap.<br></blockquote><div><br></div><div>The fix i=
s simple. If you review the first patch 01/30 of my series, I can create a =
pull request with that one change (or you can, I&#39;m not territorial, so =
long as we know who is doing it).</div><div><br></div><div>Warner</div></di=
v></div>

--000000000000ecb33005cfd6c77f--

