Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3EE4C36BA
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 21:17:35 +0100 (CET)
Received: from localhost ([::1]:54372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNKYQ-00079j-KM
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 15:17:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNKVx-0005Wv-ID
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 15:15:01 -0500
Received: from [2607:f8b0:4864:20::112c] (port=39572
 helo=mail-yw1-x112c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNKVv-0002KD-IB
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 15:15:01 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2d07ae0b1bfso10794207b3.6
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 12:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xJTk37pFnckrzQkC/vAxB1OZxVACWK+DA6B/lHbPqIM=;
 b=YqHL/pyGE5z18dYV2AyN/zGxmW6I5tEraVWeLIVgR94/Kipc/Y8OrtXIBg8LaD04F1
 lNJIMfMXnHfVaH78S2EL9xVbuCP/WYq7HZ9iCSCLMCQVslTPytK7bThlM2hbEKb02CKE
 FGNpUTwgXDF9LJ/+ZDV54wDvJvEVLCouGjYyiZrKAU+VkVOcJElE70BEFgMorvMHv1Zy
 aIHolCJF+8IsLtiTsnshAvszy6W3LaZxQBtWNyJwrfJMt4JpZmIXrYtNLZa0ZCsvXj/B
 wurpjHtQKcr5DXyrzDjtXw0UeE2PKq/0HeIRWV6YIUfPkFqV2KY1xEakU1HDvclXMmz+
 LZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xJTk37pFnckrzQkC/vAxB1OZxVACWK+DA6B/lHbPqIM=;
 b=iCthcwj34QgevthT3WKcXRIUQ+K/Pxcpckiq7FmEB+NdH11cdXcfFBPRX6/8Xd246F
 AQ60oToKiI4v45g33tTSIXVIEPetnljape5CwUNt+g0glz6hU9by19quvQ2aYSNAoEXz
 KODCaN2i+VRy4DupjT5KJCjqlD5ezEzVkwWQrwJGluGa0Q/mxzbylg5xyhIA7t9tofh6
 6fbCDmMNMyP8Vq6paTYqTx1QXOdO2AtGBi3glfyhKJJTYobX2WyZm1CU8+ouI1oG7xVb
 DIbF1N4HvfzrqZAXtIbZNYgj53f6CLxfF7yo6Od41Ynk6WSFIaWQl+nOt021tBEVsoLZ
 YQ+w==
X-Gm-Message-State: AOAM531ndy8VxD0n9fvu8eT7xER6PozW9ku2L2K8zlkwJ/u9kSbRD6MK
 AzXWGa5R6eytocHXqz54cz0m+AKH8dK4i19Q32le2g==
X-Google-Smtp-Source: ABdhPJyyo86BKtToY2INcKb/A2yTokyLmf0lIyO1WMUdGLOEo/OJshOFBYIiCx27493ifE/kDurKUooERRH9TwLJ2BI=
X-Received: by 2002:a81:1006:0:b0:2d6:e14a:ca72 with SMTP id
 6-20020a811006000000b002d6e14aca72mr4081268ywq.455.1645733698386; Thu, 24 Feb
 2022 12:14:58 -0800 (PST)
MIME-Version: 1.0
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-6-marcandre.lureau@redhat.com>
 <CAFEAcA9FDt0Y6W4zBLG3ciGe8M7TERimzD_4gX-y7pAv2G+=ag@mail.gmail.com>
 <CAJ+F1CJiQRn+5VXtfZgmVAKuA2wUdCXv=5hToiwfRQPX4qXUKg@mail.gmail.com>
In-Reply-To: <CAJ+F1CJiQRn+5VXtfZgmVAKuA2wUdCXv=5hToiwfRQPX4qXUKg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Feb 2022 20:14:47 +0000
Message-ID: <CAFEAcA-NN=L2iL=17jgg03iixisdVxL=HOZv1JbUsQh0VsgGHg@mail.gmail.com>
Subject: Re: [PATCH 05/12] compiler.h: drop __printf__ macro MinGW/glib
 workaround
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU <qemu-devel@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Feb 2022 at 19:50, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
> On Thu, Feb 24, 2022 at 11:23 PM Peter Maydell <peter.maydell@linaro.org>=
 wrote:
>> You're probably building with a newer glib, and possibly also
>> a newer mingw.
>>
>> I've cc'd Stefan Weil who might know whether we can drop this
>> workaround as far as the mingw part is concerned.
>
>
> Probably safer to keep it until we bump glib dependency to >=3D2.58.
>
> I would move it to glib-compat.h though, and leave a note there, as it is=
 (or should be ) an old glib specific workaround.

We can only move it to glib-compat if we confirm that only the
glib-related part of the workaround is still relevant and the
mingw side is now no longer needed, though.

-- PMM

