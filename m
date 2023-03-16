Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAFA6BCAC9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 10:27:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcjsk-0003YQ-1D; Thu, 16 Mar 2023 05:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcjsh-0003Xn-JZ
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 05:26:43 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcjsf-0003qX-Rd
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 05:26:43 -0400
Received: by mail-pg1-x52a.google.com with SMTP id h14so313966pgj.7
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 02:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678958800;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wHyhgwKHxLYAxhGXM7rlLrx9JE3CEv/GzCm4QDmdl8Q=;
 b=RZlrbOxbdiqF2vPcJBRjOad6ArntO/lQqlqNI8bvjqPt/EN7vcR3nc+6JzQdVhACus
 jmmOZJJDRlpPbZUV37e/ZAMk3sqsVXbkccLIu4PhM4ehHOyWxtYr6mjfbqr9dA/NHE6y
 Jp57Dn9X/OowJ8zUJwISxt1MhlD/JtyuroX7wyv2XUuDipiRkA6Z/8UzIx2mLP3gLG3b
 AbbaLSPO2xKNZ86rcWR8sTQMxmIjy6k9sCbIZsjkLYCLw51gu1hW/8Vruoebyv4oWehq
 NYnGiYEUfKYksJ7RsOnX8tZLFAT2c6YwPJ3/T/BTPqJwXsEKWsHmmHHViBKpGRa3pw6y
 roBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678958800;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wHyhgwKHxLYAxhGXM7rlLrx9JE3CEv/GzCm4QDmdl8Q=;
 b=dN8saqo2z1F0N3Sb+3dm40Gj+yKruRiXM3fW6L0t5Y+UEapb84MW6i17+U69R9tmeB
 Id4YBPA2QVw8p6K3xq15uh78h1FyykseCQrI3lrtGLayRX4y7d14bJnb7wqUNIvwhXpz
 42lVSwL0v1tmdPOLSCqg9cwUqemWoKrdGvSpUJJ2aEkv+LPGDdOuxorn/8iNwM4rHDJv
 xG0r4AEIIUCkNZvEE3wtek6lp9ABQLrogyYH6v99xqYkpj0eD4cl8mXiODWjbj/onUER
 u3uzoeDZ4CZ76GB6F8wgWZJVdM9lwq7ggIjeMrjuPN0vVcUU2ctnmZdRlPltopap8AZl
 Dh/g==
X-Gm-Message-State: AO0yUKX5eB9l5Oc5sTaeWW+UWduoZ77Dgn+kehnhZdEDQjxcDmQmIvK1
 G0lBUh74frn3HI17nfXff9y3UyKi+EMvTiHgl0yaTQ==
X-Google-Smtp-Source: AK7set+mcBIMY48jVordZQE8w/y3C+q73kqzi4/Hw44XhHi1npm1AjaFYjgGFW8CZLt6CLS2CMODQMG6VgmdVXLSNPQ=
X-Received: by 2002:a65:4784:0:b0:4eb:1c07:e5d7 with SMTP id
 e4-20020a654784000000b004eb1c07e5d7mr645133pgs.6.1678958800336; Thu, 16 Mar
 2023 02:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230315105640.616081-1-pbonzini@redhat.com>
In-Reply-To: <20230315105640.616081-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Mar 2023 09:26:29 +0000
Message-ID: <CAFEAcA9UPmfS-U6JAe3XGT=-7Zf00seOhDrZu3kAm8gg+2Gx5g@mail.gmail.com>
Subject: Re: [PULL v2 0/4] Misc fixes for 2023-03-15
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
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

On Wed, 15 Mar 2023 at 10:57, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 652737c8090eb3792f8b4c4b22ab12d7cc32073f:
>
>   Update version for v8.0.0-rc0 release (2023-03-14 19:25:05 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to dee2a4d4d2f6adc3c664e37a559d4187deee4818:
>
>   vl: defuse PID file path resolve error (2023-03-15 11:52:25 +0100)
>
> v1->v2: fix missing Signed-off-by, no code changes
>
> ----------------------------------------------------------------
> small bug fixes
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

