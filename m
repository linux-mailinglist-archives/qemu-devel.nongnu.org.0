Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC8C3E4473
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 13:14:37 +0200 (CEST)
Received: from localhost ([::1]:48828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD3Eq-0000LM-6w
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 07:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD3Dg-0007xM-Hg
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 07:13:26 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:42817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD3Dc-0006Z8-8h
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 07:13:23 -0400
Received: by mail-ej1-x62c.google.com with SMTP id e19so28208319ejs.9
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 04:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zoOb3RWQdjmHM+sES84MH5a5cMCphrrd8tuuQZLRloQ=;
 b=X7SOIUuLrmcLMEjNPdzucW3uhRN7SUiY9Mfxq9qd2BNbvdwv1bpYLGfz5PcC38n241
 0oyyG9jduGpFd6J4HTrrLjREGxgeyFyNNxqanSvc/K23KMFSmXVDsbw31YhhZbgjse56
 mvZELnuy0n9a1cyzFMfo3KK2meuTERIoEKZU9+wc5+1IJ/ziUkZPVIVWEOlPYXQE0jTE
 rJTWzfVRf3vX3eD+L56MHzQ2lNCfXRnmf+f7VxaIG20LAYUAtwLGjii6AUiM4N+c1bTM
 iuqeivik1yntpQ9IcN2bgoLzYMnlVDSnfMvjWM3hN+e+WBBHFlIypfS3GaOtOxVre/rf
 Y+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zoOb3RWQdjmHM+sES84MH5a5cMCphrrd8tuuQZLRloQ=;
 b=N4N+EpJz2qk2163copBh5V7rxLrbIPeP1d2PNyUoja/BKTEzJNvZpST1G8fSvlgm3w
 ckR7hvOX1jbgK58hBvHE1flOs7ZaR7DLxeC9o7XXsC3QUCTiri6sr5zOhrH1bvZEMY8p
 +aPXZXBPSnuBHIHWn9KthJLWyHz0g4dNiAOE6hU9r9fp8I4RSDoAqBRdaM2PpCALTOh2
 uWZqbyNbq2vF63jRg5UjM1EivebCsWnt6Sm6+9R7af56bDs7cqzGv+XoREs3oEyV5Qcn
 FMP/pHEca0IYAJ4bpHBUbhjOCBf+TA1zqtlVtGUqJpfnbQ/7DDtgxkW18svacCK0ai5v
 qzXA==
X-Gm-Message-State: AOAM533cOhb9SFx/hLQyp159vHL8d1luf2t6WxpN+lfLhwQTxEMzuNo3
 6jsLb+aduXb5WYSFD7II8G/hJmGm92aNU6Kpmd7n8g==
X-Google-Smtp-Source: ABdhPJyAO/I8TZAe/lxBKIIMKWkeGlqbJ4iqgkT8tFC7WipMSDeklku4Z2Chf1neF7KEEKVcMgZD+gGWXVJskb2x5tQ=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr22602958ejz.250.1628507598326; 
 Mon, 09 Aug 2021 04:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
 <20210217234023.1742406-7-richard.henderson@linaro.org>
In-Reply-To: <20210217234023.1742406-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Aug 2021 12:12:34 +0100
Message-ID: <CAFEAcA8bjA7Wv3G9WWvZOiTd9XsWS8FoviqXR=d2-Y0j4=_whA@mail.gmail.com>
Subject: Re: [PULL 06/35] Hexagon (disas) disassembler
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Feb 2021 at 23:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Taylor Simpson <tsimpson@quicinc.com>
>
> Add hexagon to disas/meson.build
> Add disas/hexagon.c
> Add hexagon to include/disas/dis-asm.h
>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Message-Id: <1612763186-18161-6-git-send-email-tsimpson@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Coverity reports a memory leak in this code (CID 1460121):



> +int print_insn_hexagon(bfd_vma memaddr, struct disassemble_info *info)
> +{
> +    uint32_t words[PACKET_WORDS_MAX];
> +    bool found_end =3D false;
> +    GString *buf =3D g_string_sized_new(PACKET_BUFFER_LEN);

We allocate buf here...

> +    int i, len;
> +
> +    for (i =3D 0; i < PACKET_WORDS_MAX && !found_end; i++) {
> +        int status =3D (*info->read_memory_func)(memaddr + i * sizeof(ui=
nt32_t),
> +                                               (bfd_byte *)&words[i],
> +                                               sizeof(uint32_t), info);
> +        if (status) {
> +            if (i > 0) {
> +                break;
> +            }
> +            (*info->memory_error_func)(status, memaddr, info);
> +            return status;

...but in the early error return cases here...

> +        }
> +        if (is_packet_end(words[i])) {
> +            found_end =3D true;
> +        }
> +    }
> +
> +    if (!found_end) {
> +        (*info->fprintf_func)(info->stream, "<invalid>");
> +        return PACKET_WORDS_MAX * sizeof(uint32_t);

...and here we do not free it.

> +    }
> +

Easiest fix is to move the allocation
   buf =3D g_string_sized_new(PACKET_BUFFER_LEN);
down to here, just above the point where we're going to use it.

> +    len =3D disassemble_hexagon(words, i, memaddr, buf);
> +    (*info->fprintf_func)(info->stream, "%s", buf->str);
> +    g_string_free(buf, true);
> +
> +    return len;
> +}

thanks
-- PMM

