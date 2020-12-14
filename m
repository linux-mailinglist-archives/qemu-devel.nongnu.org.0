Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C0A2D96BE
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 12:00:03 +0100 (CET)
Received: from localhost ([::1]:36654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kolaE-0004fc-Rl
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 06:00:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kolYs-0003tg-HI
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:58:39 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:40978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kolYq-0005hG-Hh
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:58:38 -0500
Received: by mail-ej1-x644.google.com with SMTP id ce23so21940345ejb.8
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 02:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h2NVZY8ERld3zt7DAwYGzfl17HhHEIXzy+6ChXXipDU=;
 b=TzLlGd924D6v8BQaUM7294pP4U0EfAVYJ+CPXwE2M+W4xmCSsUzfyY/bouru0fZTzB
 2hsWgQ7UNeiVcwxyWRU3CoOZCzbosx2yrRTh0m/IJC25Ig7qBvB5vaJkAyRkC5/5XpTA
 rSEAfUBdeCkYDwdqFeAiLAf5roWS4Btw3qu++2f3qyylnEsHx/tHdMUoHQaeI1CZ2WPx
 LoR7W//nvjCsjsZslaumgjfHYmZ5+7W4QEJ1HZ7sLkTO027eOYrbykCx7mcI1bOKDDER
 AhIPzJ4FkQoYFbKP8nrjOye/N2WZfVe1cG7ztm47fh7stEM97jOvttWsmu6/6HmHTiw2
 P/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h2NVZY8ERld3zt7DAwYGzfl17HhHEIXzy+6ChXXipDU=;
 b=WmmUB7Dlfr47LZC7Ka6iZq74eoRBnNIC4rDLVnXR4tH/9tmspgoiT6TMix5flylMz4
 MQWW/1CIQ53QQ7iZ2VUFJkm770B7V+0UTsKSzzoZEXsV4QzzPQJ9ex7masn+umcJUGhW
 CvCy0S0YyC0fdRb3W9Na11eOxbxgCh5nDlseMJAkfzpbqiRBEPzgKXFuNhsiRbMlEtAQ
 GuqYNduy+5LCJ+pQJdsP3FdsNl88vlkNotw9R12FP/XncsrmoxysJ3uFY+RhJmYU28Cu
 g/wL1MaOWYhLukr/cw/ErgmsyPFFHkACa1EZNtS0pmWApf40FBsZufYkynmL3QWwADWI
 5C0Q==
X-Gm-Message-State: AOAM533vaksvchhLT9b5dgoavxT5Ju+9Ibp0/OjfEAjBY0Zh3fZe23kn
 /KAo0GUGw0SHAQl15/0Yz0HPftE6mw36Jjc2rTwchg==
X-Google-Smtp-Source: ABdhPJz7gjEs6gcEEtayCO4urFQK4AUxIT7wd0xcK+SBiBg2tzuxLWZ8OPu2JJMdX9MWjakqGTc2Y+P/K1U0bsyfqHA=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr21894020ejf.407.1607943515106; 
 Mon, 14 Dec 2020 02:58:35 -0800 (PST)
MIME-Version: 1.0
References: <1603891979-11961-1-git-send-email-mihai.carabas@oracle.com>
 <1603891979-11961-4-git-send-email-mihai.carabas@oracle.com>
In-Reply-To: <1603891979-11961-4-git-send-email-mihai.carabas@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 10:58:24 +0000
Message-ID: <CAFEAcA933VgFohkQ19DYE4GHd+9pbtosymPNWzU2HqSBO=Sg7g@mail.gmail.com>
Subject: Re: [PATCH 3/6] hw/misc/pvpanic: Add the PCI interface
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Oct 2020 at 14:20, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>
> From: Peng Hao <peng.hao2@zte.com.cn>
>
> Add pvpanic new type "TYPE_PVPANIC_PCI".
>
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>

> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 0a59a06..ce68c90 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -107,6 +107,7 @@ extern bool pci_available;
>  #define PCI_DEVICE_ID_REDHAT_PCIE_BRIDGE 0x000e
>  #define PCI_DEVICE_ID_REDHAT_MDPY        0x000f
>  #define PCI_DEVICE_ID_REDHAT_QXL         0x0100
> +#define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0101

So the comment above this set of ID values says:
/* Red Hat / Qumranet (for QEMU) -- see pci-ids.txt */

and docs/specs/pci-ids.txt says:
# Contact Gerd Hoffmann <kraxel@redhat.com> to get a device ID
# assigned for your devices.

Have you done that ? (If so, then you also need to update
pci-ids.txt to document the new allocation.)

thanks
-- PMM

