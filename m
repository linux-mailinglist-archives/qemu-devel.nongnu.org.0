Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D98C3D24AA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 15:32:39 +0200 (CEST)
Received: from localhost ([::1]:48240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6YoY-0001Ft-72
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 09:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6YkL-0006LO-Lm
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:28:20 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:46735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6YkK-0003s9-BB
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:28:17 -0400
Received: by mail-ej1-x62f.google.com with SMTP id c17so8329097ejk.13
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 06:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HB3fjmBy+2S0/yWo6feEEIcp9TK6xEjDwv2/H4f8XCU=;
 b=Fu6i+MndvDS6hdYz2VC4EARW6i1Vdx7yrKOXWY0ihC9MtaWWoJy9g5UlIEMeSA4DBP
 4YJOuAJWi4T3qnyK0OGIqduxZPH0NIaKkrPrt7Kz3BK+rUepkNwY4pROED6xyZ4KPgwG
 yiyteSN9VuPX9KCVWvShLDkSdUWtDzBrzT1TpIUf775yxWXMa2tfC72srYjoHSyQpVAL
 Dg7lKY2gO8ycYDNRi+TilsCK2AF4HpApU6vgmwcfbG8qjYUq32xyBlM/LcIE6wFA37g/
 xC3fOKylgRgwT0XclP6guiwaHWBTtzVUpF4ZZfmt+pKVv963q007arAdu7aEddVTUxuR
 GiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HB3fjmBy+2S0/yWo6feEEIcp9TK6xEjDwv2/H4f8XCU=;
 b=HudasAqQDTbWoYHFEoduktzC+zBwfL3PQYHjWkWW9lGru0NrbR9212m07D6yyC03lr
 TZ1w/0BSZBTBU1q1XcYLzWixRgsK/KVkPBFGlDXviVLT3HKnQImGD9FarKKLh45dSHDD
 kYq9MmRakmYUiM5W4xEQ4mzy34JZC93Z2Cr7JA1a2/rQhCS/PD//Mh5SIpJM8t6rkQuP
 jFeniFMnX7/JnBN7b7sFYOFiD3DM/hN6WHHbqQxdkLj4dvw+WIwgJM+bibQDNVx6l5BI
 1u6Ibfq7EmLoL2GBuaFXm/pYtrN7hEctbOGdc8rGn/9mC/tqOSNGGkiokBcOkSKQEMVv
 X51w==
X-Gm-Message-State: AOAM530PP1jOlvWpfqL0e2E+rPQIlHgVzQJzombxn8HukRBWlZVM0TMQ
 cE9/vK4x9fjFi1OlJJrdzN0LioDFh07fwrkMy1QabQ==
X-Google-Smtp-Source: ABdhPJz68hPVq2jYzrF9Jciel947Q0lMtfHAxLf1gzuI/EPy7FWRhRoHCaF06bMw8KykUm9fNAsw0N6LfHb2SCmNx/k=
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr42953283ejc.4.1626960494343; 
 Thu, 22 Jul 2021 06:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <ef4df56d-5b60-99f1-fec6-fe2e62434d3f@huawei.com>
 <82c78e1f-98ef-982e-fbcc-34da6b8aaad7@redhat.com>
 <91d179e0-8365-e3b4-cee6-d05ce918a32d@huawei.com>
 <1d9123e9-705a-36ef-3286-b2f347ec5894@redhat.com>
 <5ccf2a18-0615-8f1c-47cb-163f80037feb@huawei.com>
 <eb63f96e-59e8-55cb-d8ba-119f75ce032f@redhat.com> <YORmWw4MUBV+VTen@work-vm>
 <fc630856-cc51-4830-9f85-4cf89e632819@redhat.com>
 <87fsw6ebaw.fsf@secure.mitica>
In-Reply-To: <87fsw6ebaw.fsf@secure.mitica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Jul 2021 14:27:33 +0100
Message-ID: <CAFEAcA8TjHHoOjOn_iyfKRNVpHYQTa3Mg-o9tfXCErDEYtUWDg@mail.gmail.com>
Subject: Re: [question] Shall we flush ITS tables into guest RAM when shutdown
 the VM?
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Shenming Lu <lushenming@huawei.com>, Kunkun Jiang <jiangkunkun@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>,
 "open list:ARM cores" <qemu-arm@nongnu.org>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Jul 2021 at 14:19, Juan Quintela <quintela@redhat.com> wrote:
>
> Eric Auger <eric.auger@redhat.com> wrote:
> > Hi Dave,
> >
> > On 7/6/21 4:19 PM, Dr. David Alan Gilbert wrote:
> > That's consistent with what you suggested in the past ans what is logged
> > in the commit message of
> >
> > cddafd8f353d2d251b1a5c6c948a577a85838582 ("hw/intc/arm_gicv3_its:
> > Implement state save/restore").
>
> Hi
>
> Ouch, it is really a mess.  Why do we need to save it to RAM instead of
> saving it to anywhere else?

The ITS tables are in guest RAM because that is how the real
hardware works, and so it is also how the emulated version
has to behave...

-- PMM

