Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF84E53742C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 06:57:18 +0200 (CEST)
Received: from localhost ([::1]:45410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvXSv-0008Nw-MS
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 00:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nvXRx-0007il-8f
 for qemu-devel@nongnu.org; Mon, 30 May 2022 00:56:17 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:40799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nvXRv-0000JJ-QO
 for qemu-devel@nongnu.org; Mon, 30 May 2022 00:56:17 -0400
Received: by mail-ed1-x531.google.com with SMTP id w27so5293427edl.7
 for <qemu-devel@nongnu.org>; Sun, 29 May 2022 21:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rdFgOMx1Bi5HGm6Iob6ByBdITJ62yaSlbTWN53OkQB4=;
 b=Jb9cGR4XjHW8U/kcRGVDBcOgg4/yL9RjkwT/fBfyzH3YfXUdDXjQB0lWBLjEwvzpPO
 9HhytYemDcaCXWIBhIP1CiRsmM42MPdozr5bRVmMQPQFBtiL4UekGo5rfbVJkzNWBlES
 C/QJdX/I2S8nWm/ChOQtb9CS9DB/tYAp9/EMlfFtnMiv6dpGjxSIPfBlPqX9vhBBCr0Z
 TKYFFXAWiAz+p04KF8NGQoH1ZT5IOMYRTE4UtH49pPQ0cnne1O93ScPQp2LZ63fIC8c8
 y8MNqIZX1zaw+o83ahdpLN0k+RQYuMQpD5EbBVeymL/3Vnx6GqaKZrfRKYkuobfnd18u
 Z+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rdFgOMx1Bi5HGm6Iob6ByBdITJ62yaSlbTWN53OkQB4=;
 b=AEuH/ZINExzD5PkZcQCE1WoFw9oAt98uK/hUx8rb2XF6C7bwUYLucTAQKPYUMKRIpM
 f3eRIyZsZWSF5FLSkQuy7wTr3VK8DycIahCOfSlOaq+6XvDriIOOWNtxDKDlhnp9WlkY
 82VOOMPU2XlO37oBf+2cF8CCF+uj0n/Rl0yTRNfxTKhkpYqcfh6zL1XdjSknsxofzEBL
 1hwjqswEShpC7RBFT3KGn88VrEIfCLl9NfdpgITMK7Y5cyDuys1evxZwNqQEb4IzVnc5
 UaYPSNZxoIJSxW9ax4maoIyP0XBjpKTf1dD8VDvAvPH6FHGbZK11VOr70fh+G3RCi+l6
 +6lA==
X-Gm-Message-State: AOAM532SxYLeAYO9kWnxlKoDxFrLux1p+EKKx8tv1NvfN6WmJlf1vCFd
 s+IRctUezbNuNgdRJXNRT5vXqJ5jb20scS032NYH/A==
X-Google-Smtp-Source: ABdhPJygEzOd9dyI3R6g53pJzAenfocXi4rtRgq3FP5en0xJ3fAHSTA9Q4YH1zlQjmSibC3rBQKtJqyZ8zdFDdfdOSk=
X-Received: by 2002:a05:6402:1818:b0:42b:e047:a94c with SMTP id
 g24-20020a056402181800b0042be047a94cmr18376899edy.109.1653886574023; Sun, 29
 May 2022 21:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
 <20220528091934.15520-3-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220528091934.15520-3-mark.cave-ayland@ilande.co.uk>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 30 May 2022 10:26:03 +0530
Message-ID: <CAARzgwwkUqvjOLHfkLUAweM5Q+pf_tijogxp_Z88N02NPQbO=A@mail.gmail.com>
Subject: Re: [PATCH 02/12] hw/acpi/piix4: change smm_enabled from int to bool
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: shentey@gmail.com, mst@redhat.com, marcel.apfelbaum@gmail.com, 
 imammedo@redhat.com, f4bug@amsat.org, aurelien@aurel32.net, 
 pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net, 
 hpoussin@reactos.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::531;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x531.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, May 28, 2022 at 2:49 PM Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This is in preparation for conversion to a qdev property.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

other than the comment below,
Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/acpi/piix4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index bf20fa139b..fcfaafc175 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -74,7 +74,7 @@ struct PIIX4PMState {
>
>      qemu_irq irq;
>      qemu_irq smi_irq;
> -    int smm_enabled;
> +    bool smm_enabled;

For the sake of consistency, I would also change the signature of
piix4_pm_init(), that is, change simm_enabled from int to bool.
We are good in pc_init1 since x86_machine_is_smm_enabled() returns
bool. In piix4_create() in isa, we pass integer 0 which we might want
to make boolean.

>      bool smm_compat;
>      Notifier machine_ready;
>      Notifier powerdown_notifier;
> --
> 2.20.1
>

