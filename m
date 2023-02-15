Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498ED697DC3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 14:46:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSI6m-0006sH-1s; Wed, 15 Feb 2023 08:46:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pSI6g-0006pZ-Uw
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:45:59 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pSI6f-0006g0-1h
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:45:58 -0500
Received: by mail-oi1-x22b.google.com with SMTP id t5so15807823oiw.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 05:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oB7R+Yk45AiaE/WxhVW1lTlTtgHxoO06lbVcfhUEZWQ=;
 b=JyigF4X9ofadwCQLNfIekOSh/rqJRT1UsKm8g6UtqZo2CVFXVtWAjn5ydVrc+7rQrG
 mE3Aq6Y8dwUPuuC+aNNyc6f+DK0R1ti7LDj3jluMRcxCdVfeO96sSkc8wUWpTX9YFvRO
 Y15b2dPT2OTMhW8CiLyb/Bhgwe8+OVSE/qyNUytr2TFNG0n4UAd9CqWvJjRf3v8cVzIl
 KdOGiQUW/AGbN2rlzjEEj/Q/7mesgxGcZVq2XQ8aDWWReiOSDc4bJrJ+fjz88zsB1IyY
 K2UB9y8L6nR83tnIP5jAIougzVRyPzz6LOtAM8sWyUjqib+zwK5Cv/k6ALTn/MOyfyDi
 gxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oB7R+Yk45AiaE/WxhVW1lTlTtgHxoO06lbVcfhUEZWQ=;
 b=lksBNpLTkGaiHcywdv/2al46Hv25QBv4rNMuxRR9rQ7Qil3kR0VdbZ6xsqO93atuHy
 0FroKHpTeoHP3XcwtlSDkDL/w1Ac50hQHtzIEc7ZU6hZfy1HTJkeyFf/qzpUpeV8rPSb
 s3fTbq+5sOdFt4dJEkDSAv7RlVSA5ENK7MG0B1DxxUd2vgspV5Y/EYPhB3dJ/5ewOqRQ
 sZBseMFmuIFdbmO4MPFQxdXsJfSlMPKWkF/d1WPMVTPZQLfriRLfq8u/b8QgZ89aqCtu
 evM0smfNMGC1acxH5oU2eH5SJQ2DlX5w3DiFJxZzcs+L1QM8Br+IgGzt0ArkkKei9/s9
 6GJw==
X-Gm-Message-State: AO0yUKX2BqUoOAJt3h3WIHKA24ORiaUqajuU4+kaSeuNh01L5jq3cyiN
 DHndmklcewxnevqG/nRPYP1YAgJWIDHg+SrjwR8=
X-Google-Smtp-Source: AK7set+Vlw+0WzJqdXCrgEVq/DDOie7/rsFEn0kOQYJF/IXwhKMg5iz5/TZro2D5HH+73tuQ620qO0kD1WgGCVGzZYE=
X-Received: by 2002:a05:6808:2219:b0:378:7d9a:dc2a with SMTP id
 bd25-20020a056808221900b003787d9adc2amr143487oib.275.1676468753718; Wed, 15
 Feb 2023 05:45:53 -0800 (PST)
MIME-Version: 1.0
References: <20220926095509.3759409-1-kraxel@redhat.com>
 <20220926095509.3759409-14-kraxel@redhat.com>
 <CAJSP0QVoLf_v2xP6GwDzbFg_RDnP5ppM3UZwTN3XAWPcv6cFCQ@mail.gmail.com>
 <CAAKa2j=2cdYxBFZO1pTJLFcPVb-6R4gnB9zad3rdptfuuo0ixw@mail.gmail.com>
In-Reply-To: <CAAKa2j=2cdYxBFZO1pTJLFcPVb-6R4gnB9zad3rdptfuuo0ixw@mail.gmail.com>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Wed, 15 Feb 2023 21:45:42 +0800
Message-ID: <CAAKa2jmkjPuTouvk3qRvuFiS7RtTSQ8vC=m_eDYLyV7tUxAkiA@mail.gmail.com>
Subject: Re: [PULL 13/25] hcd-ohci: Fix inconsistency when resetting ohci root
 hubs
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Bandan Das <bsd@redhat.com>, 
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>, 
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexandre Ratchov <alex@caoua.org>, Peter Maydell <peter.maydell@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000008ae25e05f4bd4cb9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=cyruscyliu@gmail.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000008ae25e05f4bd4cb9
Content-Type: text/plain; charset="UTF-8"

Hi,

> This commit breaks boot-serial-test on ppc64-softmmu.
>>
>>   $ ./configure --enable-tcg-interpreter
>> '--target-list=aarch64-softmmu alpha-softmmu arm-softmmu hppa-softmmu
>> m68k-softmmu microblaze-softmmu ppc64-softmmu s390x-softmmu
>> x86_64-softmmu'
>>   $ make && cd build && QTEST_QEMU_BINARY=./qemu-system-ppc64
>> ./tests/qtest/boot-serial-test; cd -
>>
>> (Yes, the full --target-list is needed because boot-serial-test isn't
>> built when only ppc64-softmmu is selected.)
>>
>> Here is the CI failure:
>> https://gitlab.com/qemu-project/qemu/-/jobs/3087540972#L22
>
>  I reproduced this failure and got "Out of malloc memory" error message in
the [openbios-ppc](
https://github.com/openbios/openbios/blob/4a0041107b8ef77e0e8337bfcb5f8078887261a7/libopenbios/ofmem_common.c#L134).
However, I'm not sure how to debug this. Have you run into this issue
before?

Best,
Qiang

--0000000000008ae25e05f4bd4cb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">This commit breaks boot=
-serial-test on ppc64-softmmu.<br>
<br>
=C2=A0 $ ./configure --enable-tcg-interpreter<br>
&#39;--target-list=3Daarch64-softmmu alpha-softmmu arm-softmmu hppa-softmmu=
<br>
m68k-softmmu microblaze-softmmu ppc64-softmmu s390x-softmmu<br>
x86_64-softmmu&#39;<br>
=C2=A0 $ make &amp;&amp; cd build &amp;&amp; QTEST_QEMU_BINARY=3D./qemu-sys=
tem-ppc64<br>
./tests/qtest/boot-serial-test; cd -<br>
<br>
(Yes, the full --target-list is needed because boot-serial-test isn&#39;t<b=
r>
built when only ppc64-softmmu is selected.)<br>
<br>
Here is the CI failure:<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/3087540972#L22" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/jo=
bs/3087540972#L22</a></blockquote></div></div></blockquote><div>=C2=A0I rep=
roduced this failure and got &quot;Out of malloc memory&quot; error message=
 in the [openbios-ppc](<a href=3D"https://github.com/openbios/openbios/blob=
/4a0041107b8ef77e0e8337bfcb5f8078887261a7/libopenbios/ofmem_common.c#L134">=
https://github.com/openbios/openbios/blob/4a0041107b8ef77e0e8337bfcb5f80788=
87261a7/libopenbios/ofmem_common.c#L134</a>). However, I&#39;m not sure how=
 to debug this. Have you run into this issue before?</div><div><br></div><d=
iv>Best,</div><div>Qiang</div></div></div>

--0000000000008ae25e05f4bd4cb9--

