Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24DC525ECB
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 11:54:58 +0200 (CEST)
Received: from localhost ([::1]:43926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npS0f-0000h1-Rq
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 05:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npRwk-0002rN-Pq
 for qemu-devel@nongnu.org; Fri, 13 May 2022 05:50:54 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:46141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npRwi-0005f5-WE
 for qemu-devel@nongnu.org; Fri, 13 May 2022 05:50:54 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2fb9a85a124so81344617b3.13
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 02:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3YTnbfqNSSq55crGmMx6dDnfZ08hCd9gHpW0zzIk8f4=;
 b=UDlmOo962YiNl8oCm9EYJO336ui3wHptu4Twb2/Zol2lL06wrOHlJTW/XeSxGnidC5
 80zqRlrQff8hTsgxHLFkQW0Il84HwDtKCW5Mo9mka4zJPCFykmZHH3Vzyz50BK6Pkm4m
 dAcbyYSZNXYvmxUDOD35xRoLsIpZeXlVWjnIYrB+2Q0vzX8fshCmyflMV8qqT5UJ1yAG
 Qt8vzI9ZcYkH0YEwGb2+XcFAC2mc7PxpHf80rJwskbnQ0tORdZnr9hBtwJApDxEY/eeF
 RY5AdGldigesFwNkxj7yvG1UZv2JPG+5C/Wnq0pXW6WdAPcL/EeDpyu+wRVSQkXphsqG
 ktkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3YTnbfqNSSq55crGmMx6dDnfZ08hCd9gHpW0zzIk8f4=;
 b=znndkVCfUomrdkluYZGFC5c9J1QgkTOYEgVrWkqxQYHDJYMjPIwebOAWxV4FWZCM6m
 AEXPV791mntsw6D5QKG47cXXheTy23iymfwXYrrjc1hY7rcmyQd+BhglfWdxoUIskg3E
 JFCJZVoG/6NmA7qgnPXPRbVi0/9P407ukLCT8Jo72OhWChFOqqW1mOA+c7xQWtFF/AyY
 UD7NICJDXtNWdA/R09f64Rlp87PAsx+KCAXo6Sbnluq2TlrXvQQkD90ekpZdUYzk7YbH
 qIPoorLDmv/MjRfDgvYbQsOoPRe+Ey2pc8UV11aJrczBX+KDpVaNUhTXctL8RiE1swi2
 FFjA==
X-Gm-Message-State: AOAM53172cFRp9eUGhKmEGj/yR8eAT4ecTXtMxASKoO2a7YzNX+/4FyC
 HDTGEo8hZPXCv5949hqVSluR5yT/VwabTfvQGN6Q0w==
X-Google-Smtp-Source: ABdhPJygCAVZgwC5b5QF6yKHna7K+R38/OfSkW88979qThXSJCnnZa9YR0Z9M7Kgw8jgF+KiFsoAuONUh/1ywzg+UYg=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr4853224ywb.257.1652435451187; Fri, 13 May
 2022 02:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220509202035.50335-1-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220509202035.50335-1-philippe.mathieu.daude@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 May 2022 10:50:40 +0100
Message-ID: <CAFEAcA9oEUHL0Z0+bSmP-Hx7e6TUdz=ahB5rgNgYt0GUytTTnQ@mail.gmail.com>
Subject: Re: [PATCH] hw/adc/zynq-xadc: Use qemu_irq typedef
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>, 
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, 9 May 2022 at 21:20, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Except hw/core/irq.c which implements the forward-declared opaque
> qemu_irq structure, hw/adc/zynq-xadc.{c,h} are the only files not
> using the typedef. Fix this single exception.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/adc/zynq-xadc.c         | 4 ++--
>  include/hw/adc/zynq-xadc.h | 3 +--
>  2 files changed, 3 insertions(+), 4 deletions(-)



Applied to target-arm.next, thanks.

-- PMM

