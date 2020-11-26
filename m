Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB882C5380
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:02:54 +0100 (CET)
Received: from localhost ([::1]:35424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFzB-0006Gb-5Y
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:02:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiFu1-0001xW-7a
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:57:33 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:35713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiFtv-0007Dc-9G
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:57:32 -0500
Received: by mail-ej1-x644.google.com with SMTP id f23so2576093ejk.2
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 03:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YGzKujG9pT1GOe5j5c5uc4YbmQ7Q1wWvzCL6UzSl3YQ=;
 b=CgExLwVy6xCfTR1rxhiH+yvPMnSiW1DvLXiNf5roSMaTQAgERnK/1Uh4lM7EXF2ivV
 Wk4C0JiXFPtSh3HODrvfVjaGaEAa7XBxC9KwQoHcdQ0bF3dsDkSBnvYwO+YpPL6fQRgh
 LSTRw6iN4XAlKYR0UbLaoswp5vVc5vORxaALdH04djqe372V1cxDXB9rUwlXcJKvjnVH
 Pm3ukAyEhpRj8DgJTlIJmE8I5+8IYzmB+Kp1kTHGKvqzLKz10U0jgiEc1D7fCDFDuXPZ
 jwLkOoU/N3+ELh8nco9ZFzNdgfsQ+C/5P1gzTcS912rgAcbGNT0xwHzBPxqnl8JpMl7Q
 qwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YGzKujG9pT1GOe5j5c5uc4YbmQ7Q1wWvzCL6UzSl3YQ=;
 b=XYIo13qREllLxoc3htIJCRnSVfyizfOF54LBpPe8F6XctPbqtXRaGEvPumA6pfF5IW
 AGg7pv9eyP1brya351g2xWYV9yXxhLgXKcR/nVyxMB565U+/xPzXlOexLGZ8HLP9bWVH
 2VhfzdenyNnH3dhgSvWB4I29WJ11Kji76unAtdngNQ1VGFBP3+Y9GJUFye8z6McIE7d7
 r5041ZT9YmVTd+JAYBaRuF8aZVvqOQp6wuEVJ8wa/pnyLOREx5nQpqunzRzRr3wUZS+G
 nWHnv+ZrmepRpZ5zwVjj8ONdfUkSG2KtxmkWg8JWKeSbxXlhnHHA1zBd+WP8xad4DntR
 vmYQ==
X-Gm-Message-State: AOAM532ZX/SZE1fRv0wxSXuvJdj5KTgPwBPzr1XvGdpqF8ZUNK3XkOO4
 9iHqKvRqwGMXozeiqwxJs6LCyLUWOnXqTE7dB8BTrQ==
X-Google-Smtp-Source: ABdhPJy8ICcWO8eMB840Is+4T/xDhtS9XvCU++UFH/oa+GchCmAuLTjZLwyUJPLVmERO1hsV/G7upXP4h33ApcyNk0Q=
X-Received: by 2002:a17:906:2741:: with SMTP id
 a1mr2301093ejd.85.1606391846056; 
 Thu, 26 Nov 2020 03:57:26 -0800 (PST)
MIME-Version: 1.0
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-6-marcandre.lureau@redhat.com>
In-Reply-To: <20201126112915.525285-6-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 11:57:14 +0000
Message-ID: <CAFEAcA9+hV2L9qjCj8naNX1GuPgGenE2CLBuKR+LHa415jrmRw@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] qemu-plugin.h: remove GCC < 4
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 at 11:30, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Since commit efc6c07 ("configure: Add a test for the minimum compiler
> version"), QEMU explicitely depends on GCC >=3D 4.8.
>
> (clang >=3D 3.8 advertizes itself as GCC >=3D 4.2 compatible)
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/qemu-plugin.h | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

This is an interesting case, because it's a header intended
for external use (people compiling plugins), not part of
QEMU proper. I don't know whether we want to impose the
same clang/gcc requirements on plugin builders, though it's
probably not a bad idea to do so. Alex ?

thanks
-- PMM

