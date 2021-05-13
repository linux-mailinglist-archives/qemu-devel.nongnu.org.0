Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D192A37F7F9
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:30:12 +0200 (CEST)
Received: from localhost ([::1]:52228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhATZ-0003WZ-R2
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAR7-0000ji-Hn
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:27:29 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:35488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAR5-00057X-LF
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:27:29 -0400
Received: by mail-ej1-x636.google.com with SMTP id m12so39643377eja.2
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 05:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SBihDQKRXh1j3fmo0CiGTGoOEjvHZV+PVVOzXk0ivTk=;
 b=vTdu5sVWNLb5yUOFqI5SQZwHH+Uln8iNSLgWsZ/XM7O1SuuX7t5cP38tMavH+ALN3d
 WxTfqajtavlulZPqj98kJJrMcmIbmNwg39gR4YkKyMNc9BRH0bDjmTifyc6olL3robql
 r3tFrIgtPX6RF72l5MdAIfGMbiacwA5hUtcUxlzU++D4nl18SxmLwvyLYHPROZh6rNVW
 +t9E8rscOazVtbPErcfuuiZkAX/Z3bd6Pnl+FyN9bRq8m9xQF19KCEsCRvi3A7byrCt4
 houhje+I+TYikSNSax723C3UigIcAKptUHajKZ75Qdnaew38t+sAM0WMJ56QPY9uu4rG
 fTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SBihDQKRXh1j3fmo0CiGTGoOEjvHZV+PVVOzXk0ivTk=;
 b=bSu1wVS/Bk40nvv8fCDpdRYmuEu84cMOKWDfTX+c3+LEqrxYvsxQEeSXtOsHLwP7Cb
 uQ5CThFgAAEh75ORw4Dfa+UeUie/oQSz3jFpbYCnfL6NRiVr+oWbvVVv/XhFCq0ysLkL
 4T/hFgMW16IlELYgoYeMerm0UdRL7ngHyNcHPV1oYCoQAslwyrkNKUh5MesNtm/n3pPA
 nzem91V24t/pxp60LB9x2aEf0nV3xKzM+4mVmfNKcZB50uxeQ4kqvjglcYAbl1F0+T52
 ChNreDqGXRgLnoi9SQRHUtopd7hcCrqlR2gkEk4gxlbaTKcIzstLCKcRbQrQjf/EVhO6
 GdJQ==
X-Gm-Message-State: AOAM533NdwZBl1CYvG3j9lzPdkGHK8+YVlFfIVgCw5GQTM+JIyNivQeB
 vTRfjJ/TcgOG8Kuq0/hspSmhq0+LKnt2ybTpE6uoLQ==
X-Google-Smtp-Source: ABdhPJwmUByAi6O5ecjtZxoSQe7RK3v7m2CgSVwssBxOzO0004O3hJ6sjImH4fppy4k95sXdBKGRe8PZFfWaIT/69Yo=
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr42930064ejb.382.1620908845948; 
 Thu, 13 May 2021 05:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210511150842.207155-1-dgilbert@redhat.com>
In-Reply-To: <20210511150842.207155-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 13:27:14 +0100
Message-ID: <CAFEAcA-caAPn5Lzt=t2u7V5zWkdhbADdSQWd74v+OMOcRqD-ow@mail.gmail.com>
Subject: Re: [PULL 00/17] migration queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: David Hildenbrand <david@redhat.com>, Kunkun Jiang <jiangkunkun@huawei.com>,
 huangy81@chinatelecom.cn, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 May 2021 at 16:08, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit e4f3ede95ce813d5705c65e1c0e1c80c70739ebb:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210505-pull-request' into staging (2021-05-10 19:55:06 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/dagrh/qemu.git tags/pull-migration-20210511a
>
> for you to fetch changes up to 872df23afc70985af5a458e0c4bd2b984559015c:
>
>   tests/migration: introduce multifd into guestperf (2021-05-11 11:26:19 +0100)
>
> ----------------------------------------------------------------
> Migration pull 2021-05-11
>
> The largest change in this set is David's changes for ram block size
> changing; then there's a pile of other cleanups and fixes.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>

Fails to build on the gitlab cross build job:
https://gitlab.com/qemu-project/qemu/-/jobs/1258047823

../migration/ram.c: In function 'host_page_from_ram_block_offset':
../migration/ram.c:3092:12: error: cast to pointer from integer of
different size [-Werror=int-to-pointer-cast]
return (void *)QEMU_ALIGN_DOWN((uintptr_t)block->host + offset,
^

thanks
-- PMM

