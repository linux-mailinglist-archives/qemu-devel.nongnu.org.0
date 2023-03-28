Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840296CCADD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 21:43:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phFDD-0001vS-Qu; Tue, 28 Mar 2023 15:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phFDB-0001ub-H3
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 15:42:29 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phFD9-0006Ox-RK
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 15:42:29 -0400
Received: by mail-ed1-x535.google.com with SMTP id i5so54445513eda.0
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 12:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680032546;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A34b6HUYYYRid487rJnbKXUdSwKbGst9OjrjMybA5dA=;
 b=dQ0rBwV6woOhGbVO7K3trvO9HH/KJFJy/jWkBxACdHSfOj1ZXGGETfkWMK9FKOPsOj
 045q4Z/Ng9sc8AYu2iECio/OYQ4oEi4XWQmuANVm4O6zl+NXLOOx7ZvcvFR6wTLkP/dp
 CX5HLdiBGdmGT+wo4ZHbJcv5vaXONn+Bu9CC5+vBVuOmeRGG8Qx5yZbFQ1/I9c8fZlCP
 3PAw0Xz628UzwZ7mHSWbpFx4uDEHYnPBZz6O4uPHdYbWyE5k8oKnP4qoUmQADUEYTF55
 VSs7qXI+cl+pVTQnSfnxvtNyc77Amr5Dx6EmZYUU2FbASYmhFNW4ONtNugsERx8X29Da
 thOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680032546;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A34b6HUYYYRid487rJnbKXUdSwKbGst9OjrjMybA5dA=;
 b=bUfdQcoDU8iSorHr188A/Bh3rFTZzDafpreDVlTh2ufQKIFmVng5YN0C9ANbAX8dXh
 Gch8yuYz1wXRXhi+A4bLCs6zR0HPcyf3HF3riBWfc8cUfDVbWJPBgQKvzIsmhOSGd7fi
 O69XI7RdvASIDLOmISn41wEySJtqL9DmFP02Jmcu6WQY7ygiF8xpkcAlWsCo1SoHmZKW
 +x1MnkX58FgFj4JKpQMvNTNmMuYzcnsAVT9b+1UhH1GgK+0kvXT0c3DDaYwnKbSDHEin
 O3HKLRM+R6fF4oR0X5NFofwZZIX0LuU6tE/3Rm3kOAWceezZXW/UB71UuSJjjtY8rZn9
 xDag==
X-Gm-Message-State: AAQBX9dvruG8F+tImdRtdaizz/0jUCTPn8q/IdcDabfOS+8LAX6nh2rc
 dEti8mJsBxHixQQ7e0aBTzaLPYCMxdYSLR6utI3jMw==
X-Google-Smtp-Source: AKy350bE1Wrcfjg0wzk9EByN5Gdvf3YBvSnnE3Ex+WYiPdkpB6NMQQ1NM0LDJYHrk8y+YLFKd5qtvKOHxuKLDROuuOU=
X-Received: by 2002:a17:906:988e:b0:878:4a24:1a5c with SMTP id
 zc14-20020a170906988e00b008784a241a5cmr7423191ejb.6.1680032545734; Tue, 28
 Mar 2023 12:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230328123542.222022-1-kwolf@redhat.com>
In-Reply-To: <20230328123542.222022-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Mar 2023 20:42:15 +0100
Message-ID: <CAFEAcA_5Adej+p8UUw8qni0gr74xxp-0ghhp_ejczqxhUBbbaA@mail.gmail.com>
Subject: Re: [PULL 0/4] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 28 Mar 2023 at 13:35, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit e3debd5e7d0ce031356024878a0a18b9d109354a:
>
>   Merge tag 'pull-request-2023-03-24' of https://gitlab.com/thuth/qemu into staging (2023-03-24 16:08:46 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to d8fbf9aa85aed64450907580a1d70583f097e9df:
>
>   block/export: Fix graph locking in blk_get_geometry() call (2023-03-27 15:16:05 +0200)
>
> ----------------------------------------------------------------
> Block layer patches
>
> - aio-posix: Fix race during epoll upgrade
> - vhost-user-blk/VDUSE export: Fix a potential deadlock and an assertion
>   failure when the export runs in an iothread
> - NBD server: Push pending frames after sending reply to fix performance
>   especially when used with TLS


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

