Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C07993CC2B3
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:59:30 +0200 (CEST)
Received: from localhost ([::1]:41884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4i2b-0004sN-EJ
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4i1a-000438-Ar
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:58:26 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4i1Y-0005jV-MO
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:58:25 -0400
Received: by mail-wr1-x436.google.com with SMTP id g16so15077376wrw.5
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=bsPOLzggftSkWNLi3rMdG52Pcf1gwQbp6I8ahH++Oik=;
 b=LjJHg3g44jFDBzEJH5M99ile0sRUtcUgH7CLK1qWgquTN49CMGS7er14cfVOpBkkGO
 12C/XIiSEQp9xjfx/YYBWxCIlo9Kl4baT4ZdVP7q38L7bPtPD4g6q/oL4M7etgEHej7t
 XSr3oWSxyC+NYpj9FYCRlRugCEXAwg3uJ8re/S5eXbZsvY9mbhDrlxseHx1anWu7K16M
 NLLP1z1pA2YZFVDZLXfiVF1OQtamtmqPtleshhx8CzEB4oMIO/N0uitY41hBs9QYLnLC
 KWiRvscND3W0Pyri5023tgb8M3ODt8+dRWVLdxyfT0ZIvgpqMkca7Yn7YeNp1WxR4Gmc
 Yryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=bsPOLzggftSkWNLi3rMdG52Pcf1gwQbp6I8ahH++Oik=;
 b=bOPfUkfbLI2ukY+KQn0uhJvOq+qG9oejgUcxA97ij6cb0+GMdjsckoVHycBn6tutA3
 D3XS6CORU5hEukreSskwI+0vR/22TcLk+eSz2wSBOkW8XL8Y9mgBZVoJdv7q/Lwnxf50
 MMcZEcZFDQI9OFzrAaVwvTff/SzjpFHTRnkvpSNdrqq2wWhPu2oqM3n31U174ff0a8Lw
 hUdDD7JzggOWqYICyBNw4JuzZiMY1h1v5tXDgF3bmfdext4ZZw8lMlse9RvqD7w7C0JC
 Lh5/oS9hDkT5cEXjhnpUMAudCuy77ruSiL/LBQvh+wbHI2KQnZ+aXY7avs51LP+CEZ3j
 lAHg==
X-Gm-Message-State: AOAM532hkRA64a8pY5wT6SmmCPl6CxVAlEG6y8RgTvNjduCts+D+jves
 0NfERY9ClCwm64JinjYdYiPPnQ==
X-Google-Smtp-Source: ABdhPJyM5h2tziZ393P61Yin+Ref10EHisdCla1Nz1N9xppIulm+dHll5v7V0HJbgTXN93fzHN8kqw==
X-Received: by 2002:a5d:5403:: with SMTP id g3mr17763024wrv.403.1626519501768; 
 Sat, 17 Jul 2021 03:58:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l2sm9497346wms.21.2021.07.17.03.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 03:58:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F37E01FF7E;
 Sat, 17 Jul 2021 11:58:18 +0100 (BST)
References: <20210717103017.20491-1-peter.maydell@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] target/hexagon: Drop include of qemu.h
Date: Sat, 17 Jul 2021 11:58:05 +0100
In-reply-to: <20210717103017.20491-1-peter.maydell@linaro.org>
Message-ID: <87r1fx2omt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> The qemu.h file is a CONFIG_USER_ONLY header; it doesn't appear on
> the include path for softmmu builds.  Currently we include it
> unconditionally in target/hexagon/op_helper.c.  We used to need it
> for the put_user_*() and get_user_*() functions, but now that we have
> removed the uses of those from op_helper.c, the only reason it's
> still there is that we're implicitly relying on it pulling in some
> other headers.
>
> Explicitly include the headers we need for other functions, and drop
> the include of qemu.h.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

