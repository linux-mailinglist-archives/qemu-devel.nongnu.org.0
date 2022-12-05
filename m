Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0166437A8
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 23:07:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Jbr-0002vl-Tx; Mon, 05 Dec 2022 17:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2Jbp-0002tK-BK
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 17:06:45 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2Jbn-0001aR-NN
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 17:06:45 -0500
Received: by mail-wr1-x431.google.com with SMTP id d1so20898911wrs.12
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 14:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f0sATFWE9oJ+QhP6jeikhOWfB1zquykrqRRAxolMq74=;
 b=onj3GN0w4RYBHY4AigcCidDVWZNKmu66tJcILRGbgaCa5XOiwIqGg5Sm7pIJwvPn0q
 UjgQdtEvSHptJxMj8sjwp9mIoqNmLwGUGyp0ChV0VjBOzk2KsRisxiC/OoKbVhTlTNJC
 R0JlS/AjgZUpcoYLQ6VVvqaw0VnOAOktYUkpljnKrhULiKtXMSC0sSfrTBla4tbA5+Rx
 YjIueWP1sUQLY+ds9LB1CM4CKNKFGjmqd4TXqhG9Mnbmvn6J+sulwayoH/jK/B0Fd1nQ
 RMW5ICFcuA5kxtSHumBUW7Dv9q5zhNMMzGEJhMy9+a624wXPyxUkkrydpMr4B2af3hkC
 p0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f0sATFWE9oJ+QhP6jeikhOWfB1zquykrqRRAxolMq74=;
 b=KLB8cOm80K9sN+8MZrzOPHuba+Rtv9fACOsbMMcOzpSrWIJJH7SaJpwxaUOs+6PyZA
 hc/yVFOanPg4BTXfEj6BMxznCSUaXO0qvJeP6yZ5PSvgTr/+kwXDXNVtkR8f3xQg93EE
 j0ynTJ/5zuD8FbLAjxx6CGDBCaTm9fJWoyNg/0b/9YSbknpY93YUDFl7id4anQLYTmCF
 HEih4XR980rYkhKEvKJVpStp880yeOt+n0pQdJB7vT8tF1tYyJs8DE3bMBJyQYY8BQ6g
 f0fCLhwcHYAvIShLNggfkZYWMDbEZkkaVGCKzfiaYtzpsh95II7lkP6IRhENuFu5W+nB
 /MTQ==
X-Gm-Message-State: ANoB5pmvFsdPNYV92n3KB1EZAgT8zjs4QYZcXZj6e1q5eyYq4c0OONyC
 r0Q0EUxy3paGpHN5vMlJar3vqh0KIBP/olUc5sU=
X-Google-Smtp-Source: AA0mqf7kQjEXQ6FE4gFyuYYiR0Zy85+yvn3mm6qw4Uqqo9SSHCs8YbZtU9agcRwI6642RdvfzAVEeA==
X-Received: by 2002:a5d:6b8a:0:b0:242:248a:a7c9 with SMTP id
 n10-20020a5d6b8a000000b00242248aa7c9mr18709673wrx.57.1670278002285; 
 Mon, 05 Dec 2022 14:06:42 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a7bc4d0000000b003d1b4d957aasm6957760wmk.36.2022.12.05.14.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 14:06:41 -0800 (PST)
Message-ID: <16a9ec30-4eb0-7a7a-7ca1-ffb04529cf48@linaro.org>
Date: Mon, 5 Dec 2022 23:06:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 09/21] pc_piix: allow xenfv machine with XEN_EMULATE
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
References: <20221205173137.607044-1-dwmw2@infradead.org>
 <20221205173137.607044-10-dwmw2@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221205173137.607044-10-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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

On 5/12/22 18:31, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> This allows -machine xenfv to work with Xen emulated guests.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/pc_piix.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 3dcac2f4b6..d1127adde0 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -404,8 +404,8 @@ static void pc_xen_hvm_init(MachineState *machine)
>   {
>       PCMachineState *pcms = PC_MACHINE(machine);
>   
> -    if (!xen_enabled()) {
> -        error_report("xenfv machine requires the xen accelerator");
> +    if (!xen_enabled() && (xen_mode != XEN_EMULATE)) {
> +        error_report("xenfv machine requires the xen or kvm accelerator");
>           exit(1);
>       }

What about the XEN_EMULATE case? Shouldn't this be:

   if (!xen_enabled()) {
      if (xen_mode == XEN_EMULATE) {
          error_report("xenfv machine requires the xen accelerator");
      } else {
          error_report("xenfv machine requires the xen or kvm accelerator");
      }
      exit(1);
   }

?

