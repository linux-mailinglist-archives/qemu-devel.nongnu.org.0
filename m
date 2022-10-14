Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F145FF371
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 20:07:42 +0200 (CEST)
Received: from localhost ([::1]:42270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojP5w-000856-QP
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 14:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojP0Z-0004Yy-Dr
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 14:02:07 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:34679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojP0W-0003Kg-Kx
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 14:02:05 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 128so4971308pga.1
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 11:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H+p+LhFIEAdK0VxqKGbkg+B7e6WdGPyJ1UPClCrE1rQ=;
 b=BfWK9Nay9IMsYHlIxfA/yuqHjWFI2y1MgN7OdXEdE72D3fpqar+pbtdFmo4SB7BJFN
 vhk7nYIbyfHvz1Ozr7lXEBRyfsXGitDiDB0UbH3tTrvWFSOrt6Vq0aJUm5WETJ5RkSPC
 yp25UTfKhdTKQIUFskyE3i2177LbC3BZuCcT6RigAASr1Op6FhgeR+kP7j+qPv0IsAq1
 X0H9mCaY7u3sF4iueKShn2rDzJW44jDESJemtQaypvUlf845/NjFUvNNhVgz3EfD+zgp
 juWBx6QIFdavelm5KHhNl78uuY4YflK/3HsE40z3+p86RhxYx84vhHp/AzTUsJpQ/O9G
 sPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H+p+LhFIEAdK0VxqKGbkg+B7e6WdGPyJ1UPClCrE1rQ=;
 b=Xqwp1CnrlnaYW62awadlBRHx09L+957i65pq90kV+BFzOL8QqT3Hykq4FFv/x87yXA
 LYowxZB9uXrzWiKqixnPqevm5CgRjhDOUmN4iIsAP4lCQAF67ZLobA8dpsJ5jVvDotvL
 xkpEtCA+zV9q2P0FaY0CL2ZwmxYU8LkK2BqV/wJeqo+Dm5uQny/2DDcslL/JCjcStP+f
 8euGVxM455AmIFTna3Xin+kAQdqgDC87SrYVl+tS/O7JyHgC2zDiYAKvzAaxMY6tHSmr
 C4nhgzU39o71xPa1er13aaSIdMd5n2HB8rup5kggJ65cxfUXkxx0bDXft4YtIZpEKvZX
 w6ww==
X-Gm-Message-State: ACrzQf0gKfZfmnqE2H2ZD2by+9PDCE5F6OfA7It1jTszcmu9OINfHRMd
 EOAUmrN3tXzO+JVnCyyoJB3GJqEeI17xNurqO2TLbw==
X-Google-Smtp-Source: AMsMyM6NIHCiKm0GhsQebqTqmfBqCk6lDwRElGP2jr+zilJ0llpdYhbMlmFzxcpM4PMtRMoplVZbmphYXLb3kC/Cuds=
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr5578234pgi.192.1665770522172; Fri, 14
 Oct 2022 11:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <1408f62a2e45665816527d4845ffde650957d5ab.1665051588.git.baruchs-c@neureality.ai>
In-Reply-To: <1408f62a2e45665816527d4845ffde650957d5ab.1665051588.git.baruchs-c@neureality.ai>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Oct 2022 19:01:50 +0100
Message-ID: <CAFEAcA-QoGwuP0Vx1-cb-PnwbO=c2=RyO56RY+ocBt179mRytA@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: fix baud rate calculation
To: Baruch Siach <baruch@tkos.co.il>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 Oct 2022 at 11:20, Baruch Siach <baruch@tkos.co.il> wrote:
>
> The PL011 TRM says that "UARTIBRD = 0 is invalid and UARTFBRD is ignored
> when this is the case". But the code looks at FBRD for the invalid case.
> Fix this.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  hw/char/pl011.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 6e2d7f75095c..c076813423fc 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -176,7 +176,7 @@ static unsigned int pl011_get_baudrate(const PL011State *s)
>  {
>      uint64_t clk;
>
> -    if (s->fbrd == 0) {
> +    if (s->ibrd == 0) {
>          return 0;
>      }

Applied to target-arm.next, thanks. (The only thing we do with the
calculated baud rate is trace it, so the bug wouldn't have had any
bad effects on the guest.)

-- PMM

