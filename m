Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C3D2C8445
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:46:27 +0100 (CET)
Received: from localhost ([::1]:46832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjiZV-0000Ey-GU
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kjiMJ-00085Q-Tt
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:32:48 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kjiMI-0004PO-6G
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:32:47 -0500
Received: by mail-ot1-f66.google.com with SMTP id f48so2580017otf.8
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 04:32:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k20zwZ0ZqIEi1h73V6C2xT4zImJSwz/OVH7ZvS1IzKo=;
 b=A8hzS2Csl5Z1slft5/VYtvd4DZsnkzQYHqvd64G8L6cUG8lOPDGka6vBRRZ9UPO6e0
 MpPoQ9TnQmEctBmIhTWP2H9M4iGFr4RHVV3TocykGDfxDEuAtIJpneVu964uFpmpleQk
 cD9DasfWm87SjWt49BMwzGO+GKvbplNP5MQNUALKaTxq9+cS09Uu5OVDHvQ5Eta36mqv
 Gem5DmfxzE2B/pQ/PDiY57eX/LAqWc2Pu5MyPPdI36Md21LPjlkfGjwHETDo8d1tvilr
 90Tit6o9ujwEw6yGAIRggU52bnnTymnBRNwaf0GTqM+g/sLbR3NcTvU8susnIcip9GBr
 eZMA==
X-Gm-Message-State: AOAM533hZ1UqgcOBvakLQe4SImihjL7ZvRKUyvzcl9IF3guzhr45XFDB
 g8p/Kx6BYGpc5LXdz+L33hZ2pnNkWJ/Ib8t1zCFe2+thaIw=
X-Google-Smtp-Source: ABdhPJyFzcczfGpCn1b3qr7gQGm+FARpIGIe4QGK+WXQ1jet3oMkxyPVikQF7aefJOczkwsaAGkgOxSCJNccqRLKD3U=
X-Received: by 2002:a05:6830:134b:: with SMTP id
 r11mr12025680otq.126.1606739564665; 
 Mon, 30 Nov 2020 04:32:44 -0800 (PST)
MIME-Version: 1.0
References: <20201130122639.2431070-1-f4bug@amsat.org>
In-Reply-To: <20201130122639.2431070-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 30 Nov 2020 13:32:33 +0100
Message-ID: <CAAdtpL4p-PA4RMuvC+90TrfDTPrwD-Vya5c_Vdr406pgHcFjUQ@mail.gmail.com>
Subject: Re: [PATCH] decodetree: Allow use of hex/bin format for argument
 field values
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.66;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f66.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 30, 2020 at 1:26 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> ISA datasheets often use binary or hexadecimal constant values.
> By doing base conversion, we might introduce bugs. Safer is to
> copy/paste the datasheet value.
> Add support for bin/hex constants in argument field token.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Is there a more pythonic way to write this if/elif/else
> loop without re.fullmatch?

BTW I discarded the simple "int(value, 0)" to have strict checks,
but if this is enough it is certainly simpler.

> ---
>  scripts/decodetree.py | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> index 47aa9caf6d1..d2ecc61813f 100644
> --- a/scripts/decodetree.py
> +++ b/scripts/decodetree.py
> @@ -849,9 +849,15 @@ def parse_generic(lineno, parent_pat, name, toks):
>              continue
>
>          # 'Foo=3Dnumber' sets an argument field to a constant value
> -        if re.fullmatch(re_C_ident + '=3D[+-]?[0-9]+', t):
> +        if re.fullmatch(re_C_ident + '=3D[+-]?(0[bx])?[0-9]+', t):
>              (fname, value) =3D t.split('=3D')
> -            value =3D int(value)
> +            if re.fullmatch('[+-]?0b[0-9]+', value):
> +                base =3D 2
> +            elif re.fullmatch('[+-]?0x[0-9]+', value):
> +                base =3D 16
> +            else:
> +                base =3D 10
> +            value =3D int(value, base)
>              flds =3D add_field(lineno, flds, fname, ConstField(value))
>              continue
>
> --
> 2.26.2
>

