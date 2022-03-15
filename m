Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D384D9838
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 10:56:17 +0100 (CET)
Received: from localhost ([::1]:44422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU3ua-00047t-VZ
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 05:56:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU3rh-0003Aw-IK
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 05:53:17 -0400
Received: from [2607:f8b0:4864:20::b36] (port=37528
 helo=mail-yb1-xb36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU3rf-00081C-OR
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 05:53:17 -0400
Received: by mail-yb1-xb36.google.com with SMTP id m67so2777133ybm.4
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 02:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4y2gE39oytkj7X2NpYY7bRBTa+kqXbTDmdp3PTkKshI=;
 b=wpvuo+6X2iU0N1A0H8RGsgEjr9CT5bXds/aEg2jTWJB/r+zOF2LrBAv+kVmVT28mXy
 UTNlj8JJODS5KBZuQ/4P44HjYN5cFmQ2YpK6HILYbapAWx+zIEp3mkZsHIZNnnUwZD4s
 5/f3TVjlFBq0Ex0ZVjxeKb2rXX+21G0DduGCqZrVsm2lYzTefTBY+6DPtwf+lArxoAJy
 +2NrEv8Rr//2NDwpQqj01rbeIn7eINW4uCS8Fr1cailFNyafPir36nzg1zxoXFKLCw5c
 YzKCjrDFLsR1mfX2GFOyh8U+z/oKqL3conGWMNRKiGuv2rge59z5xFpZwZgw6tuP0XwO
 6b0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4y2gE39oytkj7X2NpYY7bRBTa+kqXbTDmdp3PTkKshI=;
 b=IbQ4DeDO579fEWvK/Qvpo4lX9ZEVyRssfYzf5UzBPiJmMF1T5FQSBmsdk1Q3TdzQQl
 RoO4z/kw7BcDs8PepUTyTgJjlKlny6z3I7Fhp+o5PxZYdoBpuj0VqLaC3p7D2/EtBu/9
 dx9RDzfDsktYKfEUxr1lYjD+v37YTkr1lV0AkvrgP3LRIOMcvKGkDBS11TTFTwGCY7uJ
 yrpoxZ8pdsD1bGHWcLJO1FQHZXyAsMzcBUJmL+m/rsw0p5tM4R22tpCY3hxgT4Jdu8uO
 F0UC4hWiFgL1HRzjqrj9AF0UFSPn9qBvd2befeUOr4X3ynYWA+KoXWA+6SLp3mZj5M3h
 eAAQ==
X-Gm-Message-State: AOAM531KbFrmv8x4doQGQXAdQE1LyLdwf/XEaam+hrkC0M7SmwtlJ543
 ugz11zoMzq2TdlCN2F5q1mMhQ1qWQ+J5eXSoa0uevg==
X-Google-Smtp-Source: ABdhPJz300vY7dLPGAoU/PRKVWnTxsbGa6vydtDSvVzppf6uD/rTaEMlUabgpUwNhKReKqFfpN7AKphKNffEVIGAWYs=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr21771687ybp.39.1647337994635; Tue, 15
 Mar 2022 02:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220314173607.145630-1-richard.henderson@linaro.org>
In-Reply-To: <20220314173607.145630-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 09:53:03 +0000
Message-ID: <CAFEAcA_0ENAhcjjxKcrzfA2QVEzrDa_RjoM1==LdVeiAWUV2oQ@mail.gmail.com>
Subject: Re: [PULL 0/4] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Mon, 14 Mar 2022 at 17:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 15df33ceb73cb6bb3c6736cf4d2cff51129ed4b4:
>
>   Merge remote-tracking branch 'remotes/quic/tags/pull-hex-20220312-1' into staging (2022-03-13 17:29:18 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220314
>
> for you to fetch changes up to 76cff100beeae8d3676bb658cccd45ef5ced8aa9:
>
>   tcg/arm: Don't emit UNPREDICTABLE LDRD with Rm == Rt or Rt+1 (2022-03-14 10:31:51 -0700)
>
> ----------------------------------------------------------------
> Fixes for s390x host vectors
> Fix for arm ldrd unpredictable case
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

