Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1500051FB51
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:29:12 +0200 (CEST)
Received: from localhost ([::1]:40118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no1Ze-0001Ji-2Q
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no0vE-0004QR-3f
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:47:24 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:46827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no0vC-0005T4-3m
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:47:23 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2f7d19cac0bso139060977b3.13
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F+/yqUqHVJeW5Lm620oq51jAT5wn6U0/DOMEfIG0xtE=;
 b=b0keNBj9nQ8X2/A1T2YlqDf09hjnPSiFljTD+qrrLWmwwJkGWwMsEd4pCLkoKZWD0p
 l9KZcJk0sPKT38GqLg771g3Sd3TSzzRWMlc1PbqqegzR2vOlYAR81l8GtFzgtGWD/+UE
 0onesUzO/iQ/NvSxdg1n/JzjJK+jdGcc+2oKGxMFsTx+T2OC6YrC3VNpcSeh+SnFpNvT
 xmxwHBz2QK5nZKQqXdlYMUudOPOrbZZyGYPR5FpnbImpIxSIE++Es28YkB2MEswtnVQk
 cAFELt4wL/WBule4ETC2Tu5TAqC9u5PmFREW3PC3cIDw71LHzKnIWTKIWhfeWnBjnwQD
 iOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F+/yqUqHVJeW5Lm620oq51jAT5wn6U0/DOMEfIG0xtE=;
 b=rhXm/rj+81K9DwJwItd+DAa2/LTIBEWOO94a3K3uxENGkFAdoYEvWcPUZW0vnPF+X/
 VuRpJPIjsMiKZd2KCwyH2F3FyBtZCn3i+Qt/NdLba/do+pl+tPwxq7dEV9klXPfzYP+z
 yBm9pY9znGbtCM7RkpRJORQBtvakvL8szgBjhqetfjCtP1yKy8b4BWBXRAeKm2g08bUh
 6AUU1al/R/7ntNslPcQ2PA4HjfflSeNa04VZc6KgYqQl+fgA/jsIxhGEhtwoCBtV1zdv
 imxMJNup5aRL6uX8ubdmxAQ6LevMji+k6LbbOZRC3k1Q6IOthMQvWxPWLjmTXEYFy04d
 fn3w==
X-Gm-Message-State: AOAM530UdjAkmx9sfuxsuVCq4a2Kaqj39zEEPl47LkMxzB8ltjU63Nwt
 DpUKcKGbc6LQl0IlfQOxQfetiKryBugUelFI1RoNHQ==
X-Google-Smtp-Source: ABdhPJxA6pXXgh6PP4g7rw5jHupFA6Z+Ry3fYaEp6OC+KoMTxQUdFigSMZn/rkJ12ex7G6iRRpIYzVrWKi0umUU8TdM=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr14070176ywf.347.1652093240893; Mon, 09
 May 2022 03:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220503140304.855514-1-gshan@redhat.com>
 <74e4fdf6-c8bf-92ad-0c3b-0eb759a1df0c@redhat.com>
In-Reply-To: <74e4fdf6-c8bf-92ad-0c3b-0eb759a1df0c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 May 2022 11:47:09 +0100
Message-ID: <CAFEAcA9XhD88G1hVZCHJKzBEB8eXX7soi3QQWkR=WDksGS4V0Q@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] hw/arm/virt: Fix CPU's default NUMA node ID
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com, 
 imammedo@redhat.com, ani@anisinha.ca, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com, 
 eblake@redhat.com, armbru@redhat.com, thuth@redhat.com, lvivier@redhat.com, 
 pbonzini@redhat.com, berrange@redhat.com, Jonathan.Cameron@huawei.com, 
 drjones@redhat.com, zhenyzha@redhat.com, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Mon, 9 May 2022 at 04:08, Gavin Shan <gshan@redhat.com> wrote:
>
> Hi Peter and maintainers,
>
> On 5/3/22 10:02 PM, Gavin Shan wrote:
> > When the CPU-to-NUMA association isn't provided by user, the default NUMA
> > node ID for the specific CPU is returned from virt_get_default_cpu_node_id().
> > Unfortunately, the default NUMA node ID breaks socket boundary and leads to
> > the broken CPU topology warning message in Linux guest. This series intends
> > to fix the issue by populating full CPU toplogy on arm/virt machine.
> >
> >    PATCH[1/6] Add cluster-id to CPU instance property
> >    PATCH[2/6] Fixes test failure in qtest/numa-test/aarch64_numa_cpu()
> >    PATCH[3/6] Uses SMP configuration to populate CPU topology
> >    PATCH[4/6] Corrects CPU/NUMA association in qtest/numa-test/aarch64_numa_cpu()
> >    PATCH[5/6] Fixes the broken CPU topology by considering the socket boundary
> >               when the default NUMA node ID is given
> >    PATCH[6/6] Uses the populated CPU topology to build PPTT table, instead of
> >               calculate it again
> >
> > Changelog
> > =========
> > v9:
> >     * Fix typo by replacing 'thrad-id' with 'thread-id' in
> >       PATCH[v9 2/6]'s commit log                                 (Igor)
> >     * Added PATCH[v9 4/6] to make CPU-to-NUMA association
> >       real                                                       (Igor)
>
> [...]
>
> > Gavin Shan (6):
> >    qapi/machine.json: Add cluster-id
> >    qtest/numa-test: Specify CPU topology in aarch64_numa_cpu()
> >    hw/arm/virt: Consider SMP configuration in CPU topology
> >    qtest/numa-test: Correct CPU and NUMA association in
> >      aarch64_numa_cpu()
> >    hw/arm/virt: Fix CPU's default NUMA node ID
> >    hw/acpi/aml-build: Use existing CPU topology to build PPTT table
> >
> >   hw/acpi/aml-build.c        | 111 ++++++++++++++++---------------------
> >   hw/arm/virt.c              |  19 ++++++-
> >   hw/core/machine-hmp-cmds.c |   4 ++
> >   hw/core/machine.c          |  16 ++++++
> >   qapi/machine.json          |   6 +-
> >   tests/qtest/numa-test.c    |  19 +++++--
> >   6 files changed, 102 insertions(+), 73 deletions(-)
> >
>
> I think this series is ready to be merged. Could you help to see how it
> can be merged to QEMU 7.1?



Applied to target-arm.next, thanks.

-- PMM

