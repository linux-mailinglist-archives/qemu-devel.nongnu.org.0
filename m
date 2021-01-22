Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1C1300A51
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 18:55:57 +0100 (CET)
Received: from localhost ([::1]:33158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l30f6-0002My-9P
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 12:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l30cu-00016X-Ga
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:53:45 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l30cq-0006Qm-R6
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:53:39 -0500
Received: by mail-ej1-x636.google.com with SMTP id hs11so8905437ejc.1
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 09:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SEJn9V46Io5qf1Ky1KIoVtEMU1P/w+agMTpf0QtBCAw=;
 b=gZTj4/WxhFXQYpUmbO81VsypEevJd6mwmZGEzjgRMR0knA9kxY478lkOTfhPpHOhB2
 OOt2WRTMgfk63sQIPKTWBK8fHUaKBx/bSqJ17Ja4yDnfKO/uMcXJp+Ns5FWWdxmVpCYf
 89ObBnGiHQvlwVbvHwKOxv3nI181JHE4s4w+8gFD4XEjXVh4+g+H2jzokuGCNSmg0Jzj
 sA06VwEnZYzpyx2TPpuKkwRRwuXSN56sr3Ds1ph98DgHRnhfNAGlXYkpg0nWHRBI0NpM
 IcbLq+URXFRK1OfvIJW9b/U/TvXeHctj/Qi1h9gjwisA7jkT0XFFCqJOzAOueQWGRNol
 8i3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SEJn9V46Io5qf1Ky1KIoVtEMU1P/w+agMTpf0QtBCAw=;
 b=fEBwApa4Y6wkWIyrs6LukoL6B/XTZ41aRKhc3uKrgcXG29jqptxoBIpmETLSGZ2wkV
 toplVFRNIVXbT1lxBJBSUVjGSIU8m7NYOlo0bXPnbPrR6oC9lyZMMufk+uE3ClSkQZrc
 FhF5uZSafiYLxu4JQOdlb9c5z8x997QKVBP5VhrKX71R9INlsE64DxzngN7yzIt8f9Xj
 HwC1GPXHoUilunKWI5qL8H6Dxi0rYnWOIILo4X38e7rqQtxCX5X9ma3GSlWTjmoXdipi
 NWFBlEZ+07v54Eb6yUHv3lCEsmaBBgOZbEbauJUk8u4tKcA+Q3pBn+Nry1GVLD9DqyYq
 9dqg==
X-Gm-Message-State: AOAM532cSLGoqVRONjpjL06a7UEa6+mMpgxMtp4dNmiM+t2fvVkq0/UB
 lDkTsQjnu5zXFLzuDAVLsSg=
X-Google-Smtp-Source: ABdhPJzN2w9LCypVuTw4c39xMa5EyOUseTLG2PGkM4t2bLt+XWWyBiMvcmsaLALfnaINqsxB9Cl9Dg==
X-Received: by 2002:a17:906:5e4c:: with SMTP id
 b12mr3775299eju.297.1611338014603; 
 Fri, 22 Jan 2021 09:53:34 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id gt12sm4885201ejb.38.2021.01.22.09.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 09:53:33 -0800 (PST)
Subject: Re: [PATCH v7 12/35] Hexagon (target/hexagon) instruction attributes
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-13-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <11960eff-406b-158c-7fae-61b2e0550268@amsat.org>
Date: Fri, 22 Jan 2021 18:53:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1611113349-24906-13-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.221,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, alex.bennee@linaro.org, richard.henderson@linaro.org,
 laurent@vivier.eu, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 4:28 AM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/attribs.h     | 30 ++++++++++++++
>  target/hexagon/attribs_def.h | 95 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 125 insertions(+)
>  create mode 100644 target/hexagon/attribs.h
>  create mode 100644 target/hexagon/attribs_def.h
> 
> diff --git a/target/hexagon/attribs.h b/target/hexagon/attribs.h
> new file mode 100644
> index 0000000..e88e5eb
> --- /dev/null
> +++ b/target/hexagon/attribs.h
> @@ -0,0 +1,30 @@
> +/*
> + *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HEXAGON_ATTRIBS_H
> +#define HEXAGON_ATTRIBS_H
> +
> +enum {
> +#define DEF_ATTRIB(NAME, ...) A_##NAME,
> +#include "attribs_def.h"

Per QEMU conventions, this file has to be named "attribs_def.h.inc".

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

