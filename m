Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E28339DFA
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 13:03:32 +0100 (CET)
Received: from localhost ([::1]:49608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL2zT-0003Lo-KK
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 07:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lL2yS-0002vk-SK
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 07:02:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lL2yN-0005Fx-0F
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 07:02:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615636941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QvJdqtaS231XvpME5gxE1NLpCFlCQZe5U1Pxb9/J58M=;
 b=PVZUG8gVt1aBLqDV4tNNQsEdeSXD0q4ddjuOSL+7CBn7Bj8TirOegvDgDWxeGnTYT0Y1yh
 cmUVXt4Wfzo3v5YLmt9Kl2m/pg006MfydYc6E/qxugarWT35JEyj6ci0BUDqtxiNgRgTft
 eVbdpuj3GFg9DK76ouFuTH8yzRaYUSA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-xzsaFHHRNaqCtbWmG65fbA-1; Sat, 13 Mar 2021 07:02:18 -0500
X-MC-Unique: xzsaFHHRNaqCtbWmG65fbA-1
Received: by mail-pj1-f71.google.com with SMTP id lj2so10771860pjb.1
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 04:02:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QvJdqtaS231XvpME5gxE1NLpCFlCQZe5U1Pxb9/J58M=;
 b=tAIqrRf9zF8/f+jtMiCGAiOjP7MrUhUUApUb/O/aH/xhTCytsXOEazHif4vRh+7E4x
 3pJbtYecBb5XQyvt6Z2N/GcI1FoK86SCs5kcLjQUdNSc9TeNGP4HeQOx+rApk6d4xz7L
 jQlTSjD1KhyD/j64LjJtJozxfOJLLbnaYNwfVj7mkL28Aoe8G2qolDGf2LTizu/86dMt
 BcaVG+87+s+dfDejByYXvI2t++8HegaCEyPDgFYseOTGPvwEU563bxHWpxqGwDQrnle1
 rUltzRN+L6pQ3IHLn1yl5WoHvV/8EtyZUs6MP0nHO1vHKnUuWAwCbJfQEu3Jvp+H3ZDh
 31dw==
X-Gm-Message-State: AOAM5321py0Wa0fiFyBTuJZlIa71p9EeT2rdnWJOojyb5la7Edw/LIJU
 TmL/Vp6iNsN3Dh0xd7pMmxvC9XvifI9KpmHMZDYojAAxuU1Hk+H6bRgRueUUhHujY0SgzDCvReJ
 +5S2dy7KZmpGqz+RTGfllbDUIeMaGpvI=
X-Received: by 2002:a17:90a:ab09:: with SMTP id
 m9mr3480807pjq.122.1615636937696; 
 Sat, 13 Mar 2021 04:02:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwV+z0F2oyqf5DHX7pfr30p2Tp2deg4jZAATSm83LXnwZ7SadvR/WPgidJoXjzBYJIaLmYXRxz6UWndibQ15Cw=
X-Received: by 2002:a17:90a:ab09:: with SMTP id
 m9mr3480789pjq.122.1615636937399; 
 Sat, 13 Mar 2021 04:02:17 -0800 (PST)
MIME-Version: 1.0
References: <SN6PR02MB4205EC1BAA236F9A8E34E605B86F9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <216b5cca-e599-a7cb-aca5-1595e644477d@amsat.org>
 <CABgObfZboWr7SCkZGzxAdkc_0sHQj-n4o=jZ=S3iQJ2fS0f0mA@mail.gmail.com>
 <08341f85-2962-a0ba-7295-eb3e051f26bf@amsat.org>
In-Reply-To: <08341f85-2962-a0ba-7295-eb3e051f26bf@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 13 Mar 2021 13:02:05 +0100
Message-ID: <CABgObfaxifuB9sn3-VqobjSUycwAYO758=4RPhyn1112q5DNcg@mail.gmail.com>
Subject: Re: gitlab outage?
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000bd752b05bd69c977"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brian Cain <bcain@quicinc.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bd752b05bd69c977
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I wasn't saying it was intentional. It's fixed now.

Paolo

Il sab 13 mar 2021, 12:58 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> ha
scritto:

> On 3/13/21 12:35 PM, Paolo Bonzini wrote:
> > The site works for me when logged in, and the members of the project ar=
e
> > alright, but I also cannot clone or fetch.
>
> I don't think we want to update all automated scripts to use
> credentials and enforce all users to have a Gitlab account ;)
>
> Can we go back to anonymous access for clone/fetch?
>
> Thanks,
>
> Phil.
>
>

--000000000000bd752b05bd69c977
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I wasn&#39;t saying it was intentional. It&#39;s fixed no=
w.<div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il sab 13 mar 20=
21, 12:58 Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org=
">f4bug@amsat.org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">On 3/13/21 12:35 PM, Paolo Bonzini wrote:<br>
&gt; The site works for me when logged in, and the members of the project a=
re<br>
&gt; alright, but I also cannot clone or fetch.<br>
<br>
I don&#39;t think we want to update all automated scripts to use<br>
credentials and enforce all users to have a Gitlab account ;)<br>
<br>
Can we go back to anonymous access for clone/fetch?<br>
<br>
Thanks,<br>
<br>
Phil.<br>
<br>
</blockquote></div>

--000000000000bd752b05bd69c977--


