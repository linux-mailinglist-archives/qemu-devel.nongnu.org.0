Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988D74465D6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 16:32:39 +0100 (CET)
Received: from localhost ([::1]:45558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj1Co-0006MT-8E
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 11:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj1Bd-0005gO-Qq
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:31:25 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:38656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj1Bb-0004tb-KR
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:31:25 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso9804386wmd.3
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 08:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ldd/t6U+sACbQnl/iec1NcWeahb/j2CvMJd0MKtrX4U=;
 b=LWXLM/xdai5mjDl+qdCH7BHbUxOzSc56tBZM38zspQupufcl5Hq3HaCyTaNrXZujCO
 GFDBB4lWh5MK6q2vGijamkEJonYVUNcIsVmo/a6fO8GuWWhY+5X8eqaMxIw5Sdc1BStj
 ddH6xEEnitkOFE+9BLjMujKJEvX5Ua01FgnOVCtZQQq5Y49y3U+5axa1nYWYrxk4c6pO
 z5BhgBuV7NEHzHNoNAW3j0tihePZE0tALpAzCUFyTtjf6nUHDzxFB7SPKMOLqBku44mS
 2/jmzLfEk7AgLW61YKe/ecGVCxCX8EAnoprrhV6V8yJpzcM9wY49p2TvFDvAiySCtYE6
 7RGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ldd/t6U+sACbQnl/iec1NcWeahb/j2CvMJd0MKtrX4U=;
 b=5WEHtR+cVXx5LRvaukK/3A02dt1BATqbUkzFj8lKZvlSsqUTTAB9c4pgJnAy1ET8UM
 jmlROugWWvoO3pFv9N8fzte806B+483o0bQVMh1TR8KOQFVcs85CuDo4/cSYs23yiR7t
 Rj1jITbrgDlg4Qv+r1k7DVMBu1gqKNkfChteZ2s3TERvEJCzyQKzqKbr9/LIb868EwoR
 6oPELv0/ojH1rQayA7zpUNuWvCal6b5f6qhmBv/6/OtMeyDIstoSft8Y6dUHvf6Z1Tpp
 Z6VZBy7NUsWsTlgqGQ6g7Cu8fJ08Nr5yhTQEiiuqrizEqoswLV2rWnmt69kB2ie7zroZ
 CYrg==
X-Gm-Message-State: AOAM5302I0XD7T5Y1uW2XgV6Kz0pbX3lVzynrQ5HbWpEqLTe/tIw2LFz
 oTnf39IEaCS7JlN6TYhmu7IF+iXq5WuIs+lr0TKYVg==
X-Google-Smtp-Source: ABdhPJxTN4uk6ezecehADzZAkA71RIMJQWXwSt9EDRqQBmr5qj0sYvdOiS8CcWyTM4SY3hNIjsaXO8F4S4jMQUd0k5E=
X-Received: by 2002:a7b:c389:: with SMTP id s9mr31666658wmj.133.1636126281947; 
 Fri, 05 Nov 2021 08:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <61844bb6ced54_21aa5f2b09742af98856497@prd-scan-dashboard-0.mail>
 <SN4PR0201MB880836A27E0A0E93CDF7308CDE8D9@SN4PR0201MB8808.namprd02.prod.outlook.com>
In-Reply-To: <SN4PR0201MB880836A27E0A0E93CDF7308CDE8D9@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Nov 2021 15:31:10 +0000
Message-ID: <CAFEAcA9Tp0t+x+AcfJUJgqJxPMYmH7dTibYHGf0ipvPp71yGhg@mail.gmail.com>
Subject: Re: FW: New Defects reported by Coverity Scan for QEMU
To: Taylor Simpson <tsimpson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Nov 2021 at 22:34, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> Coverity is getting confused here.  The index can never actually overflow.
>  Does Coverity have a pragma or something to tell it it's OK?
>
> The loop nest in question is (the index must be < 128)
>     for (int offset = 1; offset < 128; offset <<= 1) {
>         for (int k = 0; k < 128; k++) {
>             if (!(k & offset)) {
>                 swap(vector1.ub[k], vector0.ub[k + offset]);
>             }
>         }
>     }
> Basically, it's looking for elements to swap, and the
> "if (!(k & offset))" prevents "k + offset" from overflowing.

Yes, I agree this is a false positive. I've marked it as an FP
in the Coverity web UI.

I suspect that changing "k + offset" to "k | offset" would
probably stop Coverity complaining, but we should only do that
if you think it's more readable that way. (As I read the code
we are doing bit operations here rather than addition, so
it seems slightly better to be using the OR; but there's not
a lot in it.)

thanks
-- PMM

