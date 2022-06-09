Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199BC545455
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 20:44:11 +0200 (CEST)
Received: from localhost ([::1]:36394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzN8a-0000az-JJ
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 14:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLFW-0002OQ-FG
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:43:12 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:33838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLFG-0005jw-Bb
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:43:08 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-30fdbe7467cso212065037b3.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mgdDus+EMTVrrj6/hW8xm4X8Ll6MDA9ryOrNRgI00/Y=;
 b=NjFRrb6Wr+ciKmJvnoHQjxsOs1uhVmggiHKbaoOLRl9s3QHnPz1TbyNcoLmo4eLNsy
 sntXXQNLB1D2R9jgHLSqInRapaACit7CsfkEHSSOvk7Bx6HhZtqB/PFufWkzbjExuwrF
 dBdka9R0aEQT2WLMwUZxS6UwCS8xeMrG4Hsrhwu8pXNNKWayfpbHn/W4m32pBPKbtXlo
 789A7EIA56V5MU7HJMvADdn2mZTeX4d3DlW5QyzYqStjb0SODTOabJFVoi7ehjcb21+g
 AUHZtHZ82465vce7cvbkoWp0CNalFtDQSPdSl4RKZ6QYFXwhwBl6O3rL5Zv/x/nZZBTQ
 0ZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mgdDus+EMTVrrj6/hW8xm4X8Ll6MDA9ryOrNRgI00/Y=;
 b=TwcwDU9/SlzyoLn180daLlpfqrqvYhfnJVtuKZCHylLGXuQPpqY90E9LHjZezrxkPH
 s4+VCrqgxXWVJETNHVUCZ8qocwjPmPfPus61vfWQtox2L8K3co2IKU0Qno29UCyfXkvg
 DRl1jrAH0cvM99KtVUFIgrRHEJlLiO0eI+eiODf3CkHrqk9LcD3/vtGFdnpU7JnNlM2j
 X71gwE2K0eA6uaJc1pGTlxgocw1qfgMTewdTgm1hvWWKdEs7mqG9xXck221edT1q/CBE
 K2Oz0hkm1Ws2U52y96+xaf5OVOK5oFw4uWgVvd/vAkYocXbGdHDUeFCPFFSr79npRgjI
 kkUg==
X-Gm-Message-State: AOAM532c5WQ4g1j85bzm2H7c5sq2L6aU+niPIHh5xmxNNIVH6ZNpdFA5
 rY6CdHBWNa8oVPY4CZggPqAKGZxSOxRzRIuvu1Uidt0rHw4=
X-Google-Smtp-Source: ABdhPJzeJ+hX5U13QL5PKSbgbuGCf2IvlPTSej/kKr1heyzeuRWV5lHKcPkcJYX+IbNNpUfQixZwkhmiyfmBUMhFbtg=
X-Received: by 2002:a0d:cc8e:0:b0:30c:1230:90c with SMTP id
 o136-20020a0dcc8e000000b0030c1230090cmr45550042ywd.469.1654792973083; Thu, 09
 Jun 2022 09:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-21-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:42:42 +0100
Message-ID: <CAFEAcA-A19rRzvXTF0ZqRyNwxYRs9QRTwzsFkDfChkdfbbAjwQ@mail.gmail.com>
Subject: Re: [PATCH v2 20/25] target/arm: Introduce
 helper_exception_with_syndrome
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Jun 2022 at 04:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With the helper we can use exception_target_el at runtime,
> instead of default_exception_el at translate time.
> While we're at it, remove the DisasContext parameter from
> gen_exception, as it is no longer used.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Basing calculation of target EL on the runtime state is definitely
fine here.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

