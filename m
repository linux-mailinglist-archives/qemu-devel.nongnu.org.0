Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E14159801
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 19:18:46 +0100 (CET)
Received: from localhost ([::1]:55178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1a7R-0000nc-0Q
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 13:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1a5e-00080F-JO
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 13:16:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1a5d-0007ta-Dn
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 13:16:54 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:35855)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1a5d-0007mh-68
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 13:16:53 -0500
Received: by mail-oi1-x242.google.com with SMTP id c16so13724843oic.3
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 10:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CM3Rm3q1kjx0iJ6AQmnsy9Wo09aKIkJnR9n38UvXiDg=;
 b=TzldmBXCbYLH+62cxs4VbGSKPS3n9TpwOuZHgrRcw7H51vqgpsAbk4FCPOtGjv2dXo
 Vn1OdaGK9DRCLlcPaEYXc3pf7VDt5mkVheazGmvSEihNA4l+EdvBLlQGQBmpJUsLrMWF
 koFT1r6pnPcbtpZvwTnwKP1Y4FF0X2FyE4xI4i1EvL9cKQ0EAOw1olQQR+aXo8CO3T60
 /RuL7qGKnD5uCSWSzaxMKGmnwbC5VqPlp0Is6oz32yGOVgH2daEKWAnA/BrgyI743cRc
 OrVJd+g4Y3r3FwFYH26lApUzgT2kNIpVb3H76TRF7tHNTrEwRwJ7WRuL9Hi1WevrCZ/F
 NqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CM3Rm3q1kjx0iJ6AQmnsy9Wo09aKIkJnR9n38UvXiDg=;
 b=rOsogNunibgbU2ujtA9YrwcEthErcwK8LpABX5eq+p3EfOHvax+2ZQimCJ/ihTiNhr
 udoXqbqYXZmTEIBRK1WKXsoQbIvYYvqztcwQRJ4xs52HJwr9NnsT2lqGn+SN9w8yS6T4
 JDrfqf/xdAjeWsO+6w9Nwrc2vbcXMf+kumCSet2kOJqZdWjjh4vW0L6pdhlhqiRAUadH
 Nay56JVRdyuoGUODlHXhmc7FU7MmD3er5iJtKAIjKmOsQrWEB8Pkz3/K7ww/Z9wn7t73
 mxn3IcMePrPYjnSFb/WcpkKUqXuUqmMR3lUWCwUPiPxv4ib0DS8O0hnWV2HvXhbv2vZX
 7Ryw==
X-Gm-Message-State: APjAAAU8AS2qbuOPedWNpG2nBKQB7ag8IQ2y3D5k8wK7g3EuFVE4bRHV
 5//G0xDKufV71puJdqwSBzvE7yDVXuEEGFf41wSwpg==
X-Google-Smtp-Source: APXvYqwbGqn1Fl5ptAqzMrx/DiizHg8EBDkfk2c+1Dob4w7IE2D5wPGR0plOa8RSHKQmP9C28gxSTg9ECLWZLSfFza0=
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr3573146oie.146.1581445002996; 
 Tue, 11 Feb 2020 10:16:42 -0800 (PST)
MIME-Version: 1.0
References: <20200204014325.16279-1-guoheyi@huawei.com>
In-Reply-To: <20200204014325.16279-1-guoheyi@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Feb 2020 18:16:32 +0000
Message-ID: <CAFEAcA_O10vtj341KGRc7BmBJWo8SEqG92qktfJCwWip+cYM-g@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Some cleanup in arm/virt/acpi
To: Heyi Guo <guoheyi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 4 Feb 2020 at 01:45, Heyi Guo <guoheyi@huawei.com> wrote:
>
> Remove conflict _ADR objects, and fix and refine PCI device definition in
> ACPI/DSDT.
>
> History:
>
> v3 -> v2:
> - update commit message for patch 4/7.
> - remove diff keywords in commit message of patch 7/7 to avoid applying patch
>   failure.
>
> v1 -> v2:
> - flow the work flow in tests/qtest/bios-table-test.c to post ACPI related
>   patches.
> - update commit messages for removing "RP0" and "_ADR".
> - add 3 more cleanup patches.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org



Applied to target-arm.next, thanks.

-- PMM

