Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2584CC0FC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:17:34 +0100 (CET)
Received: from localhost ([::1]:53198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnCv-0004t0-HY
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:17:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPnA0-0002KJ-Pv
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:14:32 -0500
Received: from [2607:f8b0:4864:20::b32] (port=41800
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPn9z-0003mN-0G
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:14:32 -0500
Received: by mail-yb1-xb32.google.com with SMTP id t7so7325428ybi.8
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 07:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ApkFTU2NHhJ5X2NEQHkak4+yCBjf/g9AgePNJvDlN3I=;
 b=nA7vT3jrGlH0chR8JmuruuXbnfnIou/sxwgdhESq8Hb9Pb9rB2zgOWVyr2BJJnkW5h
 i2EugShADjiJo6dgxyeSHYkvXa/vxLNyWaOk/lUITxJnmUtQxz0bb08fsiQa137dhNnv
 OqggXzC7x0sql+OhybaUUH/FTS5clKTTT+DTCcfXUng7vpADBr+K9ArOCvr4KYmPaYp4
 2zor2zfuY8S+ciQkbyVhNuG87odn096GNk6PCih2nz4aPDGAoAHQfHISJrQgW+aBjIhi
 l+GWuUCULV8GUycsrT1Pr2wLpOWWRPC0cyVf4lKUochoZPIaW6IvseBbIi1mdoeoC+Y7
 ZarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ApkFTU2NHhJ5X2NEQHkak4+yCBjf/g9AgePNJvDlN3I=;
 b=XMgmi0A+Aj1JXO4fSvAs02UPwT/euRUIemDU3Krfygcux6ThqyQYfR7yBQUaZqaxwD
 lR+O8trOjfa+p+ohORLmx9JFO/8ZnLyy+rKB/Yi/zfir03DL7nr0qiRMWkAoh6LPaEcO
 aatcHjpdOJYmKBT4/ZLjZMMCHKJVgLYm/lxDcoIia29R3kgDo07cPC1eVoSGfSRjnAaq
 JlYg36hgRs7AzRgpdy8Ip/659niCK0mkvcNJ0BbDvOYlih3w6CFjhOqolDDQVHpWL0PZ
 KO7osTSdZn3jg6HcNk973usyYkNhm7KcajR3VjUeDgOsqML0EGfU1MXQRwfGLqS2FSuJ
 L6CA==
X-Gm-Message-State: AOAM5300fUzJHYPYotS43d3f9KW8lVbvoA/fh1VLesCeJz7j1cTqedr6
 XwFDKHYNnoEw8qew6DcvOaJtwNXUSXQIbHT4Np2kQA==
X-Google-Smtp-Source: ABdhPJxKzUp3brB9u2aALF0nps33bXEOoW84EkykEiYUFXuylcoSmkCUttXyEOQnM1JwbsCkFthckJ1EGXtzQdBpMSc=
X-Received: by 2002:a25:6e84:0:b0:628:97de:9430 with SMTP id
 j126-20020a256e84000000b0062897de9430mr9779639ybc.288.1646320469719; Thu, 03
 Mar 2022 07:14:29 -0800 (PST)
MIME-Version: 1.0
References: <20220227020413.11741-1-richard.henderson@linaro.org>
 <20220227020413.11741-5-richard.henderson@linaro.org>
In-Reply-To: <20220227020413.11741-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2022 15:14:18 +0000
Message-ID: <CAFEAcA9Rf_q9v=D7BcyQSrUUaLEDPWO3ZV0XhcpV4qRR=bjkzg@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] accel/tcg: Add guest_base_signed_addr32 for
 user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 27 Feb 2022 at 02:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While the host may prefer to treat 32-bit addresses as signed,
> there are edge cases of guests that cannot be implemented with
> addresses 0x7fff_ffff and 0x8000_0000 being non-consecutive.
>
> Therefore, default to guest_base_signed_addr32 false, and allow
> probe_guest_base to determine whether it is possible to set it
> to true.  A tcg backend which sets TCG_TARGET_SIGNED_ADDR32 will
> have to cope with either setting for user-only.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

