Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653553583DD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 14:53:02 +0200 (CEST)
Received: from localhost ([::1]:33196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUU9d-0006bU-Ax
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 08:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUU4d-0002jj-OS
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 08:47:51 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUU4b-0007G8-O4
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 08:47:51 -0400
Received: by mail-ej1-x62c.google.com with SMTP id l4so2794583ejc.10
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 05:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QAYUbw5XgQAHkMiEchtAHmz4INBKE1zAtZGvAkeWZck=;
 b=aIAvUhPO7Cq015u6T8+6Q3fP2cnZaJmfcfO875KbHBIt3U38SNILKbl8XhXYeoXc9T
 k4nRoVIZeq5+yQjU7yWJz+ISueSfApNlHPvuPrvEvCAw1rd53MgBnYA48MtB+o8XaumK
 7+gA1UtROA17rCjSa70L+dKymMV1N4psuVe0VO6NmxJD3yhP3bjO1sKyx0O2eKpD7e6V
 wSIlV4IasAsVvzM3259hwqGCSFyF8Lth39jvQZa0Z91llb1HXwucXsVNgxctXgwczFZW
 WhQNnnTm6noofH0OLNRBI4SP4Z4Xovaj7aIHA4WsXVYjKtLG6aO5HOm9V8gZ/mmhrkkf
 nq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QAYUbw5XgQAHkMiEchtAHmz4INBKE1zAtZGvAkeWZck=;
 b=NsINc7QIuov/qgvPY6kCS4A4YnLcyyFV9pU379wvm4yslt0McWbexd7RcmLXAlbZBN
 w4MQBjZjfRInNOdjaIdE3grW6h6LzmPeaSX/Bd5LVqLPfgKqOj9bPJKMnDCWMP4qqFi3
 DCGhr/V5tbe/9HPyd0hh7Q+q4JSuj6vzZN1pYLJfxukNPyDxBYlte3uq+DUY5VIgLFdf
 3knH+QiC08u0Lyt2Mf3lO0Wbn/eFprLTurPzsrQjA67XfUFwMZq6MZkaJSdYP18/86AW
 yXDpLqgH2j8eyTWeU1Latz0QIC5u7pFSoVh8X2MH6dVAXSKaiUgxV1k+Qz/kKckESLPF
 3ROw==
X-Gm-Message-State: AOAM531+w2mdWqD9vWRMXYZYZKU/CrQaux3D4N40+AEApdieNN8+6ME9
 3qhSee3aOTAQE07j0F6ZTyrBEfjD9IVlWoHYv0SXyw==
X-Google-Smtp-Source: ABdhPJwlSAutGnAZalRP6A2iFulixIeEYDPqBnd/y5U+YOUvUzC6Y9fs2oEKe1LJGwpCIPnmyqSlk7joIf5QNwgock0=
X-Received: by 2002:a17:906:881:: with SMTP id
 n1mr10323609eje.56.1617886067873; 
 Thu, 08 Apr 2021 05:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210406174031.64299-1-richard.henderson@linaro.org>
In-Reply-To: <20210406174031.64299-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Apr 2021 12:47:07 +0000
Message-ID: <CAFEAcA_9v7i1p59EThNPfuJHxXqwgavupV4otqaZMt9Q5d=SsA@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] target/arm mte fixes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Apr 2021 at 18:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v4:
>   * Fix tag count computation error in mte_checkN, which when used
>     by mte_check1 in patch 5, caused all sorts of KASAN failures.
>   * Fix PAGE_ANON / PAGE_TARGET_1 overlap.
>
>
> r~
>
>
> Richard Henderson (12):
>   accel/tcg: Preserve PAGE_ANON when changing page permissions
>   target/arm: Check PAGE_WRITE_ORG for MTE writeability
>   target/arm: Fix mte_checkN
>   target/arm: Split out mte_probe_int
>   target/arm: Fix unaligned checks for mte_check1, mte_probe1
>   test/tcg/aarch64: Add mte-5
>   target/arm: Replace MTEDESC ESIZE+TSIZE with SIZEM1
>   target/arm: Merge mte_check1, mte_checkN
>   target/arm: Rename mte_probe1 to mte_probe
>   target/arm: Simplify sve mte checking
>   target/arm: Remove log2_esize parameter to gen_mte_checkN
>   exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1

So, what should we do with this series for 6.0 ? We'll be at rc3
next week, and this big a change seems risky at this point
in the cycle. Is there anything in here that's worth extracting
as a for-6.0 change? (maybe patches 1, 2, 12?)

thanks
-- PMM

