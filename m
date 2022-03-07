Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 048A04CF092
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 05:13:31 +0100 (CET)
Received: from localhost ([::1]:36646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR4kT-0001Ss-S6
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 23:13:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nR4jD-0000e4-L9; Sun, 06 Mar 2022 23:12:12 -0500
Received: from [2607:f8b0:4864:20::c2e] (port=45877
 helo=mail-oo1-xc2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nR4jC-0007Zo-0V; Sun, 06 Mar 2022 23:12:11 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 u30-20020a4a6c5e000000b00320d8dc2438so2986224oof.12; 
 Sun, 06 Mar 2022 20:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Igx6MQWAxJLHhuWRwWdRCzphp8v4TWMuucZjRE+eIps=;
 b=mOW4WgGiybY6cJIHQtWugCYu9fI3us4NbaFSRangLuZBDUgVLqatK6ZpbgT+GtBXoq
 wiQz2DODDPnY/mZMsh5KdkhxsKEAVJDPe35m3IiEbr31CSMuUwarWu6LhUFTayV67BH1
 +U7CuPEzOAw9dwfrcYN/eN/wIU5yXlxOAALyxRCU38YYtGdNgJyQupTIpd6WYrcmqVBW
 pVE7FEMe94IM6BEpwmuwrOH3SKDvM8QZrWb9sk9Boy/re5jl8+kztZk6B0CST1/PfMmY
 /15PswiV5Sfs6W3mu0b3gaNteQc4MwrZADnXnDRWd03TpD8IQtba9yxWY9YPZRLhFV1I
 IwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Igx6MQWAxJLHhuWRwWdRCzphp8v4TWMuucZjRE+eIps=;
 b=rlw6bnrKqNUDvVsyITcLVqdqXzyuAtSxlnmKU6drp0hGtcaMEvbQHMmBYat2TbClZM
 8kNtkKSPaK30OmZiPnRD1XRm/Z0Fqw7LIfSwl/zHovkryhfu0aOzBVcEdSBRHqHiaVgO
 trherLC5VcUYLcEwAKNlgstAm8xhfSwSl28EprwEheozsJYBwpvWVVN3RptXpwhiJZ3W
 OEnS2pA1BR94ljRo7TMHrp7fd77S1+lnz5KmIimNbkjXn3mJEdS9FysrZKfZv2Zo1nyz
 tHeIGdjYR5b/Adh4/uR1aYUtJJmzRGurpNQT6nUNCC7W/XiGP3zGF/GP1kbArnEAo6rG
 2jqQ==
X-Gm-Message-State: AOAM531xID+jeOb7f3W/pRsaQHoQXS1wxVVl/fwHhenthcpojsf99tpI
 xjdUffUHEwh5Mmiejvt8KP08zusZrntqQdUorj8=
X-Google-Smtp-Source: ABdhPJyMNpLJA4EP13Iw6DX+pOsvIo9dDq3CYhiCTVslPiGr//dGRCO0u+3GChNn3LRMU9qKKhr7H98+Nm03hzCqXA0=
X-Received: by 2002:a05:6870:4410:b0:da:38cc:e845 with SMTP id
 u16-20020a056870441000b000da38cce845mr2836274oah.88.1646626328566; Sun, 06
 Mar 2022 20:12:08 -0800 (PST)
MIME-Version: 1.0
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
 <20220306231753.50277-14-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220306231753.50277-14-philippe.mathieu.daude@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Mon, 7 Mar 2022 13:11:57 +0900
Message-ID: <CAMVc7JVc-TsqarWsFky=9uK9DNUgoZHFk+ctfLbfXyft7N4EHg@mail.gmail.com>
Subject: Re: [PATCH v7 13/22] osdep: Avoid using Clang-specific
 __builtin_available()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, qemu Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>

On Mon, Mar 7, 2022 at 8:19 AM Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Remove the Clang specific __builtin_available() to allow building
> with GCC, otherwise we get:
>
>   include/qemu/osdep.h: In function 'qemu_thread_jit_write':
>   include/qemu/osdep.h:787:9: warning: implicit declaration of function '=
__builtin_available'; did you mean '__builtin_scalbl'? [-Wimplicit-function=
-declaration]
>     787 |     if (__builtin_available(macOS 11.0, *)) {
>         |         ^~~~~~~~~~~~~~~~~~~
>         |         __builtin_scalbl
>   include/qemu/osdep.h:787:9: warning: nested extern declaration of '__bu=
iltin_available' [-Wnested-externs]
>   include/qemu/osdep.h:787:29: error: 'macOS' undeclared (first use in th=
is function)
>     787 |     if (__builtin_available(macOS 11.0, *)) {
>         |                             ^~~~~
>   include/qemu/osdep.h:787:29: note: each undeclared identifier is report=
ed only once for each function it appears in
>   include/qemu/osdep.h:787:34: error: expected ')' before numeric constan=
t
>     787 |     if (__builtin_available(macOS 11.0, *)) {
>         |                            ~     ^~~~~
>         |                                  )
>
> Beside, on macOS Catalina we get 2254 times:
>
>   include/qemu/osdep.h:780:5: warning: 'pthread_jit_write_protect_np' is =
only available on macOS 11.0 or newer [-Wunguarded-availability-new]
>       pthread_jit_write_protect_np(true);
>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Fix by using a stricker toolchain version low range, replacing
> MAC_OS_X_VERSION_MAX_ALLOWED by MAC_OS_X_VERSION_MIN_REQUIRED.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/qemu/osdep.h | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 7bcce3bceb..488a286300 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -642,19 +642,15 @@ size_t qemu_get_host_physmem(void);
>   * for the current thread.
>   */
>  #if defined(MAC_OS_VERSION_11_0) && \
> -    MAC_OS_X_VERSION_MAX_ALLOWED >=3D MAC_OS_VERSION_11_0
> +    MAC_OS_X_VERSION_MIN_REQUIRED >=3D MAC_OS_VERSION_11_0
>  static inline void qemu_thread_jit_execute(void)
>  {
> -    if (__builtin_available(macOS 11.0, *)) {
> -        pthread_jit_write_protect_np(true);
> -    }
> +    pthread_jit_write_protect_np(true);
>  }
>
>  static inline void qemu_thread_jit_write(void)
>  {
> -    if (__builtin_available(macOS 11.0, *)) {
> -        pthread_jit_write_protect_np(false);
> -    }
> +    pthread_jit_write_protect_np(false);
>  }
>  #else
>  static inline void qemu_thread_jit_write(void) {}
> --
> 2.34.1
>

