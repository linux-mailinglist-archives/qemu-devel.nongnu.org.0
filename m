Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93607669970
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:05:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKfK-0005dX-0k; Fri, 13 Jan 2023 09:04:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKen-0005bL-AU
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:03:47 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKel-0001ta-MN
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:03:45 -0500
Received: by mail-pf1-x42b.google.com with SMTP id a30so16232993pfr.6
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p0yqeJ9icikrfifLvEeyR+ZtcbBdX7mdhLk8p36KHko=;
 b=AiLo+o4yV0CHFaMH2aQkZi4xobRDw/2hl/y2MrUd6rBtMoXYny5VcLSKVE7EduuBCF
 UNSpL8+K5jgQJQFFvoxNPYWdvHXRmbLNIUyPud7HgdmuJjbQ5RVoZBSwrH8AW/olyj1H
 UHVUbpVd//AP8A6ZRXtlELkYHFmxr4GwftfPFH7nnR3aCg7Hboi9L8pgpH/MPxoX5UWv
 HSTQrUZdINnRo1Sw5mtARHsbz0cAzdYp41EZEmLaoP7cUDo5Et7kgbK/fw92o+In0ixF
 tWWrDA0QYM5WEKOCVVNGGpjBTdLfJRMNGsU3izt+L/CJr95Q+kDw2LtjtuKtTnwOY8U0
 sD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p0yqeJ9icikrfifLvEeyR+ZtcbBdX7mdhLk8p36KHko=;
 b=o/q2XqYOTJmgn6XVwnLKNdgluYmQ9wo0w1nDFiILVBqtT7EPiJA/BTGlijumOyKvHK
 iP46RsTZPI7N2eJW43eNwNGR/Rz6VenfJpQhcxCh2vs9EBIS+jCMkZS3creOMPjCrF6l
 LTw132DBgXEjEa2NFbd0QfBZ0EVP5T7weXlPiGOYojSiBc8yP6Yj0xTUnsIDB7SS2jQG
 TStU7Tk7bqsIeag50NQNAXo7ePt+MVAuCdZgGUGmDX0EGpa1ZgdwHN3Ub1dt/tYaI6Lz
 M3GzNL/U+PTWGjqD1mkO8xqSARQap1QAi68YlgUfMdCrlhMN+QQj3+ZRKNS4r5OWE8q/
 2y2w==
X-Gm-Message-State: AFqh2kqhr4etjxzZbpURt7+fdGJoNXe/L+VDof/2d8p+5TJj/KrBRf86
 XipfyKwKtAsyPE+jbTZ6oQnCl90j/Lnf4tpt9pl+Rw==
X-Google-Smtp-Source: AMrXdXvVfLf2dCxT1EgOv2tlHSdCqBUq2MGsmS11T1mdKkVam+ij4hzYUJbSujOfSqF/4oxlkF4s+Rpy6Vkrfv/XV2M=
X-Received: by 2002:a65:694b:0:b0:477:86c1:640f with SMTP id
 w11-20020a65694b000000b0047786c1640fmr5963199pgq.231.1673618621977; Fri, 13
 Jan 2023 06:03:41 -0800 (PST)
MIME-Version: 1.0
References: <20230109120833.3330-1-philmd@linaro.org>
 <20230109120833.3330-17-philmd@linaro.org>
In-Reply-To: <20230109120833.3330-17-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jan 2023 14:03:30 +0000
Message-ID: <CAFEAcA_HvX14erj9NPKn5L=X97C==DvNUWYNd7tvieXHOj3ELQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/21] hw/arm: Open-code pflash_cfi01_register()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 9 Jan 2023 at 13:13, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> pflash_cfi01_register() hides an implicit sysbus mapping of
> MMIO region #0. This is not practical in a heterogeneous world
> where multiple cores use different address spaces. In order to
> remove pflash_cfi01_register() from the pflash API, open-code it
> as a qdev creation call followed by an explicit sysbus mapping.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/collie.c      | 16 ++++++++++++----
>  hw/arm/gumstix.c     | 32 ++++++++++++++++++++++++++------
>  hw/arm/mainstone.c   | 19 ++++++++++++++-----
>  hw/arm/omap_sx1.c    | 31 +++++++++++++++++++++++--------
>  hw/arm/versatilepb.c | 18 +++++++++++++-----
>  hw/arm/z2.c          | 17 ++++++++++++++---
>  6 files changed, 102 insertions(+), 31 deletions(-)

When we exand out these uses of pflash_cfi01_register() can
we add a brief todo comment:

/*
 * TODO: we should set device-width to avoid the legacy
 * back-compat behaviour of cfi01. What does the hardware do?
 */

(feel free to edit if you can get it down to 1 line...)

I don't think it's worth trying to track down the right answer
for all these old boards, I just want something so that if
somebody cut-n-pastes this into new board code we can see it
in code review and say "oh, you need to set device-width".

thanks
-- PMM

