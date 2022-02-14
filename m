Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7334B557C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:58:58 +0100 (CET)
Received: from localhost ([::1]:48530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJdkf-0000MU-If
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:58:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJcjx-0001vT-UE
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:54:10 -0500
Received: from [2a00:1450:4864:20::52b] (port=39469
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJcjv-0005NP-Pb
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:54:09 -0500
Received: by mail-ed1-x52b.google.com with SMTP id u18so27390803edt.6
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 06:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=crdHzqX5Qx4ipRDZkjw04q9+OzFYN/XjR8EQIKf60H0=;
 b=YTcWq41klSZrOSXDAdgOYTP4y9xo6ypDxgGjgnMX4I+WK5mSaC0T0HLHu2tPJ7oumJ
 mLj/Eo7rn8NBI5gmCd5jayASVjiOE57pCVubdksyohXDkvOdb4ZWa8g0Df27wMdNqPQ0
 4TqR8hKg9zIT5a7wG2lD+1RHvX933/M4fxvga42jvHAIeKs54G6uTHTUgzhPVfOrkvZ5
 6x8gZH/mG8g+P6zu7IL1//wCXrt6w4PlWDqYlPAEcFAZkX/t8bTEh/222xf0//WEje4e
 HHppbMeKakLdNPeKUIFcoZvXvpjdgMhxexe1LiDFcqu6uEiS5h0S5tKds2wh6O2W2bZS
 r+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=crdHzqX5Qx4ipRDZkjw04q9+OzFYN/XjR8EQIKf60H0=;
 b=bs96OhzlbbkM/a1eIRTw75fH58yFoTvMlabAj+JwwuAyxddu2aXQSxD+HSJXo3VGlT
 ilJtbW+KO2yzjZ6NRLBxkKk6rUU9tfOIRMLoRyFCxorZzaA0SCl4yyHGCOi78L0kheCy
 5d0q988iuyS82jpB44Y/67w+FUETI6lCTD6Z/ADFMjMfJrs+F7/s7JVGXH1mrv9QJN6i
 89/Xle4EaGI4BgmmZbZGBcsq8ikRaK2ftrWeQT+fCZC5SSnf15Ow0WK4vS9AWz0B2sVe
 RA2WPrSh8m8hJRE5xUkB3lQLmk+asxgWaArU3ISyIUzS0dgaXT4b6c8OBJLeaQKc4oBb
 OihQ==
X-Gm-Message-State: AOAM532Zj6JwuAVvho4IQQUUIHgYMEeLIuZZ0CSgnB39V0RUOusMhhga
 Qr+VU2wBzC5XECdFyyyIuBzTztPo35aNUzJJgV07GhD5fv8=
X-Google-Smtp-Source: ABdhPJwxH7lRMY4agm5HzuVaTfQYunXJcpAySf+yM3ybE3tNyaH5zIHVL/aKjsVTDVrDiR9liId3GuNbRBTqmdy4s/M=
X-Received: by 2002:a05:6402:4390:: with SMTP id
 o16mr15897657edc.343.1644850446265; 
 Mon, 14 Feb 2022 06:54:06 -0800 (PST)
MIME-Version: 1.0
References: <20220207113129.2701722-1-ani@anisinha.ca>
 <20220214093313-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220214093313-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 14 Feb 2022 20:23:55 +0530
Message-ID: <CAARzgwwj62qw3_5kTqgaa8sTjH4we7vBSQWYo75s7Zp=O8cDUQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] hw/smbios: fix table memory corruption with large
 memory vms
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000008f010205d7fb9672"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52b;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.635,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008f010205d7fb9672
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2022 at 20:04 Michael S. Tsirkin <mst@redhat.com> wrote:

>
> On Mon, Feb 07, 2022 at 05:01:26PM +0530, Ani Sinha wrote:
> > This patchset tries to address the issue raised in
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D2023977 .
> >
> > Patch 2 and patch 3 are dependent on patch 1.
> > Patch 1 makes some code cleanup to make thing more readable and also is
> > a preparatory patch for patches 2 and 3. Patch 2 is the actual fix.
> > Patch 3 adds an additional assertion because of changes introduced in
> > patch 2.
>
>
> Ani, typically it is best to copy everyone on the cover letter.
> There are exceptions e.g. when the patchset is huge and the
> CC list would grow too big, but that is the rule. Thanks!
>
>
Yes that was not intentional. I overlooked the fact that the git
 send-email was not adding you and Igor both. Sorry about that. With v3
which I sent out earlier, I=E2=80=99ve explicitly added you both.


>
>

--0000000000008f010205d7fb9672
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Feb 14, 2022 at 20:04 Michael S. Tsirkin &lt;<a hre=
f=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,2=
04,204)"><br>
On Mon, Feb 07, 2022 at 05:01:26PM +0530, Ani Sinha wrote:<br>
&gt; This patchset tries to address the issue raised in<br>
&gt; <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D2023977" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?=
id=3D2023977</a> .<br>
&gt; <br>
&gt; Patch 2 and patch 3 are dependent on patch 1. <br>
&gt; Patch 1 makes some code cleanup to make thing more readable and also i=
s<br>
&gt; a preparatory patch for patches 2 and 3. Patch 2 is the actual fix.<br=
>
&gt; Patch 3 adds an additional assertion because of changes introduced in<=
br>
&gt; patch 2.<br>
<br>
<br>
Ani, typically it is best to copy everyone on the cover letter.<br>
There are exceptions e.g. when the patchset is huge and the<br>
CC list would grow too big, but that is the rule. Thanks!<br>
<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes that was not=
 intentional. I overlooked the fact that the git =C2=A0send-email was not a=
dding you and Igor both. Sorry about that. With v3 which I sent out earlier=
, I=E2=80=99ve explicitly added you both.</div><div dir=3D"auto"><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:r=
gb(204,204,204)" dir=3D"auto"><br>
<br>
</blockquote></div></div>

--0000000000008f010205d7fb9672--

