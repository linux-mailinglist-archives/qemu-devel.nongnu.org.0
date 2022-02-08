Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9074ADDCB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 16:59:28 +0100 (CET)
Received: from localhost ([::1]:56304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHStp-0005yP-Qp
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 10:59:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHS1V-0002gW-Mp
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:03:17 -0500
Received: from [2a00:1450:4864:20::42e] (port=37676
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHS1S-00054l-Vl
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:03:17 -0500
Received: by mail-wr1-x42e.google.com with SMTP id w11so31308871wra.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=sH8uU3Ee06v9siCix/IJSHdL+IpW5HKZvO8cq1geodw=;
 b=QP9eluV9Hz5LRLf38XGNra/82gnvzzQdNQPl9tCFPUEqy+VwUgxkUavBS6gsknC+PN
 b2NV/+gfPaSBrmP5yL8wvpMbgrEehxdUS/cIGzo1yY4YxBOjj2IlLo6/k0N4nVeCUTdp
 K62iX3EMH2i4207jAC4VtpqicHf6bMAvQOGc0T5YVdD5SFmndilZUevtOGabqUV/YSya
 bIdFs2p67GEFfHiVZeNrlFJURU0xuIiEzSbrtYsLvFlXeqiKOmvUxekKlyQ+e3mZ7YXJ
 IADXPFBIuERBY4qLk9muMtt16381mavjUBPV8+smu7jFTMbvZwNH2naKjUJT3oySLUQO
 GthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=sH8uU3Ee06v9siCix/IJSHdL+IpW5HKZvO8cq1geodw=;
 b=zi2L9UAz4oCm6mNlyceF1tzQFytLREdy2a6ze8tMQxabGdIrKf07AuoWueRjuYjJhO
 /5NTUWmmfNmsUVK8Va85vDgQ+gZC60/WTFr2sjdA+DrNoMSN+sHPZS7Ahrvmh6/lYMA7
 xEiQ71ajf7OfOc8F2u0jYCtMsrQiaiysWbTcqvfv0Y/3y+Rj3QI7o4jbISN00Z06xPRb
 U2CBX2xGr80wV5aoIgS9WzqmlxPEr+dYT7ckABTnLFXdgUX7E0TOwO88xSFdafsqM6ab
 v1kBwwtWZDBqR0wUTMMDlBIp03tePfQ5kylod/w0D03aWOzDMVZTL/YD77BEvs2UrgjQ
 DFKQ==
X-Gm-Message-State: AOAM5313g6L5y7fH31mDeOd0fS9IL+lNmLp3aIZGmilm5SKmHklCh4Q3
 FLdPVlebbPkIDY0NUCPui9gEQrhsY9kHoYlgaljcantABYI=
X-Google-Smtp-Source: ABdhPJxVaeGb66eYpyPu+jpg7Vd80sE2uj3WZKPENRu0IIsc+MliFNyI+ef3Q/Fo9E7WGNkE7voSRmHlhaQzSpGTorI=
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr3944836wry.319.1644332593383; 
 Tue, 08 Feb 2022 07:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 15:03:02 +0000
Message-ID: <CAFEAcA8-FhDcxo14nQ5PSDj2XAcSLgvO6rjBUQESNA5D-9fOqA@mail.gmail.com>
Subject: Re: [PULL 00/39] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Tue, 8 Feb 2022 at 11:39, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The following changes since commit 55ef0b702bc2c90c3c4ed97f97676d8f139e5ca1:
>
>   Merge remote-tracking branch 'remotes/lvivier-gitlab/tags/linux-user-for-7.0-pull-request' into staging (2022-02-07 10:48:25 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220208
>
> for you to fetch changes up to 4fd1ebb10593087d45d2f56f7f3d13447d24802c:
>
>   hw/sensor: Add lsm303dlhc magnetometer device (2022-02-08 10:56:29 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Fix handling of SVE ZCR_LEN when using VHE
>  * xlnx-zynqmp: 'Or' the QSPI / QSPI DMA IRQs
>  * Don't ever enable PSCI when booting guest in EL3
>  * Adhere to SMCCC 1.3 section 5.2
>  * highbank: Fix issues with booting SMP
>  * midway: Fix issues booting at all
>  * boot: Drop existing dtb /psci node rather than retaining it
>  * versal-virt: Always call arm_load_kernel()
>  * force flag recalculation when messing with DAIF
>  * hw/timer/armv7m_systick: Update clock source before enabling timer
>  * hw/arm/smmuv3: Fix device reset
>  * hw/intc/arm_gicv3_its: refactorings and minor bug fixes
>  * hw/sensor: Add lsm303dlhc magnetometer device
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

