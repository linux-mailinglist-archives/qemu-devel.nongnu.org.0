Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5321137FE69
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 21:52:12 +0200 (CEST)
Received: from localhost ([::1]:34488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhHNT-0007eS-Eg
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 15:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhHLF-0005lE-Kn
 for qemu-devel@nongnu.org; Thu, 13 May 2021 15:49:56 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:38640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhHLC-0005jC-It
 for qemu-devel@nongnu.org; Thu, 13 May 2021 15:49:53 -0400
Received: by mail-ej1-x62d.google.com with SMTP id b25so41422111eju.5
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=brZcaQSIL5KZPryhs9E/VBzxUNjNLY9llFPvzcPHh/g=;
 b=IuUk7x+bYj0gsp3A4xPFaRTAOW0TjBnktCTYdxcN3k7AGhjZ/YqWHFHHu3eps4RQXb
 gd8Cc8Btq2N2KUEdu2nhGVnbwXWiigOrlzUtLPqnpr8v8S48iICFJNUNoi/ThQaEQrVY
 Sv4OikSwk8E/0n7vagcPQ3sRzuL94Jfa74LBmW/h1D0SWbk368YivmdYFkRGpdzfFeEa
 sDCrqNIO13vPukofS6yOWQmP+Z8S5wIkvrRDqHDRnFzJFBUWpM8Eiyb9A5BfQ7AcFJ9G
 M8mY+MtkiX1WGPgGGC6XObfNZTSnpI7pQibH62cSTGnsScM0a9dFmQmtA0/bGNuWZkod
 soqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=brZcaQSIL5KZPryhs9E/VBzxUNjNLY9llFPvzcPHh/g=;
 b=qrqCdqDOHEJoBRRNdRozINurZtrp0rkeVFIs5XQESouGZF2qFn8vMrYK6Ht+bi8+GN
 7VQ24Nw8TKS+dbWQAdWw9Rd56LqeT0GpstCDKOZXyZIXH3Rdxpk/9GZuDzBEkoa8pF2i
 SahbkBIGaeXxvIjOYF7UenKhyyl3/suwHc9KbFwlGk4f8QnsTir9QY1ep/ROn0iuIoLU
 Zts6p5htWwhPgdMPw0yQ/js4l2d9nOmu3Ej08AyeekFYR/W4ip1yi9H3I6xDXs1L2VmN
 rx/NHLhDgSPceqz2dR1LxKDMBQY9a9xhnagr9BYN+C6GpEmqCxrv2hBgyvcDgqUjV7mk
 ouGg==
X-Gm-Message-State: AOAM532Hp5b1tzyAoaEIMi7tLqYfMEZ1oKc4qvVKOkHa/ztu05Pys8xF
 vvGqO2spaMYImjJarn4+IFVuc2gMBBT/ngbYcowtKw==
X-Google-Smtp-Source: ABdhPJx0THYySQ+M30OuwAQgXh7XxdfdFH396OvgP0CNPBfX0vFg//Zv1P873i8bF5MNhsdpWnSQDJqeneFHBR5XJLU=
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr6374991ejb.85.1620935388977; 
 Thu, 13 May 2021 12:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 20:49:37 +0100
Message-ID: <CAFEAcA-DC9vL_C6F=P309wAE5vaQjJuMrrorN4nobaKGC_7PEQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/82] target/arm: Implement SVE2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 21:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Based-on: 20210430132740.10391-1-peter.maydell@linaro.org
> ("target/arm: Split translate-*.c.inc into separate compilation units")
>
> Based-on: 20210427214108.88503-1-richard.henderson@linaro.org
> ("linux-user/aarch64: Enable hwcap for RND, BTI, and MTE")
>
> Since I believe Peter has both queued on his target-arm.next,
> and I didn't want to get in the way of his bulk code movement.
>
> Changes for v6:
>   * Rebase as per above.
>   * Rename isar_feature_sve2_{i8mm,f32mm,f64mm} to sve_*,
>     because these extensions do not depend on sve2.
>   * Update hwcap for the many extensions.

I think I'm done with reviewing this series now...

-- PMM

