Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760D846754A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 11:42:28 +0100 (CET)
Received: from localhost ([::1]:42034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt61L-0006Bz-DR
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 05:42:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mt5zi-0005OD-UZ
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 05:40:46 -0500
Received: from [2a00:1450:4864:20::32b] (port=46619
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mt5zh-00067B-5R
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 05:40:46 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso1840379wmr.5
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 02:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r39zueJZ4y6n4WK8rsirZDPWZOocW9EPBCj9/4VXJDI=;
 b=duTzXTXol61n9D4NYm/jL+1f0986iEP9jMfng61GCXySP6GYSGUKBQMDB3g7YjnDj5
 ARb4C7r+DJ5EEcbgzmHaU8woCIw6ZypP8hU/Cos0wagMElrpK4jtEUBGXv40p4BopeE3
 wQ5RcHeYaOIkezX3kW28pZ8xxlO6FGwVcfT/w6hPrMveJD4o4TiXBDo7Xv4UiavXETYj
 5ZL7lmQa4v2ptdAcxsqS+T0Iew/pPdJLKhfiV7K51uVyVOm0le2RmU6iXGRwl+zXol3Q
 I1sme+UAF/qZrkqgEZAi8Tw2ym1qGDaV7AfUf1PnY5qXYqnG7nKS4Lr3+5dzJTKg1UFu
 TQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r39zueJZ4y6n4WK8rsirZDPWZOocW9EPBCj9/4VXJDI=;
 b=0OEdDUQOaysU3H0aibM+poljEKc1BvRFKDbIAsSmggiyV+AB+GVtJEqXIxI/1Ty7rn
 xEawbwgqoYm8bwPY8WhP4HRJZiiGpOKlVgw8kn1lpuff/02BmULwAiDT3/2TkOQUUV54
 UT3g22jVtrYyQobkdE6HcD3t+uJ//yM81GTAX1Vb8jVIv0TK9qhLUoYIrdLdZCL89LhT
 OSi26Sqk/S/96LqEn75v1ZohIX3u44euQy06jBOFsxiUXTxdofKsDV/sAZZFZ52ObYVe
 cwlu3nLn+3IgXiJN0UP1qVKI8WWotsQHWNum6Ow6Q/Rb12ZPQs95RlUkwrsGzN2col0j
 X3HA==
X-Gm-Message-State: AOAM530jDI0kkW+IWDoMMgU2yjleu5L53yhANOdHsJfD1PZ9F99SbHLF
 2/Ro8WR3M2LUpayO9hZJ9SveVQ5X7ZVk05Ig85Fl4A==
X-Google-Smtp-Source: ABdhPJzPPJ4xVSj3spbNgob6zF+wJ9Z/ijMMj+ljBO09M7esebCu4G1p+k6XFJoa6FkF/vP4XQoY50EWlBB71eYjWVg=
X-Received: by 2002:a05:600c:3486:: with SMTP id
 a6mr13846418wmq.32.1638528041762; 
 Fri, 03 Dec 2021 02:40:41 -0800 (PST)
MIME-Version: 1.0
References: <20211202191446.1292125-1-clg@kaod.org>
 <d8119266-e6f1-969c-d440-d511951178f6@redhat.com>
 <8d21273b-0b81-5041-cfc4-704307aa37cc@kaod.org>
 <32012645-274e-9ee9-2d8a-a3d87c4a6bf5@csgroup.eu>
 <599e5aa0-d7a9-b89c-2da9-5e7c909a6064@kaod.org>
 <75b27dfe-cb8f-d40c-c1bd-79415264a87f@redhat.com>
In-Reply-To: <75b27dfe-cb8f-d40c-c1bd-79415264a87f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Dec 2021 10:40:30 +0000
Message-ID: <CAFEAcA9OQ=nFaMXgFi22BSuchP35OUiTwteG_yxFSnLXFHNTbQ@mail.gmail.com>
Subject: Re: [PATCH] hw/ppc/ppc405_boards: Change kernel load address
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 LEROY Christophe <christophe.leroy@csgroup.eu>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Dec 2021 at 10:32, Thomas Huth <thuth@redhat.com> wrote:
> I guess it's an accidential NULL pointer dereference somewhere in the u-boot
> code ... which will be quite hard to track down when the first page of
> memory is marked as writable... :-/

Attach a target-arch gdb to the QEMU gdbstub and put a watchpoint on
address zero ? (Or if you suspect something inside QEMU is doing it
then run QEMU under gdb and watchpoint the host memory location
corresponding to guest address 0, but that's more painful.) Nothing
in the pre-kernel part of the boot process will have set up paging,
so the watchpointing should be pretty reliable.

-- PMM

