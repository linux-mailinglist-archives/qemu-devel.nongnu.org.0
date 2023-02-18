Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5907169B886
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Feb 2023 08:39:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTHmX-0005EJ-Fp; Sat, 18 Feb 2023 02:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1pTHm6-0005C3-4y
 for qemu-devel@nongnu.org; Sat, 18 Feb 2023 02:36:58 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1pTHm4-00085Y-Io
 for qemu-devel@nongnu.org; Sat, 18 Feb 2023 02:36:49 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5368251e971so1847b3.0
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 23:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J19WVz8skiNW0PWsoNlhr3RdhnZntmFshT+dAy5d0SU=;
 b=S6+dhMQc7JPjGiwYDqwKR1VwxLkrcKnO5yHOKF/y3eDxVBmWQxZ3iSWt/DkV6rnubJ
 jjKw2ietv37UJUZyx5wrAIYcW3hAjgCfSBrv4aYQaxRIwizeJnaTfbP7f0IFxM6gle0v
 t7nC4/cM78Ly51Mxkz0uGzvp45b66TvusBhwgS/7r0vu3Olxm8YLd3iYWpZ6AliLVl/W
 4+ITY+dds+3AmCg8371g4ZHzepBU/nwQM28qgJBT0/OpjyOpqJrCUHMYHEkJvGE76g2Q
 tz+am60tdZzIDGCKdda5ZCYPpQnYiiFnBWiSCJiB82rDvlLVCU799SGLvcKojzVeAVCR
 l+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J19WVz8skiNW0PWsoNlhr3RdhnZntmFshT+dAy5d0SU=;
 b=cC6SErqbNXjYaZBEf+2htBa+kJcqDw84XkEW9hIYEr+C9yT7gfHMQZm0sd2NL7BTvY
 aQt6DzlykHQbCnQRGMier1u+jC53HYex309V9hQPyr6LYROWsbm0J6J33Z9g9zXjxU8U
 zCEMMdy0m/BG6r7w1ASUfppVkuUj7mBJoiX1ap7CWIAVbq9sxjgKZ68/3TPqcuPmzPvA
 OpKpVrcKYjBwFVUB4mLeetNLTlZGvBx8VDeuOKTNTLLG9t7PSbIpyvzVy2bzCxbirQfY
 DbRokbRCid6+v/xthJfpz1Flal8NJURHwQrg95s4PgAfM04oWZOe+LPEVz0voauXlb+V
 HneQ==
X-Gm-Message-State: AO0yUKUqxDIdx6cRS0E2TqKCY7eN1KIQdMTtoS+xTsKYut8gDa7Fk7iA
 Vjcqc4+FctM8qP9yqr9hPRuQmtNpADUhTHtQGMc=
X-Google-Smtp-Source: AK7set+k6L6kWB7nutwd3ZS2pnxSKJephG1DX/jOoKglc1zPenJJQsgm9gqZINez9f5F/b+V3xn3n2SicWo6u2l42Ng=
X-Received: by 2002:a0d:e4c3:0:b0:51b:1e55:db75 with SMTP id
 n186-20020a0de4c3000000b0051b1e55db75mr1247363ywe.463.1676705806960; Fri, 17
 Feb 2023 23:36:46 -0800 (PST)
MIME-Version: 1.0
References: <20230131063013.65588-1-wlfightup@gmail.com>
In-Reply-To: <20230131063013.65588-1-wlfightup@gmail.com>
From: Paul Schlacter <wlfightup@gmail.com>
Date: Sat, 18 Feb 2023 15:36:34 +0800
Message-ID: <CADak6y4gbKih4JcOh=Ed=840_Mov3OTYaokiqF9wLvTiVmti+Q@mail.gmail.com>
Subject: Re: [PATCH] xio3130_downstream: Add ACS (Access Control Services)
 capability
To: mst@redhat.com, marcel.apfelbaum@gmail.com
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=wlfightup@gmail.com; helo=mail-yw1-x1130.google.com
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

ping

On Tue, Jan 31, 2023 at 2:30 PM wlfightup <wlfightup@gmail.com> wrote:
>
> When vfio-pci devices are attached to the downstream, pcie acs
> capability may be needed, Consistent with physical machine.
>
> It has been tested in our environment, and pcie acs capability
> is required in some scenarios.
>
> Claim ACS support in the downstream port to allow
> passthrough of individual functions of a device to different
> guests (in a nested virt.setting) with VFIO.
> Without this patch, all functions of a device, such as all VFs of
> an SR/IOV device, will end up in the same IOMMU group.
> A similar situation occurs on Windows with Hyper-V.
>
> Signed-off-by: wlfightup <wlfightup@gmail.com>
> ---
>  hw/pci-bridge/xio3130_downstream.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c
> index 38a2361fa2..2017cf42a3 100644
> --- a/hw/pci-bridge/xio3130_downstream.c
> +++ b/hw/pci-bridge/xio3130_downstream.c
> @@ -40,6 +40,8 @@
>  #define XIO3130_SSVID_SSID              0
>  #define XIO3130_EXP_OFFSET              0x90
>  #define XIO3130_AER_OFFSET              0x100
> +#define XIO3130_ACS_OFFSET \
> +        (XIO3130_AER_OFFSET + PCI_ERR_SIZEOF)
>
>  static void xio3130_downstream_write_config(PCIDevice *d, uint32_t address,
>                                           uint32_t val, int len)
> @@ -111,6 +113,10 @@ static void xio3130_downstream_realize(PCIDevice *d, Error **errp)
>          goto err;
>      }
>
> +    if (!s->disable_acs) {
> +        pcie_acs_init(d, XIO3130_ACS_OFFSET);
> +    }
> +
>      return;
>
>  err:
> @@ -137,6 +143,7 @@ static void xio3130_downstream_exitfn(PCIDevice *d)
>  static Property xio3130_downstream_props[] = {
>      DEFINE_PROP_BIT(COMPAT_PROP_PCP, PCIDevice, cap_present,
>                      QEMU_PCIE_SLTCAP_PCP_BITNR, true),
> +    DEFINE_PROP_BOOL("x-disable-acs", PCIESlot, disable_acs, true),
>      DEFINE_PROP_END_OF_LIST()
>  };
>
> --
> 2.24.3 (Apple Git-128)
>

