Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C2057866D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 17:32:43 +0200 (CEST)
Received: from localhost ([::1]:44086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDSji-0007AY-4m
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 11:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDSgd-0003oy-CO
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 11:29:31 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:42522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDSgb-0001Ev-LP
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 11:29:31 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2ef5380669cso111085777b3.9
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 08:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pWAfW5JlgppFhBIVTsPM1YscJ0USUhYD9Rgu/ge7MCY=;
 b=Y1fc4oWdIjiwO0HXjlrI9mIwEvQJ2O4GRaXovweWWYiEbYN3APirxDINB6rFxZsvic
 h496NkaWtWZckGMZpfC5aKPtVIIN4jgkM1VuRywnJcQD6EC0jxL9Oue5qoAavZYt1kQ1
 6qAuOvwAEtYW+R8gNPPLuaKDI6e2z7ROy5Q5h2WmaMsfU7FTfGCiw3Xsn52S7Qd6LWIw
 A8NqW4HG+QbJs+ReUFZOeeRLlHvzWQrIuFN4E8rXxWZUNFaSL3wDdpRRR/tHX+GNlRvc
 2qSj/jNJhpO38p2tKMmmuFBDAxnTlawNoQs+XsDu+eMs3BKfL9bAqs4CwNAucOrg+Ev2
 2b7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pWAfW5JlgppFhBIVTsPM1YscJ0USUhYD9Rgu/ge7MCY=;
 b=rsILOEaKNd53O8G/azZ7H3tXVSL3ut41ptwVWTuvNxBMoy3qLN+LTcGJcGliKYOOnD
 A7/lVtvyf5+a8qec6Zyt2iIDDQpi4Ei+y6ay7aFZEPBt76RbHrEqXPPbuVQ1nZw3slZO
 XoQ8v57pKycgHloY5o7IuDjf8pIco8uF8sVoCWq4QKIEmxKQQ0fD2K1YFKyJBkDNjvDD
 0Ii6yTU2AQbArrlAV9tf6PTivx47PPkwRbZFQ5c9uNRUtyjxeS3Izi/r0yHOgDf+eCnz
 gOOkUNUQxRaFg1G03ALIgxQwPmg2vdZjXI6s0k9t8nz3V7KB4Kv043z+ghfvgxK1OLhQ
 ZzAQ==
X-Gm-Message-State: AJIora+XDTJeZFbVDWENOiAQY2cXhlPRU4uuQaa++ULAtrh1/ZOTGh90
 KPknPM+Xq+Iplie7hMr9xB2y7fLawf7SPptrQ/0Lfg==
X-Google-Smtp-Source: AGRyM1v7665jTyDlQOyJXOALMPPDFAiMj911wMKBEqoomqr8t2PtLjpyXqy0t0UbeaG433xD81OfJPdOrcQb6Evzzgg=
X-Received: by 2002:a81:6a85:0:b0:31c:8624:b065 with SMTP id
 f127-20020a816a85000000b0031c8624b065mr30781984ywc.64.1658158168154; Mon, 18
 Jul 2022 08:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220718092759.2360747-1-kkostiuk@redhat.com>
In-Reply-To: <20220718092759.2360747-1-kkostiuk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 16:29:17 +0100
Message-ID: <CAFEAcA_PABFOV0vU6YP-asCjtWbibjmvEh2rg3eMej5dmCEg8A@mail.gmail.com>
Subject: Re: [PULL 0/1] MAINTAINERS: Add myself as Guest Agent co-maintainer
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Mon, 18 Jul 2022 at 10:28, Konstantin Kostiuk <kkostiuk@redhat.com> wrote:
>
>
> The following changes since commit 0ebf76aae58324b8f7bf6af798696687f5f4c2a9:
>
>   Merge tag 'nvme-next-pull-request' of git://git.infradead.org/qemu-nvme into staging (2022-07-15 15:38:13 +0100)
>
> are available in the Git repository at:
>
>   git@github.com:kostyanf14/qemu.git tags/qga-win32-pull-2022-07-18
>
> for you to fetch changes up to e8cbe5842bad80bc2df692dea70134da0d13c556:
>
>   MAINTAINERS: Add myself as Guest Agent co-maintainer (2022-07-18 11:56:09 +0300)
>
> ----------------------------------------------------------------
> qga-win32-pull-2022-07-18
>
> ----------------------------------------------------------------
> Konstantin Kostiuk (1):
>       MAINTAINERS: Add myself as Guest Agent co-maintainer
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

