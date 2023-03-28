Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 921D96CC767
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 18:03:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phBlP-0006EK-EB; Tue, 28 Mar 2023 12:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phBkh-0005bz-WB
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:00:52 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phBkg-0003sy-BH
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:00:51 -0400
Received: by mail-ed1-x531.google.com with SMTP id i5so51986761eda.0
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 09:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680019249;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I6BTNt9OKaAM1y9egPEEV1M6s38Xz0EN5MSbOh/jFMk=;
 b=I5DkcV3+wUQIzAebkcrha94soGBYANzEWnvwblJnR7aVCeX/6jcxDqhSqoApzli5A7
 DYT916oHMfgUs51x0Vjdmm8EEMOUnJEX5q2sJedTo47AewQh2iZ5+3oGTbNZamXQmMcG
 UlFNHNE9JjQlFonis3uM1nnj9GrwECt0sXYYLqrSTdUpLZ+q/g4fd7OcNmvjuZIIWsfw
 5HSdW0WkL02DAK0369g/PNqeHrVrp99dqnFQTxiegWz7j9YgA5tPLixYnWZk+RyNVPjA
 0AqyAcGyx4+fvSBWKg8eCSaUuVG+XeDupbebBxH3bbOofxS34sbdfRRU4XxcTrULNNJR
 fBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680019249;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I6BTNt9OKaAM1y9egPEEV1M6s38Xz0EN5MSbOh/jFMk=;
 b=2od+Ttr2rB86I6lzaWePzdIRptQRJBrkfJiXcCpRrmbS92Oc8EXn5/+ZmNl9fWKSDl
 1NJFUGCcNihHPI/se4viTuKGuZFYJ3xlf1X1Owz+iRAOTOS9guj3qR/NsOK/Ev7AObHE
 Ii7+HQ+53zbM4vHuKQDJBWSWAQYzDKsuyfMMaerFiRRE4+javJFcaeLHC5Owz1gP/ELf
 B41jVvfMHpZ9/rlSohA5YR97/tUG91zeaZ4kIyCG34FldqN47N/WqdOuoWWbdC5sS4k5
 jqS7ouavfHSEe6/e9L/rzXaem4jG2APazPPG3mybcxySdizoFDK4GWCEqbeLjzVqQtlw
 nJ2A==
X-Gm-Message-State: AAQBX9eQ4srdHvoTVGo3tORrXKMoiq6sHOAa06J95Lz41JV6e43P1aNR
 AdyEi+IVPhCZV1IAwNu1n9vQPf2wkADV5NwNCEK6lpXHZqoBYx+0
X-Google-Smtp-Source: AKy350YMj82wsReG8YyWtdDOtQUEfKsK2Zn/uq9p8Qkr1WVGtYQdCdoKyrzRFdUzpXuJEe09GTQKNYHN43aI7eBmXoA=
X-Received: by 2002:a17:906:edc9:b0:924:efbb:8a8b with SMTP id
 sb9-20020a170906edc900b00924efbb8a8bmr8119927ejb.6.1680019248955; Tue, 28 Mar
 2023 09:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230328051917.18006-1-jasowang@redhat.com>
In-Reply-To: <20230328051917.18006-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Mar 2023 17:00:38 +0100
Message-ID: <CAFEAcA-CP1z8zWFJvBoDWFGe24KTbOn9hs3d7Fr883pij_7nTA@mail.gmail.com>
Subject: Re: [PULL 00/12] Net patches
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 28 Mar 2023 at 06:21, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit e3debd5e7d0ce031356024878a0a18b9d109354a:
>
>   Merge tag 'pull-request-2023-03-24' of https://gitlab.com/thuth/qemu into staging (2023-03-24 16:08:46 +0000)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to fba7c3b788dfcb99a3f9253f7d99cc0d217d6d3c:
>
>   igb: respect VMVIR and VMOLR for VLAN (2023-03-28 13:10:55 +0800)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

