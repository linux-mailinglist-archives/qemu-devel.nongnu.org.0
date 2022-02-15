Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C924E4B66A0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:54:29 +0100 (CET)
Received: from localhost ([::1]:58272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJtbP-0003EZ-Ii
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:54:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nJtUe-0000P7-79
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:47:28 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:39982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nJtUc-00012v-4U
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:47:27 -0500
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 5A10520780;
 Tue, 15 Feb 2022 08:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1644914841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nfK+VniyZe98ERI4i2y2Y10iAHUjuNoE9IQ5gTBBABQ=;
 b=j3qGyTV9PoPeMnJpAeqJ2H3OB+WYx+JEGAD6+clSF186Sl3kivXArVbzREILpeqIYFlFL2
 jEvNsTRCrB14M8FaLNN9Qji8n2qiQfCeGyzM9PR2QUcYv7KovPlffZKMgiZvMzzewvRCL+
 TLBOE8/bJ7Bjc2Igd5+menEX4EIoGt0=
Message-ID: <aec5d8e0-6f32-2cdd-4d9d-a8c25728180f@greensocs.com>
Date: Tue, 15 Feb 2022 09:47:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 10/14] target/hexagon: Add missing 'hw/core/cpu.h'
 include
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220214183144.27402-1-f4bug@amsat.org>
 <20220214183144.27402-11-f4bug@amsat.org>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20220214183144.27402-11-f4bug@amsat.org>
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/14/22 19:31, Philippe Mathieu-Daudé via wrote:
> HexagonCPU field parent_class is of type CPUClass, which
> is declared in "hw/core/cpu.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   target/hexagon/cpu.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
> index 096aa2deb6..76cd1d5021 100644
> --- a/target/hexagon/cpu.h
> +++ b/target/hexagon/cpu.h
> @@ -27,6 +27,7 @@ typedef struct CPUHexagonState CPUHexagonState;
>   #include "hex_regs.h"
>   #include "mmvec/mmvec.h"
>   #include "qom/object.h"
> +#include "hw/core/cpu.h"
>   
>   #define NUM_PREGS 4
>   #define TOTAL_PER_THREAD_REGS 64

