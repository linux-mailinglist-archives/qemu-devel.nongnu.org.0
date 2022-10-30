Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9797F612A4E
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 12:19:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1op6K4-0001iK-Ma; Sun, 30 Oct 2022 07:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1op6K1-0001fd-S6
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 07:17:45 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1op6K0-0007mP-54
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 07:17:45 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso13675416pjc.0
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 04:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mea9bZUQuyEjJ3RlfvCntNcSv2SbCc3AGE3XX2UP6bU=;
 b=V+bMKVr5sPQFey6ICd2cLMPMLd8TKisnlkMIKE2rlVDCrfLkmgPcSNhQ2/IyQc0ffz
 wr7VdDQd7QHQxWT0uzL4TXMG3IWnoy/prYUtOld86gjnavx6Qcfx71fhmUBXq7hz8aHd
 sM0TE7Cnb6wQiK9nAaGziNZC2T6aaERtXgo1YzmuO/K+rUBe3q4KzePTKDYazFU0k3yS
 +V65pOnw1QIePPfQ191cuhzu7QbCdmoL00GWEnsMXtlh4JaEltb0KGiOXCq98JCyncxo
 AVtaF1UvJQsELoZ1b6EyJ/vznraasP3ecevbTyvxRNdtrd9WjDkofxs01h6hm6E7tD1A
 YIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mea9bZUQuyEjJ3RlfvCntNcSv2SbCc3AGE3XX2UP6bU=;
 b=GBCoyPE/l8Mr879qklahqMIffTjMKn80J+ukzWEYI48cLIq0Nqym51T7sljFeCRe4H
 57chUZ4YUkzJk4Y0aKlCD3G3DGfldLKy19ItBa6h93uF4Baw6/JDBPC7HejNSNq5RpDs
 ulf+gNqfJbaC6LJZXqM9QsN2tnc3qeQvTVzp2vAbgqWmu7dKBZl9MHIb3SGlJvJr6/9A
 Igcg0/5yzFgu0xOZ1eDSlLz+F5h2XZ287tHJverBJLsj4LOGAznKCsaCYGlmmUFCKtdz
 X0rQNWJkddPAFqtb6HsbeNBPdW5Z1f7Y/MoTG0TS7BRjJVmxueqtLWTCfHrxM67UWtFN
 u4QQ==
X-Gm-Message-State: ACrzQf0WHy04jV2EcvXp1rdVvlp6K5hVtPvBk5sSvYYph7uoJhnc6w3f
 FAM9diM95euqX4PTu0m78vRa7rmYhcwR0tfRQR8S/A==
X-Google-Smtp-Source: AMsMyM5/rgNkCE95jcDD3b4O7Vy+wzeQ92RuTELUNImJaQO5hSkXovjz4+XXn40CIinwre0GBjxGPNxPa4CgiA/g5sU=
X-Received: by 2002:a17:90a:164f:b0:213:bda6:2873 with SMTP id
 x15-20020a17090a164f00b00213bda62873mr5166821pje.215.1667128662611; Sun, 30
 Oct 2022 04:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221030105944.311940-1-sw@weilnetz.de>
In-Reply-To: <20221030105944.311940-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 30 Oct 2022 11:17:31 +0000
Message-ID: <CAFEAcA_w=9zj3F7YiStjEZwhm8xoNydh0sG_wwNqpyHwzwJt2w@mail.gmail.com>
Subject: Re: [PATCH v2] Fix some typos in documentation and comments
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, virtio-fs@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 30 Oct 2022 at 10:59, Stefan Weil <sw@weilnetz.de> wrote:
>
> Most of them were found and fixed using codespell.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> v2: Fixes from Peter Maydell's comments
>
> My focus was fixing typos which are relevant for the generated documentation.
>
> codespell finds many more typos in source code, and adding it to the continuous
> integration checks looks more and more like a good idea.

Is it possible to set it up in a way that doesn't report
false positives ?

Anyway, for this patch:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

