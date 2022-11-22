Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6CC63439D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 19:28:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxXz6-0001r5-1T; Tue, 22 Nov 2022 13:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxXz4-0001qn-S5
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:27:02 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxXz3-0007Jd-6I
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:27:02 -0500
Received: by mail-pl1-x630.google.com with SMTP id k7so14464709pll.6
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 10:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=14pywuwH1T0Z1TFG62pzJ880c2fj33OabHssQ5MWNgE=;
 b=kZ91z5XOrPqvjbaMDwOV4k3ecIH3iaTAkGE74kxOYoEeX9QErfufX/sNmhx3aBQ95x
 Or2qpM/oTx7OOoySXNHoMnRbhRZvgu8Oe5iySgV5IIyJXyxT/NeiOspqTzI6nd6U/Gs5
 JWUlJa1NESX/BVyC6uF5nLqEZ5YXtR+4kwszU8djzZ75udHVCKVs90+EV+uGFzBYaZ0R
 aEOJUdjXo2+sEDuSxblTv+/JL45W79HFz7+8EozOrEroXLI4Uiz4YX28IPT5FkqRZlU+
 CeFsHubObcCPzg2WnZuSpMA+7IETnjLTAFRzTFpNhZV9pLUOiS8FLwcVPo5tbmRw5E9w
 jSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=14pywuwH1T0Z1TFG62pzJ880c2fj33OabHssQ5MWNgE=;
 b=hh1YzaA3M3M6qxTKru8tMem2eZ2yqCPWZ3rcEp5N+CHoqsDaNJPHWsCvEE0mLtxl4u
 VvnNp1ufQroDK9KnouAUg9VB80wAOCgqpJQkq9WcpzbIwqYQeC/TVi3EGwNsP2g5TBWy
 63vO7QZ7HFLv/wg+pBrnpAd3F1sEkl2Y1fr7GFnknz6J+V3iLNWvRNSanDhHsJijmkbR
 NBOqkF1wlZJ3mSOPAlvWmbzmIKmtWBhmxUGRddZfLhDiQvPBoaHwfaP9/xl6nEyDSJ65
 L46RqpjHro0CoFubqRA0goPtf5Pu+C7goMz2FLMc7vad00IctcSmyMQtu9YSfac3foH0
 mFmQ==
X-Gm-Message-State: ANoB5pnQV3V4Go+pCxHVPIeOtNrh7fR2tvc+YDn76COdiRXigQp4BEEn
 yjcn/a4cSOlNdb8AAdyMyr8pH0oF+HOFfeW14X17Hw==
X-Google-Smtp-Source: AA0mqf56CJb7MUMISHy09X9CfTSeVUDW+vvpRZVyrCmqzF+e5AvsXJgL6JPPTVLahMrRtOp4m0p78jJTS+Y2F0UFygc=
X-Received: by 2002:a17:902:6505:b0:185:4ec3:c708 with SMTP id
 b5-20020a170902650500b001854ec3c708mr7961391plk.60.1669141619714; Tue, 22 Nov
 2022 10:26:59 -0800 (PST)
MIME-Version: 1.0
References: <DS7PR12MB6309CF26249A273C1E2A6AAAAC0D9@DS7PR12MB6309.namprd12.prod.outlook.com>
In-Reply-To: <DS7PR12MB6309CF26249A273C1E2A6AAAAC0D9@DS7PR12MB6309.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 18:26:48 +0000
Message-ID: <CAFEAcA85sSz3bvAvz6XLqa4TxBSgYWRG-oXTCr7Q4tNYRk+GEw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: align exposed ID registers with Linux
To: Zhuojia Shen <chaosdefinition@hotmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 22 Nov 2022 at 03:05, Zhuojia Shen <chaosdefinition@hotmail.com> wrote:
>
> In CPUID registers exposed to userspace, some registers were missing
> and some fields were not exposed.  This patch aligns exposed ID
> registers and their fields with what Linux exposes currently.
>
> Specifically, the following new ID registers/fields are exposed to
> userspace:

These changes don't quite seem to line up with what the kernel
documents that it exposes:
https://www.kernel.org/doc/Documentation/arm64/cpu-feature-registers.rst

> ID_AA64PFR1_EL1.BT:       bits 3-0
> ID_AA64PFR1_EL1.MTE:      bits 11-8
> ID_AA64PFR1_EL1.SME:      bits 27-24

.SME not listed as exposed.

> ID_AA64SMFR0_EL1.F32F32:  bit 32
> ID_AA64SMFR0_EL1.B16F32:  bit 34
> ID_AA64SMFR0_EL1.F16F32:  bit 35
> ID_AA64SMFR0_EL1.I8I32:   bits 39-36
> ID_AA64SMFR0_EL1.F64F64:  bit 48
> ID_AA64SMFR0_EL1.I16I64:  bits 55-52
> ID_AA64SMFR0_EL1.FA64:    bit 63

This register not listed as exposed.

> ID_AA64ISAR2_EL1.WFxT:    bits 3-0
> ID_AA64ISAR2_EL1.RPRES:   bits 7-4
> ID_AA64ISAR2_EL1.GPA3:    bits 11-8
> ID_AA64ISAR2_EL1.APA3:    bits 15-12

GPA3 and APA3 not listed as exposed.

thanks
-- PMM

