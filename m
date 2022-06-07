Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBD45402BB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 17:49:25 +0200 (CEST)
Received: from localhost ([::1]:57618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nybSO-0004XO-GK
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 11:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nybRI-0003gE-Pd
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 11:48:17 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:45842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nybRH-0001SR-5w
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 11:48:16 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id g201so3996277ybf.12
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 08:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ELgD2Mhd/a+B1m8JwJsho8kj7v7oEMoUGbxF6wuegQo=;
 b=D2eMUj/1Z30FiA4Kwa808BEor1lV6ZzIRltd1cqZUQ3gcGhL+QS0PZJw1J0PPF7Ude
 3Jn95qwmardMbCEVboqyGg6RpXDJLUUlhLdhmzjQvrUbcB6NCM7lNN4AbauujzJ7i5FL
 cruy8lOiB0sWwNjIzrgU/m7CPRinoiQxU1SRQuKsMspWtHpXRZvIwa6rXG7Em8Ca1c+L
 dk7TXbhM59d/QVRcZt4JQ1Jr4IQBlYXZd7zpZt7A8wmxrHRn4rRhL4Gs+O8c0DngofWt
 hDVngWG2WV8ZE1uVQv+b7bEy0ubJ/aXZ2jcPfhy84Q+CFkozGdRvAdr0QI2lF/HcRrRF
 dA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ELgD2Mhd/a+B1m8JwJsho8kj7v7oEMoUGbxF6wuegQo=;
 b=sJniVhEpNR+/2zHBc/57DrUmczBgnugHq3OQmO5y8TrkcZQCcB0xGVpE7B0syFs+Wj
 3sa0PPaTdliNWjCoFmgLAOIUg7IPN0hG4tAqjFXdwqQL0aT2QL+g5f3sBSxYRlAysz17
 /X5gfW0t2c8weShkrPBncL8Nn/u0eNBjuRHGIRKVDcT+YP9P3z0BEFH+nzKC33SI1xmQ
 7sRauyxB/UdVyVxeyG5CZMsb7Yd6Btseegn8VuEHgeRzKwfR7elKh/JMQCm4jLQ7DRTl
 SPqIKNxbE0kysCQDRgvVo00Kyqhe/v3aLIoTHGlRDzXJTxd7HSpGIhLSnoZ9O/qs8Me2
 S+kg==
X-Gm-Message-State: AOAM532nMNi5lpatiGnl9HB8nN78kZDW3eZzLduedGHNUg5uGGxxom/v
 4A1JGtNl/bAvYF6r4LJtrwNQguXd2+FWiflj5hnWmg==
X-Google-Smtp-Source: ABdhPJyAjKqdMGsxW5fIznFHY8J4hm7K+fc8ya0v3w2LpY6+C8JpdZmmfqPCUsaRU4T/PKyp1yVNvMxz1dBCZkehDgU=
X-Received: by 2002:a5b:d42:0:b0:65c:a0d7:4c6 with SMTP id
 f2-20020a5b0d42000000b0065ca0d704c6mr30371551ybr.193.1654616893818; 
 Tue, 07 Jun 2022 08:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220604040607.269301-1-richard.henderson@linaro.org>
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2022 16:48:02 +0100
Message-ID: <CAFEAcA-UGK8eN-YND4s-jvCBY1jgZtMUMJwf6m6F+HdAk4QjnA@mail.gmail.com>
Subject: Re: [PATCH 00/28] target/arm: Split out ptw.c from helper.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sat, 4 Jun 2022 at 05:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The object here is to move 2500 lines out of helper.c.  Yay!
>



Applied to target-arm.next, thanks.

-- PMM

