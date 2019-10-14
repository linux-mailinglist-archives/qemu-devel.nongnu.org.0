Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A94D62F0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 14:49:38 +0200 (CEST)
Received: from localhost ([::1]:49300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJzn7-0001CS-1R
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 08:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60715)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iJzlr-0000nN-8x
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 08:48:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iJzlq-000643-3y
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 08:48:18 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35715)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iJzlp-00063N-S1
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 08:48:18 -0400
Received: by mail-oi1-x244.google.com with SMTP id x3so13633149oig.2
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 05:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y0H2jt6cspPZVFJiMqrsCk68oTN2bKE6m9749hj/lyk=;
 b=jDC9jctgIZnrQJkL1bclVxrjIJn0XZRlqFJIWDgF/p2l5rvQI9whTM3JLpGv9na8o4
 +AG8o1mtWyZEL8h4naPkzaGH4i1x9485FpBqORt9wFQphNcpNM0pEjFS+rBt+58WwC5q
 AJwHXqRySI4bfUbAVHjhYadWzoEfJ7+FFHTLWIArsXFCWF6/vJsdms/Hxl+Sms0S8Bcm
 MIHvCcKmzYgXZbtnyl8fmS5KB4MAiUhDnZ8wwJNvq3rOORLneIlFCv3YBSM2OHLX8p40
 sHfUw77oV3XABc8jBo8Hto0ozB72rpo5oVu3DoI5wdKWTafh941j7aGkuOP/hewTqT+C
 kEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y0H2jt6cspPZVFJiMqrsCk68oTN2bKE6m9749hj/lyk=;
 b=Dw8GUABIAis1hCjZ3V3/uWdcy8VWEVqWdFCtPEVRkC5nMGarOW+1xuN1QPMjc0zqz/
 p4kkFG5ZWVLH2WqoMAvTqMpnD4YVtZZ/v+CSveaJ4q+5MwgTBlf/GOT86P+BCX/QeLZb
 zOWdN/iEsK47nbcBsDn9V7TeKXninQQvxSyO8tjJ59APLzRm3eg8aN6slv90vUJfv+Nb
 n02W/MGf8k9BK3b/OzfNP7pldaYX2K1MsScM2nrYm7EYzKKltRyYLUZ+jXUd1Wm9xSq8
 hZyBhLEgtwE9IfuAIn5AL+L339N9Tb8b2LoVLzafTqaOBoPmc9TfNcpiF5gHDtdkhSKZ
 Q29A==
X-Gm-Message-State: APjAAAUVzOgdHO1GL1MOurFn/+iO5k6bOzUY5wWMtFtVra9WEtwltxRj
 qs+N/xxbImUBymEpkuica5TJzxioaHyy5R6MJTF52Q==
X-Google-Smtp-Source: APXvYqzZaMwale3r9tiaNwBWYSngOPOfZ8jkHAei/E67qjtEs6k0WVYRcwVUNG8+lbGTFPdrNVhR3QLAkUo3XwWjg1s=
X-Received: by 2002:a05:6808:9:: with SMTP id u9mr24747913oic.98.1571057297024; 
 Mon, 14 Oct 2019 05:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191003154640.22451-1-eric.auger@redhat.com>
In-Reply-To: <20191003154640.22451-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Oct 2019 13:48:05 +0100
Message-ID: <CAFEAcA8C0tPC7cYYCKvfO+tGoNHcfGEQ4ah+32c1cYWAZx+Zhg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] KVM/ARM: Fix >256 vcpus
To: Eric Auger <eric.auger@redhat.com>
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, Marc Zyngier <maz@kernel.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Oct 2019 at 16:46, Eric Auger <eric.auger@redhat.com> wrote:
>
> Since 4.18, KVM/ARM exposes a KVM_MAX_VCPUS equal to 512. However it was
> reported [1] that a VM with more than 256 vcpus cannot be launched. 5.4
> fixes the situation with 2 patches:
> - one upgrade of the KVM_IRQ_LINE API [2] supporting a vcpu id encoded
>   on 12 bits,
> - the reduction of KVM IO devices consumed by each GICv3 redistributor [3]
>
> This series uses the new KVM_IRQ_LINE API and also checks the associated
> capability (KVM_CAP_ARM_IRQ_LINE_LAYOUT_2) in machvirt.
>
> Without the series, as soon as the -smp arguments exceeds 256, QEMU exits
> with "kvm_set_irq: Invalid argument".


Applied to target-arm.next, thanks.

-- PMM

