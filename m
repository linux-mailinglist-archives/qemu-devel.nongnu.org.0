Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E9349250C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 12:38:42 +0100 (CET)
Received: from localhost ([::1]:46324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9moz-0006Za-H8
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 06:38:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9mdr-00044p-Qz
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:27:12 -0500
Received: from [2a00:1450:4864:20::329] (port=46942
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9mdp-0000Cg-Fi
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:27:11 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so4084541wmb.5
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 03:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o2d+LjwVZhOGp6FPf4oBr/VoaWC7Apff5YGoI0ZP6Rc=;
 b=NsKwDgCR6dx5WJ+44PsphjTJ7iuxTtsfapic54m/5iBOzJF1GKKn46SvTtSKvmQjxU
 ixIXfcjwKorjtiL/ksHCXt88AxgDqg9bO5fkLPx2dOXX4Rk/VIcwfbyUvl6HkoYZWf/n
 O9/zvkh+lePMV0Zal+DCUHIQ32ZZ0tfIxxg6Me+3IpDtuRCnMKEibh3YUewuCFuv3oXC
 sVjuC76Sz9kevmU/Y3Eb0ABsPfVdlMGHP81x/PIPKcesNzFR5H0bmdkrK+Sa2sDQESDo
 gep3BTg1+bpkZnbiIwG8cxR0wvUwvsX5DkRvCg5c/ha7/winDKNQdNY25/KvFGrxmpZT
 URWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o2d+LjwVZhOGp6FPf4oBr/VoaWC7Apff5YGoI0ZP6Rc=;
 b=tqndukTiHnlipme16wyzatCauOEfFXbJU/ti2+7uF2ebTKCsAQZbE83MayjIHyxo48
 QmRw9erHBEO4yi+SG7GUBxsJGocD8+mib3dE30JOlJBKetVhkzIxTnI8rurSuRpifY2D
 2MSDhq/IL/juDTA4qUnDBY7y6TLrAFGmbHGmLRVN00TAtspw8iEt9xINdtCPVfiPmkmc
 fAoIpKx+JllqnQRUW5Uj0pvk9+H3FMLQsd8VJ8f+NFOQ8tB2UnQxJ/gD8tTzIx8w4ECV
 vgfV8znf3pJhiLrSc20OYI5TiKH2UTUbmgs2v530CYJxU27qe1IQu/CXn/QyAsjsCgSM
 5TJw==
X-Gm-Message-State: AOAM530pXgxdfcVi3ZlwVEnMCOKhrzbBitCQIJ1sJ8YmcYHKaYMnnqLj
 m11LjZ7mpmRp4qhgON26q+mCMcKcfTT6iqfrkpK7zJ3Nr3x/YA==
X-Google-Smtp-Source: ABdhPJyIrDH++vm/bGIfhLF0Ox1RnYZ+2tB4QsOLtqaU6aq299Rojs6/L+sVYzIpyK+ikZzuz4vrXQvZX+l2uip6bdE=
X-Received: by 2002:a5d:6848:: with SMTP id o8mr24173889wrw.2.1642505221170;
 Tue, 18 Jan 2022 03:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20220118104434.4117879-1-peter.maydell@linaro.org>
In-Reply-To: <20220118104434.4117879-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jan 2022 11:26:49 +0000
Message-ID: <CAFEAcA9njubPQ3VQONK+gX8=QgDPqFLfr50TQWJn05kFptozwg@mail.gmail.com>
Subject: Re: [PATCH] Remove unnecessary minimum_version_id_old fields
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Jan 2022 at 10:44, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The migration code will not look at a VMStateDescription's
> minimum_version_id_old field unless that VMSD has set the
> load_state_old field to something non-NULL.  (The purpose of
> minimum_version_id_old is to specify what migration version is needed
> for the code in the function pointed to by load_state_old to be able
> to handle it on incoming migration.)
>
> We have exactly one VMSD which still has a load_state_old,
> in the PPC CPU; every other VMSD which sets minimum_version_id_old
> is doing so unnecessarily. Delete all the unnecessary ones.

...and https://patchew.org/QEMU/20220118104150.1899661-1-clg@kaod.org/
proposes removing that PPC usage, so once both this patch and that
one go in we can delete the migration/ code relating to load_state_old.

-- PMM

