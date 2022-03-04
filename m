Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5D24CD3D3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 12:55:01 +0100 (CET)
Received: from localhost ([::1]:39522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ6WR-0007sy-Tn
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 06:54:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ6UO-0005oo-O7
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:52:52 -0500
Received: from [2607:f8b0:4864:20::1135] (port=40608
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ6UN-0005KQ-42
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:52:52 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2dc0364d2ceso88539057b3.7
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 03:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m2HTDSBtJzg+iKRymQ1pqcjCbMdOpJAgtBxZQUXeU8o=;
 b=MVODVOzhZ+Rf5wiRqQIqkHr5PY4+Eu33jjWPm9V7dVJm0kw9asBWUzReosDOxd9FKB
 x1b53H1jlrqt6VoxrObaKxqkpZH7+qEG70Jkx1L9nv6tQuoQEi805B6NWz4o3h893tx3
 4cKYC+xU/9ObA7ywXyVhRef2C3yr/rqhKio5chdPxKaxWej2WWcyWrKjqzoZClvT4tSQ
 FSCxRJiAgMgzmW4cVU3pn9b1EUQ6dxwkR5WzqJfWg/aywrHLy1YXPuWh8hhGRwIht3IQ
 XGStviJ0jLxB0FXQzNbZWjjq/lSB6iKnJgWzR1LR5rWuNXOEWXMs7RBOczsMWlKh2lj2
 DqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m2HTDSBtJzg+iKRymQ1pqcjCbMdOpJAgtBxZQUXeU8o=;
 b=tU5hDsJwBeNpdnLAJFLdkQK+nNGsgtp+0/8LHpxg9PqA8c6DAjkyQ/DKYoLfS7GOQP
 kCk/w1TS0wD03MlcW3FybbneQ5woXYqddgBSCxkpyc7W6GOtyJafvxc9a00R7aeBYkLl
 HWTE+ZXxIhhN/nVfyNFMtqKMY0ALrXxWEzB4CowHLcSwHBfTOrvqsvpRUDQWIePwFo+V
 M+M+l2DTsOEJYjzo2H9NdU6rmNN3PvqLGB6EGoMeybVTAgs/JTrC8IJ0m4H4EMFBeqNh
 Waug+ph0znOSmiegh8IM/7s5Swqxrl27WRrX8xzOD+N15wFue1bAV6BQccphGQEFrkzk
 YolA==
X-Gm-Message-State: AOAM5301rHdKMdbMKHhou79dpZHhgkWUh6T6C47uSuUcobz/CY+RoiM7
 2phIgfjkyxDL/0tDbFV9WzD0xe1Y3a5y6yR1P0doog==
X-Google-Smtp-Source: ABdhPJw5Dvj0c3Aik084O0U8PNxbttiajVP6p9KaHzPPNLhlemrZOknmeHm7td1oDiOOYW2UYnZcYvTCHbnDZq3PfVU=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr39601710ywh.329.1646394770064; Fri, 04
 Mar 2022 03:52:50 -0800 (PST)
MIME-Version: 1.0
References: <20220301215958.157011-1-richard.henderson@linaro.org>
 <20220301215958.157011-19-richard.henderson@linaro.org>
In-Reply-To: <20220301215958.157011-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 11:52:39 +0000
Message-ID: <CAFEAcA9zcf+A6h3R+x2uSEk1aUpV_iWfEZT72CCUeSs32OUJcA@mail.gmail.com>
Subject: Re: [PATCH v4 18/18] hw/arm/virt: Disable LPA2 for -machine virt-6.2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Mar 2022 at 22:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is a Linux kernel bug present until v5.12 that prevents
> booting with FEAT_LPA2 enabled.  As a workaround for TCG,
> disable this feature for machine versions prior to 7.0.
>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/arm/virt.h | 1 +
>  hw/arm/virt.c         | 7 +++++++
>  2 files changed, 8 insertions(+)

Is it not possible to implement this in the usual "change
property for older versioned machines" way of adding to
the hw_compat arrays?

diff --git a/hw/core/machine.c b/hw/core/machine.c
index d856485cb4d..dac82a709ba 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,7 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"

-GlobalProperty hw_compat_6_2[] =3D {};
+GlobalProperty hw_compat_6_2[] =3D {
+    { "arm-cpu-max", "lpa2", "false" },
+};
 const size_t hw_compat_6_2_len =3D G_N_ELEMENTS(hw_compat_6_2);

 GlobalProperty hw_compat_6_1[] =3D {

thanks
-- PMM

