Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FAD3CC4EB
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 19:35:57 +0200 (CEST)
Received: from localhost ([::1]:45400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4oEG-00058y-Rw
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 13:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4oD2-0003lj-7G
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:34:40 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:38624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4oD0-0005Xx-Sl
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:34:39 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so10089923wmb.3
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 10:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ON5u6wWJeAhN58HtyHVKX8zG7rGHSfvHVW6yQkIgJTk=;
 b=T4sa96iadzicSaDJJRdjCRDvF+P7Sed83Spn2psWDHsLcnoOp/dMscLB7U2yVcZ6Bu
 A6WwRSPuAuRWBJvdvrTR39aeQQlk9DJaTi4/bPaFPatBi4ZdOq02oHC1cT1zJgj2zAT+
 y8NjHDrIgHZglU1uX8OnLyK3uq3bU/w5uPUZkm1iD188kqMftoXux+zVGmk3Tp/0VhKa
 EvqFA+i22PEOGqC0gzGY2gM2S0P+YyEBYKTBaAes+BbvfGEZSayvyMJINi2UaH/3D/gp
 v4T95Ct4GFJOFMv4jeGKKL6bcvDpGX9uC/InaIIOjZjDh8bLEYoN2DaIay3nwZgPtzM3
 Fkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ON5u6wWJeAhN58HtyHVKX8zG7rGHSfvHVW6yQkIgJTk=;
 b=hI5vV8zIKxlhMJblhgkbsiUWuT/uG9nmqmeThuoPo36y5yekqi1wQRM4CmlGFAYB1b
 Af9IumHQxx0rVTMlNXCf9qGuE0IQfMlnIZtXXuFu0nXw/Pcs//nZ8tvc2WEgNMNQJ/PE
 smXVwDL8E1Wsc/j3MeTjSwjRXOB6jc5qqWN1Twl1M1Vz7P5NiSll5a3wAJ82GL47dOwq
 RJXXCURenr3waJfQd/wZjr1AHOfbAVpHLo4quva4s+5kRxlPv/2o0tptTylUtfCkX4Wh
 MK1wrthBNyaoXmGea4paoLBQZr3xlYgcfZPMMiVVi66rDxg1cQnowkY1gzxcamNjJIIz
 ERVw==
X-Gm-Message-State: AOAM5309dLUFXaJbuYp7p7/UW+DQxN9nsNcxXJS8Q58/Woj6LhBUj9/O
 8S7EVRDCo10zJSOVE61akEDnHQ==
X-Google-Smtp-Source: ABdhPJyAxRoaiV6Pe5RP+pi+kfI0H8lUeTdNUxx+ZZt/lEXvamZDcr9D0VrcTiQ1wtNYMqmyp8F4rA==
X-Received: by 2002:a05:600c:3b98:: with SMTP id
 n24mr23388908wms.182.1626543277606; 
 Sat, 17 Jul 2021 10:34:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j16sm13760494wrw.62.2021.07.17.10.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 10:34:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 55C091FF7E;
 Sat, 17 Jul 2021 18:34:35 +0100 (BST)
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-3-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 02/10] accel/tcg: Move curr_cflags into cpu-exec.c
Date: Sat, 17 Jul 2021 18:34:31 +0100
In-reply-to: <20210712154004.1410832-3-richard.henderson@linaro.org>
Message-ID: <87im183kus.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We will shortly have more than a simple member read here,
> with stuff not necessarily exposed to exec/exec-all.h.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

