Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A7A37F65E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 13:06:50 +0200 (CEST)
Received: from localhost ([::1]:60092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh9B3-0005fZ-MY
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 07:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh977-00014R-E9
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:02:47 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:50922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh973-0003Hy-ED
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:02:45 -0400
Received: by mail-wm1-x32a.google.com with SMTP id n84so14416037wma.0
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 04:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+qrlEBUpBhoRXl5FH5Od/bUQZKqCj4pXlC5ahj4qAMk=;
 b=VClhQg968fV1lrL+l6Tkoi5t2AXquYA+rkq1C+AW2SnSQmu60B8Tz3uatufRN9Ye+U
 oP6DsbUihsaLnT5HKy43j0T43pn38Kj+8fdomXNQNrHosjiTjvvTkJQLZXoE+PFEKPZJ
 eCfw+3ZLWgl4y6k3nTm3YadqC9liWOjJwPKikHM6A9ClTAq1n3A5DpLMAkCeTqksJ0Eo
 YyoWLNTbB9x0DwfbzycdoBirxgErUf7o2iDiMusX2cGSaiouojiibJS5ICdwRiaxO/N+
 TJ6dByZLQl+QDCT6eMV1wb9CdFr58WkitOoOpbB5VDYobJvosDgdMOq0YjKoX+kHtz4u
 VbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+qrlEBUpBhoRXl5FH5Od/bUQZKqCj4pXlC5ahj4qAMk=;
 b=Xx45zQO7YMG8QxUfAjcahNxpM9v8kZyQZFEneM8cY3GTU8Faq2hq1gJz/o/k/GOVaE
 F211f83bXGS3yKhlcOcesdeD+NUwAhfqTwUy/P07gxsN7dsivYWcWgIL845LSTIWYOEy
 qdMZ5XEfQCyqJlZvardpgQsvltUibczI8T79T14XzFbGT9TDSV/5k4dnsWjiMzja3mC5
 sL2XH9pTNtUTnRtuSz7k2XrvN8a9enGGTw8Rg+6xq7RUfyePGu0dYiC5CELUZ8UAuBL2
 ZDYmJg3OtPlaNLVK+AX9AU8Ah0umt9WgxpVYXwGVdr6gFYtr/y+AWL1PEP8J8jc0wFF4
 kLrw==
X-Gm-Message-State: AOAM530EnTAmQ31HC09lUkDTIZ9j/Ip5z56sfmT5OtJt4123cQ/zYfaI
 oT7DHDpiNY1MFuEsfDu9xtUSzQ==
X-Google-Smtp-Source: ABdhPJx+Hgu+jeaUjRAjkNehw5CeQTkMCRr1G/CUH20yVbcueUckGtMvVQ91PNAv13SC/4Bb7GtFEQ==
X-Received: by 2002:a05:600c:2154:: with SMTP id
 v20mr42912980wml.86.1620903759847; 
 Thu, 13 May 2021 04:02:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j14sm4366492wmj.19.2021.05.13.04.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 04:02:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0DAE21FF7E;
 Thu, 13 May 2021 12:02:38 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-43-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 42/72] softfloat: Move div_floats to softfloat-parts.c.inc
Date: Thu, 13 May 2021 12:02:32 +0100
In-reply-to: <20210508014802.892561-43-richard.henderson@linaro.org>
Message-ID: <871raaew1d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

> Rename to parts$N_div.
> Implement float128_div with FloatParts128.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

