Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505A14DC999
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:09:04 +0100 (CET)
Received: from localhost ([::1]:48734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUrkN-0007sE-25
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:09:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUrgY-0005zK-9W
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:05:08 -0400
Received: from [2607:f8b0:4864:20::b35] (port=42849
 helo=mail-yb1-xb35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUrgW-0006v4-KI
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:05:05 -0400
Received: by mail-yb1-xb35.google.com with SMTP id u103so10706123ybi.9
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GFpp7o+3iMoXTeLG7p7hD7mTmTDgrAMeCFPtptDEjxM=;
 b=aS/788OeWLQpJg2iumLa4RiZdV60i4v1VSe1mABWafN7r7pMUjQBfE+vYShNi8TkgE
 ZWG6wplw+7EBHd5ul9mMVvg3QFdZEqWNtD5HxWOghxt9MwYkMYs58UBcu6v5nnRyRat9
 kaZPabjec5uaIQ0oWz7WZaq2o8O5BQW092n9BDC/85u4Ghitf6XHKlRAHZYsKxlbYBlE
 o9McRhgJbzyzd71+SwdG2/7eT0LrXfeoUIwtSLyQp90pL5uyzx8QqJKbgs54JiUnoIdF
 a6u0YKUV98llzbsaalJa2I4QJ+zjw2cxWgFSuhQ60oiyxtDlTqUOLz6CRE+89Ea2/MRS
 u97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GFpp7o+3iMoXTeLG7p7hD7mTmTDgrAMeCFPtptDEjxM=;
 b=y4sppxp+mSEyVSeUn82rYaVHWZCtCy04Ex4vPN2oV2NipsYnjaowOHFtSXC1IFjxOb
 wZRg65UH5mm1miGFtzkArs6wkJl2cQwqnnzANLVKpa0TW84ROyv8AqqpHw8I7zpA/kfC
 6fIz8Y26yZS4QxHFMavASUqJfsxc4jw/mpuS1+FbjjFj1bVl6qhAFbbDI/u6SLCt8Z4k
 0jZoJBQi4xGRlZo6bNs93bcHyJq1FHB5VDSaCaNYcjBSxBSPB+G2fJBSwUsoX/15wjq5
 hGmw53/dHfoPJiBrCPlTb+ffvn5WnYxLYnQ+M/xuwExRAGY7Ec54+YXdvry+FPzzf7gO
 b6pQ==
X-Gm-Message-State: AOAM532O+7LNnB0iNZRjpEA//vNruesX/cg7vdAo7UqLOFQPa4/6OIjo
 6bBP88edbln0qN6Ygle67Ttv+dsvfF4oeOJtReOrEw==
X-Google-Smtp-Source: ABdhPJxBsOxJ/XNnzXWGVzg0xz4ZgAU2ZDXQq4XV61HNCVNyEKv7c0rHgIraIbaWq+Qj9YiSBWXD+ieXpTa4QgbsFqQ=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr556714ybq.67.1647529503539; Thu, 17 Mar
 2022 08:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <38c43d66-e57c-e0fe-d35f-c411d40d6611@gmail.com>
In-Reply-To: <38c43d66-e57c-e0fe-d35f-c411d40d6611@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 15:04:51 +0000
Message-ID: <CAFEAcA8eZ0G=ZxyCv7xCk-ZE7R_t6BnDtbGCsYgSBuLwyHprsQ@mail.gmail.com>
Subject: Re: Question about vmstate_register(), dc->vmsd and instance_id
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 at 14:03, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
> I've been looking into converting some vmstate_register() calls to use dc->vmsd,
> using as a base the docs in docs/devel/migration.rst. This doc mentions that we
> can either register the vmsd by using vmstate_register() or we can use dc->vmsd
> for qdev-based devices.
>
> When trying to convert this vmstate() call for the qdev alternative (hw/ppc/spapr_drc.c,
> drc_realize()) I found this:
>
>      vmstate_register(VMSTATE_IF(drc), spapr_drc_index(drc), &vmstate_spapr_drc,
>                       drc);
>
> spapr_drc_index() is an unique identifier for these DRC devices and it's being used
> as instance_id. It is not clear to me how we can keep using this same instance_id when
> using the dc->vmsd alternative. By looking a bit into migration files I understood
> that if dc->vmsd is being used the instance_id is always autogenerated. Is that correct?

Not entirely. It is the intended common setup, but because changing
the ID value breaks migration compatibility there is a mechanism
for saying "my device is special and needs to set the instance ID
to something else" -- qdev_set_legacy_instance_id().

> Given that this is a 13 year old comment from Anthony Liguori I wanted to confirm its
> validity. Is there a long term goal of getting rid of instance_id? Can I ignore its
> role when converting these calls to dc->vmsd?

Only if you're prepared to break migration compatibility, I think.

-- PMM

