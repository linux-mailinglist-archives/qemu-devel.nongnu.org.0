Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A438348A224
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:47:54 +0100 (CET)
Received: from localhost ([::1]:47784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n72W9-0005i7-ER
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:47:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n72Uo-00051x-N9
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:46:30 -0500
Received: from [2607:f8b0:4864:20::d35] (port=41541
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n72Ul-0002J1-RC
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:46:29 -0500
Received: by mail-io1-xd35.google.com with SMTP id y18so19626432iob.8
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 13:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=sender:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=1H+TmxWQkNt42WidApCcq8xUHLuLmF+CcDHvCnO2ESk=;
 b=WOU5W3giI0GE835Bq/zhXdwpke4eTYLc0Au1CiTbYx4GRL/+EOXZQj0dEPz/fM2D19
 QinPv9aDno4+mwyknvc1lrj3d4Ut/cDe7Qo++S/XLyZOm9ADjkpA9bTR/7AchE90P0RM
 SwaRip1rDNPtBCNjfQDHiNs3hZQE7VbTlDiLBqEhDH0WyzwC35Xivc7c1vPjXWhWjDjt
 u8R6iKJSHEqxizMaggO3D7RVmh8svFKBqSLo0J3fyGB+Gdac0QuB323A2sHl4ur+BJO6
 I17a+unLm+6llEtAejs5DIC7yd3Y4lADgxeG3wxjXIRCS6RN3jEopON+JAi9oN5CuFlF
 Fpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:mime-version:subject:in-reply-to
 :date:cc:content-transfer-encoding:message-id:references:to;
 bh=1H+TmxWQkNt42WidApCcq8xUHLuLmF+CcDHvCnO2ESk=;
 b=NRMFTKiBNOhCjiUWyALiw4HJMtGYT5hlO8oPHLWyxyDNRjeDPa/IMZ+dXSJv2IQq5x
 Lv4cfY9akJ6Hy0ZcA/2mwe2XzzLNLtz2uB3HVFAPapN2roTPGsf6BLeavoRoDvARAOtE
 CyrZgNfoJtHUjGC/jIFTW5rXR8UlUgZjLo8GCzdbOS96rk2tQ5+L8rrdHg4t7lLRz8ah
 dJAobHcUnnycQ8/PWZRsciMWOIScpGbLbe6qrsPFvJFxbjtEt4b1KUASog1VwgRbW/vj
 xqpI3zlOtDykHhqV30yGnysfDCfqChWspoJx2Vt/yRPA20fvH8TwlNsoti/sTRFIz9jr
 MlPg==
X-Gm-Message-State: AOAM531sbh/i1SNlr/ncEBmPfqQMsT7g/mPfo+dtBxH6COfNNXnZlWPk
 g0o/0oVRTnOicgaSomHHjTZO+A==
X-Google-Smtp-Source: ABdhPJxLx5VhFH4JTlZ6GEQZW9QbfgC/hczKrEOw42139g+3mODja0Wyc/R7F2P7krPgnjUn+PWXpw==
X-Received: by 2002:a05:6602:2c83:: with SMTP id
 i3mr852462iow.47.1641851185925; 
 Mon, 10 Jan 2022 13:46:25 -0800 (PST)
Received: from ?IPv6:2603:300b:6:5100:3ddb:10ca:bbcf:ace6?
 ([2603:300b:6:5100:3ddb:10ca:bbcf:ace6])
 by smtp.gmail.com with ESMTPSA id y15sm4780603ill.15.2022.01.10.13.46.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jan 2022 13:46:25 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
X-Google-Original-From: Warner Losh <bsdimp@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH] linux-user: Fix clang warning for nios2-linux-user code
In-Reply-To: <20220110191751.3335516-1-peter.maydell@linaro.org>
Date: Mon, 10 Jan 2022 14:46:24 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <2C1CB2C2-BD71-4DC9-A8E6-2654D657AF77@gmail.com>
References: <20220110191751.3335516-1-peter.maydell@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=wlosh@bsdimp.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jan 10, 2022, at 12:17 PM, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> The clang in Ubuntu 18.04 (10.0.0-4ubuntu1) produces a warning
> on the code added in commit f5ef0e518d03 where we use a
> shifted expression in a boolean context:
>=20
> ../../linux-user/elfload.c:2423:16: error: converting the result of =
'<<' to a boolean always evaluates to true =
[-Werror,-Wtautological-constant-compare]
>    } else if (LO_COMMPAGE) {
>               ^
> ../../linux-user/elfload.c:1102:22: note: expanded from macro =
'LO_COMMPAGE'
> #define LO_COMMPAGE  TARGET_PAGE_SIZE
>                     ^
> =
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/include/exec/cpu-all.h:231:31: =
note: expanded from macro 'TARGET_PAGE_SIZE'
> #define TARGET_PAGE_SIZE   (1 << TARGET_PAGE_BITS)
>                              ^
> 1 error generated.
>=20
> The warning is bogus because whether LO_COMMPAGE is zero or not
> depends on compile-time ifdefs; shut the compiler up by adding
> an explicit comparison to zero.
>=20
> Fixes: f5ef0e518d0331 ("linux-user/nios2: Map a real kuser page")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I'm probably going to apply this directly once it's reviewed, because
> it fixes a build-break on one of my machines.
>=20
> linux-user/elfload.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 329b2375ef1..2993b01e60c 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2420,7 +2420,7 @@ static void pgb_static(const char *image_name, =
abi_ulong orig_loaddr,
>         } else {
>             offset =3D -(HI_COMMPAGE & -align);
>         }
> -    } else if (LO_COMMPAGE) {
> +    } else if (LO_COMMPAGE =3D=3D 0) {
>         loaddr =3D MIN(loaddr, LO_COMMPAGE & -align);
>     }
>=20
> --=20
> 2.25.1
>=20
>=20


