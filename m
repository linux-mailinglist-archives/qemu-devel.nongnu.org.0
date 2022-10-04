Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8675F4059
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 11:52:24 +0200 (CEST)
Received: from localhost ([::1]:52012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofeb9-0000IK-5e
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 05:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofeYp-0006Fo-MS
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:49:59 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofeYo-0007iU-1E
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:49:59 -0400
Received: by mail-ej1-x62c.google.com with SMTP id nb11so27676874ejc.5
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 02:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=xyuttHu2pdDbTYbbpKnoOENYxMMVk5hwNh2JwJEZ9a0=;
 b=UEeA6+/Fj9NtIaKCq4fHgFBgBg1yRd+BOYel2G43QHJPfYxmARJEjEgu2UzMDILEXM
 XXOKcJwCLQora3Lnfusal2Wjmq8A3X54RRsifmJPywyfcvya8IxwrAaafgZdxGC34qRg
 eVfY1c7DB177yrdIFLHMEFPm44pU2bGXyYUHn0uBf0+BXsdpfvBR2viNDk/gnsuYH/Pt
 73K0p2su3m8dnYGpSSDmyTI/y9KlANfr4HOYxjhsiaW6NtXjY0qmYmjHi9hGf6Z8hIRw
 BYwiRIXAH6bnQS3fm/yDX/BRh6gCqPVBn98ihK2onRdgaoyBxsrUJyW9aLULJoc5I7ji
 t8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xyuttHu2pdDbTYbbpKnoOENYxMMVk5hwNh2JwJEZ9a0=;
 b=Zhm5QsLGQ+PsjOMzArZ5MFXGVApx0+IJLZQl16B4Cy8LqyGjAq6f437HSQuWEn1tpA
 jOeHpZBU/JTEqds4AhoCkroMly+A6xj6dUI1SFQDyCQ4tXhLaqyR1Ivd+v7RK+QwdG6q
 TBP1EvQxUkxsstMqnmahm2U9/KTgC+flbNuUQz0WMHjKYZ/DiGJNFdEmch4Q0q/1fbe3
 Pg4QJ9ww1GX3zyoi/spdnDyVFHz8eyreViXIZ2q9CCfFpXkpBPjDY4H3lTcFFkCjXa+V
 kaJC+TZ+4XhiyxjJGZqBM2AeZISnJhjHzdzeAkXqPwGHYiuxqDcNqtcm6GjC98peh23m
 zYfA==
X-Gm-Message-State: ACrzQf1OKs/kkkD6eMv5dIqcPMKJl6wFnwo91p2poiqZ7S2nZKcT4zDa
 9zzXJulQG9z7t9ZytwoKxugN/Huu3QO+oypygXuYcQ==
X-Google-Smtp-Source: AMsMyM7+avvvtUZRm/yHBKqkxwPTMrZehhyTcuDKpILOuStI3kvTHuW2H0AZgX8Apc4T89XANBeRhr3zIlox0LyNNYE=
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr17817297ejc.504.1664876995848; Tue, 04
 Oct 2022 02:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221004093206.652431-1-berrange@redhat.com>
 <20221004093206.652431-4-berrange@redhat.com>
In-Reply-To: <20221004093206.652431-4-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Oct 2022 10:49:44 +0100
Message-ID: <CAFEAcA_UkN17_eitD7ft+y5HBhiD8zmrttWzfaBGM92O6eNTrg@mail.gmail.com>
Subject: Re: [PATCH 3/4] meson: enforce a minimum Linux kernel headers version
 >= 4.18
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 4 Oct 2022 at 10:46, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> Various areas of QEMU have a dependency on Linux kernel header
> definitions. This falls under the scope of our supported platforms
> matrix, but historically we've not checked for a minimum kernel
> headers version. This has made it unclear when we can drop support
> for older kernel headers.
>
>   * Alpine 3.14: 5.10
>   * CentOS 8: 4.18
>   * CentOS 9: 5.14
>   * Debian 10: 4.19
>   * Debian 11: 5.10
>   * Fedora 35: 5.19
>   * Fedora 36: 5.19
>   * OpenSUSE 15.3: 5.3.0
>   * Ubuntu 20.04: 5.4
>   * Ubuntu 22.04: 5.15
>
> The above ignores the 3rd version digit since distros update their
> packages periodically and such updates don't generally affect public
> APIs to the extent that it matters for our build time check.
>
> Overall, we can set the baseline to 4.18 currently.

I wonder if we want to be a bit more conservative about this
than we would for other library-type dependency setting ?
At the moment, even if you don't meet our minimum distro
baseline, you can still build by, for instance, building
local copies of newer versions of our dependencies and using
those. That seems harder to do for the system header files.

-- PMM

