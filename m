Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE092B8A57
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 07:07:04 +0200 (CEST)
Received: from localhost ([::1]:51222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBB8I-000630-1I
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 01:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36966)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iBAwo-0006vr-Ue
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 00:55:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iBAlj-0005w6-Hn
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 00:43:44 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:45416)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iBAli-0005vi-IW; Fri, 20 Sep 2019 00:43:42 -0400
Received: by mail-qk1-x744.google.com with SMTP id z67so5951156qkb.12;
 Thu, 19 Sep 2019 21:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Rn7Tk2uHB/T6xugSgAQXU7wxHG5fe/ryoh/z+q4n7+g=;
 b=PACf//SzGAsO+5SoCZgLBWEqSqK42zxzzb8d8kCnrqPNdYskR+Uh3LavIyk3z2zUw+
 uuYfApoBhZragXmedwB2IWWsDmuL3eqBpA05qwWCIwO0IRYqTTGJVjRLJumV7HUhU6bH
 9j8NDqdpbzd44jc7fxjk7YQE9jj9Jnn19PPuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Rn7Tk2uHB/T6xugSgAQXU7wxHG5fe/ryoh/z+q4n7+g=;
 b=qyWFQow5FqFVZn2olN3Nm4G+mgecG0XZsU6ksqMF4WWbumf+IeTjLguQFSWbiBe11k
 NexEho8qVwtJigTVVlLI3k23uMwvk/uuLDMQMBasvm7I5otqJ/+JDzkGO90bOIynFC1F
 5Vwl7GBiF55GejHXzJb1sC8ZiNEPpk5REP4DX+iPJBCKDBcvF8jZGhaldE6KFMzxXmgu
 eoO+erIExqYzMzwVz2F0lM04JTMyFh1Ozsp57yuyHqkJ6qFrqA6XJJiZhP+zJ7HncUkl
 aqt62TpyrnuY/SH0xB1dBVgCSdwofuddioWhHJyQNQJKoUBaLLnG/V98MoCIDyHsgvy7
 WvHQ==
X-Gm-Message-State: APjAAAXkwJDqNHunM4Qnz6CZVhafOXQKFkU9UmWMYPlGRxVWYdG4x2HF
 k1rzeUrszYk0xvsVfZq76FZSBGmnBBFI0hSPREJJ5w==
X-Google-Smtp-Source: APXvYqy/N9I3jxLk3LzY5AHbavtVgcRDfB2rkaiq6BRGRsLpPl/37+3EGkb/ewgH3VxcczpvUEKmS7KMriSlsa/0BVk=
X-Received: by 2002:a37:bd5:: with SMTP id 204mr1738608qkl.330.1568954621777; 
 Thu, 19 Sep 2019 21:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190919055002.6729-1-clg@kaod.org>
 <20190919055002.6729-8-clg@kaod.org>
In-Reply-To: <20190919055002.6729-8-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 20 Sep 2019 04:43:30 +0000
Message-ID: <CACPK8XdaPsaMyUVUnNULG=6_AD17Z9KCm=dkSrv_YDckmyD-HQ@mail.gmail.com>
Subject: Re: [PATCH 07/21] aspeed/timer: Add support for IRQ status register
 on the AST2600
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Sep 2019 at 05:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The AST2600 timer replaces control register 2 with a interrupt status
> register. It is set by hardware when an IRQ occurs and cleared by
> software.
>
> Modify the vmstate version to take into account the new fields.
>
> Based on previous work from Joel Stanley.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

