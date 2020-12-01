Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C3A2CA148
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:29:18 +0100 (CET)
Received: from localhost ([::1]:54104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3qP-0004es-Qb
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:29:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk3oY-00039a-VZ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:27:22 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:36488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk3oX-0005lo-AJ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:27:22 -0500
Received: by mail-ej1-x642.google.com with SMTP id lt17so3407388ejb.3
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 03:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q0Wwrvegb1qoR/YpB8x0Ur20UAQCrPkmQcYzpu0fTeQ=;
 b=Lu/lP1a93ld4ErWH+IgY4Z5rwS6z3YrWncmXV4G0QYfT+Q6JWQDxWzuxtu3+WPXkn3
 BrUkyVrNlOQm/w14V5OTp2lWPwoPip8wSMzS29Kgu+Umj9v0G6cwU3EN7sCHq/IyAW39
 McJBaCE2wYsJLsScwV6G7ImyvmvAUZpzunGJaEluy7V25FAFjerjazWsdD00iXnS6lb8
 +XHSFqKlWBLoVBCPMPKOwV+M2pctONLICB9wcTqcAiU532z/wfkUcYiM1wRuwZwlyXTf
 BFOujBBxRS0xw5v41/GrSGZk5YOiPhsyGoyD7X4WSQFeuR7NhSG1/+EkpWiv64IJ9IMh
 CUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q0Wwrvegb1qoR/YpB8x0Ur20UAQCrPkmQcYzpu0fTeQ=;
 b=FTqSQilmSywdPUDTL1UMtgUqjowOygrZYFkcHKU7FQiwCXRqGwl1RbyhBLUPEb/UaW
 dBLOonPY/HUtu1YPQu2MsRLMaQyQiqpDwMZqJ2FokewJVGkrtF6u9grgo2SAX0nl9pKc
 6K2Hf9q81VERgrr7urGyxzQpNuMNA+J6op5oyptKuqkz0HZCp4vdZTv9iPjroIaSt5et
 ABq0PO6tL3bX28hHCqPPqeOjleT6mUMw3LlFthQsp5iI0fHg5sumqj07nG55NSG/87Ht
 d8wed+tzaoblOUyawf2vgwA0wcw2rOp2XF3soiYzZoXyYLVMcVACCvNeGefiY6+bZGs+
 ewPw==
X-Gm-Message-State: AOAM531uubcg4RyuPMGTEUJUhXyn06Qo5qpePu2XFPDZl50fsajOggxB
 93J4uKLNup5/itc8IZaXerSh0TIBzUe2BdWhf0/L1A==
X-Google-Smtp-Source: ABdhPJzRHjnR1n/XIN+NThzKHDiC5xqI6+OP+yBrdl/cSfi4gGapXhMgiCgk2lb0KG5HO7MJ8NQntky27t4dXc1i4hE=
X-Received: by 2002:a17:906:4bc6:: with SMTP id x6mr2605606ejv.4.1606822039845; 
 Tue, 01 Dec 2020 03:27:19 -0800 (PST)
MIME-Version: 1.0
References: <1606811915-8492-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1606811915-8492-4-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1606811915-8492-4-git-send-email-sai.pavan.boddu@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 11:27:08 +0000
Message-ID: <CAFEAcA9_W3EbVdRXL118-hHqTxjkDnSJgXmMqctJdAXRf+Tb2g@mail.gmail.com>
Subject: Re: [PATCH v14 3/4] usb: xlnx-usb-subsystem: Add xilinx usb subsystem
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
> This model is a top level integration wrapper for hcd-dwc3 and
> versal-usb2-ctrl-regs modules, this is used by xilinx versal soc's and
> future xilinx usb subsystems would also be part of it.
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

