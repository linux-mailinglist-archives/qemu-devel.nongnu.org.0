Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321EE33F120
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 14:25:39 +0100 (CET)
Received: from localhost ([::1]:53694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMWB8-0006wD-8P
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 09:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMWAL-0006Vd-Hu
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:24:49 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:35821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMWAK-0005EE-2H
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:24:49 -0400
Received: by mail-ed1-x535.google.com with SMTP id dm8so2264390edb.2
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 06:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jXtSol+iGpcs2V2OVVJMNo/VvJT786q/OHGL7jmIE+E=;
 b=KgZHv6OMzCzzr/HxBsOLBCBEElO2/ZDee3jV2gHdS4SZlk3pzp8pI5AmloQcw7mMvg
 KFnyM+h72cwOBw7AvCfRuJWQK7UcoR2dDm8x9q2dDsEC14/gdMcTSSbh1Ese105OkGjn
 mh4+CrMqF7d+7C38ywYxa8TXJEnROsxageH0w1kJeeeL+RyuAvvuHHo3m5k1M+K6u8b/
 SIRJnyASRCfuhXVYLHPHqH3nB09eTFfkE5mWCiYnodUg7455053hMHtBVQEMKtRx8oeP
 bFPU2ESL9D+qKbUyo2FZlg7M9LRBzyr3/EbQ6w3LaK5CU4xbT8sbEIGM31qSV4pdw1hw
 XdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jXtSol+iGpcs2V2OVVJMNo/VvJT786q/OHGL7jmIE+E=;
 b=ED41RPq50Xy5y18G9M/6vTo8wnEsokLsqffSMxI/CgbZOVWpmPUlqM44B90aIViHiX
 URd+W+cbYzbsgHrXL7FNImHyhhj/KQt+TtSzLoGSnWvPKgJD0mRkWgim1iKJ17sZbHCA
 GXY7iWvacm0GYKzVd8TrWEwKWjLandWqevIQkCsGZTBgxCvIV2YFkfvdp9UwsQcRPB3I
 yUHwzDfEGdBpkqr0WLDnTlG41vYPkXnecfqlM1pUCAil+T++gjdUIO/+z8zMXKLNjKy6
 qwbV7tonWDOvdHba4nXCI50h9pNhqKdMB/BK/N9+SpHpNgxJb2ben5cxQgN2AidE0hgF
 K3SA==
X-Gm-Message-State: AOAM530DX5tl5TCoVUgj5+881iDVHbxzU2VKoi8TqvbiwBJYqTYpwaxg
 00UlYpJ1CThCAwolNzumUwOyhqf+9BgstJaOgCx0Kg==
X-Google-Smtp-Source: ABdhPJwudZS4yWF/imJRyT9b2ooH6gv/xSSEcaJFkw1AETFzK3LXOlKl57X9xOXZA1jOaUVKGuUbechFKI8fS+aLdcw=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr41486617edv.44.1615987486490; 
 Wed, 17 Mar 2021 06:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210317110512.583747-1-thuth@redhat.com>
 <20210317110512.583747-3-thuth@redhat.com>
 <CAFEAcA89BmZ7_d73Te=DXxDNc+W4NuqXZgpoi9JwsMN0_nh6pg@mail.gmail.com>
 <61029024-17cd-41df-a9d9-ec3323654d76@redhat.com>
 <YFIBH1xIeTAep9p4@SPB-NB-133.local>
In-Reply-To: <YFIBH1xIeTAep9p4@SPB-NB-133.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 13:24:35 +0000
Message-ID: <CAFEAcA-z6708M67oXnOMx-r228192VPanATn16Yf=Sbk887hPA@mail.gmail.com>
Subject: Re: [PATCH 2/2] cirrus.yml: Update the FreeBSD task to version 12.2
To: Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Mar 2021 at 13:16, Roman Bolshakov <r.bolshakov@yadro.com> wrote:
>   result = asn1_der_coding (asn1_element, "", NULL, &der_len, errorDescription);
>
> The result should be ASN1_MEM_ERROR.
>
> Something like this should work as configure-time test.

Unfortunately at configure time you can't run code, only
compile and link it, because you might be cross-compiling.
So a test that needs us to actually look at return values
from function calls won't work for configure.

thanks
-- PMM

