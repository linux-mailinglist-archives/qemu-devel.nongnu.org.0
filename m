Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4865F4C428B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 11:39:37 +0100 (CET)
Received: from localhost ([::1]:58242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNY0d-0005Fd-3F
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 05:39:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNXx6-0003Wq-If
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 05:35:57 -0500
Received: from [2607:f8b0:4864:20::1129] (port=34266
 helo=mail-yw1-x1129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNXwn-0008PJ-4E
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 05:35:55 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2d625082ae2so28712627b3.1
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 02:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nZvJnv4RAYguQJVq9bBZZ4WbyD/Wih8AxiX28JQVvBg=;
 b=aNhSNu7e4uM3jZ6ajy5Rx+i6HBo17MkvegOJHnIMWEZWeMXgVlkoR0p5g7uupe/cgt
 ftBb8oSvLF/Y6105Kbz/cXky2YmRfq5GwM7MzCgh7xHpfFTkQ08wtUJ8hLiCWgBknn1d
 XZoE1SLMih9nkOxFc4oeN/WFJW44O4ezyEDpoGv/wbnKbvvU8QGQ2X8pbUP3LXnyMuVI
 gol4yztu5+ddEP6DKOYtinnY3jOzRY8d9HJrrqug73wrRUboAnBzh5wxwgg4cyhIbUGs
 goxUQHNh1XlkliNdboQCeYA9Nvnp1a3QXVSycAZCMHjWjkcdVZ+bL5upT1EUwCPROvjj
 Pezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nZvJnv4RAYguQJVq9bBZZ4WbyD/Wih8AxiX28JQVvBg=;
 b=cn4rzgnJgOP/mC4iBGHl0mzQi15yqOL0lQugRH6SRjvtLNXOQ4SdHZ4lHMRSHdNRbv
 9Ceusd/TTIq54r9iR2oKg8x8ct/OkSp+HKBSLZ75vbwipMN9UhDRMmL3k8jhSCvcoeiM
 u8AYuKXK89rfeB1F4I8ufUV0Ix8D5AVPQ8Th2nOlvw1UPQpDCgfIaNZrBDJ9r2VdyTK6
 OqLigxpG6ZRVYB1YKFcPLCwiUTyP7fA3rT6q+ZI1nXW+l1m2o2/7ubKRxF3bTf5YaIRb
 fxAc9aSmrnWiMVyMFehkJoTCtr3LfI2TixeBYKzhjqyp0vC1xWovXBP+tG4ety1g4Od8
 G14w==
X-Gm-Message-State: AOAM530JBT1VK6NRsU94OINZ1vNQy6zxko6oDeeI9s0RGhZAZK7qIzcj
 X6xWSZ86EHzXnEIrc1yzboSwnGEha8xld6jRack3eA==
X-Google-Smtp-Source: ABdhPJzBRfW8W/IU48uboCfUUJnr3qbIRIk77HtJkvSojwSR2fkuNcybOIBydWwjutjH97YrLxn9O3ZlPu6jNkujp7I=
X-Received: by 2002:a81:8c9:0:b0:2d7:6801:3fcc with SMTP id
 192-20020a8108c9000000b002d768013fccmr6913228ywi.347.1645785328055; Fri, 25
 Feb 2022 02:35:28 -0800 (PST)
MIME-Version: 1.0
References: <20220214185605.28087-1-f4bug@amsat.org>
 <CAFEAcA9MpiwF4m5tBfDfnq=QubHA=Ej=XvEodBbVcBbi-MriCw@mail.gmail.com>
 <976be1ee-0aff-8097-5390-7a6e4c286d9e@gmail.com>
In-Reply-To: <976be1ee-0aff-8097-5390-7a6e4c286d9e@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Feb 2022 10:35:17 +0000
Message-ID: <CAFEAcA9HE2Qrh3YcqV=LVZEUQEfRxtXQK3Pd4xV5s1Z8JHa8ig@mail.gmail.com>
Subject: Re: [PATCH v5 00/16] host: Support macOS 12
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Li Zhang <lizhang@suse.de>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Feb 2022 at 09:26, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
> If there is no objections I'll send a PR with the non-cocoa macOS
> fixes for 7.0, so Monterey users can build QEMU without having to
> disable failing features and flooded by hundreds of warnings.

We should definitely get this in for 7.0, but I had the
impression there were some review issues in this version
of the series, so I'd appreciate seeing a v6 first. I'll
try to get to it and review the rest of it quickly.

thanks
-- PMM

