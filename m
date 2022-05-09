Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F52C51F85E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 11:43:39 +0200 (CEST)
Received: from localhost ([::1]:44940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnzvV-0005hC-DC
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 05:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nnzp4-0001W1-2G; Mon, 09 May 2022 05:36:58 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:53414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nnzp1-0002V5-3u; Mon, 09 May 2022 05:36:57 -0400
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 7D4F420780;
 Mon,  9 May 2022 09:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1652089008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oqhCFAm9kgwm6VmGw8DTDwhuSFw/wwkbG4hVO3dWU98=;
 b=WOTnttbESh5r+xGLVbnp2CKk0xil31IlcxBnCSrgcPlKfNGAXhUc/m3fyLHkimNUfjyDgb
 k6+hDFLOKchxVo/65JKx8IkMe/JBLW/bUJFybRuhVq/m/g2gwyelPizSkhG3vkMLrsHvS7
 eD1EWII8rZie6uvEl//Pefgduud+fXw=
Message-ID: <81e033e0-4623-6806-654d-0f5c7b7975fe@greensocs.com>
Date: Mon, 9 May 2022 11:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] qom/object: Remove circular include dependency
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220509084659.52076-1-philippe.mathieu.daude@gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20220509084659.52076-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/9/22 10:46, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> "qom/object.h" doesn't need to include itself.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   include/qom/object.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 5f3d5b5bf5..ef7258a5e1 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -16,7 +16,6 @@
>   
>   #include "qapi/qapi-builtin-types.h"
>   #include "qemu/module.h"
> -#include "qom/object.h"
>   
>   struct TypeImpl;
>   typedef struct TypeImpl *Type;

