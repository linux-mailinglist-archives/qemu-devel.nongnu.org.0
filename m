Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ACDE11E5
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 08:04:59 +0200 (CEST)
Received: from localhost ([::1]:54676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iN9lS-0002vz-VK
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 02:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35171)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iN9iE-0001t5-Mg
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 02:01:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iN9iD-00084J-CY
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 02:01:38 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:38903)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iN9iA-00082o-OR; Wed, 23 Oct 2019 02:01:35 -0400
Received: by mail-qk1-x744.google.com with SMTP id p4so18743279qkf.5;
 Tue, 22 Oct 2019 23:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lH9z+53smRFb8PlNYG23FHt15PPqTB7fi8Q7uIqUtn8=;
 b=QmztVfz4+8q0jtc1Wm2le094wK7qch+AiraMXyu9N/oMo4oMbxmLqSUH7vIh1zCuFb
 YdiPDXATZiv2N+fT6Jaxxs6dylxqpFYdvzw9wr4n/AJDipRb3/GrrlrgTbU7n1QW7sRh
 zoV445J6fqjEBwPdEZ2iDKrtA4Bs0ejFbRSk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lH9z+53smRFb8PlNYG23FHt15PPqTB7fi8Q7uIqUtn8=;
 b=XnrflQ4+Xq4apUuQH6C2MZ86EnjxXLyLgwLN/V+MsxunqZ1Z2TNKrTtsai6ettSDY5
 N8HXhITirogQRACECpfqBb7ba2obn9NweZGSAtu5FqhVFRpkRYp++jMVsjhCBBscXA5b
 vZ494WCKUoidaLL9OowgW59C5uXEi8OExuq5nuKI9kS1aoC1rzPoH4C7GrnX7XJWa6Vs
 tfO1XNOKoecTiim79PHIN6pfzN6dLsm/09EpScJbsCzWdgSNOegoeZbl+u6JiyA6Gwau
 HTj9wYZLAYzihXEVQGsMBUyIMp/AuLUuMg82nO8lNzlPsZMVO8b+BywD1f9XpkoyyYVX
 efAg==
X-Gm-Message-State: APjAAAXGf584rPsWRatG6XFIgAtB3w8iupZvGbRDDF66gEGwdxV1VErp
 ZAQsgkpmxCicFnS4AQfCx5Im6Hi8Bcf1AFn+CWw=
X-Google-Smtp-Source: APXvYqxGjS2q9Qh/M87diwJvB6cDu3222Q8RLa63AREtq5S2gAGysncsozZM5aJu1n/ChhSAUxTZrM9QeZJJM9Z6CVk=
X-Received: by 2002:a37:aa07:: with SMTP id t7mr6970736qke.414.1571810491084; 
 Tue, 22 Oct 2019 23:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20191021131215.3693-1-clg@kaod.org>
 <20191021131215.3693-4-clg@kaod.org>
In-Reply-To: <20191021131215.3693-4-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 23 Oct 2019 06:01:19 +0000
Message-ID: <CACPK8Xctzd=GpNkpj5mLEjcJEgvk=YQdrSqjUBvgrf_Os+AAaw@mail.gmail.com>
Subject: Re: [PATCH 3/5] ppc/pnv: Add HIOMAP commands
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
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
Cc: Greg Kurz <groug@kaod.org>, "Marty E . Plummer" <hanetzer@startmail.com>,
 qemu-ppc@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Oct 2019 at 13:12, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> This activates HIOMAP support on the QEMU PowerNV machine. The PnvPnor
> model is used to access the flash contents. The model simply maps the
> contents at a fix offset and enables or disables the mapping.
>
> HIOMAP Protocol description :
>
>   https://github.com/openbmc/hiomapd/blob/master/Documentation/protocol.m=
d
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

