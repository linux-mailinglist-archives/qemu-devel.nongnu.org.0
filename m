Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46057155BF9
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 17:39:40 +0100 (CET)
Received: from localhost ([::1]:60548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j06fL-000502-CE
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 11:39:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58514)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1j06ed-0004Z5-Gv
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 11:38:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1j06ec-0000EW-D9
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 11:38:55 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:42371)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1j06ec-0000Du-4l
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 11:38:54 -0500
Received: by mail-lj1-x244.google.com with SMTP id d10so2802831ljl.9
 for <qemu-devel@nongnu.org>; Fri, 07 Feb 2020 08:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ry4RaV8knKKPPYRmxX/k18mNpJpesOT+MojzfSCDsSk=;
 b=DpX30ZnM54OZgJ4xLbVnjLy366DH0jb7haVHgtkTFDYSWaKi9SNVzV4BmTGspfh/Os
 Dv0NQTJh3NucYblGiBveXTgrTKvq574wZPKe9OX89BZdaRq2PRHcJIbevPvwJNqzGisT
 OB6ALpgWit57ZJxnBJ5tmueWp+VFIG7HTIBGUszQaYR+7QlhJrwPzlfGsP7DfoMx4gKf
 VQpR51c48N88zdPtpgExOXtlUDUBTTCbn0ZTGNB9aDFbWK7FvY06izKM+TmOkkyMw/Oq
 GCR37ySnKQdLuc4o4skC2/HIrcBpo3hQefDkPEtfiSMqneVzUblWwtEyYRNIk0LPrRJW
 LE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ry4RaV8knKKPPYRmxX/k18mNpJpesOT+MojzfSCDsSk=;
 b=SMHK0N0XFu51LaQ7h1a/GqEEvNsiYXXmzzX3Nj2sP6s0dGOd5VWfYbroXvBhHxR3V+
 98ZZ8gqjbpuo6JEvAgw5VbglBo8+DAYYd/8xbZjtuvUwNhSGY+g9rBPTR588Qt8px+du
 uifHyOoyvBDqJIbwSxNkCBEvmJn473Z7LrUC1VccTN4nxD4Bf2uB8QbadjahMcMZityV
 VP+WN0uwCAjjEzOTx7F9ciErXJlQgq2oDQPLTKgLnw8nUoYrhHAbHiSRDjD5yecKGYop
 glFyKAGV65TDVxrfYZiTv3JQuLvwIIp5HK/AsEpmScJA6RKQ40PlUN4Ryb+HSNxnXtSE
 UA0g==
X-Gm-Message-State: APjAAAVzRU6bPFFHE1YN+tylsw0Yy4vp+PISrN7zUkojUF4WPtSYtzda
 0VBJR/MeS89YUp0ngC/0GyOsrguK7isTb1UhDgI+SA==
X-Google-Smtp-Source: APXvYqws7Z6Ml0XuFbUQbTrQ0QnFjrOG3kp5OFsxWWSmqm+SKaEc0eqd4zOjK92VEKo4vRXvrFNmkYJBBPYikG4HZiI=
X-Received: by 2002:a2e:9955:: with SMTP id r21mr37937ljj.283.1581093531005;
 Fri, 07 Feb 2020 08:38:51 -0800 (PST)
MIME-Version: 1.0
References: <20200207150118.23007-1-alex.bennee@linaro.org>
 <20200207150118.23007-2-alex.bennee@linaro.org>
In-Reply-To: <20200207150118.23007-2-alex.bennee@linaro.org>
From: Robert Foley <robert.foley@linaro.org>
Date: Fri, 7 Feb 2020 11:38:15 -0500
Message-ID: <CAEyhzFstYFX3fbGjVnr3AXnTWciSLE-Lv1PoRKB2BmFQ7=B=NA@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] docs/devel: document query handle lifetimes
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
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
Cc: qemu-devel@nongnu.org, robhenry@microsoft.com, aaron@os.amperecomputing.com,
 cota@braap.org, kuhn.chenqun@huawei.com, Peter Puhov <peter.puhov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Feb 2020 at 10:01, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> I forgot to document the lifetime of handles in the developer
> documentation. Do so now.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Robert Foley <robert.foley@linaro.org>

Regards,
-Rob
> ---
>  docs/devel/tcg-plugins.rst | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
> index 718eef00f22..a05990906cc 100644
> --- a/docs/devel/tcg-plugins.rst
> +++ b/docs/devel/tcg-plugins.rst
> @@ -51,8 +51,17 @@ about how QEMU's translation works to the plugins. Whi=
le there are
>  conceptions such as translation time and translation blocks the
>  details are opaque to plugins. The plugin is able to query select
>  details of instructions and system configuration only through the
> -exported *qemu_plugin* functions. The types used to describe
> -instructions and events are opaque to the plugins themselves.
> +exported *qemu_plugin* functions.
> +
> +Query Handle Lifetime
> +---------------------
> +
> +Each callback provides an opaque anonymous information handle which
> +can usually be further queried to find out information about a
> +translation, instruction or operation. The handles themselves are only
> +valid during the lifetime of the callback so it is important that any
> +information that is needed is extracted during the callback and saved
> +by the plugin.
>
>  Usage
>  =3D=3D=3D=3D=3D
> --
> 2.20.1
>

