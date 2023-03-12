Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDFC6B6524
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 11:57:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbJNC-0000M4-7E; Sun, 12 Mar 2023 06:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbJNA-0000Kc-1d
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 06:56:16 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbJN8-00029j-C1
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 06:56:15 -0400
Received: by mail-pl1-x62c.google.com with SMTP id u5so10027950plq.7
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 03:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678618573;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=srR/hIYAu0HlZF7uOcPUu7VwCxPSZay/qjEP4+lQBas=;
 b=zGoXam3rAq1uRnRHJKDwVENvjnhXRUidup8dRLqiOHmyIcH3MZSBdgQb7y9NYPMx2p
 mIuUFmuGFvCjNHZQVPomtvus3i1FG+rW9RImAP3LDpK1JldRMCRVw4excePrHb2JM+oP
 UQ8UstVWPLiUVAv40loRz9W0i1ESRKuEKbu31wFaIpDAUI72c8s7mLLGiJNjPj+SqT8j
 JsKNkuBMbphFQxFssiZNKoaX1fgFTK0+oF+mvNBIIK1qCfh1oXfi1trZixP6iDUiOPIt
 ejBUoeSo4V0U750DY4evIBoPs9e4w5KIMFT3WV3Hg2URVI+nwwmN/xSyyFaXqv+/E4or
 Ckvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678618573;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=srR/hIYAu0HlZF7uOcPUu7VwCxPSZay/qjEP4+lQBas=;
 b=g9XE/pLY6RzjKKkAyJTcEHL6OmMus590+Xbu+KRxfCvF6PZPPzK9BKBUmLQsrYcWvT
 fk3GTZ7oKiuQTPZ3s8F6IOVb69al393eNzom08bjxIFhqdsJkgMjVeErsJCB4upKWTwz
 uVZIFJHWSQE0xRmpIEsxuvP0Wn10JuMetkGFrdsFekbh1QkBpOFqDc+BuvtvLL3MYBCZ
 y9X8cB1i12vgCXj7lZoIXq2q5rtq5lAkjnLRPS8v35MMnAN4rD5DTNbyc4n5yMO7sR5z
 1hFP7iALWvlJrlqfYBhPY7gwdAJ95NyIm/qrun2W2VYcaa3R3yvedYEpAwQHGk+llSK9
 mklg==
X-Gm-Message-State: AO0yUKUA65PTg3kyZQ//562wnCYNZG082rJgS/IqJ8FciQE9JYOkAD1M
 i1snUXNYXlcIwL6pNlk8iPc9Rh2mc0SZqnN4Yejd29rounATjJcf
X-Google-Smtp-Source: AK7set8SbKDTMcG3E89tB/io49OrNSRPa8Y2bmevlTzrn8v+SN+GYxgVtQXcIZ23+aYKiyZ6daTLQoVGTm/6GA6FRcw=
X-Received: by 2002:a17:903:1243:b0:19a:b151:eb83 with SMTP id
 u3-20020a170903124300b0019ab151eb83mr11364533plh.13.1678618572852; Sun, 12
 Mar 2023 03:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230310093526.30828-1-jasowang@redhat.com>
In-Reply-To: <20230310093526.30828-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 12 Mar 2023 10:56:01 +0000
Message-ID: <CAFEAcA_rXiTZTRZXs97CpjMXmkGCdnQyYSnUXvWg_puBaPvPcQ@mail.gmail.com>
Subject: Re: [PULL V2 00/44] Net patches
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
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

On Fri, 10 Mar 2023 at 09:35, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit ee59483267de29056b5b2ee2421ef3844e5c9932:
>
>   Merge tag 'qemu-openbios-20230307' of https://github.com/mcayland/qemu into staging (2023-03-09 16:55:03 +0000)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 197a137290103993b33f93c90e788ab4984f103a:
>
>   ebpf: fix compatibility with libbpf 1.0+ (2023-03-10 17:26:47 +0800)
>
> ----------------------------------------------------------------
>
> Changes since V1:
>
> - Drop eepro100 series
> - Fix igb test on win32
> - Fix igb abort on MSI(X) initialziation failure


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

