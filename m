Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1A437C785
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:34:51 +0200 (CEST)
Received: from localhost ([::1]:37568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrow-0006Rq-ID
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgrjr-0002u1-HE
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:29:35 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:46983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgrjp-0003Qx-T8
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:29:35 -0400
Received: by mail-ej1-x62f.google.com with SMTP id u21so35851891ejo.13
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 09:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m4qBNtc3dfRir49VaXBFolmCqRCPUtJHG7vSmzulXyo=;
 b=sgv8Jyk/cL+zY9RZ6Q7vTMDe3dA7M3/Rpcx+XEKgf8bYdkXPNrCx0peJ9ZaPYRUwn7
 7kpZ7LJMYV6Zou6iQfQuvqTxprBouk8K6ORBVyDP3WKbw2jEa8Oop6ABz0So7TBi+qWw
 u+DaJg3M2o25oHwYWOixVncrya2rQuPdKO/9m5iRrBTrZZ97ia9xX7hms+0JvY8g2eZz
 7p7sV0oKA3kXOwfyr+VZaXpiqcLYPwmtZWZyCfGPgx7qVv/WNmn+SO67gakbs2H6SlOy
 jHNDI2sWhxDyKz093rbJJkR4sehm+fe0axRQrDMgs40SoZa/2oOHYkHzDtAcElKzS3Hc
 TIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m4qBNtc3dfRir49VaXBFolmCqRCPUtJHG7vSmzulXyo=;
 b=gd2syEiHzUAqB7UB4agzsNW6hDbsEITfU3BxmCWMQggYzCAc/0lV5Sz7SDsHR7gjzk
 naSVUlfFeRNDrImfV9UeN1s5JInZUDbG7NrdZDQ4Op4kd6yx25ZtE6G1fq1PsgaAp/yK
 bYqcExbnxDSp0f2MN16YXH28IpfjqUAlQD0+3sHnHQieu+CGT1+LsE0LRkatnW8S/H1e
 UEZ1VzM+DI1SFFi6ej5+oESk7Y55WXxncIiEYfS7zw5Lj8OTCXp7/DB67u0eE6sUwIAa
 ZqCt2CEhq4CQN0UXDZQ1DWO5Jiegzf3s1v+Bt9u5Gm9JkialPuLJwJq88VQ8PlFaBgKj
 jMxg==
X-Gm-Message-State: AOAM5329YWAM059V5OYrk58oWq1LMb2QoXtqcgpVH0bjkNKKG6FHcqUn
 1TrAojEqyPbpKVaYPYlpTl4ibhIibzimUwGJmn0mMA==
X-Google-Smtp-Source: ABdhPJzkOrPGVqzC5JCPl6SEFb4pqO7vU0laKS5Hiebs8e3rqSyU5ATL+YB6kmsBOwv4ZN8VujsozdnQ4kt+O+WF8Gc=
X-Received: by 2002:a17:906:11cc:: with SMTP id
 o12mr38985430eja.85.1620836972142; 
 Wed, 12 May 2021 09:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-2-berrange@redhat.com>
 <4f6620fd-bfed-7c35-4711-79d1625f9c7c@redhat.com>
 <YJqO6++eBH28sRtO@redhat.com>
 <0c1dc7ba-fbae-1b63-04bf-8d456fd6c3a3@amsat.org>
In-Reply-To: <0c1dc7ba-fbae-1b63-04bf-8d456fd6c3a3@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 17:28:17 +0100
Message-ID: <CAFEAcA9UoOadUVLPQqWV+Fvuf3n5Y2Lx98UL7vjkTHM+X=JG1A@mail.gmail.com>
Subject: Re: [PATCH 01/12] gitlab: move linux user build job from CentOS 7 to
 CentOS 8
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 May 2021 at 17:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> I was testing on CentOS 7 by accident, and noticed Peter reported the
> same error on his "ppc64 box", so I figured it would be more useful
> to the community if we could catch such error (old kernel headers)
> before reaching Peter gating process.
>
> Peter, is your "ppc64 box" OS version in our set of supported ones?

Probably not, but it is the gcc compile farm box so upgrades of it
are not in my control. I would be reluctant to lose ppc host coverage.
(/etc/redhat-release says "CentOS Linux release 7.9.2009 (AltArch)".)

That said, the compile farm does now seem to also have a ppc64 box
running Debian bullseye, which we could perhaps switch to.

thanks
-- PMM

