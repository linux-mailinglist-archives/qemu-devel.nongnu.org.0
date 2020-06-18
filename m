Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC871FF95B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 18:37:33 +0200 (CEST)
Received: from localhost ([::1]:33912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlxXf-0003i1-9U
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 12:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxWo-0003En-4Q
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 12:36:38 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:40343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxWl-0003JD-At
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 12:36:37 -0400
Received: by mail-oi1-x244.google.com with SMTP id t25so5634307oij.7
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 09:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g8N3m6jCJdYzMzXYIR5BFYcKxw/bNy07mahMLObkWTI=;
 b=sP0NE6PMrZ/jCplAZ65v0JIXPSFT7fUB8z8cUk8GJI8ntfFo61UCRXMP16w2HfUCJk
 nmIJrCYWIeJgcV83FP2v8Al1emZ+2ogm05fJSGJB5yy+RVbkErNRaLf9GMeMNV3fYM37
 rXkH/JiETdlRCvPZIPE8N9/s+ojzP2oWoIk7gj6j72gN3NHWwVxaJX/QsulyAeaYlpWF
 m4O6iyoeDkUq8PphgThvR/RUAwz+s+x7+qSFxxMTt2B7E4JAGG9HSLqcHEZbH3amp6EE
 AUFsD8iTrNsM0ieHO9rpRoUIXqCueNAPYxw3hV8K3SyFgAKrhl/4hxpQG+LCtECDKIGg
 pYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g8N3m6jCJdYzMzXYIR5BFYcKxw/bNy07mahMLObkWTI=;
 b=eTubghoRUuyihrhAz8OA7Usfv3SrQAzvKzV1KL2U+gMdYa+zwiEJYdyqUNvLFtjEPF
 4o2yKM8tvhbxSoKnGgIvVCVQ4VjddlLI5ylGmXc+8eHO8Pjth9nsLrDDRngoHyDiq2wt
 8ZDhNl6uReeWDX3S9pMOVFLJuJK+BH0i5J1yvDr9W55f5rZ9MGYpU0QBkxUrEGjcOwfo
 kD6sKQ683yuloXj4xVjFCVAgWlFxw5DiXJ6+7kSaAquIW332tOi6XkUrcfJXmWYmabdI
 jLSi3RKKr4LlesTdwXqtpfwCJkcIYFG+irKzWWid9regazsmAS0PIJsaysq6TwK4DXH1
 q6NQ==
X-Gm-Message-State: AOAM532VUBeEpd6w4iT6obR8313Tes+tAYiyGmzrhXbKin5IoL9JbGal
 Fvy0HBKvuSX2LHOH5Bw5ZpIiO71E/ubQ2wuy9xiQUQ==
X-Google-Smtp-Source: ABdhPJwFRd+OgqwruDnBDkGW1tSohZm01DNlVSesi4x90VGCmyMBy7yCvSQczlTt9C+QvXAETlY0/u8HUOZyH1xsS1Y=
X-Received: by 2002:aca:5152:: with SMTP id f79mr3579963oib.146.1592498194081; 
 Thu, 18 Jun 2020 09:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-25-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 17:36:23 +0100
Message-ID: <CAFEAcA9J_sQaDnST+y9vSZZ=renXBChNtzuhaNjsQF1H_4Q1QQ@mail.gmail.com>
Subject: Re: [PATCH v7 24/42] target/arm: Add gen_mte_checkN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Replace existing uses of check_data_tbi in translate-a64.c that
> perform multiple logical memory access.  Leave the helper blank
> for now to reduce the patch size.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

