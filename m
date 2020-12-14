Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0822D95CD
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 11:08:36 +0100 (CET)
Received: from localhost ([::1]:49266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kokmQ-0005yr-Tv
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 05:08:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kokir-0003ME-IO
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:04:53 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:36053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kokip-0006el-Ar
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:04:53 -0500
Received: by mail-ed1-x543.google.com with SMTP id b2so16559518edm.3
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 02:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Li2HSN66hSyu4Doe/Q1O1TOpSAtzuZ3XL/pXsxFrco=;
 b=ajFHqMnQd9XNYf9zUE9+u9GBF+K27DtypV9hE45bMjwd63I4voNydnNT7OMGcKOoX0
 p7V/P5b+Nj9EeCNgQ3ojbFb7E2KN3ILBV8Koir5pTg+vQY+vz9heX888hkjiYnSELY+V
 e37e/B1aZ34UaagQt8M/1u5nlkzO9mLNfjyMaxkrkVvrlF9kTXyB8X9NITuYKI0aUCE+
 DZIpoT+8YVe7AwMGBoM6FPJ+GVSDJjdjaUC/3OTz84YeVMfFMJyUDjMahxaboOEB96sn
 BDwLcWNWTBfiO9O+OXQAZfTVtUaH2ql67j0TRQ970OyUAtedHHjasbArzsswSILqj8gF
 /ztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Li2HSN66hSyu4Doe/Q1O1TOpSAtzuZ3XL/pXsxFrco=;
 b=NsuXcA0tew5Zn9H5onc/g2aJqktiFhWZsRPVxkFjbM/acPd9KUQq0G9MEjBYxTYAmg
 xCsc4JfZRF9UzG98TSH2agn4lFMP55Uk6GHQx0tCcwetIv1mHUBwfY09D9nmTpjL/3vy
 cKi0ppoGDIyfu15XgBXOnhunaxKE8fKIum7axFoJg64apqkrH8rVz/M3L5UPPfP07/bP
 AW0NDYG+tp+tPdTMpso+SLkhe127E3xHrps7HK/ykBXUo27TrJWZtsmgAb5zVlSwnFCY
 JuihLajmkm/jezM3n2iYL1Mj4ZcYEW7Ck5KBY5ZhR9EgSg7/j+xN1uwd5tHWOYJX4vhV
 FJwA==
X-Gm-Message-State: AOAM530/uhwWgNaNgUrUxVtXJJZStuztZXDj7G9qDVPI+yoVgfRkSGSo
 pMzOZw3PO6P4iNbMCGhjrOtZvHWJ7JYnjM5hQqQFIg==
X-Google-Smtp-Source: ABdhPJwdlM76+hYdxARQPoB/yckg4bXD8OmWCF60HUnP4xi6zuVfdJvPAc5w3sbPc41ZAYwV4lt25mbqsbm5CKxhs0A=
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr23701258edw.44.1607940288062; 
 Mon, 14 Dec 2020 02:04:48 -0800 (PST)
MIME-Version: 1.0
References: <20201212001537.24520-1-peter.maydell@linaro.org>
 <20201214060026.GF4717@yekko.fritz.box>
In-Reply-To: <20201214060026.GF4717@yekko.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 10:04:37 +0000
Message-ID: <CAFEAcA9armCefNxDn_nCw0k-wsXVtvRmYgZhFQxgcVVXu5-7UQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] hw/ppc: Convert UIC device to QOM
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Dec 2020 at 09:01, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Sat, Dec 12, 2020 at 12:15:29AM +0000, Peter Maydell wrote:
> > This patchseries converts the PPC UIC "Universal Interrupt
> > Controller" to a QOM device.  My main reason for doing it is that
> > this fixes a couple of long-standing trivial Coverity issues -- the
> > current ppcuic_init() function allocates an array of qemu_irqs which
> > the callers then leak.  (The leak is trivial because it happens once
> > when QEMU starts.)
> 1..4 applied to my tree.  Looks like there are some comments needing
> review on 5, so I'll leave the rest for another spin.

Thanks. You could take 6 as well if you like (it's the "delete dead
code" one). I'll try to get a respin out this week, but otherwise
it can wait for January.

-- PMM

