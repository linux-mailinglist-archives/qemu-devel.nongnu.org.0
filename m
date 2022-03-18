Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99B34DD977
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 13:14:24 +0100 (CET)
Received: from localhost ([::1]:50534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVBUt-0005PX-QL
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 08:14:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVBRW-00038z-Vu
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 08:10:55 -0400
Received: from [2607:f8b0:4864:20::1135] (port=40451
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVBRV-0005qd-CX
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 08:10:54 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2e5e9025c20so5687977b3.7
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 05:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vTotjMFQkSK78uucmx75uuyy+O/2H7qWRblIm4D0fbM=;
 b=VQxFWqAOs4LVvNJELf5OtOUY4BTAbH0O6qhT1ryNpNMnBDsYW+WwJfWH6N0EaKMh/I
 eacnW2tTON6jG4VsBJtbYRVgPjXqx/NOCQbjN4a7kybVFwmjc3F3d6kHD84NlG2DT9bv
 dqdwNVzpR6WvEMpud7YxyduzBtZ8dnh9jBSHMqjdzlqD3j8oMXr6v2RPdrhxUQhSfAQX
 /rQkifEFLjPk3eqD1s0eeZG2INjtDyE9eBixi5+/aDK2xI+YpaTokoka0pTwjNhqg4zs
 3/D6h2vAlFG1BVrtgSztMbHP0Hy3taKSJxYlVLl95SsYXWAxtG+t307ZakmtIoMFNjt5
 pWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vTotjMFQkSK78uucmx75uuyy+O/2H7qWRblIm4D0fbM=;
 b=Igufn/YvxsCR8LlbQam7fhVcfCRYhcCTUBnqb8wVrKZRprI6f/69krmLUpJ8D+187d
 HX0ZuMx5ksiYOK5WHd8euQdqC5sAxF9YGyAkOVt8VNIPqP+xugS92rcZbHyC3BD23E07
 XIaMtbi/uEl/RuHqMPJ2Hw+23vVe6j2XbenKTQP6kMvEf5tT6DDFwurly9BANvoSHoor
 KoL6actbw3+vUzAYzUFyLvV357jCa3wJ/bt8/TCypQ3s9C4PSGsrA5hezNUDRSP84ywV
 P9/FaMFpQnHhGFRYxPHOQsyquaN+7B53yaug5EWvGAlwjk5XhvB7yGCGGhxvVEM+OMfL
 vQPQ==
X-Gm-Message-State: AOAM532q4oT3TAsmMNU1kADNcL7dkc5N9f/5bBTSoit6lfS3b9FlTqz+
 iRaukN6094XycapYEIoAVeyKWdtWnKEUmu7CB5nbgA==
X-Google-Smtp-Source: ABdhPJyNjER/fnyLzLl4WjzrFZVLvlOCmfqlWYXZ4IvF+XGTwBGAf3Yk/W7Kgp6zqEjk+rv4JzcN4Fk1wUSKCb1yLfs=
X-Received: by 2002:a81:1151:0:b0:2e5:99ec:9933 with SMTP id
 78-20020a811151000000b002e599ec9933mr10403647ywr.64.1647605452398; Fri, 18
 Mar 2022 05:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220302130417.18551-1-ubzeme@gmail.com>
 <20220302130417.18551-4-ubzeme@gmail.com>
In-Reply-To: <20220302130417.18551-4-ubzeme@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Mar 2022 12:10:40 +0000
Message-ID: <CAFEAcA_JwrqFhz6Aitg41fmT2+Qz2bec3zqpWqM85-3cthGUaA@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] hvf: use correct data types for addresses in
 memory related functions
To: Yan-Jie Wang <ubzeme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 at 13:04, Yan-Jie Wang <ubzeme@gmail.com> wrote:
>
> Follow the QEMU coding style. Use hwaddr for guest physical address.
>
> Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
> ---
>  accel/hvf/hvf-mem.c      | 2 +-
>  include/sysemu/hvf_int.h | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

