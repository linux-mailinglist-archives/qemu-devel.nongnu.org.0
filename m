Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B10595BDB
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 14:39:09 +0200 (CEST)
Received: from localhost ([::1]:59530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNvqe-0006vk-5J
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 08:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNvlN-0002be-2h
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:33:41 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:42658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNvlL-0002ls-78
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:33:40 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-32a17d3bba2so146407947b3.9
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 05:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=+3GNcFBDdKSjahJmqf5i8973d8zyRMMgyeTo16qf7Vw=;
 b=ZO1udT+hyZDJKqYnNzZG6ynr4KVMHP+72b4on0rZ+g8PipEPQ3SSa2eGTUBl4sHUYe
 IozQ9yWJAF8SW0+d9u75PgGoNJ+QnPs+ZQdJubPFGrvBQG6X8UDEx+2+p+DFMqeLFPp/
 nIiL498cVh1CeCy6tboSxbk96eortbzOZdFMEg/Jq6YhiV4PK4NbERwoJMfLpdSLod+H
 4TFf5LO5zsQ4NcPe28wT3sm8EGGdebnKkSdIi2XKbOXISwysYsdyZVGdlFmrYCjYWkOW
 Esm8+WYGBvFQtSIAa/cT6izjVKXhJJXyaNEjpuf7Bh5ZjzoXbBsyX7lfYIpP/n8cMZGb
 kxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=+3GNcFBDdKSjahJmqf5i8973d8zyRMMgyeTo16qf7Vw=;
 b=lMfolX69xYZQKBmtqsE5GzGOAflTNb28xt6OxB0ya7gXEEURIazUFCuQQPyhcPzOSX
 iq1+DF4jZGNpPstmULu2nrF3lzSQZ8vXizqB9YwZ3i1NxOTBUxZp9uqodUg2s8r7fr30
 ta/Ay9+xaDbu0Lo7n5JzDvqg1ZegpSOmigUHFU6TmsYwCsBBVcXlZkvbN+gFywCTGhwQ
 m+0VccN3fLA3v5B3cyhdmUAzqtvGqoKWmmxfrpX3/qsB5XJCTbZ1CTitambd4YBqaRYj
 sHFHa5laJVyawswRekPWG3oYaPuGT7gZq/vMKj7hfFWEEFQLhCnmTm6gz8GIw1IiBxMh
 csmw==
X-Gm-Message-State: ACgBeo36Inp0GaAaheI93iTTZC6oIVkpT63HLs/6RSD3hMDWCr05SbjH
 wEjay+nKPQomax7RK1JU76BFZT6l2gjXQng8dpT2FQ==
X-Google-Smtp-Source: AA6agR6Ij2Zve4ZrQbmsdMWqk1vg9D5J5tB2xMCHK/+hM1E7iwjccLaNxvOD0RU2ZCz4lqoMprSS4cLlNxR3BDlHAM0=
X-Received: by 2002:a81:13c5:0:b0:32a:8e40:d469 with SMTP id
 188-20020a8113c5000000b0032a8e40d469mr17339805ywt.64.1660653214120; Tue, 16
 Aug 2022 05:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220816122621.2066292-1-alex.bennee@linaro.org>
 <20220816122621.2066292-3-alex.bennee@linaro.org>
In-Reply-To: <20220816122621.2066292-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Aug 2022 13:32:53 +0100
Message-ID: <CAFEAcA-+MtvsRJfpcjknT2FHkUO75AP_zySWBWi=KAAkMGdjnQ@mail.gmail.com>
Subject: Re: [PULL 2/3] tests/avocado: add timeout to the aspeed tests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 16 Aug 2022 at 13:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> On some systems the test can hang. At least defining a timeout stops
> it from hanging forever.

Aha. Yeah, I've seen this test hang forever sometimes.

Is there some place (in the superclass??) that we can put a
default timeout that applies to *all* avocado tests, so we
don't have the risk of forgetting it in a particular test?

-- PMM

