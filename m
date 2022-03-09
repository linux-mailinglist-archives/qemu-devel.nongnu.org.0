Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14574D3AC2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 21:03:20 +0100 (CET)
Received: from localhost ([::1]:58614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS2Wj-0001wK-JE
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 15:03:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nS2Uf-0000eI-4M
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 15:01:09 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=36857
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nS2Ud-000448-Ac
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 15:01:08 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id f38so6706215ybi.3
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 12:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=05LLs6s3jxh2rxfiqlYq74wkCF82pmA8Jo/516JNa4M=;
 b=SMapYlCJXQkr8BAT9WooLfrnsaq6m31yJ8zKRuWDv2w1J+Owmnk5tMhxGLWvkxjxSB
 0DZTx+sJfNTGEkdUYKBk91BCnXA6Gk8Xg23zCFiE+2+aLVBJ6+OCidZgWhAwBckUiYV6
 6+dgsLfPRkDmmT1ssmrgyvpSjUz0zNHpEyj+7uVSzqp9xtGC1i4gRAVDMjtxdMLzhOxK
 D+Y4REJ7n4Ae2sAOHVZiO3/vmTTM0OObNr8Ifz/UHPeLBesYrayobDxEwdIvcj5NWeYH
 v3WQ3dTYnUKIBpd6pVHClODSXJ9MAJUJ53Qdx4LWVpmc6d+JGKlkH4S0bJKaZzG1z15w
 HIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=05LLs6s3jxh2rxfiqlYq74wkCF82pmA8Jo/516JNa4M=;
 b=GbHYwN2t3yyPctZJbeziV9TJf3/Aibv5epiwdye1fyNyeRUKZRwuKypBtwJ0lHgJtA
 P0zvNVg8+zjIl1wdhUGxuhzIsoCvDyJrOhZDRBN1b+a0PoofXIdhyCNk7LGrg4wrIluO
 ryYuS5yhbIE+eHEMBCSUiucyOOIcrBe0A8zHw7BYrh8ukoMay1HJXzR7G4dK7ebeMDSz
 q3bzT/TpZcfyCtgDGblqpL4qXIeuf3mHx0kuH9f8riJtnK93sxKt/2HDZm5p5aJv/RsE
 H89ZFQ4myfrd3hy5ex20x6GCXaCj8HNIbfVHEZ0UtOxxlnas6lvNzWiKYUSSSfHOEmxN
 MlRg==
X-Gm-Message-State: AOAM5305N7UiJPPmvMDPjREp4LTmiDO1yPAJd7H9nBisblRsAXSrrZye
 4EPYZKiNNr25h6Bg8BuqsZnuzs1vEyW21kgJ2U1/5A==
X-Google-Smtp-Source: ABdhPJx5IREkn9ldSrrJ2ndYKjrQpx20mpU4DUjnjB0wfOPVWW9+AuYn8RyxEaHWGqJ14rEGD77c/xJF+lLVVMpOZWQ=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr1208716ybs.140.1646856066286; Wed, 09
 Mar 2022 12:01:06 -0800 (PST)
MIME-Version: 1.0
References: <20220308133451.25378-1-jasowang@redhat.com>
In-Reply-To: <20220308133451.25378-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Mar 2022 20:00:55 +0000
Message-ID: <CAFEAcA_bvJY5DMe6bibsTaJKW4X-J82PBVYiHHUtKy3s4-ondw@mail.gmail.com>
Subject: Re: [PULL 00/15] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 13:35, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit f45cc81911adc7726e8a2801986b6998b91b816e:
>
>   Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20220307' into staging (2022-03-08 09:06:57 +0000)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to a10dd1e279fc56cebc7e738925e0db85d0cea089:
>
>   vdpa: Expose VHOST_F_LOG_ALL on SVQ (2022-03-08 21:18:41 +0800)
>
> ----------------------------------------------------------------
>
> ----------------------------------------------------------------

Fails to build:

../../hw/virtio/vhost-shadow-virtqueue.c: In function 'vhost_svq_start':
../../hw/virtio/vhost-shadow-virtqueue.c:537:23: error: implicit
declaration of function 'qemu_memalign'
[-Werror=implicit-function-declaration]
  537 |     svq->vring.desc = qemu_memalign(qemu_real_host_page_size,
driver_size);
      |                       ^~~~~~~~~~~~~
../../hw/virtio/vhost-shadow-virtqueue.c:537:23: error: nested extern
declaration of 'qemu_memalign' [-Werror=nested-externs]
../../hw/virtio/vhost-shadow-virtqueue.c:537:21: error: assignment to
'vring_desc_t *' {aka 'struct vring_desc *'} from 'int' makes pointer
from i
nteger without a cast [-Werror=int-conversion]
  537 |     svq->vring.desc = qemu_memalign(qemu_real_host_page_size,
driver_size);
      |                     ^
../../hw/virtio/vhost-shadow-virtqueue.c:541:21: error: assignment to
'vring_used_t *' {aka 'struct vring_used *'} from 'int' makes pointer
from i
nteger without a cast [-Werror=int-conversion]
  541 |     svq->vring.used = qemu_memalign(qemu_real_host_page_size,
device_size);
      |                     ^
../../hw/virtio/vhost-shadow-virtqueue.c: In function 'vhost_svq_stop':
../../hw/virtio/vhost-shadow-virtqueue.c:579:5: error: implicit
declaration of function 'qemu_vfree'
[-Werror=implicit-function-declaration]
  579 |     qemu_vfree(svq->vring.desc);
      |     ^~~~~~~~~~
../../hw/virtio/vhost-shadow-virtqueue.c:579:5: error: nested extern
declaration of 'qemu_vfree' [-Werror=nested-externs]


qemu_memalign/qemu_vfree have just moved to their own header file;
you need to rebase and add #include <qemu/memalign.h> in the
appropriate files.

thanks
-- PMM

