Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522F32CA145
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:28:27 +0100 (CET)
Received: from localhost ([::1]:50802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3pa-0003FV-Ah
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:28:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk3nF-0001om-De
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:26:01 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:43157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk3nD-00055Z-Kz
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:26:01 -0500
Received: by mail-ed1-x543.google.com with SMTP id q16so2663344edv.10
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 03:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c8jveT3tECyJnG+7hGEVSEiGXyeEqrtrCyGUJlqtZXY=;
 b=vR0OuWeh25h/xRFL+ybVj6QvhmZ/K4ver/Rw1SzhQedVge5mrmzF71Z8kvmCn6YKAZ
 iWjiZd5dfnSISYqALQz64J2kbAc7ejaKIY6h4mu1p4mUwILYsuen3vA2filmrJ0ZTyT9
 CSm+h0yFQ9kkpMHeYj2NWE4kYD6DUlP9ghfdOHIyQVFK7v07HrGzvuAjJF7FYPpWFmvl
 fiL8LZ8nei4rjxolJv4X/9hTqEFWU/5EO8kgW8tIu8Ief49+1sJO1uQomzCa69kSdKyQ
 K7RY4cngO9iWCMqzo5mF+EwSFArJsjIzcyXgKOddqbpJTcb3hYNGLTN8Vbrc9vVFN/ng
 AI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c8jveT3tECyJnG+7hGEVSEiGXyeEqrtrCyGUJlqtZXY=;
 b=VVWtS6hb0xBJAnnpc3u6h8r8i7my8fHckNzLpNT7EECdZnCtmuiLyV9fNshWVock7I
 IGZmXWLIf0YSSlLB70VXHOK2dyPEolWHO0XPgpj9lcUEeZzs1JSNyivMmQek6yuSWUSH
 l6nGIcW8nrouuuQaNwmi2pgjtNls8EyjSfFwGMyO3mfTG1F6JGyQRZngVeYgOyfTbna5
 kwhnxu6oQ3lRjY9wWrsVYR2CmX8QLQS00LChfnTGg8JnWcdQAfZY3dxDZ5s0Zg5VmX5J
 /vPcNIKt010Jp6x4K0njMxA967QD/JhThGvGZDCNVO984m0LWlE/iZIX9wFAFko9DCeH
 YLTQ==
X-Gm-Message-State: AOAM531LLbmYQDAT2BugkqzIjomwuUqdDzNfpomo9K29nbTf7jofNjyW
 sJG1F8qszAv5BT81JNVmrQxZkbx0X2bJRobac313zg==
X-Google-Smtp-Source: ABdhPJwi4p+oQqMpTAvL/bHnbp+Cdw8aFojQBYNFMksK7NKQjrHCpe+fH0Y00DsMemNF4c0pyTvIjlK6uFZudCNuBss=
X-Received: by 2002:a50:fe88:: with SMTP id d8mr2477814edt.36.1606821957956;
 Tue, 01 Dec 2020 03:25:57 -0800 (PST)
MIME-Version: 1.0
References: <1606811915-8492-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1606811915-8492-3-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1606811915-8492-3-git-send-email-sai.pavan.boddu@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 11:25:46 +0000
Message-ID: <CAFEAcA_mLWxwXf6wWbLABOVeEz=bgTQhiV4B718Z4=vBGNi-4A@mail.gmail.com>
Subject: Re: [PATCH v14 2/4] usb: Add DWC3 model
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
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
Cc: Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Vikram Garhwal <fnuv@xilinx.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>, Sai Pavan Boddu <saipava@xilinx.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ying Fang <fangying1@huawei.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Dec 2020 at 08:34, Sai Pavan Boddu <sai.pavan.boddu@xilinx.com> wrote:
>
> From: Vikram Garhwal <fnu.vikram@xilinx.com>
>
> This patch adds skeleton model of dwc3 usb controller attached to
> xhci-sysbus device. It defines global register space of DWC3 controller,
> global registers control the AXI/AHB interfaces properties, external FIFO
> support and event count support. All of which are unimplemented at
> present,we are only supporting core reset and read of ID register.
>
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---


> +typedef struct USBDWC3 {
> +    SysBusDevice parent_obj;
> +    MemoryRegion iomem;
> +    MemoryRegion fifos;
> +    XHCISysbusState sysbus_xhci;
> +
> +    uint32_t regs[USB_DWC3_R_MAX];
> +    RegisterInfo regs_info[USB_DWC3_R_MAX];

This device has state but is missing the VMState struct
support for migration. Otherwise it looks OK.

thanks
-- PMM

