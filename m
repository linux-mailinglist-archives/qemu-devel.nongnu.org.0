Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B765A6D1
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jun 2019 00:20:16 +0200 (CEST)
Received: from localhost ([::1]:36678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgzE8-0003yQ-1d
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 18:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39732)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hgzBN-0003Mh-TW
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 18:17:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hgzBN-0004Rc-23
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 18:17:25 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34711)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hgzBM-0004R3-S9
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 18:17:25 -0400
Received: by mail-wm1-f65.google.com with SMTP id w9so10213362wmd.1
 for <qemu-devel@nongnu.org>; Fri, 28 Jun 2019 15:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1rlF7cCLxiyHA1UtVgDf96G5g5jR0Pmgu61bw9CTuyE=;
 b=Sgt0qFDnpDaFV01fE9Hw8htSDmUNFHwRXeBuhSpa4jlEwVZQuJhvLdOWD72pw9PZ9Y
 EzdBrfqfZs+nxMAsas6jFu1lTmVNuRHEvdB8mLYOVO08t5rhr9+PsiRgwvqHAQUYHuUB
 KEdOP/5RaLqmd9Slvi2ypc3rUsbGKdE59wjnGe+bCar6Hik3emFOc7MSW7sXu3zizslZ
 LoX6zZkYWWfwoS8HwnsOHsbUiO5K+2lzuG6/FD9Fl5qxjcKsgtw07FcJoTUC5INTRXUd
 8eVYPf8IPMJirlyHK9mgVB/di2cg1zJyrnJNw9kbP8DNSGg+/Ai5yIhc+6FcPiI4I3qi
 fB8w==
X-Gm-Message-State: APjAAAVxPxIfhMXy9J4dRnN/VkRKpoYo+vPzwIwY2csQaPr5Yt09s+LS
 /HEb1lF15G7QmUCzTymmBthr8mbf/sQ=
X-Google-Smtp-Source: APXvYqzIyu/asXvOxrvCAhouNgQZTg8bQ5PyU7V5yxPbuFvDbKOH7lDx7hWZi0wVqucLX1lOGWYe8w==
X-Received: by 2002:a7b:c081:: with SMTP id r1mr9035095wmh.76.1561760243706;
 Fri, 28 Jun 2019 15:17:23 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:a5c0:d60f:9764:1c58?
 ([2001:b07:6468:f312:a5c0:d60f:9764:1c58])
 by smtp.gmail.com with ESMTPSA id z6sm3205621wrw.2.2019.06.28.15.17.22
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 15:17:23 -0700 (PDT)
To: "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>
References: <20190628115349.60293-1-slp@redhat.com>
 <20190628115349.60293-5-slp@redhat.com>
 <20190628100458-mutt-send-email-mst@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e2268d2c-6fcb-2567-1993-4b5b65c949dd@redhat.com>
Date: Sat, 29 Jun 2019 00:17:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190628100458-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [PATCH 4/4] hw/i386: Introduce the microvm machine
 type
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
Cc: qemu-devel@nongnu.org, ehabkost@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/06/19 16:06, Michael S. Tsirkin wrote:
>> +    assert(kvm_irqchip_in_kernel());
> Hmm - irqchip in kernel actually increases the attack surface,
> does it not? Or at least, the severity of the attacks.

Yeah, we should at least support split irqchip.  But, irqchip completely
in userspace is slow when it is not broken, and it does not support
APICv.  So it's not really feasible.

Paolo

