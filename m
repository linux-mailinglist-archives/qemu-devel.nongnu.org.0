Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A5257A113
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 16:17:53 +0200 (CEST)
Received: from localhost ([::1]:35922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDo2q-0008HW-80
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 10:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDnvX-00071o-Df
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:10:19 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:42898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDnvP-00060y-Gl
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:10:19 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2ef5380669cso141997417b3.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i1VMsH/7Bfv/2P6qsBcb4GU0I41Mpe782bEKxm6sL7o=;
 b=tyVpLIKLZLb97K0bIwmBS3a6Ga6orVSbikhf9nw6nuR1YMdmElYmOg2RDlVVVIGa6g
 LNvDpoXUHndK7Pxf1ZZlSDa52HOYx65re1ZlyrZQLRnN6AAXLtPWf0ELyCGf/FSa6Hlx
 +hRysGgjXA4oBEJpFXjmF1nV6aVwD07zc66IFyrrRC60xJN0OXbu6+5PdN+vhQIUw+52
 ID4kSR6ESpe38YaqmeT+wZkbo3snSYg6uJdEUPP/uNm2pV/u0g7wZ2+pKilOqV8PHTGM
 719iOirvMg/O2DMAxXX6ZjXTRO97J2qrMLgZvRDFRmJeGl5d09157m145Pb9OVdDddZS
 XWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i1VMsH/7Bfv/2P6qsBcb4GU0I41Mpe782bEKxm6sL7o=;
 b=bbEALgMNhkHLnzCQi8bxaSiux1EE+awFacR3u/I+3TO0EaAEt0X7nJt7t4IIA8aavM
 X7yXy9lROGRvLUPTscjwwxjQfHQDbhkafYQtptw0/qNu5ZxkYUQL67Wk9zadpNixl7wy
 1bLBUzVeA7e/jepULmxV5BD/p8NZn0ON0gnYwJYssnMWU8bhlbMYZUWG+cg/pLW8JZjr
 vvz5bwInGGOD5rves4gJCap2tYzvkIHfPCHu5Bm81/EdcRLYuM/5GyGFG+BJfUGT7Z2z
 cY/dDHfWppZ2Lbr9cGMgVRAGzVD5Xc2kmh8feygL8ZbQKLaNMKvucg5qV7KnMOpRKmGI
 YdWA==
X-Gm-Message-State: AJIora8IbQblzlYPVdvVKpsVIErwr4D2TrH8lebd9vH0o5IVz8DavWpi
 P7JMkpPkQbOzM9fBEkGEIvP54lu1NZDwFoaSL13QEA==
X-Google-Smtp-Source: AGRyM1uL72PIqXk7/gIoV3s33rCTjUki1uf6Qigup6U04JqAvkEVWnM5z8YB6j7KdXjD9pyY/Qe9FavPQODGcVSvxEo=
X-Received: by 2002:a81:a247:0:b0:31d:72da:e931 with SMTP id
 z7-20020a81a247000000b0031d72dae931mr36370117ywg.469.1658239810345; Tue, 19
 Jul 2022 07:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220701132300.2264-1-Jonathan.Cameron@huawei.com>
In-Reply-To: <20220701132300.2264-1-Jonathan.Cameron@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jul 2022 15:09:59 +0100
Message-ID: <CAFEAcA-ju7SdX-RS-g3Hjq17YUQt_ncxj8qxV-st+Zn8pLFP6g@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/cxl, hw/machine,
 hw/i386: Misc minor fixes / cleanup
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linuxarm@huawei.com, qemu-devel@nongnu.org, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Ben Widawsky <bwidawsk@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 1 Jul 2022 at 14:22, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> Three more or less less unrelated fixes for recently added CXL code.
>
> Jonathan Cameron (3):
>   hw/machine: Clear out left over CXL related pointer from move of state
>     handling to machines.
>   hw/i386/pc: Always place CXL Memory Regions after device_memory
>   hw/cxl: Fix size of constant in interleave granularity function.

Hi -- did this patch series get lost somewhere? I was going
through old Coverity issues, and noticed the fix in patch 3
is still not upstream.

thanks
-- PMM

