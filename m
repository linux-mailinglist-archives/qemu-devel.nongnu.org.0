Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CEB5BECF5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 20:45:40 +0200 (CEST)
Received: from localhost ([::1]:47748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaiFW-0003Le-NC
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 14:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeUr-0007Ch-KQ
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:45:13 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:47001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeUq-0000mn-7N
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:45:13 -0400
Received: by mail-ej1-x635.google.com with SMTP id bj12so6640687ejb.13
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 07:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=4jxPnUpNOpVa2Yo4/zoa8595clQwIG4y1zhTPiPgm1M=;
 b=rNDdzYdoZgRgh+aXmqVv9qUsSaSMMz/0wwzjOzj6VjpdBwXlXd6ijEouVRlcE2ij0V
 61SrzLjewFrntCpR9N75FmYRyMkS50x0Pim/0lIg/MtC4Q/eUv2W515b9kszEJQUNI4u
 HyxkrRxv4ksUqIgZ4tX6cVovt3x/ELftSv787I3eacCdqiVDI2E88cmIgQIfMROZpx4t
 ABw+A9wN6zzo5Q6R+uvisA1QS/0y430qFg44jLGu3Tyv23NHyIPK7xtgK3VSL6lSLN+4
 RLJ9SBvI1VaMhFGlh6sr/nasN100zH676o+f2BA2rnZ70ifqoMkuTP5GF0lu4hfVt2/b
 1AZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4jxPnUpNOpVa2Yo4/zoa8595clQwIG4y1zhTPiPgm1M=;
 b=MtauV02FdY95GydOX1WtFG8vd9QXB+p9eVB5WYsyxdVU1bVfiR67vPiQf20PC6/GU4
 vmWsIpiA4zMN2iJNKHVfg67PcEx3YjbGdnrd3jcSjquDV8EPQV98qL/tfiCG5kXMxlxX
 sVnCb0aetWGBYt7bUQrdeZHmlyGOFawmSRR1HejKqw0mgO4ayM3O53+TFmlTq/w2UlUP
 xTmVfiTCRFVgaFhL3GUwiEYHkvs3e8HCzDxeV/PTEXYYbWk4y9JI2UcNHIEaafzbC5LJ
 vFeBhRhFSLZpv6jbOc0+tOoEO/QO68r56/yY786olucdI4C7dizYvjWN9+lnhfa7wv2X
 JqIg==
X-Gm-Message-State: ACrzQf1THtQLvDdS/aJZty8DHbk475xgIudb8NI/QFchNF+LAxMljDQP
 quepY6uf6tt4HDSy4WqM5ZjJ6/hWMEPdZUeWvb6uDA==
X-Google-Smtp-Source: AMsMyM5UKW7WyQnRDRX6sUEr1sxJLVVbtwbn9mUzrFg7NBETnXx/1kz7xsfaj7MaEyTl+Mk9ByyOrjKo9HrWONMVgCI=
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr16707897ejc.619.1663685110645; Tue, 20
 Sep 2022 07:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-14-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:44:58 +0100
Message-ID: <CAFEAcA9PYtEbWJqxQh-Hz-xdHEeNGi2k6kfcgy4sRSjb0Ug5mA@mail.gmail.com>
Subject: Re: [PATCH v2 13/66] target/arm: Add is_secure parameter to
 get_phys_addr_v5
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Mon, 22 Aug 2022 at 16:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from get_phys_addr_v5,
> passing the new parameter to the lookup instead.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

