Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D9B4AA7E4
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 10:23:50 +0100 (CET)
Received: from localhost ([::1]:36960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGHIK-0003T8-Ll
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 04:23:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nGHGC-0002io-Pl
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 04:21:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nGHG9-0002sS-1o
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 04:21:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644052891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nkndbyUGd+jzyOS+GnCuUQV3/d3NMxEGuhbG7GJscz8=;
 b=ZSilah0HHA05Yy7zMsf3duIrWp6ytt5wghw4sllaUUzZQ6xJRIXl8uc3KKf/DRcWxmDrwH
 o0A0mppnCKxKXeubM5ZzRxpt1g9tFmX7GI3SlLFUqv9ikKoLpjersDyNbzmCmPobg1PceN
 GOnZSAhyU/t/7EFgLDj9TXz5Vv3OiTg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-lpLlWL52NhSmLqzvKVYnAQ-1; Sat, 05 Feb 2022 04:21:30 -0500
X-MC-Unique: lpLlWL52NhSmLqzvKVYnAQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 y18-20020a17090ad71200b001b857ec95f9so3340266pju.9
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 01:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nkndbyUGd+jzyOS+GnCuUQV3/d3NMxEGuhbG7GJscz8=;
 b=oFJQfd4hxEctDf1fdXzkRbExuCfA3xuvA8dBj43fe1HKwEq0AhuKuxY43AmO6d3jky
 KbKQYOlPV0wV2f71Ss41yOlnIoDK3Ytglg8h6+IT7DE4u4GZ9cVz5IOFHkdHadh9SxzK
 5i+vjQf4E4PainGaZDQRlHoY8dAcQ3fxq8bYzakgnJZQkhNKCAsed/c4xzoOtiY1x3HN
 hH/n0fjv0qMtOvH79wTaSfbiP/BscphpSXwS0J7Y0GpeoKO9/tscWCZa8KHrsTFPp7bF
 Y0yh7m3L4+5C3803LftJVzT0zii/v4UFJ6UDWgOPS1+AC4ii+S+HJNLPsptOSfxxGJHr
 MLsA==
X-Gm-Message-State: AOAM532QuW0pyoR3NWulrT9QLyH1tHP8CkZi/j9TfkTXh7cKoCESSkt6
 iRDrGPkRbGKHsSwdMlazT/Vms0giY57vnxwFoU1Rukb6ZFC6mAnP/C2DwIov6Hf1JMy9Cz/Nbym
 GRbPAOqgsxJZwJfR7U6m/PAXSsBZoMVk=
X-Received: by 2002:a17:902:8e87:: with SMTP id
 bg7mr7496023plb.141.1644052889038; 
 Sat, 05 Feb 2022 01:21:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8o1BqcOaHmGvdfL4y2TUAj98ZOyqcpFvOo7wHa1vE8K0aPpvZxDFmyxSmgXir3jiqqG5X4c/iaQKJMX1Yymg=
X-Received: by 2002:a17:902:8e87:: with SMTP id
 bg7mr7496001plb.141.1644052888744; 
 Sat, 05 Feb 2022 01:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20220131233507.334174-1-f4bug@amsat.org>
 <20220131233507.334174-2-f4bug@amsat.org>
 <CABgObfY6+-GjEi9hfFs2x6CRctPHFBt3hxwRK_73tL8Hm4on5A@mail.gmail.com>
 <7cd97d2e-30a6-3857-464e-f39ddd98a407@amsat.org>
In-Reply-To: <7cd97d2e-30a6-3857-464e-f39ddd98a407@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 5 Feb 2022 10:21:15 +0100
Message-ID: <CABgObfb8EQxObAnBJKSq=OMCFhkL7FzNFCn1H=HoCyxz03R2Fw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hw/i386: Attach CPUs to machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006d12ef05d741e4b5"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Yang Zhong <yang.zhong@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006d12ef05d741e4b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It broke check-system-debian in CI.

Paolo

Il ven 4 feb 2022, 20:31 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> ha
scritto:

> On 4/2/22 18:59, Paolo Bonzini wrote:
> > This is causing breakage in the acpi-tables-test, sorry.
>
> $ make check-qtest-x86_64
>
> Ok:                 49
> Expected Fail:      0
> Fail:               0
> Unexpected Pass:    0
> Skipped:            7
> Timeout:            0
>
> $ make check-qtest-i386
>
> Ok:                 52
> Expected Fail:      0
> Fail:               0
> Unexpected Pass:    0
> Skipped:            4
> Timeout:            0
>
> I am confuse, how do you run it?
>
>

--0000000000006d12ef05d741e4b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It broke check-system-debian in CI.<div dir=3D"auto"><br>=
</div><div dir=3D"auto">Paolo</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">Il ven 4 feb 2022, 20:31 Philippe Mathie=
u-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;=
 ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 4/2/22 18:59, Paolo=
 Bonzini wrote:<br>
&gt; This is causing breakage in the acpi-tables-test, sorry.<br>
<br>
$ make check-qtest-x86_64<br>
<br>
Ok:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A049<br>
Expected Fail:=C2=A0 =C2=A0 =C2=A0 0<br>
Fail:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
Unexpected Pass:=C2=A0 =C2=A0 0<br>
Skipped:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7<br>
Timeout:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
<br>
$ make check-qtest-i386<br>
<br>
Ok:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A052<br>
Expected Fail:=C2=A0 =C2=A0 =C2=A0 0<br>
Fail:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
Unexpected Pass:=C2=A0 =C2=A0 0<br>
Skipped:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4<br>
Timeout:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
<br>
I am confuse, how do you run it?<br>
<br>
</blockquote></div>

--0000000000006d12ef05d741e4b5--


