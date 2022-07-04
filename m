Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0044565487
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 14:10:24 +0200 (CEST)
Received: from localhost ([::1]:58478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8KuF-00028w-ID
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 08:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8KoU-00040A-CL
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:04:26 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:41615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8KoS-0005Ym-W1
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:04:26 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-31c8bb90d09so26149627b3.8
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oq1l2TBd1ahUWNgNlTAYbuFudOaQWGD2u5s/xpe13h0=;
 b=hf0dZCoEfzqLCaB+yCUYfaIznfOqogI/4TSN18usjKFienTFEtoMzROOLi4TNIDoVN
 e1yaUFcJaghhYekj2Y/1hxDQtTXHKEo5hjC4oNdd6XLD3O/lyJbFIb4y2tvgiogZqit7
 5r9dJqtasC+TQbgq1Mxw96KbGsBnMDFEDFNse5kML9SXE+UHwxTARQO6CyPBg5qpX85d
 OgLS4+pFTDEGxGszpoAJHVAP7+hcZLeM0TFqlqwM3sp3g4UBLzapWr14YXixIKTiVJbA
 FdQpZLO1J3Uk5rzqhJCUSw1I0YiwsNQpl4Zs3dl7ZY1Pgp+N9+ZItyBt7bmKW9aG3RsX
 DLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oq1l2TBd1ahUWNgNlTAYbuFudOaQWGD2u5s/xpe13h0=;
 b=rRgJiDnGoqusfS5pGXA6EQlbIAa9hevumyc7QIxvz0kTLfC05uEx3fDYH0n1nAjHkb
 C3ba8JwzHYZ2PHpmFvPEhLbZkqEbKkOXWIBPIvvymlamUZWtzNz2x6G2u0UDqja58Dpa
 NRxPaocdd+nhiBXV2a4AFrohxsObY58nJn7gj2tIf3Mz6FtR3PFjg526k3lbeHkmftrt
 9S18istnBYZ/OOPcoJaeULbOWrBhh1bBpm8sxYa94xTr9Tmd3yO215itTVgqFhcVt4k0
 X1sIYsuRwLwnwdjeODu+SP80vlJo+1V1LDgHOuh2sp7coTn39s1xYr/rlDXEU1IDtsk1
 2xCQ==
X-Gm-Message-State: AJIora8b1CJYRPF8JCxPGICEkCilt6YDQj49a+jyNTKSMXBr1IQ0QOTQ
 ums8yBoEdnbm+1vSDQnnBitCIPre1liW7VZX++8sZg==
X-Google-Smtp-Source: AGRyM1uC/11xSltQ14AEE1QHPaYKI0HGL9Q/HI0P1H6k4lxcJYAupwHRafp/jxnyzpzrh6/8TDIWIEHPXwQOQED1+I0=
X-Received: by 2002:a0d:ca4b:0:b0:31b:7e6a:b77a with SMTP id
 m72-20020a0dca4b000000b0031b7e6ab77amr33701982ywd.347.1656936263606; Mon, 04
 Jul 2022 05:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-37-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 13:04:12 +0100
Message-ID: <CAFEAcA8V_7StzCvOhXR1a0RYk_Va-RVy1Goa0uz9wTfhHor+7Q@mail.gmail.com>
Subject: Re: [PATCH v4 36/45] linux-user/aarch64: Tidy target_restore_sigframe
 error return
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Tue, 28 Jun 2022 at 05:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fold the return value setting into the goto, so each
> point of failure need not do both.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/signal.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

