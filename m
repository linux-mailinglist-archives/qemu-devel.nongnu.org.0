Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1846DE3B2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 20:17:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmIXf-0002zK-Om; Tue, 11 Apr 2023 14:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmIXc-0002yn-Vr
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 14:16:29 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmIXa-0004Lw-6g
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 14:16:28 -0400
Received: by mail-ej1-x62f.google.com with SMTP id f26so16528966ejb.1
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 11:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681236983; x=1683828983;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=79X33BfedKu7vFtU3arX0+80qYF7li5/i/6UTVJRwEA=;
 b=vXtC6vVDfv1B3w/5LGMwuTrq1Ziyhesr59q8p9HrFzdhU4EGWOBtRHYb4p2cNpzzZq
 yt12IF2BdhC9QjsPiFUIX8L7XppbH+p/iepu8QMqgXgeA4R87Ha3X6pTHyKhfvjMJfis
 vvJH/dCFggW39gcK7l2T48M9I3RYQaQMHG0gFBc26NEI8OyT701xVso0c738g/cY47fh
 VK1pYwSoTUjuWCD4RskXHtJIVI1AqTP7pC6Eag+uYNoISB6VzVBXPrqQ+5HbkoZIGPTV
 gDPf/20VnpcOKFJXFHEJhnvQUk8eLNbL5IIqIDEepc9B203v5branIf+6K9C16z8wkhT
 D+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681236983; x=1683828983;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=79X33BfedKu7vFtU3arX0+80qYF7li5/i/6UTVJRwEA=;
 b=Jwv0EFZDyEfCTbRRYvn2/jJe0wG6zxLXkW/0j9ZfRt4A6jqoT2fLBOwOotEN7E6pgi
 FizWgdJkjLuoRoyOM4nAwoyaN1dYL+YMAtTswIVUKhFWfEwts7W5Jrbd7jEHgqm8LZjM
 6rasKGwBQBMMO+hokVYlzwAxwsY8kJbvSIlfGA7Lvlgt5ZsXsck8vfWGJnUbKCDdtKfQ
 jCg5yy5teseKPZq0VBA3BDJGtvXbQLDlncF5JqUspS4+u2yLKK6rRJwEae4PZ0jLGFDY
 vN0QoE9NUIp38zUQi33PRQwaorJnSvJUvrAp/sN8jU6WZY9/DOnYy46oCTFnTamXpqQl
 SurA==
X-Gm-Message-State: AAQBX9fSclz4zbuwZQx8bobEgA/znYZTOgYBoFudOInV8g7PHFh6NOhx
 v1y1sToqw5Z+hHT6zDkDgWfOzGNwX2OdthWMQLaPTQ==
X-Google-Smtp-Source: AKy350bbQssApGqgdn4v9QQ6ODR3BbRJSqrfG86Clb4Q8TBGGTcZdu9SfF28wQoGiVRAMZjgztEP9wcxXXVHHEwan1A=
X-Received: by 2002:a17:906:a982:b0:92f:cbfe:1635 with SMTP id
 jr2-20020a170906a98200b0092fcbfe1635mr1858946ejb.6.1681236983559; Tue, 11 Apr
 2023 11:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230306143433.10351-1-its@irrelevant.dk>
 <20230306143433.10351-6-its@irrelevant.dk>
In-Reply-To: <20230306143433.10351-6-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 19:16:12 +0100
Message-ID: <CAFEAcA98nL2w5ac-1FR79u2ai79xUm4f2Ry=-kDuHNaHrrcBMQ@mail.gmail.com>
Subject: Re: [PULL 5/5] hw/nvme: flexible data placement emulation
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>, 
 Jesper Devantier <j.devantier@samsung.com>, Klaus Jensen <k.jensen@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 6 Mar 2023 at 14:34, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Jesper Devantier <j.devantier@samsung.com>
>
> Add emulation of TP4146 ("Flexible Data Placement").
>
> Reviewed-by: Keith Busch <kbusch@kernel.org>
> Signed-off-by: Jesper Devantier <j.devantier@samsung.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Hi; Coverity points out what looks like a memory leak
in this function (CID 1507979):

> +static bool nvme_ns_init_fdp(NvmeNamespace *ns, Error **errp)
> +{
> +    NvmeEnduranceGroup *endgrp = ns->endgrp;
> +    NvmeRuHandle *ruh;
> +    uint8_t lbafi = NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
> +    unsigned int *ruhid, *ruhids;
> +    char *r, *p, *token;
> +    uint16_t *ph;
> +
> +    if (!ns->params.fdp.ruhs) {
> +        ns->fdp.nphs = 1;
> +        ph = ns->fdp.phs = g_new(uint16_t, 1);
> +
> +        ruh = nvme_find_ruh_by_attr(endgrp, NVME_RUHA_CTRL, ph);
> +        if (!ruh) {
> +            ruh = nvme_find_ruh_by_attr(endgrp, NVME_RUHA_UNUSED, ph);
> +            if (!ruh) {
> +                error_setg(errp, "no unused reclaim unit handles left");
> +                return false;
> +            }
> +
> +            ruh->ruha = NVME_RUHA_CTRL;
> +            ruh->lbafi = lbafi;
> +            ruh->ruamw = endgrp->fdp.runs >> ns->lbaf.ds;
> +
> +            for (uint16_t rg = 0; rg < endgrp->fdp.nrg; rg++) {
> +                ruh->rus[rg].ruamw = ruh->ruamw;
> +            }
> +        } else if (ruh->lbafi != lbafi) {
> +            error_setg(errp, "lba format index of controller assigned "
> +                       "reclaim unit handle does not match namespace lba "
> +                       "format index");
> +            return false;
> +        }
> +
> +        return true;
> +    }
> +
> +    ruhid = ruhids = g_new0(unsigned int, endgrp->fdp.nruh);

Here we allocate memory...

> +    r = p = strdup(ns->params.fdp.ruhs);
> +
> +    /* parse the placement handle identifiers */
> +    while ((token = qemu_strsep(&p, ";")) != NULL) {
> +        ns->fdp.nphs += 1;
> +        if (ns->fdp.nphs > NVME_FDP_MAXPIDS ||
> +            ns->fdp.nphs == endgrp->fdp.nruh) {
> +            error_setg(errp, "too many placement handles");
> +            free(r);
> +            return false;
> +        }
> +
> +        if (qemu_strtoui(token, NULL, 0, ruhid++) < 0) {
> +            error_setg(errp, "cannot parse reclaim unit handle identifier");
> +            free(r);
> +            return false;
> +        }

...but in error-exit paths like these we don't free that memory...

> +    }
> +
> +    free(r);
> +
> +    ph = ns->fdp.phs = g_new(uint16_t, ns->fdp.nphs);
> +
> +    ruhid = ruhids;
> +
> +    /* verify the identifiers */
> +    for (unsigned int i = 0; i < ns->fdp.nphs; i++, ruhid++, ph++) {
> +        if (*ruhid >= endgrp->fdp.nruh) {
> +            error_setg(errp, "invalid reclaim unit handle identifier");
> +            return false;
> +        }
> +
> +        ruh = &endgrp->fdp.ruhs[*ruhid];
> +
> +        switch (ruh->ruha) {
> +        case NVME_RUHA_UNUSED:
> +            ruh->ruha = NVME_RUHA_HOST;
> +            ruh->lbafi = lbafi;
> +            ruh->ruamw = endgrp->fdp.runs >> ns->lbaf.ds;
> +
> +            for (uint16_t rg = 0; rg < endgrp->fdp.nrg; rg++) {
> +                ruh->rus[rg].ruamw = ruh->ruamw;
> +            }
> +
> +            break;
> +
> +        case NVME_RUHA_HOST:
> +            if (ruh->lbafi != lbafi) {
> +                error_setg(errp, "lba format index of host assigned"
> +                           "reclaim unit handle does not match namespace "
> +                           "lba format index");
> +                return false;
> +            }
> +
> +            break;
> +
> +        case NVME_RUHA_CTRL:
> +            error_setg(errp, "reclaim unit handle is controller assigned");
> +            return false;
> +
> +        default:
> +            abort();
> +        }
> +
> +        *ph = *ruhid;
> +    }
> +
> +    return true;

...and it doesn't look like we free it in the happy-path either.

> +}

If this is just working memory that isn't needed once the
function exits then using g_autofree is probably neater than
adding a 'free' on every path that returns from the function.

thanks
-- PMM

