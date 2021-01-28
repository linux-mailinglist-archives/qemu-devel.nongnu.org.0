Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8956F3079D9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:36:49 +0100 (CET)
Received: from localhost ([::1]:52010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59Lk-0003Su-Jf
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59HE-0007KS-8G
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:32:08 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:56281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59HC-0000My-K9
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:32:07 -0500
Received: by mail-wm1-x329.google.com with SMTP id f16so4641468wmq.5
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 07:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=1CCnE+YxroUTKOfOSzav7PFPufX/CJ1MOYKuRG32Uuw=;
 b=VtKc+xIxZQ3wTFJOSQx8ptwityvtgK/YC7nAEJfDRWvfIi7qTgjpiCEbPH+aa+B6kR
 PnxUqTh0U1/+ToCkNjFyBY2pirCdVHCZU3WJUvkdJvB6TO6kBRZyPbGKeYVNMg/w4jpF
 avTdixAo9s8AKw4PixCkM+JNZ+jSrV7FqixJ7GCmi/Uhlju//os0Z8YIgTZXDjkOM50J
 d77hfH+fKxYTspPemv7Cdtg0tnu2XZSLhgti4PrKKKgbarA8+EKnfxhYK16yAMIkdcU5
 b5mz128tE4DV4sartHk0Cj5YY0x1M5FJ0rIqy7SUkAo17NoXNz5ncXov6988nx0zFplL
 HPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=1CCnE+YxroUTKOfOSzav7PFPufX/CJ1MOYKuRG32Uuw=;
 b=j8168yUR5wRW1pY00C9GnCj+HwExF1840wIVn62k93+6fvx/ogF6tFYmPPvwbeC++T
 luws5RHCiLsKh6qSrZpS4dq0VVwofaQhIFDhv+ZBFhAwIpnXvwME+x0JERJdTIh7+Jh/
 yHpm1gj5I+bCMpJ5QZuHQV1v4qTcHi+5TKcjLR7ks050qoW1ylA1/a2SJLZp4TM1ofhI
 tjQ94T6SLX67qJgzsG+R5RBXKIvuqeL2sh4BUmjuobHWag7T/TKhS5lBuFcublEh+KY4
 U+Ilrh0M2860ly/ypUKHp0fRQUPTtg/CWYd9IPs37AB4A4Yjj57T0ZBkxeYKAsZUVeSg
 Aifw==
X-Gm-Message-State: AOAM533k3P3/CJHnliQQ5Dlp87sR1LFbRwA9vUq3H/0OT0+Eo2OWIbsp
 FKjKvz2KGUOsfn27Uj9A5YhhQQ==
X-Google-Smtp-Source: ABdhPJyS+Qaa2v2utTF46WvJRTbYqtFTTE7ebGUf6wHgx6cUbwbatx6kXlurUKkYOKCtif3KurAwFA==
X-Received: by 2002:a1c:483:: with SMTP id 125mr9194187wme.80.1611847919630;
 Thu, 28 Jan 2021 07:31:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 17sm6026243wmk.48.2021.01.28.07.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 07:31:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4822D1FF7E;
 Thu, 28 Jan 2021 15:31:57 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-10-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 09/23] tcg/tci: Inline tci_write_reg32 into all callers
Date: Thu, 28 Jan 2021 15:31:52 +0000
In-reply-to: <20210128082331.196801-10-richard.henderson@linaro.org>
Message-ID: <87v9bhulg2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> For a 64-bit TCI, the upper bits of a 32-bit operation are
> undefined (much like a native ppc64 32-bit operation).  It
> simplifies everything if we don't force-extend the result.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

