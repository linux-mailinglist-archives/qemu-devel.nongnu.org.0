Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC1136482C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:26:20 +0200 (CEST)
Received: from localhost ([::1]:47600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYWj5-0005nK-ON
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:26:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYWhu-0004rM-1P
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:25:06 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYWhs-0002aY-1M
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:25:05 -0400
Received: by mail-wr1-x436.google.com with SMTP id x7so34658420wrw.10
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2IEVMMmjvSqcQfvawzed72ofqrNQJLYwE1FD7NLKTHQ=;
 b=qmxDCFcLnrEeeHQw+kvCEQrxx9mvbfmTEbqNhT/xKgKbl4jfZMhz9BM0lIO3qfepyk
 CXPa5+2ib2y9Dc8LrMc0hkwuptdqae7f+qIUMvFVeSYip5M+un/irGY4mj72qq399CoC
 UcadyqibEayJA0JUhVHGouQ191Eboj6bjBgn3mktGkJDZVP9tIruo7C3XdX+kP51bwWW
 8zJaazjsSAeQXCruwJwM5qNcjhPLoni3niGXs2BJWPLdk6Eo8HwglUSl/NY7NGHbZnQP
 ciYbGH/YbKmXdEOWRjRFosh2W0QS19i2Bg+7M2Gx3zvFIizSWxHCakJsxzI0kcgesRkP
 S2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2IEVMMmjvSqcQfvawzed72ofqrNQJLYwE1FD7NLKTHQ=;
 b=fr1vXdDP7tuHHi/N/DYkTupUJdO/jZOsq3A/jAzaP0ppwvkaHJfRJ7uwaTXbrJlCR6
 185NFcSyz0sIpRMeMHxLsjkM2rITKMrhdPrBzfqRg3bJb5MbIWXMfEUYogoIT2IWZ0wn
 Uh4bEzB6wxA4QERV1ss1TQSZliB3WNSDLgLVT0/MesX6dEJZIYXlncBX53tcxytBG2Oi
 3mqHmdbwkHUKAMckFgpE+BTeltZfDSpP1OgmwlSPovFtNIhBi0l2Vp+sE+KP6/aTUq0x
 DuAxqnMeR/a7X5wuSl+bwcg6Hx/0frXus1U0PTjC8pJ83mRvHpTKlMOIjR3aL81QfKQ2
 wRxQ==
X-Gm-Message-State: AOAM532pWcKPd9HjQVoxPw577DolLZJnUbHiJMyclvzCtyb4bvqyn9t9
 C6b90bRZvdVmcEEHtgurfoU5hLx2tOcrlw==
X-Google-Smtp-Source: ABdhPJz6tlBO/C4r8ErWIld/G5DyDMOUqJFQRkL1k37aUmHea8oZVnaXMZrR50X+O/FqbT/BEDYduw==
X-Received: by 2002:a5d:4006:: with SMTP id n6mr15575576wrp.240.1618849501997; 
 Mon, 19 Apr 2021 09:25:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o12sm14363892wmq.21.2021.04.19.09.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 09:25:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 461AB1FF7E;
 Mon, 19 Apr 2021 17:25:00 +0100 (BST)
References: <20210401144152.1031282-1-mlevitsk@redhat.com>
 <20210401144152.1031282-2-mlevitsk@redhat.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH 1/2] kvm: update kernel headers for
 KVM_GUESTDBG_BLOCKEVENTS
Date: Mon, 19 Apr 2021 17:22:56 +0100
In-reply-to: <20210401144152.1031282-2-mlevitsk@redhat.com>
Message-ID: <874kg29r8j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Maxim Levitsky <mlevitsk@redhat.com> writes:

> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>

Generally it's a good idea to reference where these are coming from, is
it a current kernel patch in flight or from an release we haven't synced
up to yet?

Usually linux header updates are done with semi-regular runs on
./scripts/update-linux-headers.sh but obviously it's OK to include
standalone patches during the review process.

> ---
>  linux-headers/asm-x86/kvm.h | 2 ++
>  linux-headers/linux/kvm.h   | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
> index 8e76d3701d..33878cdc34 100644
> --- a/linux-headers/asm-x86/kvm.h
> +++ b/linux-headers/asm-x86/kvm.h
> @@ -281,6 +281,8 @@ struct kvm_debug_exit_arch {
>  #define KVM_GUESTDBG_USE_HW_BP		0x00020000
>  #define KVM_GUESTDBG_INJECT_DB		0x00040000
>  #define KVM_GUESTDBG_INJECT_BP		0x00080000
> +#define KVM_GUESTDBG_BLOCKIRQ		0x00100000
> +
>=20=20
>  /* for KVM_SET_GUEST_DEBUG */
>  struct kvm_guest_debug_arch {
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 020b62a619..2ded7a0630 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1056,6 +1056,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
>  #define KVM_CAP_SYS_HYPERV_CPUID 191
>  #define KVM_CAP_DIRTY_LOG_RING 192
> +#define KVM_CAP_SET_GUEST_DEBUG2 195
>=20=20
>  #ifdef KVM_CAP_IRQ_ROUTING


--=20
Alex Benn=C3=A9e

