Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5C1159526
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 17:39:38 +0100 (CET)
Received: from localhost ([::1]:52992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1YZV-0007XO-66
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 11:39:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56735)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1YYg-00077X-Ua
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 11:38:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1YYf-0000EM-Or
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 11:38:46 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37630)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1YYf-0000Dy-Jd
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 11:38:45 -0500
Received: by mail-ot1-x343.google.com with SMTP id d3so10735219otp.4
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 08:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sMeB6VxXbVgvSLSrQF5TwJ/F+NcWXqVfkF/dRKlg44Y=;
 b=Rv4qQBcFN2L34rRg/urnetBnktSFeDSkR4gV2cPF9+HYkS5ZbSQrI3BpqguZTE/lFY
 +qaR3qBoB56n4N840LMz+pjlhh+4OA69grQVcHf5iO5waPhQmJ/Vl4fNoUlZsp8LQduy
 X5rwimXosLMoEnXsyT0v3zB3YGDOH6asfp/NM3Ac1wA3LbNd2t9O+EHlkYsglPaEhx2O
 f8U2+X5gJgGFoUpDzRkyAq9rQwg7CjwLcuBN3vjwoUtNDjArUG6TXjNq7v2hMwHisdu6
 gq3PV6nA/9nvBG8GWRtWJsRrPpVOxwcyp2qO/HEwDOMr72c2RBkjqd/wjM3MKtbaCjiD
 HkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sMeB6VxXbVgvSLSrQF5TwJ/F+NcWXqVfkF/dRKlg44Y=;
 b=D/OKhvKUYMMzOhJvCUUKDaY0Fqq/XI4byBRhviO7PDjljvLgO09n4MJhpkttk30fDI
 6uu+UdjTa16qPwHL+RX0zW1UBexR56h3YXJ9Mc29vl2PvgsnTQq9w7JRmxy28OcjBMnc
 CzBpslOlE/4RKHw4KJiM9uq+fpL8DYgWwDUkCp8x84r/I98bLdzB6DFWeJ82w17QqX7H
 c57pLMH9kYEaEU/PzRUH1xWTw/TqPRseyQC3Mk7dj81cOAKRKn3VoJ++OugloF9Ww2MN
 x/2IWzgA5/HH7tstcPFGNvS2e7+nK3gyx2YvoRLlfhTdZFgS5uDJGdN2KLoDJeuf9dvy
 Gj5w==
X-Gm-Message-State: APjAAAULrckjU+luMUVwf0BjCLr1o+WgX/0vEVz43YNgoNE9XMkZNlBR
 E7zabwv2R3qifwKk0RazARoN5dvlw2foQpEu7H/aKA==
X-Google-Smtp-Source: APXvYqxULG4ZZ0BpHqRsJtgOhmIGdyvczHL9ANWVA+KeMmdVWHJFJx87cqm9b8dRPfQ0zNec4RIb85Wz9uYwY0P842A=
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr5995750ota.232.1581439124241; 
 Tue, 11 Feb 2020 08:38:44 -0800 (PST)
MIME-Version: 1.0
References: <20200204171053.1718013-1-laurent@vivier.eu>
 <20200204171053.1718013-2-laurent@vivier.eu>
In-Reply-To: <20200204171053.1718013-2-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Feb 2020 16:38:33 +0000
Message-ID: <CAFEAcA-uH-gnPZ9=YPBzdCLVxSKp86cs07tMuLSAgO3bNWd05A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] linux-user: add missing TARGET_SIGRTMIN for hppa
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Marlies Ruck <marlies.ruck@gmail.com>, Riku Voipio <riku.voipio@iki.fi>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
 Josh Kunz <jkz@google.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Matus Kysel <mkysel@tachyum.com>,
 =?UTF-8?B?TWlsb8WhIFN0b2phbm92acSH?= <milos.stojanovic@rt-rk.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 4 Feb 2020 at 17:11, Laurent Vivier <laurent@vivier.eu> wrote:
>
> This signal is defined for all other targets and we will need it later
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  linux-user/hppa/target_signal.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/linux-user/hppa/target_signal.h b/linux-user/hppa/target_signal.h
> index ba159ff8d006..c2a0102ed73d 100644
> --- a/linux-user/hppa/target_signal.h
> +++ b/linux-user/hppa/target_signal.h
> @@ -34,6 +34,7 @@
>  #define TARGET_SIGURG          29
>  #define TARGET_SIGXFSZ         30
>  #define TARGET_SIGSYS          31
> +#define TARGET_SIGRTMIN        32
>
>  #define TARGET_SIG_BLOCK       0
>  #define TARGET_SIG_UNBLOCK     1
> --
> 2.24.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

