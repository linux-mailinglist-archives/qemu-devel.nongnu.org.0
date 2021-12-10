Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8378C470188
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 14:25:33 +0100 (CET)
Received: from localhost ([::1]:54066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvfu0-0000pb-4I
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 08:25:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvfsH-0000A8-IO
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 08:23:45 -0500
Received: from [2a00:1450:4864:20::42f] (port=43524
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvfsG-0002bU-0O
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 08:23:45 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v11so14866783wrw.10
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 05:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SvxOE5Xdidm1igIQIMYBy+HZmVrzAg9thWl09O19vQA=;
 b=w1NOghBDTcpFUeAiB6+5l38g1uplJ14gTdcO4vFybtq47e8FymuFNitAafjP01rVmi
 WO7naKCCGR5XM3zFXTzFLlBKPY/xAMc9n+r9mW2374fLrzNqVLouGs9NRAYbgOdPQiGa
 0tFGH7t/Vff7LXK6VkWQH2Kghezs3WFHAmNAiXZMvQUGJp0iqcuI74xfhrBNhnnJaKT3
 rsbkUOAiv7/dUMMdKIY+ShSFn3d4fTviVsFY/8EVTukWSZFoEhCxsuVWyJm4D8mURHpQ
 gFQxwFfKgjs0djonXgVSXAz49iJwnIQ7a73w6m7AueWOtl6rsxDU8VMZJVPBsGaW897e
 Obbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SvxOE5Xdidm1igIQIMYBy+HZmVrzAg9thWl09O19vQA=;
 b=occTW9J04snvbTaXrJue2dCYi+A58qPIuxQKBblnETSsGjHnMP9/ZlIlJvP9qE5vZv
 T5X68Mlo+wfZR7PBCbGe90LYmSjabiUzwb4YNgEGxcRfyAjnwgebIARk5EqewkJK2JRz
 CYl0GR/1Q3CRgW/nzZWcWI0RfrR8PuSiSCd/qHEGVkzC1BV/i0GHLwjOsP48CmP10nQU
 5a6jPbmV/rw8i7SeSig6ciI1ZyxQM9JDXw5fA0ZyTpJpjIE+pY9unBMpwesTtrNbclhs
 ku+k328hpsgbR8GOYguAhi9B8KsohgLbQgVDUaJTO4pvmpnJ+eX+dasoPwsEmZ0MeoiA
 cJNQ==
X-Gm-Message-State: AOAM530jVnCFBfZ6tc8b2UbZEw4OHxC/gb4MDQg9HzVMDmHq+9nmJdxU
 g8UxkumIf6pIHvxq0oMCPb0X2g==
X-Google-Smtp-Source: ABdhPJxF0bjWDerW9sUYP8InnHbfsNtBUCamhmKADpTaUczvNeu+YR8c3rZ6HiYilXpQTBLNlhMzdg==
X-Received: by 2002:adf:cd09:: with SMTP id w9mr13557247wrm.619.1639142621352; 
 Fri, 10 Dec 2021 05:23:41 -0800 (PST)
Received: from xps15-9570.lan (host-92-16-105-103.as13285.net. [92.16.105.103])
 by smtp.gmail.com with ESMTPSA id p13sm11807233wmi.0.2021.12.10.05.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 05:23:40 -0800 (PST)
Date: Fri, 10 Dec 2021 13:23:39 +0000
From: Peter Griffin <peter.griffin@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 5/8] standard-headers: Add virtio_video.h
Message-ID: <20211210132339.GC382594@xps15-9570.lan>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
 <20211209145601.331477-6-peter.griffin@linaro.org>
 <CAFEAcA_P8x90HgxSiqYiT4h6HsBwZsKKfXUWx1_g8sCgikxzZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_P8x90HgxSiqYiT4h6HsBwZsKKfXUWx1_g8sCgikxzZw@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.griffin@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, stratos-dev@op-lists.linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On Fri, 10 Dec 2021, Peter Maydell wrote:

> On Thu, 9 Dec 2021 at 15:03, Peter Griffin <peter.griffin@linaro.org> wrote:
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  include/standard-headers/linux/virtio_video.h | 483 ++++++++++++++++++
> >  1 file changed, 483 insertions(+)
> >  create mode 100644 include/standard-headers/linux/virtio_video.h
> 
> As MST notes, content in include/standard-headers/ is from
> upstream Linux, and it gets into QEMU by:
> 
>  (1) getting it into the Linux kernel tree
>  (2) changing QEMU's scripts/update-linux-headers.sh to know that
>      it wants this new header file
>  (3) running the script to create a patch which updates the headers
>      to match a new enough mainline Linux kernel that has the file
> 
> This is important because files in standard-headers are used
> by QEMU on all host OSes, not just Linux. Things like:
> 
> > +#include <linux/virtio_config.h>
> 
> or
> 
> > +       __le32 version;
> 
> won't compile on BSD. The update-linux-headers.sh script takes
> care of sanitizing this kind of Linuxism when it copies the
> header into the QEMU tree.
> 
> The process also ensures that we don't accidentally bring in
> support for a kernel feature until its userspace ABI is finalized.
>
> Where a new feature is being worked on on both the kernel and the
> QEMU side of things, you can post QEMU RFC patchsets which
> temporarily have ad-hoc header file updates (eg created from
> a kernel tree that has the not-yet-upstream kernel patches), but
> these should be clearly marked as RFCs and we don't take the
> QEMU patches until the kernel side is upstream and the QEMU
> headers can be cleanly generated from a mainline kernel commit.

Thanks for the review and the explanation :) I meant to call out this
header file inclusion in the cover letter as I was not sure of the
process on that.

This series should have been marked RFC then as the kernel side is
not merged yet. The purpose of this series is to hopefully unblock
getting the kernel side merged though, as lack of Qemu support and
a test setup that supported vicodec were both mentioned last time
in the review process.

Thanks,

Peter.





