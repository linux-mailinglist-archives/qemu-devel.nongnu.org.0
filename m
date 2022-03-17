Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C564DCB64
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 17:27:02 +0100 (CET)
Received: from localhost ([::1]:54362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUsxq-0007HV-2z
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 12:27:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUsvj-0006HI-89
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:24:51 -0400
Received: from [2607:f8b0:4864:20::112a] (port=39875
 helo=mail-yw1-x112a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUsvh-0003cK-Pj
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:24:50 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2e5827a76f4so64153397b3.6
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 09:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iyrgHWwh1pJz77HAxv+nB8h3N0x3txrZDRP0j50oKZc=;
 b=WKp2Z8aPcYzQiT/n5+Lt2hhs9Wh8bKnudxkQSwesbU76C5kETRcydEyYt1XevqJFCO
 1WZ7haL+oWDp/eJOJZ5wGwPVBqpm1F/rErj6tJcN26F3Y4ZH8bfIOOX1FmI9CleLXWfY
 bA+LNY4/AA5g3ovSsck5wo49zqVKJgv+wfyDbkFXw9Fe7Hk8qnKZPt3JGijUl2JV24Wu
 7Gz3ESXNLoBuv6C9toSoL9Y4U2b0cyJhVW1H3Mow2PMAV2qNtjjOZdyi56KOyMfv6yfr
 blNbIJ/EvIvg/seI58e8YqtXZbtlxrTtYrIdSi2KBjyMyeSZk/j4zOXrkBIzIZ9c+P57
 e5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iyrgHWwh1pJz77HAxv+nB8h3N0x3txrZDRP0j50oKZc=;
 b=ttCDUkuwhXHT857Td9+NnivCQ8SnjDWTRiYT275bg3xBPDI+Zqo+gqDUiTESKkfHi1
 DL/8/fDfLAKzOb6uqMLNS5TEFwNP6Hc/bC19apDi0D2HH5+KXFN6FouCEO4XNmF4SPNx
 dhYfE+U6qoTN6BGXSBiKpVLGo7G6DzF46fx+STbtYRkNoei1QNa6PQ5wYlanDjV8tY5Z
 7JbYj84jHeIu8vmE+50W2/gY/fENH4qzT7vxT17QzDIgCkiwCcaTfYpEFrHZ0FHtQnx9
 GszhWK1SG9iTcinlp46wO+4vldv5sk7eKO28m9xBkZaxtwHZIzz+h/uY0wg0E+V5F6nt
 RnoQ==
X-Gm-Message-State: AOAM530eeWdeJyQfuqXrTncVFI3TVvW6ZAWrlocuzgLjWl52SolG9p4t
 dsBp4u+Sm5blhN0pr+AG4HEotUBfk8D9V85DBZUG0Q==
X-Google-Smtp-Source: ABdhPJzmojFPyezUEvPwDFH6YAsTU5cLk26UoIlYd2dpPkNNHnakzir59XrKrqusL435YAFq6BzEeFYyTvAlsxF6KNM=
X-Received: by 2002:a81:1151:0:b0:2e5:99ec:9933 with SMTP id
 78-20020a811151000000b002e599ec9933mr6411155ywr.64.1647534288789; Thu, 17 Mar
 2022 09:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-36-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 16:24:37 +0000
Message-ID: <CAFEAcA_ZCukZDCnozFDX_J85YgEvig0xoAu=kJUMDgzX4h__DA@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 35/51] target/nios2: Create gen_jumpr
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Thu, 17 Mar 2022 at 05:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split out a function to perform an indirect branch.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

