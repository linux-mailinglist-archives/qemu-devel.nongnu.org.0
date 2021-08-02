Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5403DD5AC
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:32:17 +0200 (CEST)
Received: from localhost ([::1]:36026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAX7A-0005RO-DE
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAX41-0003Ki-NI
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:29:03 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:34402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAX40-0005rK-8l
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:29:01 -0400
Received: by mail-ej1-x629.google.com with SMTP id cb3so8646476ejb.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zMraL746HOqmJFEP1UB3p7cEikd66tT9MpbrkWfyHYY=;
 b=BfwrS0sbFecsEJ6scYmedBHgvBnQYmcS+M69fj1Zw4P3hMfLuiAXoNVld8zjunZKby
 p5Dp8KZ8QhzyXXE3asWzp3tbzRtp7OEBmyvKrbBTtzzmqVEIsb6T7lDghR/ard/J8AMR
 X65BiqyZpFEECyxq/1MMyuDwjlk4XZKAld8IIWwQbpaFBv1M7krz8GHEu8hwsTAa9l6x
 W5RP7pyHCdgbqsjm45i5Oyt2cmn9CrZtzIksa0DrNDHGVghcNRDPaGsQVuogkX9swfib
 szc9wG1e5m7YWjbxpcfO7LeL+YnrtpVvWm7A1lYcG0vHV8KNsRR3GWjyE0L3YYhDJgb4
 R5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zMraL746HOqmJFEP1UB3p7cEikd66tT9MpbrkWfyHYY=;
 b=OzYnjiDJDKZ4Qmq7tv4olOTOUxOgkVBtXmFwEZaxe+6akZqvajMhg9Y1gVwyHRVLEa
 vW9ft6EoAut4elk8hLiyXM2N5wWVOjkKS2iwBskAR5WE5SOAjsSFTXe9aP4QluGOcfyX
 6yFYz4pmCJgzpje9/dHDWdAuGawMrRA8hV4sdwQxpSbYAgYqBwyZCoggBC7vCqCJloVG
 Ku9EoGyFLf3uhOsg7/pLbCkFxp0zxEJ4Qx8ZVkbGsxgM6EEBjvbkoATfsaJygaA4PooB
 i+6orILKz4xDNbi1wepl2uZ9L0bqXh7Mtn0QSZNZ+0zThYpXbiA86ZYesDpdJ7qVuX5J
 rSrA==
X-Gm-Message-State: AOAM533o5NJ5B255R2a69Rg8Iq+rmfhHK7bZMZP6xE8CJJIsV3EKs/yT
 /ZqwhlRZx0Rlw66ZM+UqehaqXaMtdHRhuAhflur1ng==
X-Google-Smtp-Source: ABdhPJz9syPiopyVefd2R67U2oEmvGmxzjiaR9gi6Q9jpe9t0yKTSFWtFEpw9aux0b7c6X6c91RWqXCX8bkHzgpFEOQ=
X-Received: by 2002:a17:906:6cb:: with SMTP id
 v11mr15213522ejb.482.1627907338816; 
 Mon, 02 Aug 2021 05:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210729175554.686474-1-ehabkost@redhat.com>
 <20210729175554.686474-11-ehabkost@redhat.com>
In-Reply-To: <20210729175554.686474-11-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 13:28:15 +0100
Message-ID: <CAFEAcA_ET=Cdq5Q9k3ctKxJWH9QuPobyrNpmfwsmwXBC6dKMUA@mail.gmail.com>
Subject: Re: [PATCH for-6.2 10/10] MAINTAINERS: Add qom.rst to QOM section
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Jul 2021 at 19:05, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Add qom.rst to the QOM section of MAINTAINERS.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 42ac45c3e50..dc3f04242eb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2651,6 +2651,7 @@ M: Paolo Bonzini <pbonzini@redhat.com>
>  R: Daniel P. Berrange <berrange@redhat.com>
>  R: Eduardo Habkost <ehabkost@redhat.com>
>  S: Supported
> +F: docs/devel/qom.rst
>  F: docs/qdev-device-use.txt
>  F: hw/core/qdev*
>  F: hw/core/bus.c
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

