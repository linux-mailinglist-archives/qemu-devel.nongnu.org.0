Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23CF3C835E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 13:02:48 +0200 (CEST)
Received: from localhost ([::1]:41216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3cfA-00055e-0E
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 07:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3cdP-0003cG-8z
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 07:00:59 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3cdN-0003Ws-EA
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 07:00:58 -0400
Received: by mail-ej1-x62c.google.com with SMTP id dp20so802512ejc.7
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 04:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wzCW8EjbpOccD9gX+LHwiFoupLlFL1bML9ZnNFcx3Vc=;
 b=isZdzJxLzbiaY+xcMmPzDV7H5n8fUPuEmLUFDy0OQglhM6/ZvnUIqrVI7IMm/tkrFH
 wqKInfC5q9v1UZlbDojTjGSJlg3WsOrb8GCjp1ws6JuVn8DJXbBHokgE6ydyDGfVXqK1
 Z/H8PSL79O8/ZKRG9xHN08djYx9rkoClj2UzlpJ2O9upNYT5UrRlihRIoKVSklbP+6h4
 mZ6Z3Lq1fbuRD8eMnTSH/cZTuc3ZVnK2ojov20d/YnkxxorhKvMha4vFXcQtbpqFM6Qj
 kjWX6Nq4dnhwQmZBOmFtTN2M0TLd3xX2A/NeaLvsOtGReQxMAPVTG8g5FH4K+MEooA7q
 cG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wzCW8EjbpOccD9gX+LHwiFoupLlFL1bML9ZnNFcx3Vc=;
 b=GE0pmdmm4nlB+W6qDWQfrn59lH29ho2qsB53h9yJitKeJ4w6o6iM5O5kgdqNGkhaUB
 8gb+G2Dv+PIqNnmQI/ltgQfcDK1FGhohgxWXFC9dOPPPnl3tyz94kPO3tEDl9aSpxc1J
 WXODgdsaeg9omTaz3xQxQn8yS/zhimqewEe3KwNk+mVKst7sFYqIWDRlxclF5UVpPAv8
 UlzPUSkIw2J5GRNzYijJBTKQ8SUL5Z7/TFOKcidR1U5dktPDF9c7Px9xdqIzf3xO0nWS
 ukrWXduVciIOiXH/XqcuHWmPGrAspDzZ+KcYPo9pBbp+2BJXGblXuJSXywpKWJkRFztI
 LdNw==
X-Gm-Message-State: AOAM530EtrE/+sz1d+ez6/qKuMMH/b7rMzKZVEcW7akD+5R6sGGIpmcB
 Y28RxZ++Vr0I1tk3v+oTonZxkhVjbgMP/OS72DkYWQ==
X-Google-Smtp-Source: ABdhPJzUj94xLtX3FIj5hqtUVXW4HvONQbYcd+brklhoMRdikQBxomSc70SCx68ckCvKLqRoTnLUbfeqHeMhFFm7PHM=
X-Received: by 2002:a17:906:f9c5:: with SMTP id
 lj5mr11834202ejb.482.1626260454951; 
 Wed, 14 Jul 2021 04:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210713152324.217255-1-dgilbert@redhat.com>
In-Reply-To: <20210713152324.217255-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Jul 2021 12:00:15 +0100
Message-ID: <CAFEAcA-_xTFdwPgVcfyO2CC=EHZHMjTBr-DkaafWsrrDbb8R=A@mail.gmail.com>
Subject: Re: [PULL 0/6] migration queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Peter Xu <peterx@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Jul 2021 at 16:25, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit 708f50199b59476ec4b45ebcdf171550086d6292:
>
>   Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-07-09-v2' into staging (2021-07-13 14:32:20 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-migration-20210713a
>
> for you to fetch changes up to 63268c4970a5f126cc9af75f3ccb8057abef5ec0:
>
>   migration: Move bitmap_mutex out of migration_bitmap_clear_dirty() (2021-07-13 16:21:57 +0100)
>
> ----------------------------------------------------------------
> Migration pull 2021-07-13
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

