Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C275EB3A2
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Oct 2019 16:13:27 +0100 (CET)
Received: from localhost ([::1]:51394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQC7w-00043g-1n
	for lists+qemu-devel@lfdr.de; Thu, 31 Oct 2019 11:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53107)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iQBwj-00020C-35
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 11:01:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iQBwg-00026X-8W
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 11:01:08 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:40747)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iQBwf-00024w-Vw
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 11:01:06 -0400
Received: by mail-wr1-x443.google.com with SMTP id o28so6596660wro.7
 for <qemu-devel@nongnu.org>; Thu, 31 Oct 2019 08:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=H+/aSE2zwkw8E9P5dcG+5Nsxf5i+4uvl8efyIEoOF00=;
 b=d6sdLe+u5yz/DucPfbY7OAZrtS3aSwDdVYCeeo4qqodVjyCX9UUktSDP4korQEh8Qk
 MRkf3p0706f8uP7/KHufqub4ooKIAt7G78YXpZKImqWe/yUREJGLjq5Z8qZLyhRTcLwq
 NzWIZMjTk9uMY9J0OpKF/X5NJTPmg19+UUcMkbZtCCoQGTHUcdvdm/nt2UnIvRFS1QTU
 d91AHUdbftj7In6O8h9aPv4u+OZJoWRK4+7hln2lhh+H8ExG3uF2QbMy8hFRhbFcItja
 Yl6AAkyRovqn1t8+Z8CugUna4puvd2k9AD1BYZawyUknotTZbdDbNkzPFnOxNNb1hTR4
 plgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=H+/aSE2zwkw8E9P5dcG+5Nsxf5i+4uvl8efyIEoOF00=;
 b=czliQ+pNs5Fi7YwwXQcpHLqVmOTTKU8fjccoXFHf7zlLeyXGKmzMZo/2tDo9yeeU+y
 aJwCVuXtU9Krh4aIC/aFOAUSNaC7YSOzv14XVinMLlxOrAx7ql6idfQz4gD/JGprnWRA
 SQ/CyIjmuJmS8eKh/eEIIb4+540/7e9AA42drjf+DaGcHoZKHXF/boFjD6Ncpztdp7Qs
 QAcs3j3P6wfuCxHtlOaVDqCqM69zChHWblG02OtCj8LvdH5znJof0sM8G2+akFAZOpYk
 Sv4i0pc+cEdncQZLPun6L1rLQePAwrSbnuXtANUdVvQHKagQjeGNLW7Z4c/ZkssGBBm+
 Mhjw==
X-Gm-Message-State: APjAAAXtjY9tws7rKTk6HDfYh5KCV2T47ckNrYwtfLPmC9HySqwMsLpV
 KQeT1o8xdLgODnDVWc163iAo7Q==
X-Google-Smtp-Source: APXvYqxNgw23QJCyIEuJmNizof7aVpbaLRKKx52N+Joe/p0OaxO52AyxOnZ2bpEWnq7tHSkqpafpMw==
X-Received: by 2002:adf:9f08:: with SMTP id l8mr5774079wrf.325.1572534063979; 
 Thu, 31 Oct 2019 08:01:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f204sm3881422wmf.32.2019.10.31.08.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 08:01:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1E7371FF87;
 Thu, 31 Oct 2019 15:01:02 +0000 (GMT)
References: <20191031040830.18800-1-edgar.iglesias@xilinx.com>
 <20191031040830.18800-2-edgar.iglesias@xilinx.com>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/1] hw/arm/boot: Rebuild hflags when modifying
 CPUState at boot
In-reply-to: <20191031040830.18800-2-edgar.iglesias@xilinx.com>
Date: Thu, 31 Oct 2019 15:01:02 +0000
Message-ID: <87y2x16jtd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, edgar.iglesias@xilinx.com,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 sstabellini@kernel.org, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Edgar E. Iglesias <edgar.iglesias@xilinx.com> writes:

> Rebuild hflags when modifying CPUState at boot.
>
> Fixes: e979972a6a
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/arm/boot.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index c264864c11..ef6724960c 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -786,6 +786,7 @@ static void do_cpu_reset(void *opaque)
>                  info->secondary_cpu_reset_hook(cpu, info);
>              }
>          }
> +        arm_rebuild_hflags(env);

Do we just get away with armv7m_reset because there is no futzing about
with execution state?

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>      }
>  }


--
Alex Benn=C3=A9e

