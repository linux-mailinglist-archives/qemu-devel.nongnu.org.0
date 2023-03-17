Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBDF6BEF3A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 18:09:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdDZY-0003CK-Ef; Fri, 17 Mar 2023 13:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdDZP-0003C4-GT
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:08:50 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdDZN-0005Ky-Sj
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:08:47 -0400
Received: by mail-pj1-x102a.google.com with SMTP id a16so1558485pjs.4
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 10:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679072924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1wDCnzEpJ2BvHegow+VcNyKMRXcK30gB48gLhEmoWO0=;
 b=FZz7MprnYqB8+LC3FWfcFfeqExNw44+bTvXwtMopNtIelb9UrVVDjz+C0MzEFRpaO8
 Cp5W53rKZz5mWYz0lArcgHZaBphTwxZ1LTHw9llKnTIgKeIZBNmjvvYGzr3mG4Hf1zNH
 He7xBxGkDOYCzq+YK5tJ/o1PFrtUvfb4Z79A78bGtPUuZdiH6vN8kFzfmmwvyjUHd2lX
 QVWithlwARihYXxJvpqndbtbKZR3VJd3IVjCZ+EL/uYZtVVTjsXjeBzT2tVjUjoLiLm7
 v1gbBT6g7H3fORUCqQ+58gQ3oPAbFbx9EvumdhNqPJsI+Zm9hzdRXScyzwte86AVZtxJ
 G7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679072924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1wDCnzEpJ2BvHegow+VcNyKMRXcK30gB48gLhEmoWO0=;
 b=v+6V5XEcaFx0oebA3efFUcB1a29yj05XNClY2r/K1H2PB1NYEdGG0twjuxP+wzM7zi
 BAh2XVOfrxmuyciuEDRSakPYWDgDMaiFcDEcwol37U0VjJDiKmH9GImC4Z5iX3MTAyQN
 u/uQa6WOE2kuZ/64/tKqjks2Sd69qV4ruEYqEBCqgpUneIPMKkh1U0wX3yrLGj+tV4HQ
 xgIvgWlsMM/D4KO71d0LaFoEKg88aGr6fAsXS/m59nkq0AWKqZbXcd93m2+EnLHNooas
 ORlAt8KOktTmC4Dhg0HwWQh4y1vIYr3MKshRA4/+mhUpmuaC2OqWqWDBzDJiHavW4wlw
 +x1A==
X-Gm-Message-State: AO0yUKV9iTAH2ufUdkHNO1+et9JpJIPwGpBRpjqj1sRwMO3P2i5XwkrI
 CfcNqZrHDrqsZ+VITHRL5o6gmybE9cb3xRtvsNsqzQ==
X-Google-Smtp-Source: AK7set9xb9hzg60l0FITh9NEdd7yjj6aYpd55ij0GQp3Pj0QA3LSD9TY/Xq4u8JT57meiYnUT29DxXJWIACoAgWDsmI=
X-Received: by 2002:a17:90a:c38d:b0:23d:32f9:93f8 with SMTP id
 h13-20020a17090ac38d00b0023d32f993f8mr2449299pjt.0.1679072924431; Fri, 17 Mar
 2023 10:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230317170553.592707-1-berrange@redhat.com>
In-Reply-To: <20230317170553.592707-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Mar 2023 17:08:33 +0000
Message-ID: <CAFEAcA8a_tce5y_AEQUWBRy2_HwEyi1DFUojjmsTWtGBNZA_Zg@mail.gmail.com>
Subject: Re: [PATCH] qtests: avoid printing comments before g_test_init()
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
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

On Fri, 17 Mar 2023 at 17:06, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> The TAP protocol version line must be the first thing printed on
> stdout. The migration test failed that requirement in certain
> scenarios:
>
>   # Skipping test: Userfault not available (builtdtime)
>   TAP version 13
>   # random seed: R02Sc120c807f11053eb90bfea845ba1e368
>   1..32
>   # Start of x86_64 tests
>   # Start of migration tests
>   ....
>
> The TAP version is printed by g_test_init(), so we need to make
> sure that any methods which print are run after that.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Yep, that's exactly the same as the patch I wrote but hadn't
quite got as far as sending :-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

