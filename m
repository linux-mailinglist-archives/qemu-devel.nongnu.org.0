Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3E9398517
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 11:16:42 +0200 (CEST)
Received: from localhost ([::1]:59736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loMzR-0007aB-Ec
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 05:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loMxK-0005Io-Rt
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:14:30 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loMxG-0000BD-Ng
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:14:30 -0400
Received: by mail-wr1-x431.google.com with SMTP id v23so1498932wrd.10
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 02:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=xIH6bL45vjmevFqM3xaicdNZm66VlThcNQpUH+k5f4c=;
 b=Z+cVwpucmB0OWi4YbqG17MFMDFptGcnOR3QxySfDDPcADQ13BNLkM3DvTcEbYiB9Wa
 9NGcHlDHlcdI9yiOh8dikN/iwcuV2BWZ8r4AR+3sOLKhmKtX0Bc0NpqqyieklgaKq4+B
 v/lQQqfvPfZaNFf/zS+4AfDvLHIGRuSc1pDlS8VVp/iy/wYy82x8Lqpzr2z8pJ7Xw3dT
 uGGZNVbZVEY6Oxi2ymeAeOCGhxj0PnPmkRYLyHYaulJ9nvHnsF+1vy2/19qgvFIAi8t8
 J9xrVMYPQf7yiiWl0Z7K9gE5LmnBsCTsL7KiPUYCNGAdyo/x7jGvEZMdbJsIYUGbGRfB
 nWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=xIH6bL45vjmevFqM3xaicdNZm66VlThcNQpUH+k5f4c=;
 b=IC/BZSXKlrBRd9HU6NNr+bI3OS/rxaSYulTGwtcPY0487ZGTmipnlF6dW+0tJD7GR8
 tYtRffCZfqXjXTn3UooL1CDziCt+4luzrtYTSKitel8uDzbbps8y6V4GxS/22lAhVfJK
 8kvns4cl+Up8DhMefYgvzf43WUASnMCshtpV8D4dPzZXOauWzyUQSu2gYjS0mKq0U7JZ
 q6/eJXD9njsvzHArPlsBMtxUioq+u3lWFaEYa7Qo9NBubTE8uGV8V39Ev+XLYlEZRijm
 0sSA5YP6OwFOZYEswBatpu+PFZz3ou4IlZQZ+oSgFeVeAMYAJmwS0V60ENyOMADSFE0N
 rTaw==
X-Gm-Message-State: AOAM533x5F/mQkVRFvX7ReNeM9YquuPY+hGziVLGLBRSXYsXlLhBJnXY
 JN0e7UVUpxxlWc2vlvbOLg6V8Q==
X-Google-Smtp-Source: ABdhPJxaHAOz1/JF6inUxxlhWmPOuRuIrrMHDK48oEDXNzAGy+qztKGXFOWOsAnH6F4P/qFHHu3u4Q==
X-Received: by 2002:adf:fc11:: with SMTP id i17mr27456186wrr.374.1622625264339; 
 Wed, 02 Jun 2021 02:14:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f14sm5927989wry.40.2021.06.02.02.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 02:14:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3DCE41FF7E;
 Wed,  2 Jun 2021 10:14:22 +0100 (BST)
References: <20210602020720.47679-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] target/arm: Mark LDS{MIN,MAX} as signed operations
Date: Wed, 02 Jun 2021 10:14:17 +0100
In-reply-to: <20210602020720.47679-1-richard.henderson@linaro.org>
Message-ID: <87k0ncbpch.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The operands to tcg_gen_atomic_fetch_s{min,max}_i64 must
> be signed, so that the inputs are properly extended.
> Zero extend the result afterward, as needed.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/364
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

