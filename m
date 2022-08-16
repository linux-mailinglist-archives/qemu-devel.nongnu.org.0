Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A165956E3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 11:45:44 +0200 (CEST)
Received: from localhost ([::1]:57612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNt8o-0000wo-Sr
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 05:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNt5p-0005um-TS
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 05:42:37 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:41509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNt5o-0006K3-2b
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 05:42:37 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-32868f43dd6so136567007b3.8
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 02:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=W4GJy3HUABuR1m0+ypJ5X+91KTe/nI7ywDys/lKOW2U=;
 b=bm0Yan2+tZFCLrB8iaOBQ2/uCQvg323xJQArSXcz8m1n2QQEiXA6uxE1DGj2C47PQY
 396z3mYT8p64AGnxcs0WK/4GjHVWtwd1cPLZBvK74YHsm0wQwv14qMb/ygMGGQ43UEAK
 wvmL8nsYtI8FDotLQaFcfi0rkarQ8LHEJCLyBId1xjzD9f+SWTK8Pi48Y8XKl5lzUPhJ
 q/6wz2fc/Q+mu53ML45kJEJCfuXVluogC7Bx5NDGLibRwqOxYHk9Ji9TxA/oktrdmi+s
 CvaxO9DEhOXck/IxdWPvphegykKNldc6ZKWldfuV/l3gkCLvB91McKklXnt/N6X/t2D8
 j6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=W4GJy3HUABuR1m0+ypJ5X+91KTe/nI7ywDys/lKOW2U=;
 b=PZ0zq+no7VNrSmj37twrl+3RbL8pyoQ2wDYMUcR3pTpt2KE082cakE3JYAzVrDVHLY
 pij7HIQ80rgcj/1i6JILixX+KWVK4tFHwM33+AiXGC0QdMMfSsM7sTXJoopy4k7VqZkf
 icrElxKymxTV9/ncpDYMpHCCGtLpuC2aFk9OLlXseB5oSUq++1XGOvBkwK+VoSUQ0xwZ
 BmGkHgHQDAAQ6e/71/NHiZeGR6BbLRslt5kLf/vy03CnbX4QnniJx1jQsOfpEL1gjlTi
 74zw8VyO3KkeqeeTUotEPhRfC3HB8hfr2nllptT/k1e5NBER/ed3EajcqG41KsMrRN+S
 8jHg==
X-Gm-Message-State: ACgBeo2+yHRojGKG+h5HogxY6CMteCgLUro0ezrfBdfHrHTWGJziCwmO
 mapTy6Ran6AArU9Dy1NKmP/SyMRUZc5JANQvTH8P6A==
X-Google-Smtp-Source: AA6agR7JyJpS0c8N5H4IH4+7w7zjkauajGrDXo7ZV7SyEep57wTXcdUuHBQcCa6xNYu99bV17AINIUqVmO9S70qXGE8=
X-Received: by 2002:a25:55c2:0:b0:684:4159:38f4 with SMTP id
 j185-20020a2555c2000000b00684415938f4mr11614921ybb.288.1660642955133; Tue, 16
 Aug 2022 02:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220816092624.15168-1-zhukeqian1@huawei.com>
 <CAFEAcA8UN=NABfNzzP-m5b3ki5mKH1qyfwgi6_yiT__6u_-1ng@mail.gmail.com>
 <47f60df98b514502b422adee6b970880@huawei.com>
In-Reply-To: <47f60df98b514502b422adee6b970880@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Aug 2022 10:41:53 +0100
Message-ID: <CAFEAcA-DtHrfCF0nfvnrW6bTmjRco_rxu=vj3yNciBkM_0iUog@mail.gmail.com>
Subject: Re: [PATCH] acpi_ged: Add ospm_status hook implementation
To: zhukeqian <zhukeqian1@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, Peter Xu <peterx@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 "Wanghaibin (D)" <wanghaibin.wang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Tue, 16 Aug 2022 at 10:40, zhukeqian <zhukeqian1@huawei.com> wrote:
>
> Hi Peter,
>
> Setup an ARM virtual machine of machine virt and execute qmp "query-acpi-ospm-status" can trigger this bug.

Thanks. That is worth stating in the commit message, I think.

-- PMm

