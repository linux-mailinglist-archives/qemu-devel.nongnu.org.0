Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F57A11732C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 18:52:25 +0100 (CET)
Received: from localhost ([::1]:43588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieNCq-0001k6-5j
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 12:52:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55896)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ieNBs-00019T-6F
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 12:51:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ieNBr-0002vm-4W
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 12:51:23 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43025)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ieNBq-0002vR-UJ
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 12:51:23 -0500
Received: by mail-ot1-x341.google.com with SMTP id p8so12943061oth.10
 for <qemu-devel@nongnu.org>; Mon, 09 Dec 2019 09:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OypWHPqB8CZ/V92Fqh1GsT7znQ/C5e/e4lOcHCGijus=;
 b=YDX4QcWfylmrzS7SMTCTNhfGGptDYdF8ojmqUi+p7bf13wwkG+6SrCnjeIRZDWtSN0
 OZ62dFYEg7wy4qHyvw9F4GHEDGhfh1pZURMWby4OTYCpJ9QhN+/OB2w71eI/I+v4a9A/
 shMNl3Hn8HQDsrqNHlIcKWzBIf9sqvE7ipXGv/lhsNiGEsftc/1hEMgu4SiTnSY1STXd
 2ENGgPdzefSR2Vw2tzxOA9jtdCCtKUCymfLLDPUIFtdtk8cPx+2UZ47AdiNhFtfejTg+
 pZF3WXMyjF0fIkuQSNvABQD3zpZfrVQLR1EPL/XxR0ODRd6/EKc1geP5oH2ke+eyMr3R
 Jrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OypWHPqB8CZ/V92Fqh1GsT7znQ/C5e/e4lOcHCGijus=;
 b=kGITsDYjr1nynGFw8I4+Mj90yeQb7r9Ahl+ahCMv2UVJI3JLfYofh1AWzjzchHVqmH
 3FGIwBD/Efr8nH7NFuwueA+uT60CkmG8al4jRkOLtGz1b9xzX4/dKWDh6KcdLzamP8ql
 hmfkdCXFpcX2Vwy2FnvdiVWYNLhKyTNVqE6wKYCkHvmdVb8nEgPy8+swpP6SvJ0EiahA
 hUJyMJOOaCzNcMJs5oayA/h6CfDYTordkrbZJkMPeugqb8nmvxTeuPX9KPtQ1k8OBpfj
 cT7tZbVpmbaxiOW4fV0Vz9Lm/tRYyNsOo7mIE5po3MN+DBLwc90V0n57+c4iyTbqF/jR
 c2dw==
X-Gm-Message-State: APjAAAUEgBqiMm8j6BkvefUaoUTtJNr5pDKyjuvjfeP+FcOk6CxF25+z
 RCWy7gluONSM7ZoWwQOXp967NS4KqBnk5qiZ6A2iZg==
X-Google-Smtp-Source: APXvYqwHOSUtLk0t5QXyOY0CWdRL/tm6o6FSxBCfMjLZOnUP50hdQQe6EBUwVPLEE2pHP5XayjJPX8XuZSxTw6ttgh8=
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr22868775otq.135.1575913881931; 
 Mon, 09 Dec 2019 09:51:21 -0800 (PST)
MIME-Version: 1.0
References: <20191209063719.23086-1-guoheyi@huawei.com>
In-Reply-To: <20191209063719.23086-1-guoheyi@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Dec 2019 17:51:10 +0000
Message-ID: <CAFEAcA_cP1pW=WC=0M7S37TRi_4uwaA_kQRTJ_xRkqbq48eLTg@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] arm/acpi: simplify aml code and enable SHPC
To: Heyi Guo <guoheyi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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

On Mon, 9 Dec 2019 at 06:38, Heyi Guo <guoheyi@huawei.com> wrote:
>
> After the introduction of generic PCIe root port and PCIe-PCI bridge, we will
> also have SHPC controller on ARM, and we don't support ACPI hot plug, so just
> enable SHPC native hot plug.
>
> Igor also spotted the store operation outside of bit and/or is not necessary, so
> simply the code at first.
>
> v6:
> - Fix "make check" errors by updating tests/data/acpi/virt/DSDT*.
>
> v5:
> - Refine commit message of patch 1/2
>
> v4:
> - Improve the code indention.
>
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>

Thanks, applied to target-arm.next. (it's a bit awkward that acpi
table updates require also updating a bunch of binary test files,
but I suppose trying to make the golden-reference be some textual
format would be not very feasible.)

thanks
-- PMM

