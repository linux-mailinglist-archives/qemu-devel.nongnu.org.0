Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E4F2F3B79
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 21:25:34 +0100 (CET)
Received: from localhost ([::1]:56498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzQEP-0007qJ-69
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 15:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzQDV-0007QE-Pf
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 15:24:37 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzQDU-0002qo-4b
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 15:24:37 -0500
Received: by mail-wm1-x32f.google.com with SMTP id y187so3331936wmd.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 12:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Ui0dl+FLjAoEQ9kxtJ59jruYgYU6oOqYXNh6d4fE0rM=;
 b=I26EyE5GfBJfPZ1DNXl9uZNh/O2sQDG9+dtPxrBo1W+cfOSKo0ts1asR18b6r/jiCR
 lbH75n4R1xddx/mvs3EcaJhsyid3QBj2VVAlu74ItDZLEENXqdCjySpyWUnVkNXJG96K
 qMncu8/uE1DCFBijHOxnt2AU6Kj42umTlAf9hRUrPGgI9nCJGetp0WLs0/xyOGMxn/2w
 l+TFsnXrUck/tqNaUynctZStS0vpTnPSib9TKqREqAiaE2WOfJcGn5EjBaI1OsZnLxw3
 LEybbSXnLXLHkAaNW01czyrY0HPOlRToqd0XGKw/wEYiK6LGWTynY/rjJqz6HK09M+Lv
 lFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Ui0dl+FLjAoEQ9kxtJ59jruYgYU6oOqYXNh6d4fE0rM=;
 b=Dn55z7Yi8akUtUsmRmOpFnBwb3qtKZY+SQLQRuft3Zl8H1soHXO5apEhTc768yVYob
 g2VkqObfzaD/sy7JX/25RuFcW04qUDeevHilcocPusQQ5M/UwLEZVBkYH0vlRqBc4XOj
 gKE4Zh1Lus+Q4C/tMDbsjWMxapmQ+4D2OZpBmZYa0iuEWzW+bZ1RJp0XcJqmmoPSV7EC
 Wg5wFit8y35WJ+l5NRpsxYUqKKqhSmaHyqUiLtgIkbzOIFNnwcTy8CBDfJfAGXWt2T+O
 z6qdLMcRS1Vsnqjm3hcTIWIfhmpNom3syWK7+jkZxLjz426Ek+569xFRYkLuKnbibuhJ
 vtrg==
X-Gm-Message-State: AOAM53240xhRv4/RchA8P7V/E+ac/cnnziTe7cNcvV3oNVGEwaP1OmI5
 rq20Tys5PwFyZGkYDKvHRP4n+ZrJhfsBHw==
X-Google-Smtp-Source: ABdhPJyfSakWwLTMMFvbhq0niAx0Cc+LO3DSvOrHPX622f6SI+DD+6Ktyh01l5lUx8BMV0FWpoaMSQ==
X-Received: by 2002:a1c:2182:: with SMTP id h124mr884136wmh.25.1610483073820; 
 Tue, 12 Jan 2021 12:24:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c6sm6599602wrh.7.2021.01.12.12.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 12:24:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E26211FF7E;
 Tue, 12 Jan 2021 20:24:31 +0000 (GMT)
References: <1610476384-13760-1-git-send-email-tsimpson@quicinc.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Taylor Simpson <tsimpson@quicinc.com>
Subject: Re: [PATCH] tests/tcg/multiarch/testthread.c: Add pthread_cancel test
Date: Tue, 12 Jan 2021 20:22:54 +0000
In-reply-to: <1610476384-13760-1-git-send-email-tsimpson@quicinc.com>
Message-ID: <87bldtnbsw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Taylor Simpson <tsimpson@quicinc.com> writes:

> ---
>  tests/tcg/multiarch/testthread.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/tests/tcg/multiarch/testthread.c b/tests/tcg/multiarch/testt=
hread.c
> index 810ba5d..b30b4b5 100644
> --- a/tests/tcg/multiarch/testthread.c
> +++ b/tests/tcg/multiarch/testthread.c
> @@ -50,8 +50,29 @@ void test_pthread(void)
>      printf("End of pthread test.\n");
>  }
>=20=20
> +void *thread3_func(void *arg)
> +{
> +    usleep(3 * 1000);
> +    return 0;
> +}
> +
> +void test_cancel(void)
> +{
> +    pthread_t thread;
> +    void *res;
> +
> +    pthread_create(&thread, 0, thread3_func, NULL);
> +    pthread_cancel(thread);
> +    pthread_join(thread, &res);
> +    if (res !=3D PTHREAD_CANCELED) {
> +        puts("ERROR: thread not cancelled");
> +        exit(EXIT_FAILURE);
> +    }

Aside from the signoff line which I need could you add something like:

      printf("End of pthread cancel test.\n");

just to aid debugging.

Thanks,


> +}
> +
>  int main(int argc, char **argv)
>  {
>      test_pthread();
> +    test_cancel();
>      return 0;
>  }


--=20
Alex Benn=C3=A9e

