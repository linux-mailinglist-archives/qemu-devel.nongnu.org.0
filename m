Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA6433CE20
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 07:53:57 +0100 (CET)
Received: from localhost ([::1]:36850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM3aW-0007iu-Eq
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 02:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lM3Zj-0007C4-DX; Tue, 16 Mar 2021 02:53:07 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:45696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lM3Zh-0000K2-Ko; Tue, 16 Mar 2021 02:53:07 -0400
Received: by mail-pg1-x530.google.com with SMTP id p21so21967443pgl.12;
 Mon, 15 Mar 2021 23:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xdrC8QPCsDK9AAPQLNQgCfrs0thMIIxR2jZww3scs+E=;
 b=YjdMzxRO6KBr/glsJyFj/rS1HDvgatAIoiGXWO77G7oTO/S6lrJHIaNOcwOiKRDmNh
 6lCZK4qsQsceYYfc3Da5Ke1ZcGl6A9TrXy4IxbDRIyUxSkQAqjohkuzKmjLyOKHM1pU8
 9WpBaLdoJ7ncYH0VydHiZZKb0smt2ISIxkYRO7Nx7ZkgFe3CQF3otoZzosNN/M9txLop
 t4dwP9cguSWGaozdcEDzOOtLiXvg3t1Srfcpue66hoqPO5YkC7Ec7/OTk+L8+1Se0IPb
 qvxt4CGyxRytGulkgUtov2Jl5TPpNKYyZjO8+lLyxqYeAIFAU+lGpEb8R4+vwop2u3jk
 IKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xdrC8QPCsDK9AAPQLNQgCfrs0thMIIxR2jZww3scs+E=;
 b=PriG4sr6SlfFiS2YvqvrotSwY3Eu8EthN/mFemrw6QEcgIDbvf+bIrYfQbwriWcQ4s
 9LBYtPIceqkm2Gmj2s+1squermkwpskfNtsQSwwXnOLCcdacBUxBI+cmZQh7P4/ynsKN
 nSPK/dqRe6/1qohrmiRIWKXwrZopf+1NfJNi3LRBc8/HnDDHPc3WxUA+JkjOccP4/yxm
 VtbJWpLE7GKFimvPhbTOefTJh0mbDr9ZnL3EN0I3brpR3ikm9dk7aemdymmVVPMMxG4C
 +1mHp7on+0e1EI5lkypowmYjzdEPVx0wr2p+RiigIPs+PLaujkW5ZKwIxydMvrearQ/q
 hD9A==
X-Gm-Message-State: AOAM530+Ft/elW5n3vrpQYuAoX+5Bb/SkJTI10B0af+uGstl8/kDDVgg
 rC/3mKounPy5Q67ikNudV1c=
X-Google-Smtp-Source: ABdhPJxb2iRm3dQNT88ZqzcHNL5lpWT0u7VcyDoEmmuQDx2XU7wf7PQi63TyasXVnyCA2YQ+wFfU+A==
X-Received: by 2002:a65:4c08:: with SMTP id u8mr2560067pgq.203.1615877583854; 
 Mon, 15 Mar 2021 23:53:03 -0700 (PDT)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id k3sm14593466pgq.21.2021.03.15.23.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 23:53:03 -0700 (PDT)
Date: Tue, 16 Mar 2021 15:53:01 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v5 09/13] hw/block/nvme: parameterize nvme_ns_nlbas
Message-ID: <20210316065301.GC23761@localhost.localdomain>
References: <20210310095347.682395-1-its@irrelevant.dk>
 <20210310095347.682395-10-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210310095347.682395-10-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-03-10 10:53:43, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Provide a more flexible nlbas helper.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme-ns.h | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
> index 07e16880801d..34f9474a1cd1 100644
> --- a/hw/block/nvme-ns.h
> +++ b/hw/block/nvme-ns.h
> @@ -136,12 +136,18 @@ static inline bool nvme_ns_ext(NvmeNamespace *ns)
>  }
>  
>  /* calculate the number of LBAs that the namespace can accomodate */
> +static inline uint64_t __nvme_nlbas(size_t size, uint8_t lbads, uint16_t ms)
> +{
> +    if (ms) {
> +        return size / ((1 << lbads) + ms);
> +    }
> +
> +    return size >> lbads;
> +}
> +
>  static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
>  {
> -    if (nvme_msize(ns)) {
> -        return ns->size / (nvme_lsize(ns) + nvme_msize(ns));
> -    }
> -    return ns->size >> nvme_ns_lbads(ns);
> +    return __nvme_nlbas(ns->size, nvme_ns_lbads(ns), nvme_msize(ns));
>  }

Hmm.. I think it looks like __nvme_nlbas does the same with the
nvme_ns_nlbas, but flexible argument attributes.  But I think those
three attributes are all for ns-specific fields which is not that
generic so that I don't think we are going to take the helper from much
more general perspective with __nvme_nlbas.

