Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255BE6A1E03
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:08:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZef-00052H-M9; Fri, 24 Feb 2023 10:06:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZea-0004wO-0V
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:06:32 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZeY-0005qq-00
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:06:31 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 k21-20020a17090aaa1500b002376652e160so3054280pjq.0
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 07:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9OsrfWDNdPmpoy5UQ0TQrTyvzLpjmADL/vWf1DVPsZ0=;
 b=Xeynr9D53EjlFuU8Fbsjp+HCtE93nIGLp96BSeE/Ubbxe5P8MeJrTOkV1snRTTXIXX
 3iFHa8iLw25c7dizxCLq5bkWYx+XCfg3PixDdfpZkItUe+OFZ0KsjgN7OWxQzGBttjew
 e5+73Fp6p9uX3a0Kj3kJYs1EJFxL1EkWvbBR2X85I/WTFz3FNO4ub2cSR9Nt04yX/lOy
 YVl74lVvvqPmz/qWtxkqb3kI54/DXGXv/+fWGICYvA9h51NGCpfWeg18M/jcweIa0dZ7
 Ox7arfV8k1XZzLNqw+q7JRySRFW1VQf4clbeM7kOL/eRSXhnAG8fGQQkC21oet3ZM2xF
 yJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9OsrfWDNdPmpoy5UQ0TQrTyvzLpjmADL/vWf1DVPsZ0=;
 b=svhvW0HEQD2+qdVI71zD+QgIQ0UWtGReI1QyyYkB6A+dEhJHrUiAfu8l1+KbJrNxP/
 vEyWOPuZWDwo2OYFcF/tGbO6wbyM0l2mwdZMBUwncF+6GSJe/Ykxwzhf42fqtcKdgTYw
 o5zZ3KAa9aNuHP0WPrjvM/ShD2Xowws1WStlLeeUOWuJkoOYiJE+yFseu0NheFqQNZGz
 aRvoVHEKOhJ6z19gWYK46Ul5TTbtoDDXfRnvNMDaT8F0xmnkJ3I0p4+ydO5iQdR4I60N
 m0pZQeDm1bwvH4uyYdKFWVCAaldtC5sAJPHY5gw3UtXLFkDWI1JziN7Uvwg3qMl+RmQi
 ezzA==
X-Gm-Message-State: AO0yUKXNUlr9afuJzq9SAwJcbRsRZ7MR0BIOLdJvFM5aNGsiyGpOXP/z
 tLfGTD3ZV7c5Lqg7di8P1PgU6oYb79K//t0KGhyHPw==
X-Google-Smtp-Source: AK7set/ECUMbYQW2S8msDM5CjwqvKbWC3uuBqYnyZKiNUZpUwXa2PvBmcZ3vBO4k+3ZwagqLv2C7yEYKOGA5vIcKjks=
X-Received: by 2002:a17:903:3307:b0:199:4a4f:9d2a with SMTP id
 jk7-20020a170903330700b001994a4f9d2amr3208292plb.13.1677251188494; Fri, 24
 Feb 2023 07:06:28 -0800 (PST)
MIME-Version: 1.0
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-21-richard.henderson@linaro.org>
In-Reply-To: <20230222023336.915045-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 15:06:17 +0000
Message-ID: <CAFEAcA81+8purhnHceWr5oCXBX9Km0eC31+VKnXW=9wKU6eioQ@mail.gmail.com>
Subject: Re: [PATCH v3 20/25] target/arm: Use get_phys_addr_with_struct for
 stage2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
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

On Wed, 22 Feb 2023 at 02:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This fixes a bug in which we failed to initialize
> the result attributes properly after the memset.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

