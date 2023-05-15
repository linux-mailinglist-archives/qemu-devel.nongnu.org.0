Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D71D7029CC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:59:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUzT-0007ll-Qc; Mon, 15 May 2023 05:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyUzK-0007ks-Cr
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:59:30 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyUzI-0007wa-R2
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:59:30 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50be17a1eceso23285931a12.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 02:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684144767; x=1686736767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CX8zFUszW8AhvqvMu4OZUAGHR5+xcJ1pj76LiJAMgHI=;
 b=MaHL5t6VdylrE1/2oGdZZN7GIw4M2KhDGMd3Hmf2i1MnVJ06FzP6mQI4XLVRSzJaBF
 I7f1pujiIN4Si8+Xl7NS7acClCDb9FFk2No7J+LsoP1XtQZC+kdZbhR7YSXeo5QigLzv
 /cI+3//J2aIbp9vD3Sxqk6nM+rAEsr4gp1IHsVe3h1OgAydArdhugi3jBN+xUviM8THy
 C8yAd85t0nK3gIAmqucoJts0TpCRmd2CxZnFG3q51+45HOLnEm+Uz/ij8BRY7Cb3VenD
 deqan0oWJl401usYR14h9k8yPS0tI/DTToiquNEwFbfMGwH4cZxU2dvMpeX6n2ZxFBsM
 4NGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684144767; x=1686736767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CX8zFUszW8AhvqvMu4OZUAGHR5+xcJ1pj76LiJAMgHI=;
 b=J7XD5Nwm9jxg26CQBpQPUyar9Bc+G48wgOJGqPDrC8mEqGBqwQXPfy22nIhJZYzW5F
 qmjs3gwYdqmpm1k3Q8e+bfJvo1D8iqsHSqjCQm21jfASkP18tPmF/k9iPaLqKYlQ58n9
 iq86I7vGskKNu1LY7e56kQqbPFXhJxyQ0zY6OqfEb0YJvk2wMbk9pQKfyDRDie+sxEK7
 mQQC7AjpLyTspRm5vRb1wA5WU3oRbC3gP26/QjhWzJoao5dSRudo6DTDlmya6pCvbmwY
 vN67Blk1rknyTY/DH4maACz5+0krWMhlnF6rDdYVlelf+wquozeiJ5WevIioXIq+MeCO
 Z5Yw==
X-Gm-Message-State: AC+VfDxd0q5uIYuIVl/OI+SZrallPG2z3ecz+OfMu9KM31bQoAsfs+hT
 T2J3QeVN0N6F9Xq2mX+B6d2kWEB9LTN3dqbtMLWK0g==
X-Google-Smtp-Source: ACHHUZ6VW9NocnUXKdWk1qze2SiexC5USFFQ3Gbqd9tDlxqEAlKR0EWd5y6SrfI0QWaJwVtwhGtn2PA9qC+D67N3QEQ=
X-Received: by 2002:aa7:cf95:0:b0:50b:c4f0:c200 with SMTP id
 z21-20020aa7cf95000000b0050bc4f0c200mr27128039edx.41.1684144767420; Mon, 15
 May 2023 02:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230512093108.1180726-1-zenghao@kylinos.cn>
 <ZGHyvBb8BQdKhWEy@redhat.com>
 <e2d06c7a6528a16b6ae58360d49a1fc9c7e8ade5.camel@kylinos.cn>
In-Reply-To: <e2d06c7a6528a16b6ae58360d49a1fc9c7e8ade5.camel@kylinos.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2023 10:59:16 +0100
Message-ID: <CAFEAcA8fN-+FUJapo=+ObZgfrJW32ccFj22qvU92ndNzPLQ9Dw@mail.gmail.com>
Subject: Re: [PATCH V2] hw/arm: enable qxl for aarch64
To: Hao Zeng <zenghao@kylinos.cn>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 pbonzini@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 15 May 2023 at 10:57, Hao Zeng <zenghao@kylinos.cn> wrote:
>
>
> On Mon, 2023-05-15 at 09:52 +0100, Daniel P. Berrang=C3=A9 wrote:
> > Overall, IMHO, we should keep QXL restricted to as few build
> > scenarios
> > as possible. Given the status of SPICE, possibly we'll even want to
> > deprecate it on x86 eventually, not add it to more arches.
> >
> > What are you seeing as the compelling use case that requires QXL to
> > exist on aarch64 ?

>    Thank you for your answer, it made me learn a lot. No use case, just
> outside customer feedback on the ARM architecture qxl use has problems,
> I compiled the community qemu, found that the default does not support
> qxl display, so the submitted enablement.
>   I agree with you, please ignore this commit.

I would still like to know why QXL isn't automatically
enabled like every other PCI device...

-- PMM

