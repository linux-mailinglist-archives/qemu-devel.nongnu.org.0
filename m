Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F3044D725
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 14:22:58 +0100 (CET)
Received: from localhost ([::1]:58120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlA2b-00067w-Ef
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 08:22:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ml9xx-0000tg-Uk
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:18:11 -0500
Received: from [2a00:1450:4864:20::42a] (port=39468
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ml9xv-0006I2-90
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:18:08 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d27so9763195wrb.6
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 05:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Wgw4Yz/DkPk1BTrZOrkrCwWtrwcWHw0L0y3puY53Og0=;
 b=qyhJHgAd76DZ0j5rBThNb6FIkJo+ojeBjb64LH6CiF1MApE9vbLLAiHP6eg2VoDUi3
 IMihxrU3sV2dJilvALucsfVZBhxMI8OgmPGGfTE61LzgN1m0dVgVtqQMytrx2NwZOWzA
 cn+hm3xcw8MOEzVUIsu/vTSlCcJr3GtUNrPIutYFTye16TDSeSttMF1U5R/VonokjaCQ
 acGqmYHgrie+5q2tZB2nWOMAEhG7tcWr/ysEmpRnYbFrcKlgZhPErjDdEY5m0i4Ay5JG
 T3Dt5I4cpy/KYqmNSjHgVvHkwPv9R3Bs1pq8aIcVpHaBjQyw5q/8ZYVCalAs9IctZjEX
 1Dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Wgw4Yz/DkPk1BTrZOrkrCwWtrwcWHw0L0y3puY53Og0=;
 b=tKlVldRZ0Epm2A/AwPQ2clM6XorSis5XUWtWzsfdFNAOnTdd6XW68/kmfhIYrpEBLR
 cdPVmudD4vx1NxbLJbwY0lnGZhXmV4FJdUYOq73nb6ewPrZnEqlcGyhYTYL1WU4DQVUF
 wrV736QMd7tR1affIWfMH5NC1EQI2syMqiBLurqJPKa1nNLoZAC5MHgLoDCKoLSKYW7O
 +cDI5hyFx00+NwhDPm4VyPh5HkCcabSW5C5k/lM5zCcUz0SeEmKSENgy+LdmYHlor6YJ
 ysCHHZBhMXLNDRvwB09e51OcD9+NwPq4f3X+mlv0Qzh5Xd71lRKRZ9InMRsoSmu0C9ZK
 EPiA==
X-Gm-Message-State: AOAM530JMiCkzviCkn3bUHttdBOIZUZpG3ovxLJJvCZR+5z/w6XrbMxY
 gQNdETB1hd7CI0C+UWTmLPkkGQ==
X-Google-Smtp-Source: ABdhPJzxdlOCnPp/QBGD8RSELJDZOwB4GU332rWvBkdSd2nJOtwk3YRO1XfQd6gYxaFA8JEBPhFGVQ==
X-Received: by 2002:a5d:68d2:: with SMTP id p18mr8836702wrw.21.1636636685596; 
 Thu, 11 Nov 2021 05:18:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w10sm2750253wrq.88.2021.11.11.05.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 05:18:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6E4B11FF96;
 Thu, 11 Nov 2021 13:18:02 +0000 (GMT)
References: <163662450348.125458.5494710452733592356.stgit@pasha-ThinkPad-X280>
 <163662451431.125458.14945698834107669531.stgit@pasha-ThinkPad-X280>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH v2 2/3] softmmu: fix watchpoint-interrupt races
Date: Thu, 11 Nov 2021 13:15:34 +0000
In-reply-to: <163662451431.125458.14945698834107669531.stgit@pasha-ThinkPad-X280>
Message-ID: <87lf1uj0fp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:

> Watchpoint may be processed in two phases. First one is detecting
> the instruction with target memory access. And the second one is
> executing only one instruction and setting the debug interrupt flag.
> Hardware interrupts can break this sequence when they happen after
> the first watchpoint phase.
> This patch postpones the interrupt request until watchpoint is
> processed.
>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  accel/tcg/cpu-exec.c |    5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index df12452b8f..e4526c2f5e 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -742,6 +742,11 @@ static inline bool cpu_handle_interrupt(CPUState *cp=
u,
>              qemu_mutex_unlock_iothread();
>              return true;
>          }
> +        /* Process watchpoints first, or interrupts will ruin everything=
 */
> +        if (cpu->watchpoint_hit) {
> +            qemu_mutex_unlock_iothread();
> +            return false;
> +        }

side note: I wonder if it is time to wrap up the locks up with
QEMU_LOCK_GUARD or something similar?

Anyway seems reasonable:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

