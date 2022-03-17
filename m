Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 599C34DC9FC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:29:50 +0100 (CET)
Received: from localhost ([::1]:47774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUs4T-0002sF-9U
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:29:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUs2H-0001Hi-I4
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:27:33 -0400
Received: from [2607:f8b0:4864:20::b2d] (port=36857
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUs2F-0002vW-MD
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:27:33 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id f38so10895807ybi.3
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u3LwUdkf0guCYS7Dzmm3dv9UXM3ZiNxhgkiONGlHmUw=;
 b=qsl2E524sb0ot/SVxT0KhZ+ttSyY1BwrtyhtPOfjKH6dVEshsKSqye3RsYX9lMKBmM
 HnE9OvRuAKEw6zgQPCQeyszeELljjc+iUjtzQ4CGVybeutoU9mMm0ynw8Xfta1zKMsn6
 2HzUKX2tbOdD3N/5zZ4I5rEht7kdFgS+1sITMQRwFkq4XZuk/Kq4ldMrconjss3Qc7Ag
 EMLryj0bkctrktypNN61+ZXQ4nDn1M9V9aY9ektvG6A28i+ig5481pdnu1O86s3yiVQp
 UY2EEy12FaLhbCWENK2a63ae0/J6R/RIUMB39JJjA2P2or6+D5QO14TBrBBYwJ6Q/dVs
 kMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u3LwUdkf0guCYS7Dzmm3dv9UXM3ZiNxhgkiONGlHmUw=;
 b=Fz6mzuPk0tV3mCD/22wYaE32AUbBjlSjZhtmeGFJojJvx7Nq5+JKtPNRDQHF9NSqtF
 vkakDJoVb3gAz+KX15jSmaLKxbeV9zJu5IlXzWCSvR8H9+x1bLpKkRFmX7f4/oAgD6T7
 5ULfiYdqFE6wnbj3yJSAOupchVgrZJwtZRYcPP4la/+KgNKUlptcxnN11s9xHeYq4Nkn
 RtTkHFJgSB9/m+L569UIYIU7zAPROzDoSu95eb+5qv9Jb1uFhyiPItQQLhPOg5X53Bbw
 im8q8du9ESoW0CqYzg0jYvp2iXWq8IdLySSQJxel69CkOyqDKiJmeAeOIiJhHHICN6ly
 WRjg==
X-Gm-Message-State: AOAM530HW92Bo9wogFJagmivYk1TGcS6Gknkvg6YJv7wsWK7lDxrCqdb
 WMzsSq8mNuzxzRJVeTsM7n1KkdrIAQzA4izLIIgfdG/onfA5e3hP
X-Google-Smtp-Source: ABdhPJzSmWvqXe9fwIDypCLEJrzMNhUEK+YMT9WOulTkWHX8Yc2d15bkAYlt2z7WL9N2mlpC/shHmN3GIcUOENQW3ww=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr682093ybq.67.1647530850599; Thu, 17 Mar
 2022 08:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-24-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 15:27:19 +0000
Message-ID: <CAFEAcA-dwaHuLaBSqKX3fj2+-e_=mgsKYT1E97EF-H3yxBufuA@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 23/51] target/nios2: Handle EXCP_UNALIGN and
 EXCP_UALIGND
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 at 05:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These misaligned data and misaligned destination exceptions
> are defined, but not currently raised.

nios2_cpu_do_unaligned_access() seems to already raise EXCP_UNALIGN.

otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

