Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453C64AFE0
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 04:10:00 +0200 (CEST)
Received: from localhost ([::1]:34626 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdQ2w-00062E-UF
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 22:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33148)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1hdQ1Q-0005WK-EU
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 22:08:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1hdQ1P-0001MK-Fe
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 22:08:24 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:45384)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1hdQ1M-0001Js-Oj; Tue, 18 Jun 2019 22:08:21 -0400
Received: by mail-qt1-x844.google.com with SMTP id j19so18006270qtr.12;
 Tue, 18 Jun 2019 19:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m3czvhaoTG0+MCLm8ymZq4lnfK4Emrrjk2yb8cqFdVk=;
 b=Mc+8vWXWcGXsj6ihIdIlEoXMsbtbcCpJZ6qQ0IrmlPVILqGjxcwc99FNs77q4JcVu+
 pEH7z9ZKXSjAz6JjrbQLDxhZtk7ed81iW4Q3wft+Ot7HVtl0Z3jTF6KDnQW2jt9ZQjMo
 QhrSyzjpFsaeJEyNHCSuueKZip/bDf0wCgLAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m3czvhaoTG0+MCLm8ymZq4lnfK4Emrrjk2yb8cqFdVk=;
 b=dfv+C5JhJ5TLgj3vO0jsgq0+7NxJuFhwgEHm9a4DjUbZUPE/6VKsXMBz2Z5mE8tNP3
 jwEi91ZushSV2QLmtatF2/H86Vq16V9QdYkqF0Xt7yiPIDbw9sSEziczAgnFTgIIlaKj
 oIKuySUwtYZTSKINUhpAmoRKem0Fx7nDgvWbuY8X1MlGOJguNkeGMLlKO088XFtKB26n
 XEwuxRD2WpJI9zV6jQ20aG9mQREb1RsdKa/DQ843WKXPLmxg9hzZqQ5cGE0EuZSURx11
 NwKSZaKjt2D5eBZDhetjir1GQ76EVlk+ZvOdXK7Gu4UJMbUbq/SvNqS/yilQcZWmxmGH
 uqbA==
X-Gm-Message-State: APjAAAXD1840BgZxGJOvSVZtDrFm9oYEAqxvoVnrq1g0sXaSaB7h17DW
 fnEtQshvysKSMCwYLnXMGDu7RilzGVOKepxRM4A=
X-Google-Smtp-Source: APXvYqz7jyEj/bbJ9xkZCQitVVSAB7UcwA+wlWKLdt21tzUF0Fpk+kYO/tfL4tw2Bml40cRxM5dSNBDX0IRj+1mN7K4=
X-Received: by 2002:a0c:ae31:: with SMTP id y46mr31269961qvc.172.1560910099165; 
 Tue, 18 Jun 2019 19:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190618165311.27066-1-clg@kaod.org>
 <20190618165311.27066-22-clg@kaod.org>
In-Reply-To: <20190618165311.27066-22-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jun 2019 02:08:07 +0000
Message-ID: <CACPK8Xdt2GJ5RWVhu-YjOfNVyX8OWAk_kAKNhEpobtTYLw5pZA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::844
Subject: Re: [Qemu-devel] [PATCH v2 21/21] aspeed: vic: Add support for
 legacy register interface
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Jun 2019 at 16:55, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Andrew Jeffery <andrew@aj.id.au>
>
> The legacy interface only supported up to 32 IRQs, which became
> restrictive around the AST2400 generation. QEMU support for the SoCs
> started with the AST2400 along with an effort to reimplement and
> upstream drivers for Linux, so up until this point the consumers of the
> QEMU ASPEED support only required the 64 IRQ register interface.
>
> In an effort to support older BMC firmware, add support for the 32 IRQ
> interface.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

