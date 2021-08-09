Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCED3E43C5
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 12:20:34 +0200 (CEST)
Received: from localhost ([::1]:41898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD2OX-0004H3-AQ
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 06:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD2NY-0003RL-W9
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:19:33 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:40806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD2NX-0007DM-F3
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:19:32 -0400
Received: by mail-ed1-x530.google.com with SMTP id d6so23720473edt.7
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 03:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dTh9nQgqFZlsz4LgfqU0+nVbrOy7rcth/yzaPja3/5o=;
 b=LkQ+RsY5970SsG+Wwu7mFf+XYT0kKiswMX02lbcgD/ZsaQ60VuP9qNnwf4dK7RG3AX
 RSuHjS6lkx6t4W7op7SElvflsra9CwKnNF3kJ7WSXsgmm0IGsX+l2xi9tpI0u78hSrHl
 AAnHEjknxUYz363lAjpV+S/v/dHyNMvcyq9Gr/2bFx88LjVw107y+jFmih9LAz+95DgA
 CKCwjnmRDtcjqOMbb0+tDNybilwNEvjZf1w6eCHOvi8kii3UULQOIXb58ragxxZzNjU/
 A88mNa9aKj445b6EKj1/B0waZmA1bj0f1sV4fDfHZS52rkVliKoO4BK9ItAPrqRtNikh
 MXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dTh9nQgqFZlsz4LgfqU0+nVbrOy7rcth/yzaPja3/5o=;
 b=Wttj6Dfmo3kq0bjLbfMUW7ol50rHLn7AfhduRAS5oOc59py95h6TNBSEJNKSjYtvd2
 MruurOjLFgJDe9bTJLFOOwVnUZfFfIpSzCYUAn9wFy3oS714/f2JJ5OSJQuEXjF69uuM
 7QpikrTaOhHe3z58kfHhdeVIwj4tVjugK62G+9ST4DXlkzRu5Z3Q5+7we/wKz82uTIjP
 qAbKEqSTWfsci+npNr/a7iOoyyNtWdWYX+yowCzwk42Yh9DNB2GjDEYDOpnYVcUvto8H
 8WHBiOUdqRKzK+rP2C93amd0y3Ww9TI5t2dPzCUYJfr6Z5H90do8BUnNLWIg0OrNMJMg
 E6UQ==
X-Gm-Message-State: AOAM533qkcZwp7Etl96xXHKSCnd62skMOrhEAyAW7YGh/FJjRLDzGV6v
 PoM/hTcNWNWEPfLpp6Jqp4CLqIXSUJPUBXa1BWlyZg==
X-Google-Smtp-Source: ABdhPJzrFEYUoydUd6p2ZIx1YHZE8MZj8O2aQp0YW02SAfYZuJSvOKhBgvI67+QUllF6uUbAdBK9+soQvU1f8/9qViM=
X-Received: by 2002:a50:ff03:: with SMTP id a3mr18963560edu.100.1628504369663; 
 Mon, 09 Aug 2021 03:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210629184743.230173-1-its@irrelevant.dk>
 <20210629184743.230173-7-its@irrelevant.dk>
In-Reply-To: <20210629184743.230173-7-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Aug 2021 11:18:45 +0100
Message-ID: <CAFEAcA-Xodpue0bUBbG++-CcRPV-+EJh=qw_23aGPEh3sAk0Ow@mail.gmail.com>
Subject: Re: [PULL 06/23] hw/nvme: namespace parameter for EUI-64
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Jun 2021 at 19:48, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Heinrich Schuchardt <xypron.glpk@gmx.de>
>
> The EUI-64 field is the only identifier for NVMe namespaces in UEFI device
> paths. Add a new namespace property "eui64", that provides the user the
> option to specify the EUI-64.

Hi; Coverity complains about some uses of uninitialized data in this
code (CID 1458835 1459295 1459580). I think the bug was present in
the previous version of this function, but this was the last change
to touch it...

> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 7dea64b72e6a..762bb82e3cac 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -4426,19 +4426,19 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
>      NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
>      uint32_t nsid = le32_to_cpu(c->nsid);
>      uint8_t list[NVME_IDENTIFY_DATA_SIZE] = {};
> -
> -    struct data {
> -        struct {
> -            NvmeIdNsDescr hdr;
> -            uint8_t v[NVME_NIDL_UUID];
> -        } uuid;
> -        struct {
> -            NvmeIdNsDescr hdr;
> -            uint8_t v;
> -        } csi;
> -    };
> -
> -    struct data *ns_descrs = (struct data *)list;
> +    uint8_t *pos = list;
> +    struct {
> +        NvmeIdNsDescr hdr;
> +        uint8_t v[NVME_NIDL_UUID];
> +    } QEMU_PACKED uuid;
> +    struct {
> +        NvmeIdNsDescr hdr;
> +        uint64_t v;
> +    } QEMU_PACKED eui64;
> +    struct {
> +        NvmeIdNsDescr hdr;
> +        uint8_t v;
> +    } QEMU_PACKED csi;

Here we define locals 'uuid', 'eui64', 'csi', without an initializer.

>      trace_pci_nvme_identify_ns_descr_list(nsid);
>
> @@ -4452,17 +4452,29 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
>      }
>
>      /*
> -     * Because the NGUID and EUI64 fields are 0 in the Identify Namespace data
> -     * structure, a Namespace UUID (nidt = 3h) must be reported in the
> -     * Namespace Identification Descriptor. Add the namespace UUID here.
> +     * If the EUI-64 field is 0 and the NGUID field is 0, the namespace must
> +     * provide a valid Namespace UUID in the Namespace Identification Descriptor
> +     * data structure. QEMU does not yet support setting NGUID.
>       */
> -    ns_descrs->uuid.hdr.nidt = NVME_NIDT_UUID;
> -    ns_descrs->uuid.hdr.nidl = NVME_NIDL_UUID;
> -    memcpy(&ns_descrs->uuid.v, ns->params.uuid.data, NVME_NIDL_UUID);
> +    uuid.hdr.nidt = NVME_NIDT_UUID;
> +    uuid.hdr.nidl = NVME_NIDL_UUID;
> +    memcpy(uuid.v, ns->params.uuid.data, NVME_NIDL_UUID);

Here we fill in some fields of uuid, but we don't touch uuid.hdr.rsvd2[],
which remains thus 2 bytes of uninitialized junk from our stack.

> +    memcpy(pos, &uuid, sizeof(uuid));

Here we copy all of uuid to a buffer which we're going to hand
to the guest, so we've just given it two bytes of QEMU stack data
that it shouldn't really be able to look at.

> +    pos += sizeof(uuid);

>
> -    ns_descrs->csi.hdr.nidt = NVME_NIDT_CSI;
> -    ns_descrs->csi.hdr.nidl = NVME_NIDL_CSI;
> -    ns_descrs->csi.v = ns->csi;
> +    if (ns->params.eui64) {
> +        eui64.hdr.nidt = NVME_NIDT_EUI64;
> +        eui64.hdr.nidl = NVME_NIDL_EUI64;
> +        eui64.v = cpu_to_be64(ns->params.eui64);
> +        memcpy(pos, &eui64, sizeof(eui64));
> +        pos += sizeof(eui64);
> +    }
> +
> +    csi.hdr.nidt = NVME_NIDT_CSI;
> +    csi.hdr.nidl = NVME_NIDL_CSI;
> +    csi.v = ns->csi;
> +    memcpy(pos, &csi, sizeof(csi));
> +    pos += sizeof(csi);

We do the same thing for the rsvd2[] bytes in csi.hdr and eui64.hdr.

>      return nvme_c2h(n, list, sizeof(list), req);
>  }

Explicitly zero-initializing uuid, csi, eui64 with "= { }" would
be the most robust fix. If you think it's worth avoiding "zero
init and then overwrite 90% of the fields anyway" then you could
explicitly zero the .hdr.rsvd2 bytes.

thanks
-- PMM

