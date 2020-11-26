Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE22D2C5DD6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 23:31:22 +0100 (CET)
Received: from localhost ([::1]:51532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiPnN-0008QQ-RC
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 17:31:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiPj0-0006Cv-F3
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 17:26:50 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:35763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiPix-0001E5-HZ
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 17:26:50 -0500
Received: by mail-ej1-x643.google.com with SMTP id f23so4959344ejk.2
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 14:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0y4RpvpeQrQuyoRlFv0Z0WA/0BbXyrS+nASu+yXFU3o=;
 b=hElLGIZyKxfkWo5oFGt112j81TeN/dNGw+p6eQPpW5gD1U1gxlLNgXDXqH20REMoUB
 H7WH3lBucKZlCQ7UZM3tx52vobqNALWO7RXL8YglfbKxxPf7keFtYeVSoo6uNYeGzHWI
 EPeLAmOhV8Z5lBb0nY2OUmVzYmrqkCdC1yUaX81SrfGhhq0OfrbJQdCXTBEyKVRIy4IH
 ETdYQILz9JIxjGDnbstZwV5GZwrLpba5Jkqh9krRrZBL2ynI9wXm9Rqm41lwiJKKmlvX
 PpXno1N+zTThsK+mDjPJGkCDUhjlC1gbbC+jDoE7XQc/VdOIqHt7/Mt+2PfMk6E8rdWF
 85bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0y4RpvpeQrQuyoRlFv0Z0WA/0BbXyrS+nASu+yXFU3o=;
 b=JSnsoLREU7/G18k+5U/utrnKYA6M2mnjNMkitxCYpT7nGHZhLZ954gROEONGDE/R46
 BXUIuhDuPdydnLkv4uv5xiqujqPaOP3LKQy3O97q4cpRmN/C/JdNpdkSBUj2gfZmirU7
 Lb+qMI6/+9iM+l4HjjVcX2cGbg3HrX61XuWqIohsPLICgOajgz7HhIV7GzBSsSj4NA76
 dq3onOfseOb1mc83ZeMGNFKus/IJ2Km1NT+OxDG9LDXkALbN5ZBBQmdjfjBbZv57tMSv
 5QUaGKxjaQdM/bd5wLs4Enpiq3VVpAk2hO0GFk6Tid5p7w5XCNwR2Hf19wovYeUyc9DA
 /vLA==
X-Gm-Message-State: AOAM530ms0+w/WHasZXikOt3Rwb3YH5ArYVXfuzZ4sbMBEYOBoMnq+DM
 RKeQeINM9Rjf3T2m0/SrIuOKDyxXRnopzGfK3xsgFA==
X-Google-Smtp-Source: ABdhPJw4oOxdRXdjX8imlCnocVLUlvx57b2UaU+p9G1M7KutPCFI6hHnZGXfngm1CQOQvfRfN5vM3hGmlPLf9/OjUeU=
X-Received: by 2002:a17:906:d8a9:: with SMTP id
 qc9mr4615748ejb.482.1606429605919; 
 Thu, 26 Nov 2020 14:26:45 -0800 (PST)
MIME-Version: 1.0
References: <20201126213600.40654-1-agraf@csgraf.de>
 <20201126213600.40654-5-agraf@csgraf.de>
 <CAFEAcA_XZu07Fg3G05VWYDYTJfMSAzOH5yyd=rFLJVa73juDtw@mail.gmail.com>
 <785c216b-d4b5-b65f-1ddf-4c6374b72ece@csgraf.de>
In-Reply-To: <785c216b-d4b5-b65f-1ddf-4c6374b72ece@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 22:26:34 +0000
Message-ID: <CAFEAcA9QUfBQpmH=8_A+xDm53GkkOgFEDnkTDXOX_1A-bFg0Ng@mail.gmail.com>
Subject: Re: [PATCH 4/8] arm: Synchronize CPU on PSCI on
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 at 22:16, Alexander Graf <agraf@csgraf.de> wrote:
> cpu_synchronize_state() sets the CPU registers into "dirty" state which
> means that env now holds the current copy. On the next entry, we then
> sync them back into HVF.
>
> Without the cpu_synchronize_state() call, HVF never knows that the CPU
> state is actually dirty. I guess it could as well live in cpu_reset()
> somewhere, but we have to get the state switched over to dirty one way
> or another.
>
> One interesting thing to note here is that the CPU actually comes up in
> "dirty" after init. But init is done on realization already. I'm not
> sure why we lose the dirty state in between that and the reset.

Yeah, it sounds like you need to figure out where the dirty
to not-dirty transitions ought to be happening rather than
just fudging things here...

-- PMM

