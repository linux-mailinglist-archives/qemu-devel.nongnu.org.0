Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C5741D694
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 11:44:15 +0200 (CEST)
Received: from localhost ([::1]:53044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVsbu-00080N-68
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 05:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVsYf-0003bB-6x
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:40:54 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVsYd-0006x9-01
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:40:52 -0400
Received: by mail-wr1-x433.google.com with SMTP id v17so8960057wrv.9
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 02:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TOhvrHl8TMAsrwi+5rSMGSVk6aK9SzaDVcQoYzTnfRo=;
 b=EL/e27sHMMOcgQHOoqJkaTNLGYH2ydftAdsKvrMy8Vk9iPj4U3/nm/CNaBY16OlZr0
 k//Zv7c7cpGO5Kobswph64Iwss3THw+HUqa4udd7S/ctAqrUiYj+4jQJmSfVnZK+KgOa
 KCEegGXheOv3k2lqNt8GH8L+YU3wxY2KDXT+cLaDRNBfWcvr1NO20OBfEcGpHh1T4bOT
 7o5GpXmFH7yMpiPV4o7fgqNPwiUDiaH23U0WUtz6FpiQV59FOMJxe9j20lDHQtgo/ROb
 WPYS4m1DudunxqgFfhDvv9bPmVOluhhZz2STZYPHA8vgF5O54SLYnZwwi8wC7ysMIxo/
 VRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TOhvrHl8TMAsrwi+5rSMGSVk6aK9SzaDVcQoYzTnfRo=;
 b=28AO7Qzr2kOWiYIhmJL9+umC7r2V1h4YoakPZttkIIPNs0A1MgU0zFLwJzV8633Wfi
 GsPcpZo2jwmkU9zdfhdKfOBKje3QiKA8dNn9mPlj6P8L+HEA2zaV9jhtzHtHGuOqaRvJ
 QsZ9ljp52Obg4tihD0QBBP7zuXEvplXc8IRN9AVJFkRhpxAjyxWA9KWibgupVUr5F7uj
 CXJMsGIJ4wrICZ9vd483Ozjt94JZMzBKMPou+789EpLB6c3KnhZ4wQJaIA/e+TVXBcGt
 JxEmWCydDx8+w3w38PhNvN9IVpI032bST10E21h/7IW1xGVUDunWb7cdQCcmfj1sIHL9
 gB+Q==
X-Gm-Message-State: AOAM5310hpQDHHF8CTZG+kqIRI/ZCrRLuSuxfAujjqjCc804YCbFLvQn
 5T+PuwG5q4AYjmHZbpRNGzjibUIb+YZ9KtujcPuKu0IBDGc=
X-Google-Smtp-Source: ABdhPJzGunDjpIIjgb1hSYEelDtfOVStNpfge6/Ak+UOr+wKaLO8qJXacFdIf5KEn/EMxd0APoCWAoT4+lcKE5eVIXM=
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr5018402wrr.149.1632994848302; 
 Thu, 30 Sep 2021 02:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210923121153.23754-1-peter.maydell@linaro.org>
In-Reply-To: <20210923121153.23754-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Sep 2021 10:39:54 +0100
Message-ID: <CAFEAcA_PMJkSLLb5YN4oRq3fJA6WJDiRRXc66J59GfiYk1F9GQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] Improve consistency of bus init function names
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Alberto Garcia <berto@igalia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Sept 2021 at 13:11, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Currently we have a bit of a mishmash of different function
> names for bus creation. There are two basic patterns: you
> can have a function that allocates and returns a new bus
> object; or you can have a function that takes a pointer to
> a bus object and initializes it in-place. We have to some
> extent a convention for those: the allocate-and-return
> function is 'foo_new()', and the 'init in-place' function
> is 'foo_init()'. However many of our bus creation functions
> don't follow that; some use 'foo_new' vs 'foo_new_inplace';
> some use 'foo_new' for the in-place init version; and
> the bottom level qbus functions are 'qbus_create' vs
> 'qbus_create_inplace'. This series tries to bring at least
> scsi, ipack, pci, ide, and qbus into line with the
> _new-vs-_init naming convention.

Thanks all for the reviews/acks. I'm going to take this via
target-arm.next.

-- PMM

