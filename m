Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65225651015
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 17:15:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7InH-00043v-0P; Mon, 19 Dec 2022 11:15:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7InC-00042X-KW
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 11:15:07 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7InA-0005H8-I6
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 11:15:05 -0500
Received: by mail-pf1-x42b.google.com with SMTP id c13so6598511pfp.5
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 08:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3F+vUCbanK0jr30yMko/eIZnLrc1z4dF1HGYjZSQv4w=;
 b=WCAyRXktjqzgTGwXrIG0yEh/CDl5/+ct82cdKZAUdcc8lYnQkmdXwqsQLRxVOszzZ5
 1zvrS0xd0UUfCgDYFp4Km0aZeDDvcKirlCSY4+WUXkccmtkIPs2fRjPaUGmXCgEevjcn
 B+XufSdv7wq57jgLWipJpEkyHdOxxc6EbaNUAvF5nypZsB4gb7YOllPhQ6mWud7oN6EZ
 MBG+d0KS0GxsNKbqLA7LfzQUjmUs6sGQen0dIOYpmlfScKg1aXndSiVxS+K8DbY9YHWs
 JE+iES+0EvnlBT8mXESqwQedRe3oiwXF6gDZWmmFGW39jQmC33k7wyHOfKcUzngYSSck
 4n/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3F+vUCbanK0jr30yMko/eIZnLrc1z4dF1HGYjZSQv4w=;
 b=1asvZ0xrEdnkxfzPrOCpqFRGMCENG/Rw7lXwTqd37pR+fPqUvpmHhfjdEzWdGB04tr
 nCjcYjdQVxxxWclKS1iwEFeJAXDe7S6d0VawjZzw4mHGP0GC1T3Snu5o14veKksnUEVr
 M59M3mXMBJesk4iYX2W81M/W85SHiFzbwJrE9jJc1KWugXKQzYiEBnZUGXi78f13snOA
 b3zCfJ3PAigRMEF5PkRROflZ2FIXJOx8waBS6LfQUaLA4oN9m0X+06/RJw9ofDJgC/Vf
 dN24dyPbM0r0aJI2uhI0fHo+wEUUOMD+wE2pd2cWrSDR3/pxq0XD2aXiOln2yT5C+vvi
 6/MQ==
X-Gm-Message-State: ANoB5plovzV+15LIfjwUzymIsIr5TCyJfPjg1fPwa4E6tfCrtExb7E/b
 Hsr0Gt6/xDUDcR17yru88ZC2iCgXsgaaqxaw4DfG0Q==
X-Google-Smtp-Source: AA0mqf6DFPM92yOBhQSEFxJympArvAPVDzVqmjQPfMQ7A5UCxMEq7nYCDJMjDFs78MK1ysMZ3Etfv2zcwb3JIPEh8XQ=
X-Received: by 2002:a63:d20d:0:b0:479:18a:8359 with SMTP id
 a13-20020a63d20d000000b00479018a8359mr6665945pgg.105.1671466503097; Mon, 19
 Dec 2022 08:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20221207021322.16165-1-vikram.garhwal@amd.com>
 <20221207021322.16165-6-vikram.garhwal@amd.com>
In-Reply-To: <20221207021322.16165-6-vikram.garhwal@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Dec 2022 16:14:51 +0000
Message-ID: <CAFEAcA8Rp39A1VESBmid3vAdgJ6_HvnydsZts-f0KWKyBcy5Yg@mail.gmail.com>
Subject: Re: [QEMU][PATCH v3 4/4] tests/qtest: Introduce tests for Xilinx
 VERSAL CANFD controller
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, francisco.iglesias@amd.com, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
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

On Wed, 7 Dec 2022 at 02:13, Vikram Garhwal <vikram.garhwal@amd.com> wrote:
>
> The QTests perform three tests on the Xilinx VERSAL CANFD controller:
>     Tests the CANFD controllers in loopback.
>     Tests the CANFD controllers in normal mode with CAN frame.
>     Tests the CANFD controllers in normal mode with CANFD frame.
>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Acked-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>

> --- /dev/null
> +++ b/tests/qtest/xlnx-canfd-test.c
> @@ -0,0 +1,422 @@
> +/* SPDX-License-Identifier: MIT

'/*' should be on a line of its own in a multi-line comment.

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

