Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE059A8DC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 09:33:26 +0200 (CEST)
Received: from localhost ([::1]:52378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i144a-000200-St
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 03:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34786)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1i143Y-0001b3-Lu
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 03:32:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1i143X-000829-QM
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 03:32:20 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37016)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1i143X-00080u-Ih
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 03:32:19 -0400
Received: by mail-wr1-x444.google.com with SMTP id z11so7688529wrt.4
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 00:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OVmcS2iWJPWre1PgJxzaoCyFR9w05XeQp5u5FYyiCXA=;
 b=QKFNqeWOvIe1992gLL9flB/o3Q/U5LMqpKB/nlj/7eq/nEtXaB42giyU3+mD2XnU7B
 i9v4tA2n4MYeN1uT8ui1NNYwEhYg+B6WCz4XYL2aE8T+V9tRY2T78S2LnA9fvlmQ+YSy
 dvUPIGJW87CVM5ouhKrY9vtHViQEsuFfJ+28n5iiUnQ4M3Ob7xIgZOHvJvRqxKLBM4Pj
 +BjtZoktUc1rXfUnFwu/kQFw449YVV7y8VuAKrZwHppdt8lXsTXpxDvi3jXHTWZRb2jr
 7l8xMvzbM5ezmzG6cdxc4MCo2SV4rdKNqxQU5B/fZA80B5jOiAo+8wvIqnlPFckp6ciZ
 1l9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OVmcS2iWJPWre1PgJxzaoCyFR9w05XeQp5u5FYyiCXA=;
 b=qd8/89Fqa9zMylI2At5EIc5cQZPWIF5/5roZZtHXUQgpLGu0G+tDFCk8s3pJZ26iEK
 xoI2atkTOdfHvyv9y5OlJZubqW1tGFTWJLALZMSVvJfYDJ8uh3Lm9aToWY3HNrjMhvxo
 tO3xbWQXJllKzgijArAu+LMc0c2V9BhvG9l7bP1FVMpKa8W4zujiEEJsTCH/BZODECo2
 VKiilenmPJnpyLyzJfN0po+zSP8pRp62uvzDcaeBLbt0X1IQhQzuCf2sYxcYd2y7TDRg
 x74Sw9T2aCKyZX/xqAA/m8cRJ0QKNpeX6dIk1VB+00Vf3uXJp3FWBIWkC70EMZ3aPbQZ
 gIpg==
X-Gm-Message-State: APjAAAVhjfB9J+6dhj9ZY8kJFgUF4F0U4QNYz2OFxXXC8BDB2baT9J1e
 glFy/spEzYZOHPHceO+DlUGmxRx0oML+cXpAGPU=
X-Google-Smtp-Source: APXvYqxwprnqR6TIoCZus+8b1idAsbGtJZ5LVcUpdComNBb80UHncmVePqtVBOjyxAbvguGhH9WvmJWZT0F6sGlhh6c=
X-Received: by 2002:adf:f404:: with SMTP id g4mr3224714wro.290.1566545538305; 
 Fri, 23 Aug 2019 00:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <1566495734-23297-2-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1566495734-23297-2-git-send-email-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 23 Aug 2019 11:32:06 +0400
Message-ID: <CAJ+F1CKx_B9nFAaAdNbWAdsim7LUvSEY06mR-b_Ngya79iwoSg@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-devel] [PATCH] modules-test: ui-spice-app is not built as
 module
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
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 22, 2019 at 9:43 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> $(call land, $(CONFIG_SPICE), $(CONFIG_GIO)) will never return "m" so
> ui-spice-app is always linked into QEMU.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

I would rather build the module:
-common-obj-$(call land,$(CONFIG_SPICE),$(CONFIG_GIO)) +=3D spice-app.mo
+ifeq ($(CONFIG_GIO)$(CONFIG_SPICE),yy)
+common-obj-$(if $(CONFIG_MODULES),m,y) +=3D spice-app.mo
+endif



> ---
>  tests/modules-test.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/tests/modules-test.c b/tests/modules-test.c
> index a8118e9..f9de3af 100644
> --- a/tests/modules-test.c
> +++ b/tests/modules-test.c
> @@ -53,9 +53,6 @@ int main(int argc, char *argv[])
>  #ifdef CONFIG_SDL
>          "ui-", "sdl",
>  #endif
> -#if defined(CONFIG_SPICE) && defined(CONFIG_GIO)
> -        "ui-", "spice-app",
> -#endif
>      };
>      int i;
>
> --
> 1.8.3.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

