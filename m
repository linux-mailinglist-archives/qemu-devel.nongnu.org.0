Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067DA32D48D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 14:50:25 +0100 (CET)
Received: from localhost ([::1]:59650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHoMy-0005Jl-25
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 08:50:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHoK2-0003Ut-Ag
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 08:47:22 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHoK0-000536-70
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 08:47:21 -0500
Received: by mail-wm1-x32a.google.com with SMTP id m1so9750587wml.2
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 05:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W/lpvDYMuKBaq7tOu1eaNNB6OBUw8mE+/HsMelVooAA=;
 b=b/PuC3GnLjc0efGzGXMyf7EyXgVVSBhsOaLlFTmTwG1J9erQqgFfWXMw8EQpfGxbJs
 hwD1a7SdMFExkCcqEWilk/CWbyQL8oOqvIsEFqdyEd5vk5GD3WZR4mLC+28R6NCIPbVz
 dvVsRdiN9M1gVnF5388vYKBrouzFRkV8zsHgl+MrAQDVnk9yqip/yNBSmrE9rdF3U68r
 yA4LU3vBgpWPBtUMJe8QrDiYTr41AqDDKFyOj9LihHwCTUgmIGBXbr+TMLfCim3xXpse
 xEmIjJImhRzLLRREAkmPg32a3PZcjlTa8uhel8sfkufQB+QiST4cKYAJVu6srp3z/JNH
 5SKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W/lpvDYMuKBaq7tOu1eaNNB6OBUw8mE+/HsMelVooAA=;
 b=gbYCiPFk+62reXNvBL8wW69WaM8eCZj8bThiBCYbGyhAI64BEtqlrIBopGdnlELf9K
 GZGRoo+bVgAJRQmgjC3z8veDr/HByGhrchAmADDowouYf+AQVuyIaQ5Ddbz1YdA+WJY7
 u782vohjdKN+LDIePQAHWqgAbp3l/IkTuuYQcVHJG1RX9/XMieY693tSAWv9fUqUQnHF
 ufeWVl9ca5hP1seIx/ttc60sB6Kwz52KlPXsXUZ6kaenvmLP/qw7I6bhnjsYPAku96p4
 7X8OAUK/6GJJ9i4uR/8nFcYs9b+O9+F9uPs8fFp79sdebtq41hA4+IrVaMjiuHKzx3rX
 j1AQ==
X-Gm-Message-State: AOAM533ghXmHZrcORDV5R4WlRcl8cRtAj+/7kCx/cE+q67d5d29hvVRV
 wEGxDzz/fbyTEkjILPgYK1D/cS5Tgic=
X-Google-Smtp-Source: ABdhPJzhl2m2tlkKggUMFeuYKZaf3bOH23FBqPCGFqbTYD+OU1YcubXm7RYdKJOkY4flkYNl/rNEdA==
X-Received: by 2002:a1c:9a09:: with SMTP id c9mr3964940wme.172.1614865636857; 
 Thu, 04 Mar 2021 05:47:16 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j136sm10529954wmj.35.2021.03.04.05.47.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 05:47:16 -0800 (PST)
Subject: Re: [PATCH] hw/sh4/sh7750_regs: Replace link to license by its full
 content
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20210222185605.2714192-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b57ab441-ae60-ada8-5b41-6d2ba646d25c@amsat.org>
Date: Thu, 4 Mar 2021 14:47:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222185605.2714192-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 2/22/21 7:56 PM, Philippe Mathieu-Daudé wrote:
> This file is borrowed from the RTEMS source code, which comes
> with a GPL-2.0-or-later license with a header exception.
> 
> Expand the GPL-2.0-or-later license in place to not be dependent
> on a 3rd party website. This also fix the misleading comment "The
> license and distribution terms for this file may be found in the
> file LICENSE in this distribution" referring to the RTEMS distribution
> and not to the QEMU one.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/sh4/sh7750_regs.h | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/sh4/sh7750_regs.h b/hw/sh4/sh7750_regs.h
> index 3e4554af315..ab073dadc74 100644
> --- a/hw/sh4/sh7750_regs.h
> +++ b/hw/sh4/sh7750_regs.h
> @@ -10,8 +10,28 @@
>   *         Victor V. Vengerov <vvv@oktet.ru>
>   *
>   * The license and distribution terms for this file may be
> - * found in the file LICENSE in this distribution or at
> - *  http://www.rtems.com/license/LICENSE.
> + * found in this file hereafter or at http://www.rtems.com/license/LICENSE.
> + *
> + *                       LICENSE INFORMATION
> + *
> + * RTEMS is free software; you can redistribute it and/or modify it under
> + * terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2, or (at your option) any
> + * later version.  RTEMS is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> + * General Public License for more details. You should have received
> + * a copy of the GNU General Public License along with RTEMS; see
> + * file COPYING. If not, write to the Free Software Foundation, 675
> + * Mass Ave, Cambridge, MA 02139, USA.
> + *
> + * As a special exception, including RTEMS header files in a file,
> + * instantiating RTEMS generics or templates, or linking other files
> + * with RTEMS objects to produce an executable application, does not
> + * by itself cause the resulting executable application to be covered
> + * by the GNU General Public License. This exception does not
> + * however invalidate any other reasons why the executable file might be
> + * covered by the GNU Public License.
>   *
>   * @(#) sh7750_regs.h,v 1.2.4.1 2003/09/04 18:46:00 joel Exp
>   */
> 

