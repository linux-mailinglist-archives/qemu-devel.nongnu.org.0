Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF30518A30
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 18:41:13 +0200 (CEST)
Received: from localhost ([::1]:41798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlvaK-0002pM-4x
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 12:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvIN-000676-VT
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:22:41 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:37302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvIM-0007GQ-LI
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:22:39 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2f16645872fso185358927b3.4
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 09:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0rVwcEFg7a2VnJnWKRRVObbsy+REu8LqtiRDqYZ66yo=;
 b=zIg91eXeJdei3cyn9R21r6bY/YXvVqBN92Z2W/wGD0kTXIuSQ8p+yq49LgC8n+BuU0
 t2eibbp4MndhWj/lPPJYLen6bbiSfH9GoXQ3RuVoI8w4eFZq2FMLgxMtrvCjSjRazh0P
 KNfP/JJMwx52X13Vre5i1+dJmGaiNOIEcBXhOUYJhDJFLxnbZhXQqk7SjxfGd7y3WX5f
 D3YSAWIbO1UUFFGKuUXMEUERuWowJ1SFu8Uk3X8t9lPenl1ItsuMy24CRYFX5YhpF7Vu
 xijeXrKvRJKD9kcKwYWtoQFSZLM4cEpgeavUZ9ge7HPnPfa51agIu8PEFE0GWAQkC6GY
 UfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0rVwcEFg7a2VnJnWKRRVObbsy+REu8LqtiRDqYZ66yo=;
 b=UZ9vCrBxij4geGRpPPRi8fKL4pZlcolrN30vyA6HthZCrUWNlGk7X4vObPF4C3LslI
 oClK1BJx1KXT1HNKl/ORDRjEMrnGNPVr7x1QB3vKqlxW+5ZyhKpE/RNJEHpzu29NWkJl
 Du3u9zEi9331ifz3i2t4hO0jt7JnLu3H3y+EcmgyvHR/DZ4MoWZEMxdsOjD5W6Wv5gLP
 8fOiR9ue+cHCsfswqqcvr6g8PQW8Qcq4FmMfKhXwK3p0J4ukcplC/3buUzfCHu/9Fv1B
 UXpwatsmHIigAP+0nBA7LzCIvY2Q0VeqUyioQuPYX03N7ZUYm0EExyRtZH+bc/uF1QUy
 e/dQ==
X-Gm-Message-State: AOAM530NS+3PdFw6NyCkeldJe8ix8vHVa+uLrE8W6GkqV+cNWwcWMB4z
 mJKDdkzrGhpkOscz0ml01BzOHSOuhx65NTUOvFOWAw==
X-Google-Smtp-Source: ABdhPJzLacpqVs4B3syYWEYzEvicNJbdDmQWvtRpYo15qmd8auhVT+7TMgFxyTmPJ0jTgkoXM4JUj3NgUKvom2/gZ1U=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr15882842ywj.329.1651594957317; Tue, 03
 May 2022 09:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-19-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:22:26 +0100
Message-ID: <CAFEAcA_C_ayXjAJmz+YZ1A3Sg2rV972kO_6NRNajBVNh_C2a=g@mail.gmail.com>
Subject: Re: [PATCH v4 18/45] target/arm: Reformat comments in
 add_cpreg_to_hashtable
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Sun, 1 May 2022 at 07:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Put the block comments into the current coding style.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

