Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FF32F8C0F
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 08:38:12 +0100 (CET)
Received: from localhost ([::1]:32900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0g9z-0003SW-20
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 02:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l0g8X-00032P-Oa
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 02:36:41 -0500
Received: from mail-ej1-f41.google.com ([209.85.218.41]:39498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l0g8V-00085c-Im
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 02:36:41 -0500
Received: by mail-ej1-f41.google.com with SMTP id n26so16501623eju.6
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 23:36:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SxeEqiCtMqSwo+RpLqbdBnZ+ZgNp3AMVd2shAfvqZOk=;
 b=N9/5pjIboWtWmCo4FJBVcwFh6zcpAj6VhiNrbchR04l0cg9tKZNhgfFpag7VleEMDj
 fj074WEvcG9uS9agMtNvsJPgxEaK4vUNy9+vv+2ky0UWbtvvx1qojgk8eYyR1MoyjOYX
 OXjv2Hd8GQIXnucjkboIfjInyXf3BvTigaBqZIisEU+KUVXVqFt1zbQnfiKeyF0sPil6
 NzOYiOASsBQm2hOhLCeda252LrEW0XhqSSkHyEbt8IqeGxE18e3Osc6ai2kV7R4l0c9p
 VOU2Iaj54ENH5WGZrCCUa14/2Nfgj3zwyXEwDWIiF5+sbZYx2+lBaSoouGcjkP2HKE12
 uGkQ==
X-Gm-Message-State: AOAM531Tw0Z5a1vvco5Xw5XBPx6NCHTubRTtVEnDAJ1uPW87LVZFAG0g
 n2eebVKQHlzbxb8NdhY7qkU=
X-Google-Smtp-Source: ABdhPJw2ENHPK61+QpJK8oKIh6V2GubFLdF05q5rrqgH/kW0XESY3WCBuDTtBXI/AmPjuOs3V4MpHA==
X-Received: by 2002:a17:906:134f:: with SMTP id
 x15mr11467830ejb.278.1610782598143; 
 Fri, 15 Jan 2021 23:36:38 -0800 (PST)
Received: from localhost (pd9e834f0.dip0.t-ipconnect.de. [217.232.52.240])
 by smtp.gmail.com with ESMTPSA id x20sm5716540ejv.66.2021.01.15.23.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 23:36:37 -0800 (PST)
Date: Sat, 16 Jan 2021 08:36:36 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 11/11] hw/m68k/next-cube: Add missing header comment to
 next-cube.h
Message-ID: <20210116083636.5d29363f@tuxfamily.org>
In-Reply-To: <20210115201206.17347-12-peter.maydell@linaro.org>
References: <20210115201206.17347-1-peter.maydell@linaro.org>
 <20210115201206.17347-12-peter.maydell@linaro.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.218.41; envelope-from=th.huth@gmail.com;
 helo=mail-ej1-f41.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bryce Lanham <blanham@gmail.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am Fri, 15 Jan 2021 20:12:06 +0000
schrieb Peter Maydell <peter.maydell@linaro.org>:

> The next-cube.h file is missing the usual copyright-and-license
> header; add it (same as the next-cube.c one).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/m68k/next-cube.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/hw/m68k/next-cube.h b/include/hw/m68k/next-cube.h
> index d38c52d540d..43577282d15 100644
> --- a/include/hw/m68k/next-cube.h
> +++ b/include/hw/m68k/next-cube.h
> @@ -1,3 +1,13 @@
> +/*
> + * NeXT Cube
> + *
> + * Copyright (c) 2011 Bryce Lanham
> + *
> + * This code is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published
> + * by the Free Software Foundation; either version 2 of the License,
> + * or (at your option) any later version.
> + */
>  
>  #ifndef NEXT_CUBE_H
>  #define NEXT_CUBE_H

The file is based on Bryce's original version, indeed:

 https://github.com/blanham/qemu-NeXT/blob/next-cube/hw/next-cube.h

So I think that header comment is appropriate.

Reviewed-by: Thomas Huth <huth@tuxfamily.org>

