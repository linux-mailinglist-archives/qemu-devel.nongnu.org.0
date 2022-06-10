Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 141D954654D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 13:16:11 +0200 (CEST)
Received: from localhost ([::1]:56202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzcca-0001Xf-N3
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 07:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nzbnK-0003Ip-CF
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 06:23:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nzbnH-0003y1-8v
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 06:23:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654856585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p6jBMO9N0+QxKXEYdIEQCeYvOO1X841zZNsfXsn+FY4=;
 b=g35vcMB3XZFgGH7hz9hCYMN+9MeN2BLF1t8/b3y0Z/nkdNIXVNUZgWzM4Cgr3ilBsnj+c1
 Bc2hHDcSm5+eIo1096aMdO8ZplSncZCDBPGcQ2EjInIHQ9OqGjb5aFHJPdmeu6Pg9JWZsh
 ST6PDIRJ3/a0GGB9XAol1SoXxHVi4lk=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91--E8_WHthPaytpodrSVWcJQ-1; Fri, 10 Jun 2022 06:23:04 -0400
X-MC-Unique: -E8_WHthPaytpodrSVWcJQ-1
Received: by mail-yb1-f200.google.com with SMTP id
 a68-20020a25ca47000000b006605f788ff1so18944134ybg.16
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 03:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=p6jBMO9N0+QxKXEYdIEQCeYvOO1X841zZNsfXsn+FY4=;
 b=B+C+T2dM3WdJdQFzL6zXpGmZqB8n9jdk6URL1ofHk7gemHVZ/Uv2Pdnu6vl11Sc9bS
 +Tio9lBjBYJSiYawmZ2DMJKU8a3o757OAK/5y6au+k2mBMKcl9BpN9OV5tVebejQiKUW
 BhYBYAEZRHiDVcX1Tk1zfmMK1sCDOT7XGzS7MjVvs2u9YrxeeTXvxpObgZAR3PUZvKUa
 OEkEH46/URJQVfAKzc0zi8M+7vCax6FbmGXO2I1DCosZGEtyx+hgEcKbM2NDsJqcTcG7
 I64f1mlMgpUfHX7JRBn0HC4fGhiZvjYOuS50s+K3z3mCIJaXeXxdgkefTcg/RwH4cDdM
 Dfgg==
X-Gm-Message-State: AOAM533/2kkSMCGMhTtfsxBOmo8jqsyoOnzm7svSTWj4eWVfac0vxhAj
 OhHa4QNxH/lJ2uduMYqp8dJBeu+WAPheaSUMqMXAKUBM55I/+u45BeX41GmqWkSJ5OnbuX49Se1
 krib2sdTVoM9KOVn8r/A8HsplX0/S3GQ=
X-Received: by 2002:a25:d8d8:0:b0:664:6ac4:fa4d with SMTP id
 p207-20020a25d8d8000000b006646ac4fa4dmr1287368ybg.351.1654856583682; 
 Fri, 10 Jun 2022 03:23:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9Iv6yHpNYGzNuzKszIT330G4oabSLTiGimvz+4hb16DwtO/VXveFKbUrGQ7F0Uogc4ZSg+3K/+J9FljE726k=
X-Received: by 2002:a25:d8d8:0:b0:664:6ac4:fa4d with SMTP id
 p207-20020a25d8d8000000b006646ac4fa4dmr1287346ybg.351.1654856583416; Fri, 10
 Jun 2022 03:23:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6900:caf:0:0:0:0 with HTTP; Fri, 10 Jun 2022 03:23:03
 -0700 (PDT)
In-Reply-To: <501454fe-1889-d573-2976-27485b22f00b@redhat.com>
References: <20220606164336.245740-1-kchamart@redhat.com>
 <20220606164336.245740-3-kchamart@redhat.com>
 <501454fe-1889-d573-2976-27485b22f00b@redhat.com>
From: Kashyap Chamarthy <kchamart@redhat.com>
Date: Fri, 10 Jun 2022 12:23:03 +0200
Message-ID: <CAJ=Wi4odMJJuZUjGgtMpY7ne=-4PKgzp2TR0RMs8E=O+EMi5-A@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] docs: rSTify MailingLists wiki; move it to QEMU Git
To: Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, 
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "eblake@redhat.com" <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000cf256605e11552f6"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

--000000000000cf256605e11552f6
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wednesday, June 8, 2022, Thomas Huth <thuth@redhat.com> wrote:

> On 06/06/2022 18.43, Kashyap Chamarthy wrote:
>
>> This document is referred to from the GettingStartedDevelopers wiki
>> which will be rSTified in a follow-up commit.
>>
>> Converted from Mediawiki to rST using:
>>
>>      $> pandoc -f Mediawiki -t rst MailingLists.wiki
>>          -o mailing-lists.rst
>>
>> The only change in this coversion is that I have removed the users
>> mailing list, as it will be referred to from a different document from
>> the docs/about/ directory.
>>
>
> Which document? I didn't spot it in the other two patches...?


I was referring to the "contacting-the-project.rst" doc.
You're right in that it doesn't explicitly point to the users list. I
omitted it because the new doc refers to the "support" web page[1], which
explicitly calls out the users list.

If you think we should also call out the users list in
contacting-the-project.rst, let me know, I'll work it in.

PS: I'm away until 01July on PTO. I'll address your feedback here and any
other patches once I'm back.

[1] https://www.qemu.org/support


>  Thomas
>
>

--000000000000cf256605e11552f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br><br>On Wednesday, June 8, 2022, Thomas Huth &lt;<a href=3D"mailto:th=
uth@redhat.com">thuth@redhat.com</a>&gt; wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">On 06/06/2022 18.43, Kashyap Chamarthy wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
This document is referred to from the GettingStartedDevelopers wiki<br>
which will be rSTified in a follow-up commit.<br>
<br>
Converted from Mediawiki to rST using:<br>
<br>
=C2=A0 =C2=A0 =C2=A0$&gt; pandoc -f Mediawiki -t rst MailingLists.wiki<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o mailing-lists.rst<br>
<br>
The only change in this coversion is that I have removed the users<br>
mailing list, as it will be referred to from a different document from<br>
the docs/about/ directory.<br>
</blockquote>
<br>
Which document? I didn&#39;t spot it in the other two patches...?</blockquo=
te><div><br></div><div>I was referring to the &quot;contacting-the-project.=
rst&quot; doc.=C2=A0</div><div>You&#39;re right in that it doesn&#39;t expl=
icitly point to the users list. I omitted it because the new doc refers to =
the &quot;support&quot; web page[1], which explicitly calls out the users l=
ist.=C2=A0<br></div><div><br></div><div>If you think we should also call ou=
t the users list in contacting-the-project.rst, let me know, I&#39;ll work =
it in.</div><div><br></div><div>PS: I&#39;m away until 01July on PTO. I&#39=
;ll address your feedback here and any other patches once I&#39;m back.=C2=
=A0=C2=A0</div><div><br></div><div>[1] <a href=3D"https://www.qemu.org/supp=
ort">https://www.qemu.org/support</a></div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
=C2=A0Thomas<br>
<br>
</blockquote>

--000000000000cf256605e11552f6--


