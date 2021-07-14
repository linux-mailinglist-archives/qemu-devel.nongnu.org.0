Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA913C8863
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 18:10:53 +0200 (CEST)
Received: from localhost ([::1]:39118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3hTE-00009k-K7
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 12:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1m3hSC-0007ZY-RZ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 12:09:44 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:47016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1m3hS7-0003TR-Vp
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 12:09:43 -0400
Received: by mail-oi1-x230.google.com with SMTP id t25so2794219oiw.13
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 09:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=spScO7rDL2llYd4IDGXCbpWed2O0ybnzf7Tr3D0iUH4=;
 b=JZ2+xcCbDNTYKWVM6G55kumjB0ooUdCCHcr1yfWyoh6+IXly4P4Rr16e6zCHMYcxBI
 2s2icqaHJFWH2DWQaIZxEi1FATXfb8p1WKOyOim9iUlKsPcKgN03/Mit6NwD2ycLgA+V
 Nne65LJPIv8HFGzkdQWqABt5qOYbg1LGidUzJAvo4tK17g2Oetf2XZRhTz6KLgP8OMpN
 EyFERkCHij8TPLUdEcrIPJgVnTdKSfK8A9R3kX2t6Ed8j9y+xN8r0c23icqdmoGiRzpB
 YBCKQKkCC5vwwt449PwKEL07OgX8Tsu46xuPThKAbrbVugxwmFPb0zhPaKg+4zgmkdRl
 F47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=spScO7rDL2llYd4IDGXCbpWed2O0ybnzf7Tr3D0iUH4=;
 b=lnhzC/cjODNL+QJA6Bd0msEEmHlYc76ht/eLS6yReGFm/3mieljFYPnVDlLbmpqK1D
 Hd/N1iNcE9fv3RgBVRKIB3YkOaI6m0M9/Fvz6yFwcms72+q8nJftpP5UIGkG0PJabGUS
 K2GLwZCxHg9Ga2kWTOwM/kS15icatBzYtJ4xpPI1DAapskUJ2d9YGKQKLns3DPGs9dET
 QaLigOErfzdMx7XdEUZP5FWCoZzU1G3arx95DbvI0jYKlytyy8udV4tTeF1O38D8Ra1/
 lm5YPo2Thy9FKFNoJ9cnSocCR8D0e68iAhPTuUdazqBu/tE4FXd28aiD3XzZi8sSN+R/
 /9jQ==
X-Gm-Message-State: AOAM5327ePrQHQGOHdq3dCjdWnmaFRSLitu5Zvt6RqyBSbVpbxbozWnD
 P1vt8cOvXUCPHWRAQfGmyOEnyw==
X-Google-Smtp-Source: ABdhPJyHJ0WAHhrpLascBKU62ksss8a0+bxoU3hXSwkf42Ki/7caev4qiUUNEDZQua9CBkJ72lilAw==
X-Received: by 2002:aca:b343:: with SMTP id c64mr7780883oif.137.1626278975934; 
 Wed, 14 Jul 2021 09:09:35 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:6938:a190:9608:2d5d])
 by smtp.gmail.com with ESMTPSA id l20sm489464oof.8.2021.07.14.09.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 09:09:35 -0700 (PDT)
Date: Wed, 14 Jul 2021 11:09:33 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 07/21] contrib/gitdm: add domain-map for MontaVista
Message-ID: <20210714160933.GB3431@minyard.net>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
 <20210714093638.21077-8-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210714093638.21077-8-alex.bennee@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=cminyard@mvista.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: cminyard@mvista.com
Cc: qemu-devel@nongnu.org, Corey Minyard <minyard@mvista.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14, 2021 at 10:36:24AM +0100, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Corey Minyard <minyard@mvista.com>

Acked-by: Corey Minyard <cminyard@mvista.com>

You even got the (mis)spelling right!  Thanks.

-corey

> ---
>  contrib/gitdm/domain-map | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
> index 0074da618f..efbbb15643 100644
> --- a/contrib/gitdm/domain-map
> +++ b/contrib/gitdm/domain-map
> @@ -18,6 +18,7 @@ igalia.com      Igalia
>  intel.com       Intel
>  linaro.org      Linaro
>  microsoft.com   Microsoft
> +mvista.com      MontaVista
>  nokia.com       Nokia
>  nuviainc.com    NUVIA
>  oracle.com      Oracle
> -- 
> 2.20.1
> 

