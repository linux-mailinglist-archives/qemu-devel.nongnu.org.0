Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E379C5BB033
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 17:29:36 +0200 (CEST)
Received: from localhost ([::1]:45800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZDHb-0004mv-7T
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 11:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oZD83-0004Qn-Lf
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 11:19:44 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:38535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oZD80-0006vz-S5
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 11:19:42 -0400
Received: by mail-ed1-x52d.google.com with SMTP id e17so31976242edc.5
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 08:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=6ltKyCBLAYqNcCaOEWIzjD15KZ0/cBrZ46cjtjUDv9U=;
 b=frqaOQ/Ze5zXk4cdoLy9VIjcd7+dSys/NTD0VRwLI49YppuqrBdQ+OP4i5x2NguEsw
 QYFE3VxWBvM57RC45PaNC9bhyoF64EGfBFxA2bBDJHs6h6PjA51rVbXKtTxryygABiG2
 K4HSjoqoBdqZof4/XSrbcbP5QeTkXSXERBSMSN+RFEIGtsbDb2DiSLAm7yrKz3ix3w+g
 hcCHCpfPpAGdXKFWslvucX2gyA8VrePkfSjoayppKJXla/LIXAZQJkx+Gz/ipETHnHvd
 5L9Gp3Z+/Me7r8vb1LhApntSl6NdSjJajtK4PpdRdt5FsTaVArClYj7+AX34P/Gu6u1z
 yveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=6ltKyCBLAYqNcCaOEWIzjD15KZ0/cBrZ46cjtjUDv9U=;
 b=ofZUpS8PMbzfMye3uqTHYXT2AIgMm9ys4c9+qFLkQqD94pRMqYqtgoDMFLR32VNtWq
 7X2FQm2c5JTHuM8IKCkpU5QERX+ff7hdkMTm51WVJayQu0skJcZm2NoX2mQNrW+5YdDP
 WwGu9oqDTtz9Rwwfh58rJmoSfP6D4a0y8MZerWoU2F1klZnPfehGM4DGfES7zzp/dbnM
 chGr1a0BhuajUT/J2l/YyV+QX70jn1sr4Z7PZwHI3uWbVgOu/JsZf8ZVL50HT8qbiFJZ
 QddUw9bXALlr3Jei7Yu0vBo2bq1IBa6uwQp9LG+UniNCo240JIatJZ4ZzsGzWTUq9rBm
 G0cw==
X-Gm-Message-State: ACrzQf1yEN0RNC5hLYO6wpplyTetx/vVYzE/W7kbW4n9Qg3MSq016yoO
 WfWp2V7zzAVPDoa0wQs2fUiKeg6OpSh8mQX1bQ2lyA==
X-Google-Smtp-Source: AMsMyM520ZIu4FdFTyIhts++uh0IkoqCgMngHDOqhOG7X8tKuIGqxQ1ieiM4q1UpstKIofHWdcP9aBwJzQqQP2fihek=
X-Received: by 2002:a05:6402:11d4:b0:452:a97c:cd36 with SMTP id
 j20-20020a05640211d400b00452a97ccd36mr4464768edw.53.1663341579065; Fri, 16
 Sep 2022 08:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220914160955.812151-1-alex.bennee@linaro.org>
 <20220914160955.812151-2-alex.bennee@linaro.org>
In-Reply-To: <20220914160955.812151-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Sep 2022 16:19:27 +0100
Message-ID: <CAFEAcA_SKAeWnhUob4CNaAs9LYfUc2V-xuYDPtyw_SSydC8Vsw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] hw: encode accessing CPU index in MemTxAttrs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 14 Sept 2022 at 17:50, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> We currently have hacks across the hw/ to reference current_cpu to
> work out what the current accessing CPU is. This breaks in some cases
> including using gdbstub to access HW state. As we have MemTxAttrs to
> describe details about the access lets extend it to mention if this is
> a CPU access and which one it is.
>
> There are a number of places we need to fix up including:
>
>   CPU helpers directly calling address_space_*() fns
>   models in hw/ fishing the data out of current_cpu
>
> I'll start addressing some of these in following patches.

> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index 9fb98bc1ef..3bccd5d291 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -43,7 +43,9 @@ typedef struct MemTxAttrs {
>       * (see MEMTX_ACCESS_ERROR).
>       */
>      unsigned int memory:1;
> -    /* Requester ID (for MSI for example) */
> +    /* Requester is CPU (or as CPU, e.g. debug) */
> +    unsigned int requester_cpu:1;
> +    /* Requester ID (for MSI for example) or cpu_index */
>      unsigned int requester_id:16;

This defines effectively two uses for requester_id, with a
bool field differentiating between them, but the patch doesn't
change any of the places that are currently using requester_id
on the assumption that it's the MSI PCI ID to check that
it's not actually a CPU ID instead. (Generally you don't want
the guest CPU to be able to masquerade as a PCI device...)

Also, I think we should look at how this is usually done in
hardware. I'm pretty sure that in AXI, for instance, CPUs
are not special -- every device that can generate memory
transactions can specify an ID (and it's up to the SoC/system
config to assign them sensibly.)

-- PMM

