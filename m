Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336E91B9FDF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Apr 2020 11:28:42 +0200 (CEST)
Received: from localhost ([::1]:33840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jT049-00076g-9K
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 05:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60796)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT032-0005zf-Kc
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 05:27:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT032-00012b-0C
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 05:27:32 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jT031-000110-Ga
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 05:27:31 -0400
Received: by mail-ot1-x341.google.com with SMTP id 72so25059781otu.1
 for <qemu-devel@nongnu.org>; Mon, 27 Apr 2020 02:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jUW7ujg8+1frTiwl+Vw+rEehy9pjVQUkbwS6EcBELuA=;
 b=P3PrNN8JuxA/zfmxELudhpK6rfjeMiYhEnbIJEG/WVsu9zUvFHcEaHvcw0cAbiCDml
 WSBF8AOU2MdZIJf6AC9Fcx8MA5TmhH96ooHsa+er/MyNJOgxcMUue1AVLRB7ZjP3kEHh
 NKPBl1VEE7HRL8BXEBCBRMmFkGfWwNdHNHt3CDxtrV8sT0imZQAEf5ZwuYCsUwgcSFJh
 fVLtIYpvCvS1b7dQ+rDpIkAehz1Spvit22p1vIkbM4yT6Xl6xwT9XaAtpwGRfEte4Pi8
 heXm8oQimewBWU2PX1/efIdaznISR1ceYQDsrT7SIZHEJlhOLeRon/qiIY1Lqe1BkhtB
 zj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jUW7ujg8+1frTiwl+Vw+rEehy9pjVQUkbwS6EcBELuA=;
 b=sgwA6bLxtbI8Siff2WRPsZj4KNanuZY9JySeJzVIt1xXcb2P+wQIrPCHfRo5EEEekS
 2fc/GVW6c7+K/uXJa3fZY60zNG37e2/ho+Oa+bbYmAKzuAJnefFKZlqRrcp7vTmk3QAr
 63tzJPulVVmDDe5iczdsNv/qFFmditEOYfDf7GVnb5x8CsO1BE7v2YlkQ6Zu61jKwE2h
 wJNuFWil1Y/cW5vlUnrVbeuQiaDNg3hZMkdV84KvBXleXAeofMW5sblYceCQ1loh/t4z
 DD9W3xFuFVc7zrZYtNShQhkZbLj7eAKSckui09V1qTx0QTvn6R8mz+/CmFiJX57M+4Z4
 y4dw==
X-Gm-Message-State: AGi0PuZJ7EBbSlrsX93g0VBmdR9cvxRV9PyvfAvilJXY7jozrcmFfJcl
 CCoNK4jmdulUSpYLP+3KnvRRbql4Xvm7vEhMpvnZQg==
X-Google-Smtp-Source: APiQypJcXUQdPqkXBPM5iUbfMoM1ikQEozKPmHP1/ylRbPsGDrtIMAP33bs0mHSlt5jyE4TeFfI0DJpgagUdgF+U+SY=
X-Received: by 2002:aca:c751:: with SMTP id x78mr15234690oif.163.1587979649842; 
 Mon, 27 Apr 2020 02:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200422043309.18430-1-richard.henderson@linaro.org>
 <20200422043309.18430-2-richard.henderson@linaro.org>
In-Reply-To: <20200422043309.18430-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2020 10:27:18 +0100
Message-ID: <CAFEAcA-hLN349aQYList5f7oBzoKp9CrCOu1+zMXmfKVU_G_cQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/18] exec: Add block comments for watchpoint routines
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::341
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

On Wed, 22 Apr 2020 at 05:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/cpu.h | 23 +++++++++++++++++++++++

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

