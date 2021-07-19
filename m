Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 304FB3CD4BC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:28:52 +0200 (CEST)
Received: from localhost ([::1]:41770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5SOB-0006MZ-8n
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SMI-0004qw-MW
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:26:56 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SMG-000312-1a
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:26:53 -0400
Received: by mail-ed1-x533.google.com with SMTP id v1so23662049edt.6
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 05:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VTD21oAE+JKh1wuCP/64AU3mTrXO3eTB5lC1YXxRNW8=;
 b=swS69y438Og/dMEhzIVrW2cOujtYrIC+7yllsD4lTjxjxAnsKtXMFxPAQZVNAQxYzV
 nIfjEynt9zAqn9JpbjX0+ajvCvZoi8G03RwAPwmLjywr0DUvs3CeXO4d6wk1+KqX4n0C
 iNN2i5awKr+cnD9DXCo8BaaIFcmJ388RE2EQNF+4azuHFjtMBntOZg5CB+l+7xWAfVj9
 pmqp7hBq2622GEoV/s7THqTahPqfQsEm56jcmkVywTwQqycLnarQW5kxQevzlYx4/ech
 uzHrnf3z1qzDY90B5dPmBi61YDtixy6XuMbjNXBBtOfVy6aedyRoTWi2u2119N5kGx17
 u8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VTD21oAE+JKh1wuCP/64AU3mTrXO3eTB5lC1YXxRNW8=;
 b=PRCZaRKyv0vjk2dSqTttH+evkM7zUlI3Fa8KG/sUbnyxPkNFBOT9GUsRodoPqinjVx
 aNbbkvNygiK8xSTnk7PC0S547pJmPAc7bTnwSbz+6G+akeNa72UckWJpOISF1hu99uAC
 A5pYjFSUabK8HWhcG1hOmgq50DX6Fv2DtEsw92AuM7RW4lF1UZPWa7JSXsqs/CVsIl9+
 lE/xFRyZTlyBkKw4fTwEBuJTlTf79b4edVK/HHeRcHoCVnM3Kd6epvxNq9DTHdUAuDH/
 Aqsa+kkUDMJF/Dl7Of9KrMQMLbhQs7q7rl7hvf1WwC3zM/vJE22vs158/ceO7MxVi0oF
 7sCA==
X-Gm-Message-State: AOAM533/5kagavaCO2GFbsumtSeDfWH7e5d9zGUTjlycLE5Ao4CtVo+y
 5OOEsbSG1uPXpJS/2LpblxZSnfDDfQnevgUh6EJgAA==
X-Google-Smtp-Source: ABdhPJyZs0zuNFMfQaMQvBysHohgM0pk+9JgFdt2sqf9co9RcjLZ+WkHNnQ/o87pu9zRfsro8N9QOFgPZ6UoRuBrjHQ=
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr33584146edy.44.1626697610693; 
 Mon, 19 Jul 2021 05:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
 <20210717192419.2066778-10-richard.henderson@linaro.org>
In-Reply-To: <20210717192419.2066778-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 13:26:10 +0100
Message-ID: <CAFEAcA-6APB+P=E_d0Arsw3rEyY=7+VffPg2ay0fzGmESXEFxA@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] trace: Fold mem-internal.h into mem.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Jul 2021 at 20:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since the last thing that mem.h does is include mem-internal.h,
> the symbols are not actually private.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

