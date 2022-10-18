Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3607603197
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 19:30:24 +0200 (CEST)
Received: from localhost ([::1]:56438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okqQ3-000380-F0
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 13:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okq64-0006F6-AD
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 13:09:45 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:46683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okq61-0007cy-Lz
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 13:09:43 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 t12-20020a17090a3b4c00b0020b04251529so14572518pjf.5
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 10:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tOUSIuIlTYZfmkFJKxiwVoLnSxrWmdGw8FLwgcCykhc=;
 b=H2uSIoqhWykAF4xOigAFW9u38GE4pUViG8sk+bxKnO9M12rGhpi0RGLoMp1PpONnHA
 YDgX8ru+OB8AF5IkyLTQR7BYRiYfgr4PkQfywVeka1BCGOifcVpULNv9HZ9uwNHXtQ4M
 MkeiWiys4odAPNGHxgUszCGSBedFGuKt7UZroeduMAt+MaZTWIImkMVG6pTXUbU1cxRH
 PrAIm/TP1N56ZWCgwvxGlpH0ZY5aZyqTTWva7/5BKlScaynrNGLZ3adxy6loBHxs5CnZ
 Z0+fgr/EHTohT56fVkWpVZZESfai/5KB8km6S3QJyUPW/Yc1E97hU1HeCR2fjNINou86
 Hsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tOUSIuIlTYZfmkFJKxiwVoLnSxrWmdGw8FLwgcCykhc=;
 b=n7ePAPby1Ctq6bnE0TdEUnZELJVOwWOdY2qrvhM1fsLeB1R2Kj3ZO49MdTImAbRKzK
 6WDfFmU5jCzRVJ2uLoWEO/8bS7nNiz4dkMkSgAj02I8R677d1asmSHvvmyrmgDenp5gN
 tEx15Oa1ikS38CZvA9H/ywfLAFWbwaiyHKFrkrDGhwmaU4PxdQ/s5xwyOG3CZ3hhisK+
 ftQM5LNHF7shg7ZeyD+vmlZa4C0xbHFbHaMqhTXrXuEOyILSvj9ri2ASlHd+jQJuQ4b2
 XpbRdSKNjCsySh3fqCBlchP9a6d5YqQehwmm++nRz/TGXgRb6ZywYqHJDnK+kH2n7Oi5
 6jxw==
X-Gm-Message-State: ACrzQf3AxgFFfej5MjFKNgCqZB+LN0dK+MbF+irtq5KMtfMf7t/zAOKZ
 B9yPIbSslUP9wTaOVZcrgyE7jLgEWmYtClSeAeIwIA==
X-Google-Smtp-Source: AMsMyM5Pr4RIID/SfS8LrKgco8F8Owi+k4JyDNkDZGkmrbpNsVE61DoUuVFm2fkMG11CnBriR5GNnOoCbLSzZswB4BQ=
X-Received: by 2002:a17:90b:4b8e:b0:20a:f240:9b23 with SMTP id
 lr14-20020a17090b4b8e00b0020af2409b23mr4701355pjb.19.1666112980040; Tue, 18
 Oct 2022 10:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <20221006151927.2079583-10-bmeng.cn@gmail.com>
In-Reply-To: <20221006151927.2079583-10-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Oct 2022 18:09:28 +0100
Message-ID: <CAFEAcA9nyy47p=Mextm8qTFu1LDTMYBv1BubtywyzGPuDiD0XQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/18] tests/qtest: Use send/recv for socket
 communication
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
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

On Thu, 6 Oct 2022 at 17:20, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> Socket communication in the libqtest and libqmp codes uses read()
> and write() which work on any file descriptor on *nix, and sockets
> in *nix are an example of a file descriptor.
>
> However sockets on Windows do not use *nix-style file descriptors,
> so read() and write() cannot be used on sockets on Windows.
> Switch over to use send() and recv() instead which work on both
> Windows and *nix.
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - Introduce qemu_send_full() and use it
>
>  include/qemu/sockets.h |  2 ++
>  tests/qtest/libqmp.c   |  5 +++--
>  tests/qtest/libqtest.c |  4 ++--
>  util/osdep.c           | 33 +++++++++++++++++++++++++++++++++
>  4 files changed, 40 insertions(+), 4 deletions(-)
>
> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> index 036745e586..adf2b21bd9 100644
> --- a/include/qemu/sockets.h
> +++ b/include/qemu/sockets.h
> @@ -33,6 +33,8 @@ int qemu_socketpair(int domain, int type, int protocol,=
 int sv[2]);
>  #endif
>
>  int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen);
> +ssize_t qemu_send_full(int s, const void *buf, size_t count)
> +    G_GNUC_WARN_UNUSED_RESULT;

New global function prototypes in headers need documentation
comments, please.

thanks
-- PMM

