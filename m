Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6964AA0EB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:08:11 +0100 (CET)
Received: from localhost ([::1]:44892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG4sL-00009o-LA
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:08:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG3Pj-0001Cy-BL
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 13:34:31 -0500
Received: from [2a00:1450:4864:20::334] (port=54040
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG3Ph-0002fc-Ms
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 13:34:30 -0500
Received: by mail-wm1-x334.google.com with SMTP id n8so5139601wmk.3
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 10:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xmMDqerlSSkY7lzEayqcK7gonWjIiB0TGhaauSMgrgE=;
 b=vupb8XZ3IEHgFrndbODvApU1T85F3pRbwuj1xz1n40uu2oBWtJ4WaEp7EOy/nqn/+j
 ZHhHP6pP/OojgxvufHVOT8YqVuexwJwcOjgGfGJ0H8Fp0b8g6nLDZ3eeSCsZVw4lwveM
 MlZXiQfwRZleAXq1y1gokH/o3HYK2RZ39f+BMoToiTV+Gz7c2+/dNWPXs7Df3UY/Yc4S
 p9/KYWoyJMLuTEjPl3TFwYGDxFhHqUOMOQL9osVlL2vTmK71OrMjFYah4InS07ajgD5s
 ZLmE2LCxtFii1J9F/zzEuoSRoLZ/2xo/ZXvFoR6Ja+fvdAs4OJAqGHSc61i3lkm4Eft5
 5a1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xmMDqerlSSkY7lzEayqcK7gonWjIiB0TGhaauSMgrgE=;
 b=kJKcrLwIvTbYx5vEa1A5Yz0SeIWzb53pn0EbsRvrNyAEysspvL1+Mz8AzHSPSDZOWQ
 f2WYB+3t/0Ib7FlfkXfC7g4NSlY3qSuJHiRMj0JiYI6NMhV4/ZERhu9h4jDFHcNaNm7n
 yl4sXq50fqiSogz6dw5KfRv9CxDJklMleMrm9Gsaq9O/8xl8BY+S4nhTyy5lyRMrBC2X
 xsVARSjJqz3Q22ExuuCnQfpT4cXYYUCAEl1Pe49ftvcIzLOY/LpRjZrGoRpWfRpsRyNT
 i4PF7ny1j+4ytDYcsW0fEk4fDFYPEpwbTm531sb8767cWMYIFfJGPebkDDGkNZu2977X
 Zn5Q==
X-Gm-Message-State: AOAM532CcgHjYYJk4ltjV1DuNxqjrvWqnDvwTGrNWJBbaPQYlfdW1/7D
 91HkaTAyiv5FNvR1qQ/vK7/h8HEQjG5PlkqcRSs/bQ==
X-Google-Smtp-Source: ABdhPJysNG4eoJnwNvmlBr8fozLxkcEFdg5CODx4X9yoJYizsiQ1sM6CwT6y5b1bquzFYxeVyLNAFo1T1KUs4dHydFk=
X-Received: by 2002:a05:600c:3552:: with SMTP id
 i18mr3370784wmq.21.1643999668242; 
 Fri, 04 Feb 2022 10:34:28 -0800 (PST)
MIME-Version: 1.0
References: <20220204070011.573941-1-richard.henderson@linaro.org>
 <20220204070011.573941-5-richard.henderson@linaro.org>
In-Reply-To: <20220204070011.573941-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Feb 2022 18:34:17 +0000
Message-ID: <CAFEAcA9rfc5ycQCki=qpP-HKQ1S20X0ZM-TxJKX42-8nQ-wmMA@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] tcg/sparc: Add tcg_out_jmpl_const for better tail
 calls
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Feb 2022 at 07:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Due to mapping changes, we now rarely place the code_gen_buffer
> near the main executable.  Which means that direct calls will
> now rarely be in range.
>
> So, always use indirect calls for tail calls, which allows us to
> avoid clobbering %o7, and therefore we need not save and restore it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

As an aside: I found it a bit confusing that tcg_out_mov()
takes a 'type' argument but ignores it, whereas tcg_out_mov_delay()
doesn't take a 'type' argument at all.

thanks
-- PMM

