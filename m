Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8241B150786
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 14:39:19 +0100 (CET)
Received: from localhost ([::1]:40688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iybwc-0007ip-IU
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 08:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49090)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iybvh-0006lg-KL
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 08:38:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iybvg-0002Xn-GI
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 08:38:21 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:38061)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iybvg-0002WN-9r
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 08:38:20 -0500
Received: by mail-wm1-x342.google.com with SMTP id a9so17119766wmj.3
 for <qemu-devel@nongnu.org>; Mon, 03 Feb 2020 05:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=WI5H2klNN223SQls31ejq5sUasXu7Lt4yFfdN3hjC7k=;
 b=GBgKuI4KOhhR5WMUy1ws+ySgRd1te3VhnkL5PJpNLC9Kz2uiHY5+J7rudL8ERF1WbH
 1r/bYUZn7Ko8lPlmtFoNhg3zfHnzJlFTay/+NejeeV7pEbUq+cBEdbHWKhYUPhWcucGW
 PEbG+wc1QHFd/2eYoCyEwt8Dgodwdgu2dM+nCftFmhhP68MMT3+fxTG6Y/ZI+YhZU+dS
 i7cRJSCYT9EIdQRRjhk5RBA/TWhFU4sLoGFwnyVxnxx7idYOlIhMTaOahVxAochUCY+g
 hnBKHFn/2flo3sDRDq+Flx0dulFmqvSkDgsPJzEw2W43KrG0fEvKE0hs8cUqUW9m/9+b
 joRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=WI5H2klNN223SQls31ejq5sUasXu7Lt4yFfdN3hjC7k=;
 b=Y/tuCUxtd+Hth/xm0ga+rLpJTEZh5MkfHKKyLx0ofv7ePYJct3kzfst1iC51u446DZ
 LOITZsklNQCOmCyV6aOw/0jqT/GbwMwwQQJ21qeSJPDYfvWgFRzNsNsLV3plY60uAlKd
 QMhGuOSQa3gBcqU9VMlhj7CRGfGuFji7U9PX/bCbVSsrH50vmBBXGnbuqNs+5m7j1p+e
 nwR1/rrrJW57ELz9IIPYFW2eRKgdeUzyAx++aUxt7qM3gmKPld/kR3DrQgeoTTxWTvcP
 zM8oneTLJgCk0MsXffbxVbAvNgFutffu87JrkMUMUEF7S2LMO6GUorOnzESEGx0ep83q
 jNiA==
X-Gm-Message-State: APjAAAWM2jUoJgI7ChA0uAdJChCzq9ni3FjitTIlAi/xDd2Bgm/1ySLa
 9kKF2vjy9pb6yXuwJmU+FxRV3Q==
X-Google-Smtp-Source: APXvYqyD+Mz9DEYoc0iIUFgyrv/WYLtquvFkRz/Vk2qKEkvu2A5wBkzyFcNV38wV4t+Io2DnkZUAUQ==
X-Received: by 2002:a7b:c1d6:: with SMTP id a22mr28390690wmj.108.1580737099241; 
 Mon, 03 Feb 2020 05:38:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b10sm25951999wrt.90.2020.02.03.05.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 05:38:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AA0A21FF87;
 Mon,  3 Feb 2020 13:38:17 +0000 (GMT)
References: <20200202010439.6410-1-richard.henderson@linaro.org>
 <20200202010439.6410-7-richard.henderson@linaro.org>
User-agent: mu4e 1.3.7; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 06/14] target/arm: Update arm_mmu_idx_el for PAN
In-reply-to: <20200202010439.6410-7-richard.henderson@linaro.org>
Date: Mon, 03 Feb 2020 13:38:17 +0000
Message-ID: <87h807aj06.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Examine the PAN bit for EL1, EL2, and Secure EL1 to
> determine if it applies.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 90a22921dc..638abe6af0 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11904,13 +11904,22 @@ ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int =
el)
>          return ARMMMUIdx_E10_0;
>      case 1:
>          if (arm_is_secure_below_el3(env)) {
> +            if (env->pstate & PSTATE_PAN) {
> +                return ARMMMUIdx_SE10_1_PAN;
> +            }
>              return ARMMMUIdx_SE10_1;
>          }
> +        if (env->pstate & PSTATE_PAN) {
> +            return ARMMMUIdx_E10_1_PAN;
> +        }
>          return ARMMMUIdx_E10_1;
>      case 2:
>          /* TODO: ARMv8.4-SecEL2 */
>          /* Note that TGE does not apply at EL2.  */
>          if ((env->cp15.hcr_el2 & HCR_E2H) && arm_el_is_aa64(env, 2)) {
> +            if (env->pstate & PSTATE_PAN) {
> +                return ARMMMUIdx_E20_2_PAN;
> +            }
>              return ARMMMUIdx_E20_2;
>          }
>          return ARMMMUIdx_E2;


--=20
Alex Benn=C3=A9e

