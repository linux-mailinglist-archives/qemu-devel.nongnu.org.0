Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BA948AC76
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 12:29:45 +0100 (CET)
Received: from localhost ([::1]:46540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7FLU-0003Fg-55
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 06:29:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7FGy-0001sB-KU
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 06:25:11 -0500
Received: from [2a00:1450:4864:20::435] (port=41761
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7FGu-0004eF-9M
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 06:25:02 -0500
Received: by mail-wr1-x435.google.com with SMTP id v6so32251196wra.8
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 03:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yMcihyz1BuOdWrEB7uVEPBKSQOPoXfXgI4uAMK9CK+w=;
 b=P80MJxix4CGVTGQ+4f/abEW/96IEID6DFmTND4Mre2i1Y8ghXO7zZ6u+gi5KNMBLeJ
 oxpfKjgn+/8qBFsKzlIWODdLA5k5laxgGELlVTJXCBItBaQEuEiSEoFv5DeMF2DxKKHM
 zSN6T7yKBhMxG/B2y627s8511IPS4NFjW7Ub4jJKJxVFNFgicpyl8DMGqEFphAU1KBU5
 2Wjb+3kf2oeNJk2Pd/XJ5BfYLY+3PmyidPkzTPiNL/JiiTuqbAHptOjDCydRiG19RpmQ
 O4NZgnN7xsCGzG+Cxl8tFos7Bv+zziWJvy8qGJvIx5XOx3VCd19+R9gGghQWHBTF8xNx
 8HqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yMcihyz1BuOdWrEB7uVEPBKSQOPoXfXgI4uAMK9CK+w=;
 b=AGjl5YBogsdiErwJC0VK2rqcTwDvnlZuodU/blbu7D6sLXdOGzPiGgEhSnQch82df0
 lm8O6jBaUItn4o8uwwPjyH2KF16cz5NGxR5JVqVMEuNO0j6hApDufgcB1Q4Da7r7z5FT
 V8FHtoP+Bpv9GYzuUDVd5ejQ6k2PCvJybjTUe6Wh2q36zOZi7VHv61mskfYXZNEnfqDw
 BCi9vc/HEe4lfMVpb3hveAWFTkI0yjtQXCOmH6/MKcBy9CrnQsPGZlHp4mgLkAms45St
 yxwGBfnGn3LT81Ma3kIhSSO6Ex7l8m/Oi3wEzxHbsvsg+tMmuQewElcuvtOol8JaCDRO
 /sNQ==
X-Gm-Message-State: AOAM533mmRncVtyMvsOpAD+rdMlNjOez2tQQJYoVsSiOk1tWsTUcrlv0
 wNsd84TA7gp9UnpcTsZM+twsH7kaTkiYDuFrj3W0uQ==
X-Google-Smtp-Source: ABdhPJzpQMLiF/Ij3lkJ0wbu2u3Z7aTjl5G2hW2M98OQrkW6+wsnrdXlxm9owfQNMZ6pl9NKBF4PgBjd6F6oyQBexL4=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr3320158wri.295.1641900298357; 
 Tue, 11 Jan 2022 03:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20220108063313.477784-1-richard.henderson@linaro.org>
 <20220108063313.477784-2-richard.henderson@linaro.org>
In-Reply-To: <20220108063313.477784-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 11:24:47 +0000
Message-ID: <CAFEAcA-paBos=+yL2+5huNUJXLaoZS4a0g9sE_BjCtz-7xTzvA@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] tcg/arm: Drop support for armv4 and armv5 hosts
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
> Support for unaligned accesses is difficult for pre-v6 hosts.
> While debian still builds for armv4, we cannot use a compile
> time test, so test the architecture at runtime and error out.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

We should remember to put this in the Changelog when this
goes into the tree.

thanks
-- PMM

