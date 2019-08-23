Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 816FE9B586
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 19:33:49 +0200 (CEST)
Received: from localhost ([::1]:60230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1DRc-0008Qj-8J
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 13:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58474)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1DNM-0004lF-EF
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:29:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1DNL-0004v0-E7
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:29:24 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44912)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1DNL-0004uW-8q
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:29:23 -0400
Received: by mail-ot1-x341.google.com with SMTP id w4so9419942ote.11
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 10:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VUD8n7OC2ux8NyoIT2qOnbI/PPMDtdmpdrWexT6wtgM=;
 b=uX1cX9ShaFw5VPyeSU95W9yV4/r815qnbjKy3rjkqYb/hQviv6ZK3L3lJ15BnTbPSK
 AWinjNkEDFUIaTOMCN/8ZAr3LLdgAo1IGgGXsza+MQtnGg2lHnsRaKKBR59GMgglmLLx
 5uQ5BwraHAX/sVJ4SH/Ivewpwcfv+ZsmhUQpSFcL3Mx59ux4kBR8fMn/mt0VcBOSrgL6
 bRGPvdJjtig6CuGhfldbcQyheAms8ccufJJIiBJchHPRNCeNjqp5SsL4TL8+9l3x/d0/
 +OTKZo0gD8p2slEzJ3gZ26bhzgqjDFxetH3KOY+qr8v6iGeYYwsg6uJZ4JhZlDCyG8b8
 Qtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VUD8n7OC2ux8NyoIT2qOnbI/PPMDtdmpdrWexT6wtgM=;
 b=SIOP8rHPRQEazwT+veUHjfJ/A8YsyPyCMgmHiHv0zJQIbTFBnd53VzNycq+yXZQ5zJ
 2FdVvtNq9ZAzy4rGWp2YyDk4iPZP/zB3Y87SVv+vXfe4O0FGegUlxfy0v8wYLsI9cqkD
 iFmgVw7WBm61WOAkTz0MkWrSZUg2yifntoPqBPcqRYwqaMrstfbdCUBGLFglKJ71pu/e
 W9ThBOFcnEiYbieywVQsuaBgDwFPvlPmvRFFDb6PGzWq6Fcq+Ry8wFc0cV7qUrT8G6HX
 TqiSVGJ8ID/oogLcTaQHACUnTyK/njxLplCjZgEfLnYnTkGanpjAfHIeUjNjSTsyWAGe
 QlUw==
X-Gm-Message-State: APjAAAUypb6V9PdwMod8LNCwe9Fp/g5bT96KBZ0QL/QqPvjisyB3CTKo
 Bt7ixIn5GwdL/MRmiT+77CXnrOi+KGaSTuZ5UBq2Ww==
X-Google-Smtp-Source: APXvYqzf+5KzuxhWw2UC3B6G8qEEWb3OGLI9zLa6U7W+VgNZrlvmBmgWOv42Yo9Atbr3si+gT9KnFUY8cg8z4hl/wCs=
X-Received: by 2002:a05:6830:2103:: with SMTP id
 i3mr5211671otc.135.1566581361646; 
 Fri, 23 Aug 2019 10:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-29-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 18:29:10 +0100
Message-ID: <CAFEAcA80UB-0R14raqoFF=1MDMVAR=PVfE2CPzg6U1YWwhBQHA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v2 28/68] target/arm: Diagnose writeback
 register in list for LDM for v7
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

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Prior to v7, for the A32 encoding, this operation wrote an UNKNOWN
> value back to the base register.  Starting in v7 this is UNPREDICTABLE.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 4451adbb97..29e2eae441 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -9880,6 +9880,14 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a)
>
>  static bool trans_LDM_a32(DisasContext *s, arg_ldst_block *a)
>  {
> +    /*
> +     * Writeback register in register list is UNPREDICATABLE

Typo: UNPREDICTABLE

> +     * for ArchVersion() >= 7.  Prior to v7, A32 would write
> +     * an UNKNOWN value to the base register.
> +     */
> +    if (ENABLE_ARCH_7 && a->w && (a->list & (1 << a->rn))) {
> +        return false;
> +    }
>      return do_ldm(s, a);
>  }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

