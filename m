Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA636AB636
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:06:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ3xY-0001T3-C3; Mon, 06 Mar 2023 01:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pZ3xX-0001SJ-15
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:04:31 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pZ3xU-0001LR-He
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:04:30 -0500
Received: by mail-ed1-x536.google.com with SMTP id j11so14305054edq.4
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 22:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4SFtyOBVKvI12MCJJcTSwtK3iJvl0bWaYPxsg1raFj0=;
 b=j1a6o7CJk8CHNS3AFSLdkCmPk9vn6GylGnT6Mva8zjfpcj0lnGxMTqdAGtHic+1Fb9
 b1wRbUJueN7cvyDxD4eD+Nikini5W2fcts7n/zmD5yJxhDQLg4dlHZ8diixcOIG5n2Cj
 pUafMOBpPCG8njbZOcY20xZUOt0Q2mVkR0xhqINsPGlmDj47joGdfP3KC+vx44+uwtc6
 0fORcOk6WHtpgpzUPDHsD0q5C6xf3NVACg1EeANU/bIjiMXfI9FLkxLTCHKfcuOg5/MJ
 v+GWZlJFTqTrccyvXWucUKyyoCuwnZ3iiHKJwW3LZnwN8e/eWHGL9IMoE78O/rzu72ZN
 39Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4SFtyOBVKvI12MCJJcTSwtK3iJvl0bWaYPxsg1raFj0=;
 b=IqZgvMIOXJbjnppVh6+K6DTJBS79QQ7QuV2rx+MmtbeY8DKCv0awVx6hxGSMLYJ+pZ
 RqyYxHndv/1OIOEY5Vox5Z3Y9uGwt/rhj1xfwbYjofslioyh8wXQ2MmI4eJ3qhvT2AeZ
 p+Vj5HN75FtZPYxWUpdKc/RXh50/D3V2F78Pfk3e4Qs6hl/FRDrkDTYncRPUzvhtvu9g
 oZFKGzFupqbmhiNny1SI1TbgSz0IFxLFxWJLs32JnNdOu3o4aK8zcQQ7EL8Ep2KnWVJQ
 YcrMKf1bwg2fY0aCHMx+ONQeTgoYdjAlaod/8eBW8ZNBR1TlXYeUFOjRlRNxLoQjOAdD
 EtbA==
X-Gm-Message-State: AO0yUKVkPwuNVwelYB7OPApDaV5v0WaR2EUs/6uVVhKqVxt53o9yx8yS
 qnU10pibbcl75tiPyL1qR/WY3gCkCETOeNsvUJo=
X-Google-Smtp-Source: AK7set99rqMnrjrxY7d+SNLgLcDEaUPy9MFUhRoQGeXqq6JuHnhc9ZqytSt7JrpkuWBdM4uUgisf8xJ4tsrM352hyyE=
X-Received: by 2002:a17:906:b48:b0:8b1:3cdf:29cd with SMTP id
 v8-20020a1709060b4800b008b13cdf29cdmr4561399ejg.6.1678082666083; Sun, 05 Mar
 2023 22:04:26 -0800 (PST)
MIME-Version: 1.0
References: <20230220100815.1624266-1-bin.meng@windriver.com>
In-Reply-To: <20230220100815.1624266-1-bin.meng@windriver.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 6 Mar 2023 14:04:14 +0800
Message-ID: <CAEUhbmXSiq9pRfUUSfAUyd_4cZEL=H6hc=J128VOCWOmX5wg9w@mail.gmail.com>
Subject: Re: [PATCH v5 00/16] hw/9pfs: Add 9pfs support for Windows
To: Bin Meng <bin.meng@windriver.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, Feb 20, 2023 at 6:10=E2=80=AFPM Bin Meng <bin.meng@windriver.com> w=
rote:
>
> At present there is no Windows support for 9p file system.
> This series adds initial Windows support for 9p file system.
>
> 'local' file system backend driver is supported on Windows,
> including open, read, write, close, rename, remove, etc.
> All security models are supported. The mapped (mapped-xattr)
> security model is implemented using NTFS Alternate Data Stream
> (ADS) so the 9p export path shall be on an NTFS partition.
>
> 'synth' driver is adapted for Windows too so that we can now
> run qtests on Windows for 9p related regression testing.
>
> Example command line to test:
>   "-fsdev local,path=3Dc:\msys64,security_model=3Dmapped,id=3Dp9 -device =
virtio-9p-pci,fsdev=3Dp9,mount_tag=3Dp9fs"
>
> Changes in v5:
> - rework Windows specific xxxdir() APIs implementation
>
> Bin Meng (2):
>   hw/9pfs: Update helper qemu_stat_rdev()
>   hw/9pfs: Add a helper qemu_stat_blksize()
>
> Guohuai Shi (14):
>   hw/9pfs: Add missing definitions for Windows
>   hw/9pfs: Implement Windows specific utilities functions for 9pfs
>   hw/9pfs: Replace the direct call to xxxdir() APIs with a wrapper
>   hw/9pfs: Implement Windows specific xxxdir() APIs
>   hw/9pfs: Update the local fs driver to support Windows
>   hw/9pfs: Support getting current directory offset for Windows
>   hw/9pfs: Disable unsupported flags and features for Windows
>   hw/9pfs: Update v9fs_set_fd_limit() for Windows
>   hw/9pfs: Add Linux error number definition
>   hw/9pfs: Translate Windows errno to Linux value
>   fsdev: Disable proxy fs driver on Windows
>   hw/9pfs: Update synth fs driver for Windows
>   tests/qtest: virtio-9p-test: Adapt the case for win32
>   meson.build: Turn on virtfs for Windows

Ping?

