Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FEB5601C1
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:54:22 +0200 (CEST)
Received: from localhost ([::1]:33778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Y97-0007TU-Mx
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6XQb-0005tk-M2
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 09:08:21 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:37672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6XQZ-0002N9-3Q
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 09:08:21 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31772f8495fso147342327b3.4
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 06:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yfqKmAHpj0JEz6EA4ekbJTLGituDPawbqw3N/hp1Tio=;
 b=UmaBvc4pVDmY0KHppBssC4zMdYr6D6EXlJHM3hG7y/pf+zIw0tbIfiwUOEpo3s0Omt
 su8vLdle5F5pvbPhfmHtl79JiC1kpG+GopYilVAJIwKUzrI7W8s9tzV7UrzbLIfvgWgH
 i/S1rR7Z8UB++mmrW+g7pQ1+xKTAiTEFByduHbR/yww5xACuCgoa84aCJnd5Ob+86qYU
 amqUfWBuhBDumTshzcY6vbfobxiN/xFRQig8HP8XlCb1q8vyiB3cyeMpBpUyGavDF0cJ
 iMhkBOLDW4qv1QYDfT4X64K0XkjWaF7UBemut2y1yeIwz8vRUZpiudJGBN8WfEMPhGZU
 r0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yfqKmAHpj0JEz6EA4ekbJTLGituDPawbqw3N/hp1Tio=;
 b=BLws6f5i9BGeeGJRpKOPGMciTU5LiRMAqxKqu98CpWWUifVzP3b/SnSny/Mt8vF/x5
 yjXgiLkowR1YQga9tp6lshdSLsaGkaOAlcoET7SQWv4Q3Cntv40VOEnwbwLR+u/mn5Bg
 D2AVXKtBHZsayXmtDPMBjwsSpf9VjfI2zZLEkuBFbDvxcDddJGl6FCpZlXZShh0U/btM
 4NjKtv/07CrqoJNdhQ5pB8yk75gmIme7aNLt3w9c3Pww8uFpl9WYYAMvuvlACwOvnDSP
 UK685QOq/DYpneFhk/BSd9Beua/zbubErKmDFcCXECxAXmiBS5d0z0+T0zTqkpDJvjk1
 DSMQ==
X-Gm-Message-State: AJIora+OsVV2UhFg7jR9cuwDKxnkO0sj1zb8ra+OW49hRJ2B8rcYUPjQ
 TUpVeb4ZHu+cA1sG1iaVIxpavnOkRdxyBUQ79802vAS0+88=
X-Google-Smtp-Source: AGRyM1vS/73ic+JbXEyyDEfli7xRSeIFTHkZRtBzozQK+kvJZI/Tmp/Yyoq+RVNJ9AhbkaR6e2naeX3uTKc0iHxCm+k=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr3789726ywb.10.1656508096898; Wed, 29
 Jun 2022 06:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190131210851.9842-1-richard.henderson@linaro.org>
 <20190131210851.9842-2-richard.henderson@linaro.org>
In-Reply-To: <20190131210851.9842-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 29 Jun 2022 14:07:38 +0100
Message-ID: <CAFEAcA-rU-1xbk8qa6MdXOTtc6tSCN2_3sARum2sV80XzO4xow@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 1/2] decodetree: Initial support for
 variable-length ISAs
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Thu, 31 Jan 2019 at 21:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Assuming that the ISA clearly describes how to determine
> the length of the instruction, and the ISA has a reasonable
> maximum instruction length, the input to the decoder can be
> right-justified in an appropriate insn word.
>
> This is not 100% convenient, as out-of-line %fields are
> numbered relative to the maximum instruction length, but
> this appears to still be usable.

Prompted by a query on IRC I noticed that this patch from a few
years back added variable-insn-width support to decodetree,
including a new commandline argument --varinsnwidth, but
we don't document how to use it in docs/devel/decodetree.rst.
In fact decodetree.rst doesn't document decodetree.py's
commandline options at all. Could you maybe write up a
docs patch to describe them?

thanks
-- PMM

