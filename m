Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D693A57804E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:56:39 +0200 (CEST)
Received: from localhost ([::1]:57210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDOQY-0001VP-W6
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDOIl-0000Ig-Qd
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:48:35 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:35454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDOIk-0003nf-9q
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:48:35 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id e69so20060298ybh.2
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 03:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D8aYZR9L6JQDRX/RDGKze4HXJ5HuISh1PmJpbh59tEI=;
 b=bgftrLUixh5bAqivf8Xz5xuVPhed60qcxCA/YmYzpNComjY+UvLW3rwERYV+4S7y7k
 LU651yc6IFh8Ya7m4nfCea83su6CHgpk/YkCDUoXkY7za2klUmG8ZpREHiqoNannQeck
 pEcPkyS4OO6Aax3ujMy5IsCzn6N6Jsh00khXewW4fwZQKwgSjsPYUqIMeqMNWSwF79US
 Oul2FCGFf4Zab3xpOFaPvwFcb1hyKna0XcfpbAkmUuCXuO1lEInxLII8eqxTO/RtlLKn
 cEL+SIiKZKiN5ddC8iL/ONGArJdShp412nIUHLJUCYX4wABEYoQg88RDzVejtfmh2moD
 fbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D8aYZR9L6JQDRX/RDGKze4HXJ5HuISh1PmJpbh59tEI=;
 b=lwadmzlqLekOoLals+RXAovgolMGa4mO2WY7zrRB++5YoX1P4TBt/pBksWGWmTzX2x
 XnDZe4Jj3/3Qudj0CTxqduZ0A0cJAJdUh/DYMhC8G2wqassowgc24XM1pTq2RSs7Esh5
 79WqDvMG8kIyPemhTloUTNa3qcs4AHJvDgZFFTwPE/+1LbpfjQgsQfeNcBqe9rQwOatZ
 RANbBSEu5C2iVj8tBAy0DSYndvJttg+4JT9Oohly71CnKIxK3BR2HLmCzyTfHKXVSeO7
 bAoL4vX7oaaOJcwCeNZ8NOX616IURSBkPACCsly8ajGAMuJTX/4zLO12QTCqrXZBDDhU
 oo/A==
X-Gm-Message-State: AJIora9VXh1OfRnX+EgQ25dE4YrtXCCca2j18SO9CzOKPN2bWYim1Pvh
 9JhARVoPuHjtzHZUbID+ng5WOF7KU8RebSDh4bfZHw==
X-Google-Smtp-Source: AGRyM1tx4itkzxstTrX0xckmT8SX+iWncmurvJ7AwDCMlrfbFg0P6Zn9YvtyBkucx8Ouik9NkNB9MlG28fRV+bSMVyg=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr26676658ybr.39.1658141312621; Mon, 18
 Jul 2022 03:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-17-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 11:48:21 +0100
Message-ID: <CAFEAcA824kVbQHjo8U=Ymgx3s0yLmWgEJK+2uuOzG8=965CQrg@mail.gmail.com>
Subject: Re: [RISU PATCH v4 16/29] Split out recv_register_info
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 8 Jul 2022 at 17:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will want to share this code when dumping.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

