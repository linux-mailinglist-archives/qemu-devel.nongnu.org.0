Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 308542E885D
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 21:03:31 +0100 (CET)
Received: from localhost ([::1]:47470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvn7a-0003cC-8b
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 15:03:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvn53-0002rV-M4
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:00:53 -0500
Received: from mail-io1-f48.google.com ([209.85.166.48]:43877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvn4y-0006Bf-FW
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:00:49 -0500
Received: by mail-io1-f48.google.com with SMTP id o6so21412093iob.10
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:00:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pOojvXcDTUNkRviV7XiDmKL1Pky8JmvqO2IpHqMK17w=;
 b=cR9wF7TmdbGqnS+bzF8JxmA1cjdKBKdS3dj1al9LMyFDPh8ZZtuV/j4kVkN9ZaGc97
 jKTkk+k4Dsxn4ckHz95lnUk45r0utDtFpzhBaxsiSb/hUU01pyC1NdR0keTo9FKcFdh8
 dmsphCTIQH+Of0jaAkw48mGJSBef3ir1FCQovtfX7TYZw61GmUptYN4bGEu2e3M5jUq4
 yGC6HFvGMBSpESe9Pv5WIASkNLdYsGs3Xh1oQ+f/IEaGc0MUrmIZCFf38Iv3u5WBgSVA
 EknjGYnDnCUpAAyise3F+JzVI0OtyLxcaaEb1bwseSRi8BCDMcc6XfcQhRPPJ8moXbMK
 4HTA==
X-Gm-Message-State: AOAM533u358V/YtJopLwqAWIEWFAfLH7FvKGl7g5nIUsfwPKB/7THMU1
 LHbh55t6pWdnytJGQTXQCdrmcwAXmPg=
X-Google-Smtp-Source: ABdhPJypXL+aP9uFccc6OgmxDZ4gLvC9kUCVRx4qb+qdQAC6M4Yql0jJZ9sA75LSPrgjTRalPw66Jw==
X-Received: by 2002:a05:6602:1d4:: with SMTP id
 w20mr54575663iot.25.1609617647187; 
 Sat, 02 Jan 2021 12:00:47 -0800 (PST)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172])
 by smtp.gmail.com with ESMTPSA id o195sm37808718ila.38.2021.01.02.12.00.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:00:46 -0800 (PST)
Received: by mail-il1-f172.google.com with SMTP id w17so21697447ilj.8
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:00:46 -0800 (PST)
X-Received: by 2002:a92:84c1:: with SMTP id y62mr63483271ilk.191.1609617646749; 
 Sat, 02 Jan 2021 12:00:46 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-9-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-9-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 2 Jan 2021 12:00:35 -0800
X-Gmail-Original-Message-ID: <CA+E+eSAYbr76MK7rOLRjLq8e+E_MOsTthDD6YrpL_q0K7Tu6qw@mail.gmail.com>
Message-ID: <CA+E+eSAYbr76MK7rOLRjLq8e+E_MOsTthDD6YrpL_q0K7Tu6qw@mail.gmail.com>
Subject: Re: [PATCH v4 08/43] tcg: Introduce tcg_splitwx_to_{rx,rw}
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.48; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f48.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 6:02 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add two helper functions, using a global variable to hold
> the displacement.  The displacement is currently always 0,
> so no change in behaviour.
>
> Begin using the functions in tcg common code only.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/tcg-runtime.h   |  2 +-
>  include/disas/disas.h     |  2 +-
>  include/exec/exec-all.h   |  2 +-
>  include/exec/log.h        |  2 +-
>  include/tcg/tcg.h         | 26 ++++++++++++++----
>  accel/tcg/cpu-exec.c      |  2 +-
>  accel/tcg/tcg-runtime.c   |  2 +-
>  accel/tcg/translate-all.c | 33 +++++++++++------------
>  disas.c                   |  4 ++-
>  tcg/tcg.c                 | 56 ++++++++++++++++++++++++++++++++++-----
>  tcg/tci.c                 |  5 ++--
>  accel/tcg/trace-events    |  2 +-
>  tcg/tcg-pool.c.inc        |  6 ++++-
>  13 files changed, 104 insertions(+), 40 deletions(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

