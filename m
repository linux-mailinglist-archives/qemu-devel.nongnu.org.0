Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC69321BC3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 16:45:52 +0100 (CET)
Received: from localhost ([::1]:40742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEDPD-0002KO-Ax
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 10:45:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1lEDN7-0001QA-9A
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:43:41 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:35533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1lEDN1-0006MC-5w
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:43:40 -0500
Received: by mail-lj1-x230.google.com with SMTP id a17so59228548ljq.2
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 07:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OjEU41wrBAK55aLCDg2A+a4+z9DWVKbKbydzIvRGYVY=;
 b=mPIh4UShQg2hqkAJOkZCvS4vZXhKxNfYgnShYNpo1oM769bSn+w3EmaWRsKoiP2I5S
 mNhQKMqM8U+P/e7MZKPVwzAH/mKOB+7MRG0FngtaIMS9QxGoC5Y7SDz6rC5Xml5aB5AE
 Mrv2rXhkjd92dMuQGxs2FfbQVjuRz5r0FUbaaBepYIxrFQKInTmsUbXzIqAZSRMAbYSD
 4/HFm9j0WRATh3oDZ+d4E+yNrpR0T5ITpWaVoV8QwfgWn2m7DKtZvpuISIp6kJcBGhvU
 dP57zQ/zrMloQpwutpIwXRkf1CPmHjzdMomyrll9LmmGMlPiz91SC7hOnQqqfxUtG3sH
 qrnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OjEU41wrBAK55aLCDg2A+a4+z9DWVKbKbydzIvRGYVY=;
 b=KCujOAJazaONkA0azsBqYqadqQpwh7wiA+h6UKPdTiZEBSA05TK77PYXuTSRphJu0d
 bx29dhDobHJKtEFUhLKxKTE14whR3SvntBgHLtrccKqoUrXv87RkO3m9pbm5EMm6GbJD
 irnNUfRdIJ8Ol6F2ZqFSTKB2lvsv5/72Of55avmCo0MBlrS5cC8B3aPMrb1zWDZjb8d3
 ZgpueJh+nQKFJK7wyypxUAwac5UxfH93g0jnJAyiyxrV8cXjm8buXmGYl8M4LQEEqEy/
 PLcxLvNZVqs4NFts0hevHQTd/eSNFjnWhq7/Q/ocK/ZYjpRMwLKkPiwsq4eS2W5S5Lx1
 /NJQ==
X-Gm-Message-State: AOAM530/GbRKDtdI+4heFy9NiwVa6GaO93TdBFfBIXH+5IABnH/Blx80
 ZQF0HuX324ps0QAXja3edoWPvJ6+T1SqdA0EFDse3w==
X-Google-Smtp-Source: ABdhPJzNn5rw+VRGMkjrocsZeEBQFDQnazQ8NgmFmMDdYCjHbNl4hiN57VuKsEtnet4pxUOzxPjBM4ovkKwwHPAqCHM=
X-Received: by 2002:a2e:8141:: with SMTP id t1mr1752492ljg.385.1614008611540; 
 Mon, 22 Feb 2021 07:43:31 -0800 (PST)
MIME-Version: 1.0
References: <875z2knoa5.fsf@dusky.pond.sub.org> <YDPMs1Hu8LDRJUhX@redhat.com>
In-Reply-To: <YDPMs1Hu8LDRJUhX@redhat.com>
From: Liviu Ionescu <ilg@livius.net>
Date: Mon, 22 Feb 2021 17:43:20 +0200
Message-ID: <CAG7hfcJsNz53uA9cg1BYpC-9FRWJp_hvOLNOrHf-L55oJ1O=KQ@mail.gmail.com>
Subject: Re: A brief look at deprecating our JSON extensions over RFC 8259
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f4a3bf05bbeea9a1"
Received-SPF: none client-ip=2a00:1450:4864:20::230;
 envelope-from=ilg@livius.net; helo=mail-lj1-x230.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f4a3bf05bbeea9a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Feb 2021 at 17:27, Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

>
> IMHO we should deprecate and eventually remove single quotes....


+1

If a JSON cannot be directly processed by the standard JavaScript parser,
it should not be used.


Regards,

Liviu

--=20
Sent from my iPad via Gmail.

--000000000000f4a3bf05bbeea9a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, 22 Feb 2021 at 17:27, Daniel P. Berrang=C3=A9 &lt;<=
a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote:</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex" dir=3D"auto">
<br>
IMHO we should deprecate and eventually remove single quotes....</blockquot=
e><div dir=3D"auto"><br></div><div dir=3D"auto">+1</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">If a JSON cannot be directly processed by the st=
andard JavaScript parser, it should not be used.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards,</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Liviu</div><div dir=3D"auto"><br></di=
v></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartm=
ail=3D"gmail_signature">Sent from my iPad via Gmail.</div>

--000000000000f4a3bf05bbeea9a1--

