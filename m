Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A303593154
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 17:11:09 +0200 (CEST)
Received: from localhost ([::1]:38512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNbkC-0001i1-IU
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 11:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNbh2-0008AJ-Of
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 11:07:55 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:33486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNbh1-0002ux-9r
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 11:07:52 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-32a09b909f6so79803267b3.0
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 08:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=xk3D0qnFEv6Js9SIYN+NeNUNen8iIiMti5KqnenDtCI=;
 b=ZH6i/Urv/InUOrTukcha3fE+bZS6aGdaVCDDgASyKAGXLUOVK7zkPfMTgD+q1XiYKe
 XpceXTzpGn6Oea5qDcf5Ku1txwNGqT7OQ0Zf4YN5VjDGBEss5z6tqHyWiU3rkow5pML1
 h9jrAC2reqibXLrKNZYLy6DyZqSjrtT5v/+ruaQVyLhJcnQKQtaPk8N8bkDBA86gD+tW
 hgH95iVJI0KZaudcu0+/KZDaZvLv+NmDN85pFcZMRIriggIhe07Dy+Yq3dFK1Xt4U827
 R8ixwyUW4xU/DkofqSF+jWfGZZjyunonJ8gAoByp4uh5rEU3k3kJ2DVzyN8qu8IrLOqP
 XMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=xk3D0qnFEv6Js9SIYN+NeNUNen8iIiMti5KqnenDtCI=;
 b=M/KkRfaoGqmVn35dR3lozFAJkpQFnRzzGHwXY8EG8h/yVRM2Dbk/Vx7I57OPDDik+8
 xJRyN5mwxlIFHHNR9YpU9RDKJBR2va83fOxiAkMUh7dmrd+zFShYcqDkJuq37sZH+PaP
 /uoiNQdmF1BwSzIkinYQATGb0gsFeFBxan5sOPzgsITFhULC6Ia2neECYrHkGrZiz6Ck
 lO5MumZN9LnSRPGol+3Dwxpd+bLfF354rs69s9ERL/j+58/H/rANXonNMV+6BeO7pSR+
 trtjZn01+s6tWTuUmjx1YCalxJj5hiZzY4KymU5l10Bre14BfosGy+pHGWZbgwVy4vVp
 ugnA==
X-Gm-Message-State: ACgBeo3Aw9pL67S/U63jVdEaSJrwd9xdKjsoofum0COU6RmTjta8poar
 MDSfVtSYGvJ96nSRpwHk7g2iwG9S4b++s6XallBNyQ==
X-Google-Smtp-Source: AA6agR4L9eBhYf/u6xcB6hHHOL1HXUayoG7nN0as29bQs6+piWi4PvaXa5/6/kh0erO8HDYmskZS0QDSiqEPNGAF690=
X-Received: by 2002:a25:d4a:0:b0:671:6d11:d14e with SMTP id
 71-20020a250d4a000000b006716d11d14emr12595202ybn.479.1660576070236; Mon, 15
 Aug 2022 08:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAGr_yG0UrfJAMWta3EkR1F0JZ4j--sig74p6vKL3K6TZDx9YGA@mail.gmail.com>
 <20220808133727.00001171@huawei.com>
 <CAGr_yG36GSO8esyO9nn6OeOEN5zPSosEmBHbfYGwqNGiYOh9vw@mail.gmail.com>
 <20220809170825.00001b61@huawei.com> <20220811180857.00005e67@huawei.com>
 <20220812164403.00001654@huawei.com>
 <62f679b67828f_992102942@dwillia2-xfh.jf.intel.com.notmuch>
 <20220812171509.00006034@huawei.com> <20220815151809.0000294c@huawei.com>
 <20220815155516.00007ebf@huawei.com>
In-Reply-To: <20220815155516.00007ebf@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Aug 2022 16:07:09 +0100
Message-ID: <CAFEAcA-W-xnm_H_qo_YJXY0Ve75DCMH8WQkZh_AWU1RF3JQcwA@mail.gmail.com>
Subject: Re: [BUG] cxl can not create region
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Jonathan Cameron via <qemu-devel@nongnu.org>,
 Dan Williams <dan.j.williams@intel.com>, 
 Bobo WL <lmw.bobo@gmail.com>, linux-cxl@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Mon, 15 Aug 2022 at 15:55, Jonathan Cameron via <qemu-arm@nongnu.org> wrote:
> In the interests of defensive / correct handling from QEMU I took a
> look into why it was crashing.  Turns out that providing a NULL write callback for
> the memory device region (that the above overlarge write was spilling into) isn't
> a safe thing to do.  Needs a stub. Oops.

Yeah. We've talked before about adding an assert so that that kind of
"missing function" bug is caught at device creation rather than only
if the guest tries to access the device, but we never quite got around
to it...

-- PMM

