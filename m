Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBED38FD29
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 10:49:47 +0200 (CEST)
Received: from localhost ([::1]:39144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llSl0-0000Eh-EF
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 04:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llSjU-0007ak-J5
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:48:16 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:33552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llSjQ-00048D-Dr
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:48:12 -0400
Received: by mail-ed1-x52e.google.com with SMTP id b17so35222861ede.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 01:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vofBthghFCTcVro4Nfb47W557uQUlbvXOBkr1OTQzFk=;
 b=pIffcDKSlyAZMmy9B8UkTpPE/0Uq2thlNFCbfULGw+5gOp62eSrAKc0V1eR98eeqp4
 AVy6h9G4L9l2IVBsN/pOH8rlF3hY/StqUAHBi/A7fAlBmBoiLW7FmYiw2sQVjwk/CVz1
 xg1MrB/GINux9fiyyTImzDjzSLi7+PTOSJLpynPuHqQbbVb1FWKqR0TIa3T1eZycbYVg
 QS4Vg8m4HPMqMIUOXL/8LB2JBLj7f9qhqKe5koGFq6XoH1qQCpOgZn4ryW+buFDwHHAJ
 wTjaY+43Ow08A3edWiO0PWYz+iJc5ChmEHFfp3AL7I6Q5QDZPPuiXWkuGqv02I0P7NDT
 NIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vofBthghFCTcVro4Nfb47W557uQUlbvXOBkr1OTQzFk=;
 b=CWYaGl11oDZRzKtVzjhuJR5g9xWH8zF36dgFlCo8WX88IyH9S0DldX5x4BYxotwuNs
 YCvarI0ovKfed1ni/0ikuEzKknp6+Gd2cyE7tbkQ0SsSiIGwuKbsE7Wc7kK51G1gUpGW
 Qj3R4ue4ecd53cd29dxDlvYM4n+9xkWpTRvav30brb2Jt6LuVKMIflWX+GvfwXH3fM+4
 EmPZgWchV5FimLhW6TrC7uVRO3HhMIAIVjNanG3YfoIHObb9UdBcLVhZ2000CzVDFmCX
 t/r/R74Hq2egiqOzJPW5+xyWRdayMQpE0Anb/Q30PYvDGipA5lbrCh3I9ZNy2ITXyaS/
 X0Ig==
X-Gm-Message-State: AOAM5306f5nREd7f61SEeqiYOp5wCfwPUL1Bo4ir/eF3xzCgeQYWsSlN
 EI9mxBiA/5m/XiorKwCrdNOzcH8IhQHVQC9GYe+q1A==
X-Google-Smtp-Source: ABdhPJy+hUbw6LCq4zLD4TsltSDdEeGjLzUHRtuE4Yg3lzREoIdYh5Y4EXSqBrA6WcTMcYWjWnIF/bpYDTRre22ubBY=
X-Received: by 2002:a05:6402:203c:: with SMTP id
 ay28mr30223830edb.100.1621932486647; 
 Tue, 25 May 2021 01:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210511192950.2061326-1-jsnow@redhat.com>
In-Reply-To: <20210511192950.2061326-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 May 2021 09:47:43 +0100
Message-ID: <CAFEAcA-Tt-bacKbipQkMF9s0OPgbYd4dSygfdDRAe+itpmzr4w@mail.gmail.com>
Subject: Re: [PATCH] docs: fix broken reference
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 May 2021 at 20:29, John Snow <jsnow@redhat.com> wrote:
>
> Long story short, we need a space here for the reference to work
> correctly.
>
>
> Longer story:
>
> Without the space, kerneldoc generates a line like this:
>
> one of :c:type:`MemoryListener.region_add\(\) <MemoryListener>`,:c:type:`MemoryListener.region_del\(\)
>
> Sphinx does not process the role information correctly, so we get this
> (my pseudo-notation) construct:
>
> <text>,:c:type:</text>
> <reference target="MemoryListener">MemoryListener.region_del()</reference>
>
> which does not reference the desired entity, and leaves some extra junk
> in the rendered output. See
> https://qemu-project.gitlab.io/qemu/devel/memory.html#c.MemoryListener
> member log_start for an example of the broken output as it looks today.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  include/exec/memory.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 5728a681b27..3b9ca696061 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -571,7 +571,7 @@ struct MemoryListener {
>       * @log_start:
>       *
>       * Called during an address space update transaction, after
> -     * one of #MemoryListener.region_add(),#MemoryListener.region_del() or
> +     * one of #MemoryListener.region_add(), #MemoryListener.region_del() or
>       * #MemoryListener.region_nop(), if dirty memory logging clients have
>       * become active since the last transaction.
>       *
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

