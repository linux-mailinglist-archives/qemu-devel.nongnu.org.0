Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5173362F6CD
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 15:06:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow1zI-0001xH-Te; Fri, 18 Nov 2022 09:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow1z8-0001w2-Ov
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 09:04:55 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow1z6-0006ku-8H
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 09:04:50 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 w15-20020a17090a380f00b0021873113cb4so4704652pjb.0
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 06:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lsFNclvDcrpa2M6sKFDT1ng/uRpt7NowFDU47kDC0Jk=;
 b=Yhcrbw6DQOxWweF4aMDnZwuymvXYPOveZRd26M9murEwuQXteRq68LecBqloC1OcXg
 YsaSsnEIuiVqfyB/+5QQ17bJGq7a+r0Sacu9ckTNQHRiJzsMYfI29LPEAttOl2CIrY31
 B5sAixj3k5VQ3GlOQTM3AJm0PcXIKVP1s+g/Xm77n5IJFacki6Rp5zbQ/300NpT/90wX
 2NmqoAuJVOfk65zkOnvXEn2HI5ensbunEo8sPzt7Ch8n96Un+meUQVbgxSanepm0wJEO
 6woHEJCgZ+FlGpUqZHzPW5YOGjmKj4CaMGC4ETQPBZznEZ+y8NtVk/VVeBVuiZvYCEVp
 mFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lsFNclvDcrpa2M6sKFDT1ng/uRpt7NowFDU47kDC0Jk=;
 b=I4aygWpCuNYCr1cEKH1tfxTcsafgRanCgDtDj7tSCjLAPyjptWh0egtIz6UE137fcX
 tyNbMFMo8SOZOFWmgrRmHj7D0kXgzZ58yKuvE1H2bU9VMzmTWoZSDJvnlsby2LdVAlZ0
 CZGzJvCCi0tNb9BQZATG6sDjzn7cAL4+sepx5Pv5snWWHWfCyBS8nKqlWZ8cDb7iGKxi
 SW6A3fHEab9nG9C99zUsqS17UNQz94+/gGwSPpmmQNHZH0pTTtAEV4hCGzE3LLmHsOEE
 1uV6472tLLqT2XcmiHj2GWqzmEzcy3ZeZC6wgBiIhNDaGx0O9wH6SqrrNoadJlkCGqyh
 acrQ==
X-Gm-Message-State: ANoB5plf0NpqovowWoNOc7okeFJ0ckKnIRyIYgkpnVH9/qQz/rCScbIu
 1rRtX4HdnD6aEp0jAtenKsCPpnt1jf8f3sn9qpEBGA==
X-Google-Smtp-Source: AA0mqf4EEXioqkXuPSd1Fjy3SIWX/lqgq1+DXIjrjGZ2RGhTa0U/410E2wHCkTuy6yAOp3D8i10Hrs3QKFcKr4YVhYg=
X-Received: by 2002:a17:902:b18a:b0:188:5240:50ec with SMTP id
 s10-20020a170902b18a00b00188524050ecmr7615421plr.168.1668780285003; Fri, 18
 Nov 2022 06:04:45 -0800 (PST)
MIME-Version: 1.0
References: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
 <20221023153659.121138-8-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20221023153659.121138-8-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 14:04:33 +0000
Message-ID: <CAFEAcA99KbgPay82oVcqZFKFw+X6dqCL4JEqCBMFABsH5C0KeA@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] target/arm: Add ARM Cortex-R52 CPU
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1030.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 23 Oct 2022 at 16:37, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
>
> All constants are taken from the ARM Cortex-R52 Processor TRM Revision: r=
1p3
>
> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
> ---
>  target/arm/cpu_tcg.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

