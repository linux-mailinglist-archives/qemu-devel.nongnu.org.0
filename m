Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E48846B9F81
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 20:22:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcADb-0000gD-U3; Tue, 14 Mar 2023 15:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcADZ-0000fe-VM
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 15:21:53 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcADY-0003YV-8k
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 15:21:53 -0400
Received: by mail-pl1-x62b.google.com with SMTP id u5so17695953plq.7
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 12:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678821711;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SKrC58cpLzzekQXNHo2IJwvDEkYLoPjHxtHMnb7tZXA=;
 b=aBQXsAVXK6fm/12ELAf7gxQpqsT3xLJJhGEVtpafGnAUiZNq1NVl7+pZ6IAIuHjeiI
 lN1S7RnzjmP6rhxkAFA8h9x95gF0BkWBAl6uwYt9IfWhExt1aZt/T9AdN/DtlyLrnx6M
 uCBN5tfO+4eyASrogH8okynOX3VOmMUI5adNP3fUXP62N90GoZi8c9P+7GU8iVAzvdAc
 OW9nXagiHgTmxksZ8s7cQGvU5kZAgla2YO7Lx0hYiHQMmQVzjPAg/vOd6ItawUmaXc87
 JQ7CsRhGU7oZgh7C7pFWs9o5zX7Yig8FkWWhKx+KBtRERFqHJoDlWjzc6gV91UgA1Slp
 lx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678821711;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SKrC58cpLzzekQXNHo2IJwvDEkYLoPjHxtHMnb7tZXA=;
 b=QUdzigTfQotRzKgsms933Oi9rS2E9SUc1CQk2JIgnBpe10llrG4Xu61u5CkAm5nC/H
 xQu6FayHlBmNgVw5By75ea+mvGOiCdjSeLSdvvVWFMAG3rKx9fVIMg70El/EU30FDkGZ
 YULXggZ4TYcBfP/bA57CrbnWUlE6ygd3IH3P2aXOt3WsF2fhLN5wiGHklmxHQ2aFHQsi
 jSU2Fu6O8Ik1vPBtid/IRoNIJ31sW1DQoy5nzR9W02kMnvX+WHUYnitPIIjoY00ZXMgY
 MaaJDX7OijNiLtjMPTCr6iBsFfLwaO5KoFD5l/rqYIfnI4B4yo/ySfGEu8wZNdRmeWKd
 ykLw==
X-Gm-Message-State: AO0yUKXwIGYvC8kkJy5YOKBNl9Ii2BNsFG01K4gcaUuRureeg1YiDx4v
 X5iG69SlfwU/QhQrTLgfC+57aKF8id8xbsPUY8c9+w==
X-Google-Smtp-Source: AK7set+KxJTpDkvTgKMzaPArCtKcZ2LkVtEYyBkUGfiwkHvgGriqONIEh2mdVeFE0nK416TrVc+ZOpaofJFgYh5CRAc=
X-Received: by 2002:a17:90a:d901:b0:23c:fa47:e763 with SMTP id
 c1-20020a17090ad90100b0023cfa47e763mr3209664pjv.0.1678821710839; Tue, 14 Mar
 2023 12:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230314134950.569342-1-laurent@vivier.eu>
In-Reply-To: <20230314134950.569342-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Mar 2023 19:21:39 +0000
Message-ID: <CAFEAcA-_VsB3en6oKgUcBaACZ2HVUHfVNtXw7xhkRXMq-MJjdw@mail.gmail.com>
Subject: Re: [PULL 0/3] Trivial branch for 8.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
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

On Tue, 14 Mar 2023 at 13:53, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 284c52eec2d0a1b9c47f06c3eee46762c5fc0915:
>
>   Merge tag 'win-socket-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2023-03-13 13:44:17 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-8.0-pull-request
>
> for you to fetch changes up to fcc8f37ca3eca968932e5da716ec5e7fc05fdcf4:
>
>   MAINTAINERS: Remove CXL maintainer Ben Widawsky (2023-03-14 14:46:38 +0100)
>
> ----------------------------------------------------------------
> trivial branch pull request 20230314
>
> Update MAINTAINER file
> Fix typo in qemu-options.hx
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

