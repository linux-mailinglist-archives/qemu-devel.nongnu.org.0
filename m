Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4739428F147
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 13:30:15 +0200 (CEST)
Received: from localhost ([::1]:36968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT1SY-0003Vn-Bt
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 07:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kT1RF-0002cf-J9
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 07:28:53 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kT1RD-0008VH-K2
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 07:28:53 -0400
Received: by mail-wr1-x434.google.com with SMTP id g12so2974009wrp.10
 for <qemu-devel@nongnu.org>; Thu, 15 Oct 2020 04:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=koPOGYXSyXw6tPDPWAQW3prKNDkoh+hS6T+k06WGNrA=;
 b=ROrYgj0cY3ucULJynaDoE6oqGXD70R/72B5MqKxOljoHirjIDGuv4864snkJKOuD89
 ZIDjUkqU9DVsegmWepZWo73r0RpBZpFtSbxf3ETRMU/S9v/tzzFiuFyU17avrpTkEnrW
 0gEw+9RQTdzlZNYNvm8clpEW64FbJ9popBq1NT+LXal5wVVwfpDHRoAuLPPDvTpUG391
 RoPQiO2gCvhx53+zHfKxNN9MPyEUyW91jnH7cZQ3wgSVWcC8rX1x7mB+4srVDOfVdQ2/
 GvpIaK+DoajHC0azB43HbBtgow2ILQTdsEUKxW1FrNhSzTdIHrIV2B7gvNj0TkckF/jW
 hKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=koPOGYXSyXw6tPDPWAQW3prKNDkoh+hS6T+k06WGNrA=;
 b=SHdKhWZt+KTsc6Ou/enEyA7teMKxSWUpFQfs0eVowhAicB47Dp8qnUz+hMK0maGABD
 TrLTUDFUTBKdYVZcAVAzuo7nFxS0pGlguYGuEbl5d0hcjBLix0PSsA2tD0pEppy/irc+
 wyMdAwCTR2VPlEG6XhOgwcFdwnUqjmj9qjGai8H2s1REU0OwVK1PGOgE596zxRUJNCHr
 A9jVq0PSF+89XgT7cJaYKtxom2zx+9Q8m3XB0yJ8+mBH3b71+/7eOohHGVRClnujJyd9
 tYwJMp3sQkNDnANZ/DWpO16CMvy+dJq81McWhF6t2ZZm5wppFRalQpLW+lnb4epYP/ID
 /7jA==
X-Gm-Message-State: AOAM532SfPYcac/ThAD1kEvzoh1US2uGwjLUdqhfE4taTh4so8y4qq6/
 Ritj9TSkad68rPjYQk3sKhh8p64WqheRma3VGv4qPg==
X-Google-Smtp-Source: ABdhPJykwDwQwkK8/yr/TnjeElu5+s1ksXVX5c5I/vTJPMxnoyLqHPXy6uoMUlotr5Nz9S6og7LdQacqDNUaSGjd0mM=
X-Received: by 2002:adf:edcf:: with SMTP id v15mr3538968wro.291.1602761329479; 
 Thu, 15 Oct 2020 04:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200929142501.1057-1-ani@anisinha.ca>
 <105B94CB-1345-49FB-B296-F5236E448BC3@anisinha.ca>
 <72e35a9d-21f4-095d-1ae9-9ed33842dd24@redhat.com>
In-Reply-To: <72e35a9d-21f4-095d-1ae9-9ed33842dd24@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 15 Oct 2020 16:58:37 +0530
Message-ID: <CAARzgwyJ2Cy286wWoo6G+mMZbGQRVyChxEQV++oLpVY+_MOU+g@mail.gmail.com>
Subject: Re: [PATCH v5] Add a comment in bios-tables-test.c to clarify the
 reason behind approach
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b4296205b1b3f338"
Received-SPF: none client-ip=2a00:1450:4864:20::434;
 envelope-from=ani@anisinha.ca; helo=mail-wr1-x434.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 mst@redhat.com, qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b4296205b1b3f338
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 12, 2020 at 19:43 Thomas Huth <thuth@redhat.com> wrote:

> On 12/10/2020 16.07, Ani Sinha wrote:
> > Request to queue this patch with the next pull.
>
> I can take it via qtest-next in case Michael / Igor do not plan to send a
> pull request any time soon.


Michael or Igor, care to comment?


>
>  Thomas
>
>

--000000000000b4296205b1b3f338
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Oct 12, 2020 at 19:43 Thomas Huth &lt;<a href=3D"ma=
ilto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,=
204)">On 12/10/2020 16.07, Ani Sinha wrote:<br>
&gt; Request to queue this patch with the next pull. <br>
<br>
I can take it via qtest-next in case Michael / Igor do not plan to send a<b=
r>
pull request any time soon.</blockquote><div dir=3D"auto"><br></div><div di=
r=3D"auto">Michael or Igor, care to comment?</div><div dir=3D"auto"><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-colo=
r:rgb(204,204,204)" dir=3D"auto"><br>
<br>
=C2=A0Thomas<br>
<br>
</blockquote></div></div>

--000000000000b4296205b1b3f338--

