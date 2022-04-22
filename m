Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E6E50B86A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:26:27 +0200 (CEST)
Received: from localhost ([::1]:53300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtIo-0001zQ-Ow
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhsoG-0004k1-OT
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 08:54:53 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:42978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhsoE-0001B5-WB
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 08:54:52 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2ef5380669cso84190847b3.9
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 05:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5keMIMhNdhcMOJkdV/IYZocQRz6Cpocz9306AJ9uXL8=;
 b=rL3ei4n8Oz5LTY+0J44JaizSE0MrAd/cWUH2oUxXuBmbuJL7dzp5sUHcxQ8ArLXS9U
 7H9ebumx6VCNQZ6s3mkpr8skC3t56H3C01C52oTtcSy1roQsrQCDW/7V55RIri1K2T1m
 wPJHNj2k1PPMSrQ9x1sF/G9bnJGgZnmFUHeg9050i/RBJ1du+CfeeV5n2JuTz+SNtOw5
 mHTvESrRE+2dR6dMTYuS2ynu0jlfTRlIB/oYtogTNF1+EPYXGByPz2VsNO02Xw0EoG6K
 KxPfViqLg5xP61XdX5qH4REU4KhPpO5AXTQ5KseWABuFehzG6+Bd0bGrdbAgiFO+lz8Z
 wGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5keMIMhNdhcMOJkdV/IYZocQRz6Cpocz9306AJ9uXL8=;
 b=eYiJFSN/0ijVQ6Kz3DD8OoKY9nNkZ8WeZEYw2IX0hF2NM2Rmu440syJEvFE2WstA2a
 qUB7VZyBoZhdgAG8ZF/OoZ4jEGSwB+2N52nj5RUCdFX6hwyOpriJeXx8YMT+Uwvp3GbV
 en+65vMxyDbJ8VPw64cyeLl4p/M3OFEZFp0MCtWba0eK2sCH2OB9I7P27OyHGY3URT75
 skXbTJmvQac9bl05DNXHgT3Ou/bOiV0JgstLZVwR+p7V8cE4EqJUW434/bvNvt1ETf8o
 7VQNvFZY78QLWP7WgnB0Wf6xCx2AIJy7zNSHpiHmz3TQytrDBAAuQhzqsEEdyxa+G+OH
 D1gQ==
X-Gm-Message-State: AOAM530Bnu7Z6U+5iUgXykugUvoDeXLLGxbkcuuvf0sF4/ZPykPXlQ+o
 hfLDurBcJh2iOurG3I4N3oUGuiouli8Llcce7KbB/9HHNw4=
X-Google-Smtp-Source: ABdhPJxzuded5xQC2+v8oCyjpy4xFTCMC0bV7q46sJK97rnav4d3VFltf17ELQi5n4WNzQJBrzqnE0E3m6clGNkwP3w=
X-Received: by 2002:a81:6642:0:b0:2eb:c364:b8e1 with SMTP id
 a63-20020a816642000000b002ebc364b8e1mr4480147ywc.64.1650632089922; Fri, 22
 Apr 2022 05:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220421151735.31996-1-richard.henderson@linaro.org>
 <20220421151735.31996-13-richard.henderson@linaro.org>
In-Reply-To: <20220421151735.31996-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 13:54:39 +0100
Message-ID: <CAFEAcA8X7pfHGD4WYaRjN_ux=MT8wY6=5w3hqzUpVug85Ru+wg@mail.gmail.com>
Subject: Re: [PATCH v7 12/64] linux-user/nios2: Use force_sig_fault for
 EXCP_DEBUG
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 at 16:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the simpler signal interface, which forces us to supply
> the missing PC value to si_addr.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/nios2/cpu_loop.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

