Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E381A537A00
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 13:37:32 +0200 (CEST)
Received: from localhost ([::1]:50922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvdiF-0006EP-QP
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 07:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nvdTR-00050m-GP; Mon, 30 May 2022 07:22:15 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:40813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nvdTQ-0000Bj-0P; Mon, 30 May 2022 07:22:13 -0400
Received: by mail-oi1-x22d.google.com with SMTP id t144so13603630oie.7;
 Mon, 30 May 2022 04:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RnLp2RbDipYj6uw2hkWb2uHPdqaJ6r7CneDuTKVN44g=;
 b=FmRXqzRn6cvn+db6NcSajq+GA9krn/FzHGUaDnim4EiPubKpy6bGO/LSpuMh8w0qSH
 Tz5+BIm7M3MUznznQdke9MIGGVyl5KHeMtGkrOJ35I12gCGwq0kpogHQEyfamcYvGWjy
 ggMkOlmAMmDS8Y+Y3NvjB/ke8cxOaDOl29MLgOKMR1LKTK4CW5C4MHI6b1t9Jf18bNed
 i5ldV1zsEjFiJegfsYNSltZfmD3QVHR7oqq7kyvVxd/TOJKNinHvrK153m1i0pfiO8a7
 7UvPzpbi6JTktV2gA6KvrE/umNMGG7Ynbm8FhJ6UVFr1HZ0Qj4MNFNajbrrROxgFe7po
 QsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RnLp2RbDipYj6uw2hkWb2uHPdqaJ6r7CneDuTKVN44g=;
 b=eOomqAG3beOGKCqJJAC/EotSYySAlDuPOibl7fnzJ9t8omTLKXkxLK7f+fw7pLyNqO
 6+6Q/cf2EE67B2OgidJC7Vm1MvFEopyfnScEJNw9rewJrag/VdQUF/KbxjgwneXdUcao
 fibZpBWAUJzYPG0pFzM5jZt88WkXz3x7IReQNQ/BUsjCkKU3y3bsf3jmgofkjxBMgCCE
 QIBGUZOucVIFtOwf1A2Eu9hoy+mmR+qG79qxCO+4QwAYAOxQkikIg19mFcTFFAECjJYR
 KD5vB9nOTL59m/wQrcDBUe1il3W02RNH2DSBWIgTKYWI2KLG+w1McNWGv3/4tBsRKRcb
 +Iog==
X-Gm-Message-State: AOAM531Ii5hj52cwxr51b6dTftidY6lRRdlYbJ3PnJvAdWs4P5YFxEA3
 3Bb29r5kM8gz3zYoSK2EbrHUyM+1MxglqXgBw8Y=
X-Google-Smtp-Source: ABdhPJyBU0JgOgoCeQIZmgeue6WX9VmodNqaVJgqQUDcIIL145nO7BWay/iQp6ufa0giINuhMTg5PUT/Lj3t/ho6tPY=
X-Received: by 2002:a05:6808:3099:b0:32b:30de:d14e with SMTP id
 bl25-20020a056808309900b0032b30ded14emr8933008oib.212.1653909730568; Mon, 30
 May 2022 04:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAAAx-8+ECfznYPcJqPvP=7fzfgQobU1t+kGhGzWvArjm_Xs_yg@mail.gmail.com>
 <DM6PR04MB7081D63D848FC239F92860F4E7DD9@DM6PR04MB7081.namprd04.prod.outlook.com>
In-Reply-To: <DM6PR04MB7081D63D848FC239F92860F4E7DD9@DM6PR04MB7081.namprd04.prod.outlook.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 30 May 2022 12:21:58 +0100
Message-ID: <CAJSP0QXZEq4+Rjyg0xGq5KZm=Wb_p1+o9gYmVKg8GH_Y9Wi0fQ@mail.gmail.com>
Subject: Re: Outreachy project task: Adding QEMU block layer APIs resembling
 Linux ZBD ioctls.
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Cc: Sam Li <faithilikerun@gmail.com>, Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 Hannes Reinecke <hare@suse.de>, qemu-devel <qemu-devel@nongnu.org>, 
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=stefanha@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, 30 May 2022 at 06:38, Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> On 2022/05/30 14:09, Sam Li wrote:
> Once you have an API working and the ability to execute all zone operations from
> a guest, you can then work on adding the more difficult bits: supporting the
> zone append operation will require tracking the write pointer position and state
> of the device sequential zones. For that, the zone information will need the
> zone capacity and write pointer position of all zones. The zone state may not be
> necessary as you can infer the empty and full states from the zone capacity and
> zone write pointer position. States such as explicit/implicit open, closed,
> read-only and offline do not need to be tracked. If an operation cannot be
> executed, the device will fail the io on the host side and you can simply
> propagate that error to the guest.
>
> See the Linux kernel sd_zbc driver and its emulation of zone append operations
> for inspiration: drivers/scsi/sd_zbc.c. Looking at that code (e.g.
> sd_zbc_prepare_zone_append()), you will see that the only thing being tracked is
> the write pointer position of zones (relative to the zone start sector). The
> state is inferred from that value, indicating if the zone can be written (it is
> not full) or not (the zone is full).

It sounds like QEMU BlockDrivers need to maintain state? I haven't
thought this through but the guest probably has some state and the
device below QEMU also has state. Can QEMU just invoke the BLK*ZONE
ioctls on behalf of the guest without maintaining it's own state?

Stefan

