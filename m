Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE9639A39C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:47:00 +0200 (CEST)
Received: from localhost ([::1]:39342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loocd-0002Ii-HZ
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looag-0000aq-SQ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:44:58 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looad-00033P-Oj
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:44:58 -0400
Received: by mail-wr1-x433.google.com with SMTP id u7so676543wrs.10
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=owtu8bE3QY1+sHoplJkFPDCNnuudVWXsvVfS/xP0RnU=;
 b=zbvFHWiU4N77WdPcJUWS/Xj0pUjkwGpArcAyaiIxKMNqMe+SgYYdgb8ViqWGzPFIJ0
 SA/SmeVt+ce8HyzEaV53fvKdRGPqCf4olBIC6xQfzljNDK7ai9ZM5TWQtsZR3zrz6hQb
 bU8PO5SDdn/UkkrbULribW7b9yiffEMGbp/g30bsgcqws/FP0DKIDpGTjJnEpU6/lLRR
 aHu7p7k/o9OTszDzZlPsVug/lCwjE9v/onOYIYJW8AN4E6N/ddA8eeQw+9xHO/RQIvwA
 iRzGwgmEPzBgEXoGL3Gx2iUq9UYUJUqblrzB1dKLwaEyi0Nyve27gdoaqWx/mqJ4nR+8
 Kp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=owtu8bE3QY1+sHoplJkFPDCNnuudVWXsvVfS/xP0RnU=;
 b=Maqo0pfd/5+oJJOlHUefR4HsK8syZtgxEHvfFLLFkUynV0Boq05WZrhO1V0mZv41OF
 SABgdTbGc6shQGMdd+eufjJykeFKwGzc3P2YiPSFZIhpFnA2B29B8SFIuFOEyt5cvHHv
 2wj07yIoHUF1FZGAcvjBGRUhd10FVRr/oBSay+Si28wspk6xyCZf25ZQqFbOympeeaov
 ziPt7n0/SmejmD4rpNik1yGF9AQYIH71ArBIR5oLlp6WpEYkP2d/YXiTfFhFOET93RMt
 StXAANQZcJ+QqBoEfT76H1Ca9aBBEeKh/pI0fG9cFBq452WpjZMibHjv4WsAnt0hYhal
 z97g==
X-Gm-Message-State: AOAM530/9vBuRLrcZIMuMX4ZHB5LWgmynR6A8l3MjybKe+czxQD4YUfA
 Z2vMJrsLAqEFzhOMpvtGQSVvIg==
X-Google-Smtp-Source: ABdhPJyuBXOBab8kLYTOehWY3anpRipaGwqVzXldZq0CJwYcjKDvhgESjL4EPBlhv3x2RrONs19a0A==
X-Received: by 2002:adf:9d81:: with SMTP id p1mr295850wre.287.1622731494081;
 Thu, 03 Jun 2021 07:44:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n13sm4097438wrg.75.2021.06.03.07.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:44:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3E21C1FF7E;
 Thu,  3 Jun 2021 15:44:52 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-25-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 24/28] softfloat: Convert float32_exp2 to FloatParts
Date: Thu, 03 Jun 2021 15:44:24 +0100
In-reply-to: <20210525150706.294968-25-richard.henderson@linaro.org>
Message-ID: <87bl8n80t7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Keep the intermediate results in FloatParts instead of
> converting back and forth between float64.  Use muladd
> instead of separate mul+add.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

It would be nice if we had some tests for this but I guess only one arch
uses it at the moment. Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

