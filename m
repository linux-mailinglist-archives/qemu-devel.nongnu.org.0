Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58D441A1B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 03:55:19 +0200 (CEST)
Received: from localhost ([::1]:56194 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hasTv-0001Cl-1Q
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 21:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54098)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1hasOM-0004YM-El
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 21:49:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1hasBx-0001CF-RJ
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 21:36:46 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:38129)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1hasBw-0001Bu-EH; Tue, 11 Jun 2019 21:36:44 -0400
Received: by mail-qt1-x841.google.com with SMTP id n11so14836941qtl.5;
 Tue, 11 Jun 2019 18:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eTIfW7HynanhXXC8daMSeYJoRYU/p94Cc8htj9sUXcA=;
 b=CajKx7Wp13Uf0qBRefqjXXXF7SD3N6CcZqyNG57OhGqVopDyyOZWMjX3EjL/pygwwH
 uETkG/us7RDjKNHvyEZB8xGLdP5rSOahpvORugacDJDdRH6YfRqoIiNwitfM1ylBs/cc
 M3vtNGVCGZk+6v1v08/UCz0HLAsSScqu8S95M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eTIfW7HynanhXXC8daMSeYJoRYU/p94Cc8htj9sUXcA=;
 b=GKnOFPmdrkrgedxKj5t9mIQInfj1Kv+qfqzAZ1GGOnMYMi8igYpoPDbLUf5xuwIMZZ
 pUK5rXxVBrBI6GW4F/uz2sB8O9HDw6UqsX9ARe5teFCOtFLYLxI87MHkROBoQU/7saup
 RsNpjYuqZPRCySdDn33E6oc3yc46nww/3OXUkclH/5ZDsyDK2S9s3PVoRBxroJqsXUAP
 8N+HXUku9DWe6RYteLCupks2qG29QSdiU2Reg9I9FO/VsQe6lp34JIAhRRmd12ocMk3t
 aRROI1kFWQQNiCMdQ5dUVtqyK/uq4dBx11UGyWWj2wMsvybsnAcOhyIk3YxxEu64w8QN
 w2aA==
X-Gm-Message-State: APjAAAV/AYRIRQIr1beO8HLdGYKczNCYQpCslmEvlCJfi/vRQ0Gya8mT
 swGXAUMRDZd7uxsDtKx6f5LARuyDCEaoFemeh84P5/Pk
X-Google-Smtp-Source: APXvYqwwC27FMONOVlz9488myVgoRdWMJf38g4xfnR4X51Ra/wxqJ5qGYePa7IUcsIqabckLHnksB6XGaFwkkSIXT7A=
X-Received: by 2002:ac8:264a:: with SMTP id v10mr35694473qtv.255.1560303403519; 
 Tue, 11 Jun 2019 18:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190525151241.5017-1-clg@kaod.org>
 <20190525151241.5017-16-clg@kaod.org>
In-Reply-To: <20190525151241.5017-16-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Jun 2019 01:36:32 +0000
Message-ID: <CACPK8Xfgk6+3vEy=_81X1GUep_8w-uFyE8AnzdpgUTKNVFyxnw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::841
Subject: Re: [Qemu-devel] [PATCH 15/19] aspeed: add a RAM memory region
 container
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

On Sat, 25 May 2019 at 15:14, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The RAM memory region is defined after the SoC is realized when the
> SDMC controller has cheched that the defined RAM size for the machine

checked

> is correct. This is problematic for controller models requiring a link
> on the RAM region, for DMA support in the SMC controller for instance.
>
> Introduce a container memory region for the RAM that we can link into
> the controllers early, before the SoC is realized. It will be
> populated with the RAM region after the checks have be done.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

