Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C173CF9419
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 16:25:17 +0100 (CET)
Received: from localhost ([::1]:36552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUY2e-000750-Rv
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 10:25:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43575)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <beata.michalska@linaro.org>) id 1iUY1d-0006AZ-JQ
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 10:24:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <beata.michalska@linaro.org>) id 1iUY1c-0004vs-Gl
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 10:24:13 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:46643)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <beata.michalska@linaro.org>)
 id 1iUY1c-0004vf-CB
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 10:24:12 -0500
Received: by mail-il1-x141.google.com with SMTP id q1so15177513ile.13
 for <qemu-devel@nongnu.org>; Tue, 12 Nov 2019 07:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L852fntP1IyRhNO1sxkOBPKS3vlD7jlzXsaTQ768b/k=;
 b=eXSchAeqF2gAHho/y9bBBrHsTPEtgnouopt56iHXRI/3Aj9hQTEP0w+GIABHBGjav9
 3QudAdGHXUZDvYaSgvKDMbGlxDyydXMnqEGRKa2b4fnXgj2gc1D3xayD94O5Zunpt+/u
 DIisa5dMepbBnFMhq3BQ8/eC23OgzgF7752hCKE0WScPxAUyR2IP1RuuITFcNfPICfyq
 3XjAGOn9LiBsToE48xjBAUFhI8zpnIZnMhJbObX01zQg93iX47pLabeEQFqOno7dJh5+
 fW/q0TfpKK+favI1nV3mnSKkBy+tm9EjFp8RJJ3mAr8D4mfWZ5355VQVKmW/KBlfCUxE
 Dttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L852fntP1IyRhNO1sxkOBPKS3vlD7jlzXsaTQ768b/k=;
 b=Vnvv7twiv7EzgvQXGvhqEy0Y5r4Q0SwvxrVAthoI6e9KDJGy/rKQvCPUU09wzNWVlm
 czYfrX9EWCuEFfcwgu5PpweWtcxKnSNvTWFaw5Wv/ufeE5FhFfB0BjNdQz/hWmxsJlR1
 8o+gMuS5039qumvHIPB5RliT/IiyHZZtsFjGxOFHmnAug79/jXfqzBr71L/q0DT4xrUd
 eZJ7WluEPNHdM+q1MlpJ/ukwrAQBaC0j5Z/B5Ekska+/knjvrfPaAe6o3VHNoHjRZiDh
 +aiPZ94iTX/H1zddWfz7XVaLPwb0I2r5jBb2yi6r0JnfZ2E6cxijIX9Hp7iLX4UnPR25
 9T9A==
X-Gm-Message-State: APjAAAWf6F1YElhp2I3ngvmsbRpXS94vZjs/uEKcsEpRmkt3rH48uvWp
 Lej8b2Weqf9AbCZBnu1y1BDxTuUf4IbdbLxN7teVyQ==
X-Google-Smtp-Source: APXvYqwM/yVV+zUseQ6b2Ay6caZHRvzsEjdmXRvjoovT196/zioBAx1irbQC8exdjIZl1gIj4I4Bd+ZTbVTeI+wvGdY=
X-Received: by 2002:a92:4010:: with SMTP id n16mr38755787ila.260.1573572251830; 
 Tue, 12 Nov 2019 07:24:11 -0800 (PST)
MIME-Version: 1.0
References: <20191015103900.313928-1-its@irrelevant.dk>
 <20191015103900.313928-20-its@irrelevant.dk>
In-Reply-To: <20191015103900.313928-20-its@irrelevant.dk>
From: Beata Michalska <beata.michalska@linaro.org>
Date: Tue, 12 Nov 2019 15:24:00 +0000
Message-ID: <CADSWDzsWWpv64aVJuUUPgu8+DTH8Cs_sRxMqeF6kUb1AicgBvQ@mail.gmail.com>
Subject: Re: [PATCH v2 19/20] nvme: make lba data size configurable
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::141
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Javier Gonzalez <javier@javigon.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <keith.busch@intel.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Stephen Bates <sbates@raithlin.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Klaus,

On Tue, 15 Oct 2019 at 11:50, Klaus Jensen <its@irrelevant.dk> wrote:
>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme-ns.c | 2 +-
>  hw/block/nvme-ns.h | 4 +++-
>  hw/block/nvme.c    | 1 +
>  3 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
> index aa76bb63ef45..70ff622a5729 100644
> --- a/hw/block/nvme-ns.c
> +++ b/hw/block/nvme-ns.c
> @@ -18,7 +18,7 @@ static int nvme_ns_init(NvmeNamespace *ns)
>  {
>      NvmeIdNs *id_ns = &ns->id_ns;
>
> -    id_ns->lbaf[0].ds = BDRV_SECTOR_BITS;
> +    id_ns->lbaf[0].ds = ns->params.lbads;
>      id_ns->nuse = id_ns->ncap = id_ns->nsze =
>          cpu_to_le64(nvme_ns_nlbas(ns));
>
> diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
> index 64dd054cf6a9..aa1c81d85cde 100644
> --- a/hw/block/nvme-ns.h
> +++ b/hw/block/nvme-ns.h
> @@ -6,10 +6,12 @@
>      OBJECT_CHECK(NvmeNamespace, (obj), TYPE_NVME_NS)
>
>  #define DEFINE_NVME_NS_PROPERTIES(_state, _props) \
> -    DEFINE_PROP_UINT32("nsid", _state, _props.nsid, 0)
> +    DEFINE_PROP_UINT32("nsid", _state, _props.nsid, 0), \
> +    DEFINE_PROP_UINT8("lbads", _state, _props.lbads, 9)
>
Could we actually use BDRV_SECTOR_BITS instead of magic numbers?

BR

Beata


>  typedef struct NvmeNamespaceParams {
>      uint32_t nsid;
> +    uint8_t  lbads;
>  } NvmeNamespaceParams;
>
>  typedef struct NvmeNamespace {
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 67f92bf5a3ac..d0103c16cfe9 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -2602,6 +2602,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>      if (n->namespace.conf.blk) {
>          ns = &n->namespace;
>          ns->params.nsid = 1;
> +        ns->params.lbads = 9;
>
>          if (nvme_ns_setup(n, ns, &local_err)) {
>              error_propagate_prepend(errp, local_err, "nvme_ns_setup: ");
> --
> 2.23.0
>
>

