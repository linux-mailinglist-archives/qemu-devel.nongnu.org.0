Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEEC100698
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 14:37:00 +0100 (CET)
Received: from localhost ([::1]:34074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWhD9-00016U-4d
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 08:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46210)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWhBu-0000PH-NI
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 08:35:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWhBs-0006Wu-JO
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 08:35:41 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:35914)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWhBs-0006Wb-Bg
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 08:35:40 -0500
Received: by mail-ot1-x335.google.com with SMTP id f10so14504825oto.3
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 05:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GuOtEJ5z4Wnwzz524426jAKDDbWyqt68knGVTzMGhXM=;
 b=MgpAT8ijWPqkJtg1Y/Pe7HXWuw6Whs2A2JKpD9Za/OvmfrK8/LfNdTibz00VoIqyfl
 Wf94CKvM+ohuF5aWgQkQTaF1oqZ4hC38h5kaGaOAkXNOGrvyetwevtPQaceYkdU7D+bG
 nx7ez5c0Z59ggA4r8r+z2j1/iHpui/utWxCQ+HDKom1Rvlo8T29EAN5CVY02gAlEs/mG
 AXXS4cOiT86mMCGdZ8GEo3ahTV3+fIYqtKVPGlzXkVpl7y8dM+fky0xUVI+C5HBO3Xn8
 IrKLXfHjqlV9Nq3FV7pCmn26E8ujqYk0lELJCPE/iaOv2/WRXkdGCskId1NSMpdmMmz3
 B28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GuOtEJ5z4Wnwzz524426jAKDDbWyqt68knGVTzMGhXM=;
 b=GPyAtPQn2vH97fzhuZlvd665DGLfh97rdUb+7f7UUnIN+PlTgo77NnVuUpF8yQSPwW
 SSPXZB9Uz4W0wHDqs6LfzkXLp9qDAYoF6iYuzpeEj8cnPQrhCahdf0xu+sGCnpN/O7Yf
 KFbGk0PbMH2BvPEAcxWGIbZHXcES4vJ812ELIVyaamUN900JUwPu3O177x/P6co5EnyX
 V5/1Ceo1aZ6jlI3E97FKehMg8+K1ffIjGHj+q8+zd+5zWNeKra3sK62ITMYLbHFP5LUD
 c2I7tir/jJbwx4+KNwjWLqIpxpWf937hW9bwa4H4l5Svh1c1oPWP4HtgP39TYWxPAkvw
 94Lw==
X-Gm-Message-State: APjAAAUUigCPi+8DLCVjAiQgi8d5803FQsg4h7/RWkXR3wNhXu6xbwL9
 8j+UpOk3Nwj9juAdbatpYDTV/qm/MBjufAbj8rznnQ==
X-Google-Smtp-Source: APXvYqwxf8/bQauu4paEs7Ta5hVXXZ919tVhlTK7dbNzs04SYLb/sFeYr5AX8LuyDGaTBl/hujRHCBxZc2XESibRphI=
X-Received: by 2002:a9d:68cc:: with SMTP id i12mr20661837oto.97.1574084139661; 
 Mon, 18 Nov 2019 05:35:39 -0800 (PST)
MIME-Version: 1.0
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <9d7a2c5d-df78-ef67-87af-3860fcb7aee8@huawei.com>
In-Reply-To: <9d7a2c5d-df78-ef67-87af-3860fcb7aee8@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 13:35:28 +0000
Message-ID: <CAFEAcA8dAOiqRX2Uy9g2f=hO56Zx6pbEaLY3AQ8-3SX4YK9FkQ@mail.gmail.com>
Subject: Re: [RFC v2 00/14] Add SDEI support for arm64
To: Guoheyi <guoheyi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::335
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, wanghaibin.wang@huawei.com,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Nov 2019 at 06:55, Guoheyi <guoheyi@huawei.com> wrote:
>
> Hi Peter,
>
> Could you spare some time to review the framework and provide comments
> and advice?

This patchset is on my to-review list but there are also
a lot of others on that list...

thanks
-- PMM

