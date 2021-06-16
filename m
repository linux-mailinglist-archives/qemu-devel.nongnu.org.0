Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B24E3AA614
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 23:18:26 +0200 (CEST)
Received: from localhost ([::1]:54618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcvY-0008O8-Iv
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 17:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltcu1-0007bB-Fd
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 17:16:50 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:43544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltctt-0005HQ-J5
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 17:16:49 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso2432085wmj.2
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 14:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=VGl/o005cXKpD5bC6KUaa2fU2ifQm0LiQ8vcuDPjIEg=;
 b=fno+iCBtnkDtcU7Wu1HqBEkQvvoulKgpxNF6UxyRgakWfJahNR/1wcu4M+qsa7fEvA
 vJzje5o8dwYNdcfywC8Y3eoYpDl4IBQ5OfiNXTuAM9aqoIb8arUGUqWU2UCTamePneTS
 CxwxIzhiRaXGXhU68Gl5qMzHW31YiVUzezqJ2cwZhZl635XDrLjpthMYMWesp3HxI7xE
 Bm6Ucvm0ReDhFWkpX6NVUeJSOTo16HN1BxhIL2uugILFJdpQIhNZGaKxi8n5b5nI3ciZ
 +qIrtjbvifO1Ml5s/fH7HoQx4Lc3w+xGJ0wCzzSZZwB2PuWe1JEC8CuXHfAJH6HQStVs
 /JQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=VGl/o005cXKpD5bC6KUaa2fU2ifQm0LiQ8vcuDPjIEg=;
 b=cHfj+Xuv4zblBbe0rO8TiCk1aKsQRrPe00DiKQq2yYrAbbz4p3csP/G2QJAxFXBfwd
 Zb6YJDdbFZsA3PtiRyMLCR70lD/UBtxDqlCt9vw/+/7xPTXSjtmwDzqG2Ooi5m17vQK+
 Tft4Xwzw20Jd06aWBSosxXbV3RHRtaGZlCGtK9sSUm4/GmZsJbJAPX2DoSQdHKoMaWDT
 zMv+JZl0G2mkWW77u3SiDl5j5bC5VtKEmdMQYfMUedbJB0J/A2PW5mYxxviIANTsrqsl
 8dNeW206FC0kp3q25ooX6A2+QyBZedULlujlIfbfzZwS4xbrAz2QlO+9zv/FIv1Wf17X
 JXWA==
X-Gm-Message-State: AOAM531Q4ZOqwNbjSdE5jaIl3p3yKsY4xOtNCOTHW8+3gLQ0S6OgJKky
 VvSOQ2SQZQLzXx++380IySgDyw==
X-Google-Smtp-Source: ABdhPJzjoIs3jjXnauJ48Lm4rO31Y/Qj/r/++wHxSmejCagTF0fgD2mtPc09DV43R0FUJMwiE6b5EA==
X-Received: by 2002:a05:600c:22cf:: with SMTP id
 15mr1054561wmg.144.1623878199535; 
 Wed, 16 Jun 2021 14:16:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b10sm3376486wrx.57.2021.06.16.14.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:16:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0336C1FF7E;
 Wed, 16 Jun 2021 22:16:38 +0100 (BST)
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-9-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 08/21] linux-user/hppa: Document non-use of setup_sigtramp
Date: Wed, 16 Jun 2021 22:16:32 +0100
In-reply-to: <20210616011209.1446045-9-richard.henderson@linaro.org>
Message-ID: <87im2dfr2i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We cannot use a raw sigtramp page for hppa,
> but must wait for full vdso support.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  linux-user/hppa/target_signal.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/linux-user/hppa/target_signal.h b/linux-user/hppa/target_sig=
nal.h
> index 7f525362e9..d558119ee7 100644
> --- a/linux-user/hppa/target_signal.h
> +++ b/linux-user/hppa/target_signal.h
> @@ -71,4 +71,18 @@ typedef struct target_sigaltstack {
>  /* mask for all SS_xxx flags */
>  #define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
>=20=20
> +/*
> + * We cannot use a bare sigtramp page for hppa-linux.
> + *
> + * Unlike other guests where we use the instructions at PC to validate
> + * an offset from SP, the hppa libgcc signal frame fallback unwinding us=
es
> + * the PC address itself to find the frame.  This is due to the fact that
> + * the hppa grows the stack upward, and the frame is of unknown size.
> + *
> + * TODO: We should be able to use a VDSO to address this, by providing
> + * proper unwind info for the sigtramp code, at which point the fallback
> + * unwinder will not be used.
> + */
> +#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
> +
>  #endif /* HPPA_TARGET_SIGNAL_H */


--=20
Alex Benn=C3=A9e

