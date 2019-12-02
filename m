Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E53110EF53
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 19:29:00 +0100 (CET)
Received: from localhost ([::1]:43128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibqRP-0006aQ-JH
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 13:28:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60761)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ibqQL-0005qM-KC
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 13:27:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ibqQK-0004YJ-Ho
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 13:27:53 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:46862)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ibqQK-0004Xo-Cy
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 13:27:52 -0500
Received: by mail-oi1-x244.google.com with SMTP id a124so532751oii.13
 for <qemu-devel@nongnu.org>; Mon, 02 Dec 2019 10:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dP2JCQbWzYq+j6H+K0zSpsgH9pH8Yu2DiLKkze34i5c=;
 b=zXaEndRpo940BmNkNAkaG6vBp7FBhL5TWuQQlK2FC9TCYW/TZ0ynoQO+5wlTMTzXn6
 bG4GbRuqtTqouOX40iBFMVnXfO7I/1g48C+2ag5kOYw4IG0s7mmbfrrWVZ5CJsfa+zqc
 Mdey985FaDxiu07xmI2G1Gz+8whe2ARv9+Qv7mdRxmcxEZiL6EbJ5QDPt/Pytv3f6bnD
 B2pJibyJzHzPvCnBY2/X9aKraz+F6iixJVPkEihesTLkgOydvd6ISSTReRoaPcfd22Vb
 CU1XSDlQefGLowhufDortNYAg872s+1ka5doOtHs4UVwWOu1s8f1EXdIgUK+/LOoKDHd
 Qsmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dP2JCQbWzYq+j6H+K0zSpsgH9pH8Yu2DiLKkze34i5c=;
 b=BGKZ6Fc1rJjco60a3gVdrgRcOVHJvt602T9tCpcOyJSAXIp0sMyq/6Qk0BMHsZbdHq
 fDUhoedwJDkV4PXiTUnwBiIBEaTbDeLdZPZaixVTARsC8grSEyyamNvUkXokMlUmNHTo
 Hm1dYRV9mRVWNQv6clshhKDEArUN3fpEyQ7Vf+QqCmcqNCK1MsdBhpzB1QlTDZ/8O0Da
 lKl9oJfAT7+TVj6UJmC+QFTVMdSIWlkq+kJf4uNHCaEARugdO+AWwKqhSRwSsBGlnNjx
 owW838GLxnzuTfYz+Muw3j4aV165e0EjXX1Dynu5y2dVslIzU6muzr9gQsQXzWZMbk69
 iuNg==
X-Gm-Message-State: APjAAAU9xVF/Jfce/y1Pu/w8/kZPL3+NzlbRm+wHsnh96iTzLghXb/LK
 7FRbPTJgixNnc6NELu/R7WBHzVyIxGFXSjgXea/xCw==
X-Google-Smtp-Source: APXvYqzYkcr1K/kbJ9V5EeCHx+PRqgxp8GQzi/6Rw2Jb5q31RVmSbaRKDgbS1Q2W2/t69lWVMT1IcbklCE2EXW5NnY0=
X-Received: by 2002:aca:edd5:: with SMTP id l204mr369787oih.98.1575311271706; 
 Mon, 02 Dec 2019 10:27:51 -0800 (PST)
MIME-Version: 1.0
References: <20191111014048.21296-1-zhengxiang9@huawei.com>
In-Reply-To: <20191111014048.21296-1-zhengxiang9@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2019 18:27:40 +0000
Message-ID: <CAFEAcA96Pk_d_T2=GL-QyEBwEXC2fV89K=5h4nEtSHUL0VKZQg@mail.gmail.com>
Subject: Re: [RESEND PATCH v21 0/6] Add ARMv8 RAS virtualization support in
 QEMU
To: Xiang Zheng <zhengxiang9@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm-devel <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Marcelo Tosatti <mtosatti@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>, gengdongjiu <gengdongjiu@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 James Morse <james.morse@arm.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "xuwei \(O\)" <xuwei5@huawei.com>, Laszlo Ersek <lersek@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Nov 2019 at 01:44, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>
> In the ARMv8 platform, the CPU error types are synchronous external abort(SEA)
> and SError Interrupt (SEI). If exception happens in guest, sometimes it's better
> for guest to perform the recovery, because host does not know the detailed
> information of guest. For example, if an exception happens in a user-space
> application within guest, host does not know which application encounters
> errors.
>
> For the ARMv8 SEA/SEI, KVM or host kernel delivers SIGBUS to notify userspace.
> After user space gets the notification, it will record the CPER into guest GHES
> buffer and inject an exception or IRQ into guest.
>
> In the current implementation, if the type of SIGBUS is BUS_MCEERR_AR, we will
> treat it as a synchronous exception, and notify guest with ARMv8 SEA
> notification type after recording CPER into guest.

Hi; I've given you reviewed-by tags on a couple of patches; other
people have given review comments on some of the other patches,
so I think you have enough to do a v22 addressing those.

thanks
-- PMM

