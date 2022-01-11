Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0433348AC78
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 12:31:34 +0100 (CET)
Received: from localhost ([::1]:47610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7FNF-0003zj-2t
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 06:31:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7FJE-0002Yr-KK
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 06:27:25 -0500
Received: from [2a00:1450:4864:20::42e] (port=38725
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7FJD-0005Ph-7r
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 06:27:24 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a5so28383614wrh.5
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 03:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wLPR7c7cgvtR1237GY+x66fg6e3v+7KhN5kt+EvjKwU=;
 b=c0pPO+GtIxOzTGkGZaRPrb5UR2HicXrCbp9yTE9wG4rJEeEh3yY3z1B5quMnIWHC6n
 /0BU14oQbMylGFXdxZhQnQOgv5XaI5czcPzPSs17TFPbLZd0P1xMtV2+IsnAWRJnLBjS
 /pgpRMQUJQOSH0lhLuaRYs5BuFFJ0V2NRuJVG2nEaamSuLExtxjt8sl/oqmo1CwVwFEn
 kx+vgkJGTP2m5zQvoi1lyhAkAnB4P1XSgW/qEe9Mecgz4XqgQLxdDS4P+oi9TSu3O3eP
 A629LRweoJxXSIP2BxyiTb01/nonaI4Nh9VUiTXUiffruUUNIEhw5uYu6/GcvI3JEKm3
 qwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wLPR7c7cgvtR1237GY+x66fg6e3v+7KhN5kt+EvjKwU=;
 b=DAiNaZEiUmJ6m0l4Etq+46N+SAOuVlAC8s9DsLvCDoBUPtUOw2P61Rbtn0xK/RZKl/
 XQyVwvsREB7FokVmSCL+sNY5RM+UXKOZ0zuVqRhL1krivU6EM3b4w6zRwHasiO0Cc/kv
 Hqum/L6grOlQjnCH07gLBnE1a2JQ7BxCbEk78mmlvB8hpnsjZiH2bTilMk/nPP3hCVAm
 L/TCL4OTaBzC+DyOJ24h53eFoDn8GIWlpQPbqycaV4kI+MTMOkC3boBo4fAQNVFVYUXu
 L+7VfdOmCQxjh3VNCHnSlxTBTaP44KFlcibJGUT81HzQo7mNKyX+cTnRMa2HD76jp+eP
 VQFw==
X-Gm-Message-State: AOAM5305VMjwdTHL05Xxt5p+JjKNK0tR2MALrwoLtu9pnmKAr4OOCjKY
 yJ3mbT2GVV67AvuOWGrqu2O2AGplbQ3kGoqG2gjIEw==
X-Google-Smtp-Source: ABdhPJwcsOgiTubG0gY1x+AP/hBwPkiYUBJ3ntO2MhHwtANkQosmCN0LhKr5w/Ae1pR0HxJT29h1VTs72kyLqEPCp4o=
X-Received: by 2002:a5d:6848:: with SMTP id o8mr3606138wrw.2.1641900440853;
 Tue, 11 Jan 2022 03:27:20 -0800 (PST)
MIME-Version: 1.0
References: <20220108063313.477784-1-richard.henderson@linaro.org>
 <20220108063313.477784-3-richard.henderson@linaro.org>
In-Reply-To: <20220108063313.477784-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 11:27:09 +0000
Message-ID: <CAFEAcA_hRB1q3A2Zo9o7H+GcS383MBkcBiNXpgPi3vbWykWQFA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] tcg/arm: Remove use_armv5t_instructions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 8 Jan 2022 at 06:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is now always true, since we require armv6.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

