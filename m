Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE30458CFC0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 23:35:32 +0200 (CEST)
Received: from localhost ([::1]:58906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLAPL-00031D-D1
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 17:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLAF4-0003kn-OC
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:24:56 -0400
Received: from mail-vk1-f173.google.com ([209.85.221.173]:46863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLAF3-0008VC-Bc
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:24:54 -0400
Received: by mail-vk1-f173.google.com with SMTP id c12so4983242vkn.13
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 14:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=wUyKvRb9hD3YCcH+zs9oAO1JmGMgQNRxGsxiuXAjTt0=;
 b=0SNmXGvm1ESgsz8Zgn5+oSSjTGjjJ4wo/NLHlk9+Xb4NZzMpwOBA+6zz7xAlU52l4t
 E5Gb/A4ylUkk9jqmNEvf98C03XnncV+wd6KEaVgn0LcGGqDe6AJJ7qVbA4YLsRdmvBlV
 2qKquUIw9l9sTGSihVjAOsD4yOWrGDkyDdjErK+D9qKYVSRDi9YHkhZnfFlmRpsRaLq+
 s3VMtUvInjyRyzSpBnTXIGEu9G4slRmPrLsrqEGtIdTl5GP0NteMQrbAGeM9IJyDAMvn
 5zVS+6BREhz/ol6DzfoQaFXYJjk3o8WTwExL7KAihfJqjliaLRZhjbjCVhpkoaskwZby
 +zMQ==
X-Gm-Message-State: ACgBeo0DAInfD2R+197PtJu6geo6f3IVPJ6ISigcv205EQw1OVj5eA+N
 9px8S2M8bzTeHb740P23fGhYAjSy9LmomCqV9dc=
X-Google-Smtp-Source: AA6agR4fV8dI5Kt3Pi8olV8CEf50mGclEQl8rQ008SLpe6d5FflZZ22Sikbqe3TMEZ3MDDAsDHVDPeOySlOohdLZGH0=
X-Received: by 2002:a1f:34d8:0:b0:377:142f:3e2f with SMTP id
 b207-20020a1f34d8000000b00377142f3e2fmr8391258vka.27.1659993892336; Mon, 08
 Aug 2022 14:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220728115034.1327988-1-imammedo@redhat.com>
In-Reply-To: <20220728115034.1327988-1-imammedo@redhat.com>
Date: Mon, 8 Aug 2022 23:24:40 +0200
Message-ID: <CAAdtpL6+2YuMeTH2w0B4rL91aS0_+_G_iDXJ6-y3VP=4U4Es5Q@mail.gmail.com>
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features of
 PIIX4_PM
To: Igor Mammedov <imammedo@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.221.173;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vk1-f173.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Thu, Jul 28, 2022 at 1:50 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> QEMU crashes trying to save VMSTATE when only MIPS target are compiled in
>   $ qemu-system-mips -monitor stdio
>   (qemu) migrate "exec:gzip -c > STATEFILE.gz"
>   Segmentation fault (core dumped)
>
> It happens due to PIIX4_PM trying to parse hotplug vmstate structures
> which are valid only for x86 and not for MIPS (as it requires ACPI
> tables support which is not existent for ithe later)
>
> Issue was probably exposed by trying to cleanup/compile out unused
> ACPI bits from MIPS target (but forgetting about migration bits).
>
> Disable compiled out features using compat properties as the least
> risky way to deal with issue.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> PS:
> another approach could be setting defaults to disabled state and
> enabling them using compat props on PC machines (which is more
> code to deal with => more risky) or continue with PIIX4_PM
> refactoring to split x86-shism out (which I'm not really
> interested in due to risk of regressions for not much of
> benefit)
> ---
>  hw/mips/malta.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Thanks, queued to mips-fixes.

