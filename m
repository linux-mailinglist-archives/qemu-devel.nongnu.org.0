Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449664868C4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 18:40:21 +0100 (CET)
Received: from localhost ([::1]:39656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5WkO-0005nj-4D
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 12:40:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n5Wim-00050l-D1
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 12:38:40 -0500
Received: from [2a00:1450:4864:20::534] (port=42626
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n5Wik-0004ae-Jl
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 12:38:40 -0500
Received: by mail-ed1-x534.google.com with SMTP id j21so12241584edt.9
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 09:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RQEoOk2CbgL5aXDfT1Q7RZMGBc3hKaGKSmRNehPDbyo=;
 b=NQ3EGw4K6udDC45BphqbpMGeTDaP/khZnXWzeoWn+u5MSnQxr1lfib8f9a4yruJ/Jh
 VGrOHfVhLQb8FxUXgFYQUWKuWeJut7NMgsY18LNhxhA+RZ/pDHYZCDwUIaJQVjKXG0AP
 dSjKkT4y6w1aMXMiJIN9+wIIYXVqezlRIPRq7kClXDNoQ1InPrczmf4zqHDNlG4A0XnY
 SrT7eMNGqc4BW8x47PzxqtMoaCJZAXIU8+u38Bh8iN5BI8BQIiUAV3P5ADvhjigUqiHR
 XGAYqgqMpFyQJc+VUC5FolLdr4pSZK9UkypVGRjHA62LUAAxMM8VNPwig3x159+D30tU
 9NGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RQEoOk2CbgL5aXDfT1Q7RZMGBc3hKaGKSmRNehPDbyo=;
 b=h3+gtJH93gv7fb9Rm9uQjafcbA+RmUQi4U7tFgO/MPNJYP+9iA80K1UUbKqy5aFMlV
 Zqo8GAlnbsJ/1ADbP6ja5m1cevsjSsjusAIfnVlXKnDfSiEnu0EpwklQM+LFVY6GWwAm
 XBOgGbKLvarswfUqzLcj9feZyLeDXxzJiwIr/vcQfq8+/bq244GbyBah3aoTtnnNbhgD
 GD2I54hZ8wJZICQKqTcvmgSjug603lQNVoGWTribQLjPtYvhoh0UDH5xtaGqJBcQI+eD
 JzsjML7jaBud+IQNMznJd1NsfAFKZolv3IJDB8iIZneeXef1kLlOOVlqh1KBhoCystp8
 Sc1g==
X-Gm-Message-State: AOAM5323jsYX36MjG+I8vAYstSqNUAAYkQ3KJndtBQFEwEYLa5e5O4zy
 xRIlp5oKC1wsWul8rOzCSysajAmyhaAlc+gTWX8/0g==
X-Google-Smtp-Source: ABdhPJz798Px4vqi6LqYp91pCgLqUrtTMv8JnzYHvvLLUa5xSeLRlZ5Yi+tl1eLU4NIPLdTsVW+OdfaUkL1uLlfLcfE=
X-Received: by 2002:a17:906:715:: with SMTP id
 y21mr5480610ejb.51.1641490709170; 
 Thu, 06 Jan 2022 09:38:29 -0800 (PST)
MIME-Version: 1.0
References: <20220104175806.872996-1-stefanb@linux.ibm.com>
 <20220104175806.872996-3-stefanb@linux.ibm.com>
 <20220106093636.7fc7755f@redhat.com>
 <6096f301-4c39-e39c-eb5f-9f7d22ba1260@linux.ibm.com>
 <20220106085502-mutt-send-email-mst@kernel.org>
 <bc4b7631-6bf5-ce30-8710-48f0369f688c@linux.ibm.com>
In-Reply-To: <bc4b7631-6bf5-ce30-8710-48f0369f688c@linux.ibm.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 6 Jan 2022 23:08:17 +0530
Message-ID: <CAARzgwwL4VbocntvZqe657RwuUf2SNSGM3wnXptnUuPRW4OkLQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] acpi: tpm: Add missing device identification
 objects
To: Stefan Berger <stefanb@linux.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000009f9f2e05d4ed56de"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::534;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x534.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009f9f2e05d4ed56de
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 6, 2022 at 19:31 Stefan Berger <stefanb@linux.ibm.com> wrote:

>
> >>> Can you smoke test TPM with Windows, and check if adding UID doesn't
> >>> break anything if VM actually uses TMP (though I'm not sure how to
> >>> check it on Windows, maybe install Windows 11 without this patch
> >>> and then see if it still boots pre-installed VM and nothing is broken
> >>> after this patch)?
>
>
> The VMs were all created on an old qemu and booted into the patched
> qemu.


Stupid question - should we also check the other way as well? Install on
patches qemu and try to boot on the old unpatched qemu?

--0000000000009f9f2e05d4ed56de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jan 6, 2022 at 19:31 Stefan Berger &lt;<a href=3D"m=
ailto:stefanb@linux.ibm.com">stefanb@linux.ibm.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:r=
gb(204,204,204)" dir=3D"auto"><br>&gt;&gt;&gt; Can you smoke test TPM with =
Windows, and check if adding UID doesn&#39;t<br>
&gt;&gt;&gt; break anything if VM actually uses TMP (though I&#39;m not sur=
e how to<br>
&gt;&gt;&gt; check it on Windows, maybe install Windows 11 without this pat=
ch<br>
&gt;&gt;&gt; and then see if it still boots pre-installed VM and nothing is=
 broken<br>
&gt;&gt;&gt; after this patch)?<br><br>
<br>
The VMs were all created on an old qemu and booted into the patched <br>
qemu. </blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Stupid que=
stion - should we also check the other way as well? Install on patches qemu=
 and try to boot on the old unpatched qemu?</div></div></div>

--0000000000009f9f2e05d4ed56de--

