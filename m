Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E8A31CE9A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:04:31 +0100 (CET)
Received: from localhost ([::1]:33138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3m2-0000V4-E4
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:04:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC3TJ-0006AN-Vy
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:45:10 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:38170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC3TD-0006qj-JF
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:45:09 -0500
Received: by mail-ed1-x533.google.com with SMTP id s11so13012690edd.5
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xp8gyyw4XX+v5GfAXxip4UNdg+CNKu2z9lmgf9b+QEI=;
 b=SCQCIGlNZmbtz2ejbwiOgXOxelbHvmReciN0EQj3r0b4kRb8u5QIW/i16Ur02cNsfb
 CyRgHQQVopVIvfka7tPFSL2UavQha7ogwuiusFzj3yaLn7Sb23GFwUwKg7f6/I4Bd8z3
 QdZ0N9uNYjxhtH5TmdZSCaa1wuUNVckHf8rXbJ99oqGGj/KtpTwJ3RcOyi4+ZscKJYSc
 6q09Wj9sVj0t2Eca35WoMiR73f34LlMLsMoLgC/ACwmIBJc8QPCbILDC4rsEWexxywK3
 4HGsXqlD6PRV9ifEJzFi7fu8TN4puzZkMlKvMZfk+SPlBcqHmrT/JZ6NfvuFxpAjHV61
 mVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xp8gyyw4XX+v5GfAXxip4UNdg+CNKu2z9lmgf9b+QEI=;
 b=g7Fvp8cE6ZfVK9s4LgIW0UC/drdhRRZzrIW+snVubvEpt6H/eKmWSQ16qnsMFegawM
 1cWr9w5ISQmsWO2RAwJ+UNbZxzxk+2OvDxWtnAP7I2jehr5YoLajcB5MDtufTLFstigH
 50dDLrnITPkH5FeuJKlW+2W+Czb52E6KNNt4xaP7vxws2Tk1T2FvG+0kEbid+B11N+0x
 pe7vcDyIDbZt/oErmvmhy/uygHaB5476kIdOCxEpmjkev0ZYfK6PCGFcE1DM4hH35FHf
 quvMCxiHFazJuB3WB9kot0gA1k8sd6N15hsGHjd4EkBwDV3P/umZQKfwILUfNN0mLtOh
 xLVw==
X-Gm-Message-State: AOAM533NZTpJ59b33TverUCuu119K/GfEY4Rm7ehP8raNmtq7WwDy2ow
 QZIgWRT5W8CvclBRyWLxoqHFm1A570QCpcapyfD3dQ==
X-Google-Smtp-Source: ABdhPJxVX3B7vLefA/PltxdwERUcV7Lpfc/UrUeKoiO/osLJDfnoxHwfZK+aA0WZ1uLuOD3NMgasEr9m1yxhHfhvc9Q=
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr22514439edc.146.1613493900110; 
 Tue, 16 Feb 2021 08:45:00 -0800 (PST)
MIME-Version: 1.0
References: <20210216110056.1228582-1-thuth@redhat.com>
 <20210216154010.3691880f.pasic@linux.ibm.com>
 <72e9a5b3-dd88-85de-e4a8-88a6a9c45099@redhat.com>
In-Reply-To: <72e9a5b3-dd88-85de-e4a8-88a6a9c45099@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 16:44:48 +0000
Message-ID: <CAFEAcA-yutW-96v2ktvMfVsaZPeA2aTxMg+Y-t-F1Q_xtM-a1Q@mail.gmail.com>
Subject: Re: [PATCH] pc-bios/s390-ccw: Use memory barriers in virtio code
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 at 16:15, Thomas Huth <thuth@redhat.com> wrote:
> I was just about to reply that this is certainly not necessary, since
> the DIAGNOSE instruction that we use for the notification hypercall
> should be serializing anyway ... but after looking at the PoP, it
> actually is not marked as a serializing instruction! (while e.g.
> SVC - supervisor call - is explicitly marked as serializing)
>
> So maybe that's worth a try: Peter, could you please apply this patch
> on top an see whether it makes a difference?
>
> diff --git a/pc-bios/s390-ccw/virtio.c b/pc-bios/s390-ccw/virtio.c
> --- a/pc-bios/s390-ccw/virtio.c
> +++ b/pc-bios/s390-ccw/virtio.c
> @@ -54,6 +54,7 @@ static long kvm_hypercall(unsigned long nr, unsigned long param1,
>       register ulong r_param3 asm("4") = param3;
>       register long retval asm("2");
>
> +    virtio_mb();
>       asm volatile ("diag 2,4,0x500"
>                     : "=d" (retval)
>                     : "d" (r_nr), "0" (r_param1), "r"(r_param2), "d"(r_param3)

Doesn't really help (maybe brings the occurrence rate down a bit
more, towards about 1 in 9?)

-- PMM

