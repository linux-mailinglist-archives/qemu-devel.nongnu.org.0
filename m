Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16668402979
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:12:39 +0200 (CEST)
Received: from localhost ([::1]:33372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaty-00028f-4k
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNaIg-00017G-UD
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:34:06 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNaIf-00035W-4c
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:34:06 -0400
Received: by mail-wm1-x329.google.com with SMTP id i3so6718760wmq.3
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 05:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=80+bAoOyeQdABZJKnvOF2JX+erN9WyyamoNmoSLuTg4=;
 b=UBUcteAYJPgftX+2V6hzwgPK+QX9lIKQyO31moK7bXog1IVdni65TvakVCnQVW2hl5
 x7qyW8o87AJ2Ah3A0y/kMbSjUB+lIcl/+3NOrgy3nkM/0RsjEYpx0BZ4Ca4W3VXAuhqt
 jw3Qth/yAEvHmooovetH36lQWzorHrP5nJ1GYE955qaexSyMIz+OS9roLYasaJZ7DiB0
 D4bH5bpVdGNdGwhuMpsLCsc3f02W0uE04ZYGnY3YfUl7hy1qPS1M6VotCq2vBdQaUcyl
 rPDpW0iG2M66IQZwrzXSgFCgPlNgR4AxKeXFx1OsWWWZ6vwPJSBp7sFq45JJKZH5hOfe
 17Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=80+bAoOyeQdABZJKnvOF2JX+erN9WyyamoNmoSLuTg4=;
 b=OWqzlP3itENzXZiw31z/DbuC63lqBVfZDy6JY5o0Vm6qy4m/8ukTn9qpgeyvBYXp2r
 JjtawBoaF2oV7LhXtUSAXD7elTzqKa3mk1+CYojHsL8whex8AS31TCYtAfrQvRHCgyTw
 KH9SeX+K5UzKv/Jzm+UPns7XrlnbsgRpxIgEE0RT2jgj6KeDlX/N0DsholWZXwj8thrP
 vme69WotDu9IYPfcY88wplZ68O6zAcAdX+LYnXACEw0N8pcDbgmbfunEGz5zRKXQd0XN
 q9/5VRKLr8iRmeDhxjtHGVELAEi0q5EdLHsa50AcP2ebC0dHLkS4zDUWBRswDYhPO3SN
 95BA==
X-Gm-Message-State: AOAM532osFlA8VrqDKAl0YN0369S8VN0zjDm3625nyKedD3/4Gbc4SVZ
 VSalJ2bQhc3KG2DESLINq59jz34OclqEKJxgEovEhQ==
X-Google-Smtp-Source: ABdhPJzjEZeYGhl7MAryNNREEKrGtfSKoS+U6BWplimTTCMn1R9YOBpX7q/0jTuLWMJxx46eGrEm8jI1heJc5jTJxys=
X-Received: by 2002:a05:600c:4f46:: with SMTP id
 m6mr3734576wmq.133.1631018043289; 
 Tue, 07 Sep 2021 05:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-2-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-2-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 13:33:14 +0100
Message-ID: <CAFEAcA9BzYj5N3P-Cykm7tzbu9xJAnBO8rF=vBZ87DJnk=kKzQ@mail.gmail.com>
Subject: Re: [RFC v3 01/32] RFC: docs: add supported host CPUs section
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Sept 2021 at 13:23, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> I was looking for such documentation, but couldn't find it.

Yes; this is definitely something we should document, and in
the build-platforms doc is as good a place as any.

> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  docs/about/build-platforms.rst | 28 ++++++++++++++++++++++++++++
>  meson.build                    |  2 +-
>  2 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.=
rst
> index 692323609e..bfe90e574e 100644
> --- a/docs/about/build-platforms.rst
> +++ b/docs/about/build-platforms.rst
> @@ -29,6 +29,34 @@ The `Repology`_ site is a useful resource to identify
>  currently shipped versions of software in various operating systems,
>  though it does not cover all distros listed below.
>
> +Supported host CPUs
> +-------------------
> +
> +Those host CPUs have a native TCG backend and are regularly tested:

This is a list of host architectures, not CPUs.

> +  .. list-table::
> +   :header-rows: 1
> +
> +   * - CPU Family
> +     - Accelerators
> +   * - ARM

The correct capitalization these days is "Arm", by the way :-)

You also should split 64-bit and 32-bit Arm; we support
KVM on 64-bit but not 32-bit.

> +     - kvm, xen
> +   * - MIPS
> +     - kvm
> +   * - PPC
> +     - kvm
> +   * - RISC-V
> +     -
> +   * - s390x
> +     - kvm
> +   * - SPARC
> +     -
> +   * - x86
> +     - kvm, xen, hax, hvf (64 bit only), nvmm, whpx (64 bit only)
> +
> +Other architectures are not actively maintained. They use the slow and
> +experimental TCG interpreter. They may be removed in future releases.

This seems to be conflating TCG and the TCG interpreter.
We should just list which architectures we support (proper)
TCG for, and say that everything else is unsupported
(not mentioning the TCG interpreter at all; using it is
pretty much always a mistake IMHO).

The table also seems to me to be a bit confusing, because
the introductory text suggests it's a list of the TCG
support for each architecture, but the table itself lists
only the non-TCG accelerators. I think we should just list
all the accelerators supported for each host architecture.

Perhaps we should also (eventually) have somewhere some text
describing each accelerator in more detail, though probably
not in this file. A docs/system/accels.rst that described all
the accelerators with a paragraph or so for each, maybe ?

-- PMM

