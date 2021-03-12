Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA36F338E83
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 14:15:38 +0100 (CET)
Received: from localhost ([::1]:57630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKhdf-0001Fd-OB
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 08:15:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKhb9-0008IK-E9
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:12:59 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:39784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKhb6-0003yz-BD
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:12:59 -0500
Received: by mail-ed1-x52b.google.com with SMTP id bf3so7871902edb.6
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jNMdsRh9OZ1j1JWhbi6sVjs2GbZtsfoTLPIo0juJRjs=;
 b=w2xZvzIm0nAiOgMa4KH3QtJ+xvdvJ+GP2BDtmTBFjT6vI6d64F96jii8jz3Gl3KQlB
 fqLWFgATcMXYgkIbu07UEBrb+60wHarB8bwXP0jUOu17873BsFAs8tbTB8HlwNWq2kJv
 pzXfcoQc9zoQL8wnKFDgkVpcujy2MQbex8KfMF/8trkDLf2LiCGnSozABq9dbm7AKAP0
 UjGli4SgP1N3N6Gk3MwvTTqSXJ84XihI72is5Oswq5PLVh4G5KApHTUKWkqTe1n1UqTA
 3NYk2T3XovyK7gaUwdvGZUNbQmPPnOTx2FV1MWDq38u2GxlV9PWHPq9cUOGFJvLvDbeL
 oaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jNMdsRh9OZ1j1JWhbi6sVjs2GbZtsfoTLPIo0juJRjs=;
 b=bcpr92kL2VeFOETm//ZJ2jHB9VVJHXNhhJcHC8a+Rq8r3GjxsYKqvOFt2woIp7HdaS
 t9nUgWc2yreNjf7rexfOT6OPWlExHl+O/yxClJtTZ5BGOM6CyqrM9IK+KdoZwSz59M75
 wnlst41tg5CMmo8P+AoPC+KXCdN7TfOemlEsEYJsjh219QZPU4rhHOx3nes+/BXf7roL
 i11hmzcx15tnnDFwwvktOGexryvBtbuWLGyh9YKoUC5iivRQGOs2DtZ3lu6GKJACv5nk
 +ZXI30y8k7gLmXS5VzGiptjCKXnfhwAbSaNCuXRUb9JuBBrtArS64tGehuDA7CnfFYu+
 uCZg==
X-Gm-Message-State: AOAM533aEIUoEIZIDjW5EhhLqsIdB6QHDgz51zmUIYnhKkz/PfQn5ybT
 6gbfojr9z7qEPLFCOrrxV82Chra4i27fyD4OSp5TJmQPlP1bDXhb
X-Google-Smtp-Source: ABdhPJx1QS/ECNJkYx3/+JmNjarIXVsdvwXbPJ10/P+W4Wz5ynkIK/OMANI9Z7Pg517mXkPPv7xQfRSoR9PRcpd8/jM=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr13979847edt.36.1615554774513; 
 Fri, 12 Mar 2021 05:12:54 -0800 (PST)
MIME-Version: 1.0
References: <20210309114512.536489-1-its@irrelevant.dk>
 <20210309114512.536489-37-its@irrelevant.dk>
In-Reply-To: <20210309114512.536489-37-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 13:12:35 +0000
Message-ID: <CAFEAcA8TiJQJaamiVZbzbnxtzmfYTkVd3HEJUU6mrd8dyWnSug@mail.gmail.com>
Subject: Re: [PULL v2 36/38] hw/block/nvme: support namespace attachment
 command
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 11:46, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Minwoo Im <minwoo.im.dev@gmail.com>
>
> This patch supports Namespace Attachment command for the pre-defined
> nvme-ns device nodes.  Of course, attach/detach namespace should only be
> supported in case 'subsys' is given.  This is because if we detach a
> namespace from a controller, somebody needs to manage the detached, but
> allocated namespace in the NVMe subsystem.
>
> As command effect for the namespace attachment command is registered,
> the host will be notified that namespace inventory is changed so that
> host will rescan the namespace inventory after this command.  For
> example, kernel driver manages this command effect via passthru IOCTL.

> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index 85a7b5a14f4e..1287bc2cd17a 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -235,6 +235,11 @@ static inline void nvme_ns_attach(NvmeCtrl *n, NvmeNamespace *ns)
>      n->namespaces[nvme_nsid(ns) - 1] = ns;
>  }
>
> +static inline void nvme_ns_detach(NvmeCtrl *n, NvmeNamespace *ns)
> +{
> +    n->namespaces[nvme_nsid(ns) - 1] = NULL;
> +}

Hi; Coverity complains about a possible array overflow both here
in nvme_ns_detach() (CID 1450757) and in nvme_ns_attach() (CID 1450758):
nvme_nsid() can return -1, but this code does not check for that.

If these functions both assume that their ns argument is non-NULL,
then adding an "assert(ns)" would probably placate Coverity and also
would mean that any bugs elsewhere resulting in accidentally passing
a NULL pointer would result in a clean assertion failure rather than
memory corruption. (Or you could directly assert that the array index
is in-bounds, I guess.)

thanks
-- PMM

