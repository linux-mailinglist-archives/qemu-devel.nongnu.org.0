Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B98533F95E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 20:34:18 +0100 (CET)
Received: from localhost ([::1]:35358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMbvt-0000FG-BB
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 15:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMbmH-0001IM-EL
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 15:24:21 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMbmE-0004yn-QS
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 15:24:21 -0400
Received: by mail-ed1-x532.google.com with SMTP id u4so3675369edv.9
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 12:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mxwV2+kljZJ+8AZC2oEA25RlzoO43w3h/PsUfynUf/k=;
 b=RaS0TZSX32GAQ+63c2n2nsQ7vsErMydw2MVkhwd7BnYyceNIPRMCD3vffnA1QqUU1K
 IbRG2YVqG0gtV3EQRP53d1jX+2YBc2lrSDBPoDiTo22tiErnd1Vc54obmkeYKqPHVevk
 I2IVfeJ+s9Anwl9PjDhukRxxqAOFNNSsrzda4sn36Ne9Jdu2fBnfGWUC7UUNSbNwrQP0
 Ix4j+NeCYWymQNcPXu2B+Z9vTnrDm2u4wkzrfUXIL7dLzqhaMSmq79rNvoXAqlPAzeWJ
 ppiOZ3Zgc14jyRjNNLs+MxHBmUnMHhlD8iXAOtnwNiHR4DVMjfXdDZqfxPdHtDgcMXSN
 R8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mxwV2+kljZJ+8AZC2oEA25RlzoO43w3h/PsUfynUf/k=;
 b=DweCdehbDWkDfawsssdhTl4M469j6T031fAVhR+XlPhbHg4Vv8ZWcVPf7lRvOTIO3C
 37K6glu3ltfchm1AB8C7OvrkdZAE4k7NJcKxY08PlmW16KV9EXG5imbTvdlMr/zfuah2
 9zUvGr3B5XYtrainKf0q3qNnb6ppwc/qQWkC06/0HcQHQfdC92Fvl8nWya1sweHwUq3C
 vBkgRX2qjR9gqB/vO2wMAcdwyITpuOSsbXJ6JgIN+Z18dr1xkdzSuj+xDcCUCOwJtuwA
 JadoGVUE1rHeykkIdww7K8rn7bZ44I65sRLZkodiYTtHfucrrsx1z1A/zT/0mnvF4w+Y
 QirA==
X-Gm-Message-State: AOAM531njT7T5dRHdfxCYB9wkU6wTGezm5RELUVTNZRyCsBDlti37cKi
 KkciO46bgT/jnYICAwvjOU/ihIH/CJv82/uQDgOnxw==
X-Google-Smtp-Source: ABdhPJwi4Vg5OhwFp3GxPSIsPi3HlQBy1nJ4KJpRuNVH0TaZiViQgAOEeKBhP5KA4Z9b/aeesRu5gDRryPz1kxbrSrI=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr32449337edb.204.1616009057068; 
 Wed, 17 Mar 2021 12:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1615891769.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1615891769.git.qemu_oss@crudebyte.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 19:23:53 +0000
Message-ID: <CAFEAcA9u3uO_+Fb1YF5ZkEP3TYkQowtFqJAYyXWAQNKbj0FAqA@mail.gmail.com>
Subject: Re: [PULL 0/1] 9p queue 2021-03-16
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Mar 2021 at 11:00, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> The following changes since commit 2615a5e433aeb812c300d3a48e1a88e1303e2339:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-03-15 19:23:00 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20210316
>
> for you to fetch changes up to e4fd889f51094a8e76274ca1e9e0ed70375166f0:
>
>   hw/9pfs/9p-synth: Replaced qemu_mutex_lock with QEMU_LOCK_GUARD (2021-03-16 11:41:49 +0100)
>
> ----------------------------------------------------------------
> 9pfs: code cleanup
>
> * Use lock-guard design pattern instead of manual lock/unlock.
>
> ----------------------------------------------------------------
> Mahmoud Mandour (1):
>       hw/9pfs/9p-synth: Replaced qemu_mutex_lock with QEMU_LOCK_GUARD
>
>  hw/9pfs/9p-synth.c | 12 ++++--------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

