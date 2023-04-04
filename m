Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43156D6116
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 14:44:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjg10-0006hs-Vn; Tue, 04 Apr 2023 08:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjg0q-0006ha-ST
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 08:43:48 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjg0p-0007PE-BD
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 08:43:48 -0400
Received: by mail-ed1-x529.google.com with SMTP id y4so130112294edo.2
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 05:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680612225;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aQjPDhyRzL9B20Lxfne2IlKpSVL4IBEqQ7lZ4IdsELk=;
 b=eg5880GQ6SKMLQ2UQBz3ZFFy2OW66SANfyCgiZ6I4Yksa0pP2DJHChJCsM3vHb4mBb
 RyUhDUrI/+ozucFMMWYQ7S/rv7TgD2L03Q1Y8SmhQCTLylzTCIu2AR25XY4mQTyhP2+L
 3YBehTtY2ukDS1vNitjJQSoywNUedj0AYo6Za/LU0emjOLNyju7T5PmlixP5l0hbNjKm
 37iRBjPRJctKTZbtSHbgIrJlPdo0qpC/qMt/AG7mLs7wM/Mg+TYFhXXSz5ZZcCOKpH6o
 dtxqvd+w1qc4rmQsGJ4AtP/4V9CPd6Z+UHN0sMR8gc+akLd1aHe/qxLy5CqcoXmTsxpm
 oQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680612225;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aQjPDhyRzL9B20Lxfne2IlKpSVL4IBEqQ7lZ4IdsELk=;
 b=76puP6o7HRnFjbU41M2y8IyVjMFmSK008AmJYJBNo7ahuUshBDdf0qaGOSnZcCBHcr
 swDszGotm+XzIHMvzBSj5T2BshjOWbdkYzVnddxnppN1PtJ6IU5Sjcqftnm1p2up1bUk
 hHS7fAEaUJpKcXSXRlCfgvIS2o4MLwmlSrWV1nOPKsRFrqFMbU8kkK3wsIDHdMK9kYTS
 gYvcjTE1F2p2MY2sVABQ1nCeUMbUgSmA1TmasipyL2/NRM2frxMRCHa6RHwfa24mj5OX
 P7spfqxWxHaUqOeJmobfii+77AONLwDoVvyfUegWDij3t035a97K9MHcGD5XagwWtIPm
 8CGA==
X-Gm-Message-State: AAQBX9eyoF3SbnUpquf1exK59sGAclPwN8nd2n4vd4sH4pNdEKL481li
 7c0/l4r0E2e2aXDFpvk1CtEAezkK0nTrF7RN2K+1BIDLinMFsbh7
X-Google-Smtp-Source: AKy350ZhfbYLPTihm3NxBVpmrX7VPpWVMmoYoOP31Q8qVFpk1B7toLGyMSy2xiPClx2JBOSQNvOqX4McAturgWKEggo=
X-Received: by 2002:a17:907:3e93:b0:8b1:cd2e:177a with SMTP id
 hs19-20020a1709073e9300b008b1cd2e177amr1230319ejc.6.1680612225455; Tue, 04
 Apr 2023 05:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230403160117.3034102-1-peter.maydell@linaro.org>
In-Reply-To: <20230403160117.3034102-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 13:43:34 +0100
Message-ID: <CAFEAcA-_d8Ahc19Wk0_Y_-wdGR1XZZ8J9Y1ZNxHMfeiYKnU4tQ@mail.gmail.com>
Subject: Re: [PULL 0/4] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Mon, 3 Apr 2023 at 17:01, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The following changes since commit efcd0ec14b0fe9ee0ee70277763b2d538d19238d:
>
>   Merge tag 'misc-fixes-20230330' of https://github.com/philmd/qemu into staging (2023-03-30 14:22:29 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230403
>
> for you to fetch changes up to a0eaa126af3c5a43937a22c58cfb9bb36e4a5001:
>
>   hw/ssi: Fix Linux driver init issue with xilinx_spi (2023-04-03 16:12:30 +0100)
>
> ----------------------------------------------------------------
>  * target/arm: Fix non-TCG build failure by inlining pauth_ptr_mask()
>  * hw/arm: do not free machine->fdt in arm_load_dtb()
>  * target/arm: Fix generated code for cpreg reads when HSTR is active
>  * hw/ssi: Fix Linux driver init issue with xilinx_spi
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

