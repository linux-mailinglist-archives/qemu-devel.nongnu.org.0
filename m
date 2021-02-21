Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1ED320DB2
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 21:48:35 +0100 (CET)
Received: from localhost ([::1]:50790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDvec-0005Q6-Nj
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 15:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDvcr-0003VU-3N
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 15:46:45 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:45122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDvcp-00027i-JK
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 15:46:44 -0500
Received: by mail-ej1-x62e.google.com with SMTP id n13so25850851ejx.12
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 12:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R+qZmiwaj4SAGkc16SNGhITCfJmyq4ty4vxNIjVy8vk=;
 b=RSd/RJ2I5XWDX3f9uKBb3wj37NjLj57DTr/FFNnDHSAnXWYGKlsZnKSj+rofItbndd
 Vy7QXiQmfKAKqSn76SXm65e98tvFvendHgukJqx0+W4N/8OBu5DDP42LvoYiJYx3gnFZ
 533GrCJqfxQskApZFm29omeQvpEjwwY+kx73hw9ID9Dz6TyOkQGd3pw9ia7rHC8ri/bd
 slW0F6+oNcwrdyhkRPRLX31nXqXpQq0Gccb8FwI5rdCOn+kvCEgQZzBzKRP4an8MgR8R
 XO8KRCb71lF2Vy/B6DkQYK/G2cf0j/sv8xjmb30He7L//pIlVdd2hqhZ2Uv+y6uemRdk
 kbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R+qZmiwaj4SAGkc16SNGhITCfJmyq4ty4vxNIjVy8vk=;
 b=nTnUEWp0W/wVRk9QbKKCyK71fqx0DiSZgx4IEkge9yf6DzKcaH/xLNChdRcedypr79
 px6ptIUCiiVKMkYoRvcTwH4d1oSNqM3k3Hu5mUwLXaqgDxqLXOHRWdtWYGlbVIANxVtf
 8s5bhEsRm+3mNh4bsY61cxy9/1kRQk0DW6Ol9FVZtwYEtw/oO8BIZeUWWFgFl6+9E7u7
 SEMvjZvK+OKhQ3+P2pvMpyIIGEyuAvjoCKlDSDLox/KLBt3y/MKdwigWg15ySpBDbiTV
 jZkkg9XGXeNyxohf/jfYR14rnBeLF1Nl9AKv6eDC0gSbfIuDfXMMhnue0Wx7XIyYIFDm
 /6Eg==
X-Gm-Message-State: AOAM530K2o7EtsVFPoiTjy8/cnDwM0j/DGnuolBkPE3OlaiGD3nX5W4m
 p7FQq5GHkG/48azlKuUJTORMZMq5nABUhfvlW1RQ8g==
X-Google-Smtp-Source: ABdhPJzhKMRFOiUpWyEMPpji395beA5rq3RZi+LcmSno/TQFedj7LpfOiJsyCfpDN7a7ao1hlQi9axJMI4OltLsuUeI=
X-Received: by 2002:a17:906:ca58:: with SMTP id
 jx24mr15147446ejb.482.1613940402258; 
 Sun, 21 Feb 2021 12:46:42 -0800 (PST)
MIME-Version: 1.0
References: <20210221200249.2536247-1-f4bug@amsat.org>
 <20210221200249.2536247-6-f4bug@amsat.org>
In-Reply-To: <20210221200249.2536247-6-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Feb 2021 20:46:31 +0000
Message-ID: <CAFEAcA_Bzyjk7pAxN9GMOUxzCK-AsQmMwo=UxChMLX-a3Kftzw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] hw/timer: Introduce SH_TIMER Kconfig entry
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Qemu-block <qemu-block@nongnu.org>, Magnus Damm <magnus.damm@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Feb 2021 at 20:03, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> We want to be able to use the 'SH4' config for architecture
> specific features. Add more fine-grained selection by adding
> a CONFIG_SH_TIMER selector for the SH4 timer control unit.
>
> Add the missing MAINTAINERS entries.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

