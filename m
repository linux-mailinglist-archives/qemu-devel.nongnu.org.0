Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EB44A7196
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 14:32:27 +0100 (CET)
Received: from localhost ([::1]:37962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFFkH-0000l1-VN
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 08:32:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFF1n-0002Rv-5Y; Wed, 02 Feb 2022 07:46:27 -0500
Received: from [2a00:1450:4864:20::32d] (port=44982
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFF1l-00045z-Mu; Wed, 02 Feb 2022 07:46:26 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so3819470wms.3; 
 Wed, 02 Feb 2022 04:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JXqoHZx9RaJNH8Wfq3ehf5pr/WkCIRGEXeRLTufmAZs=;
 b=JcnpYZvS3a/ZDUK94C/ipi9dDDhYIf67tY28cLXGWJJp94lGQDI7RzkqztgxlIlF93
 Nm7V2hHjjphxxl4o/MGmfaWjqtY0faKptZfXSOmWYedgGZmiJYCq9Vrqg0733K+hPfRe
 F1WKgyrRwRR4Ofxkmk1iV7rfwVRDo+JnXVGMghA0MIl2zUftaDhgfoQBPlhsM9eTBi8w
 EHxB2ivsZnoiKm03hrQqa3MP3iUSbJzQQmwma9F10lfbuBDJmZjKBA2GJ9GRRPeCU/c9
 PWsXu3UM2oB49kJIEWK32kzRYYIoO0eJwSyY6TCR6tsoOFMjTwNETrNhxXLDVClGAse8
 ESgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JXqoHZx9RaJNH8Wfq3ehf5pr/WkCIRGEXeRLTufmAZs=;
 b=23rqAuc8yFOOsL6/+l1YDo63aJjYvGhh/yxURghnVoB2QjJERUOL0RUU5qdCWBXQ4P
 YiQcOMV3h0qxaF5+rSALyytEel2wAPPypTLvFhkvCWxOUkD78q9Uxo9gNYqJe4Glk4F5
 iTLTpTbDAlwxvADeGnY3WfZwnBl0H3/jyUuLkGbapUsbGzDho1VO4bPy1D23sc7AH1lP
 d6inVPjGuFJi86vNa68dcuCsxBnxlUZ2b28dYnHNafYrAII7+I9QwHSGlZjyYgt/J1ia
 b4BsXMuIjDzsYaruGciB/r0kJmbY+koBt/Yh+lFe+YHrx5i80QOqUTeFwcJP6qyuFzPv
 61kg==
X-Gm-Message-State: AOAM530H3N5feQk7gfpRWm04iZo2AEjvh+xER4RFX9ugFnchSh+d4ngf
 ss3/bh3AFcvBIjoqiPdQ5GM=
X-Google-Smtp-Source: ABdhPJwbNawwnLwoljXG39kvBi3Ilmx/dVbAJThYriefysTCXUOnYIFq5bkKwDzyGtPWcvc1YxW7pw==
X-Received: by 2002:a7b:c0d0:: with SMTP id s16mr6015303wmh.169.1643805983818; 
 Wed, 02 Feb 2022 04:46:23 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id h11sm4548236wmb.12.2022.02.02.04.46.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 04:46:23 -0800 (PST)
Message-ID: <b68c1a68-9404-2031-e729-ac0b1cb1c263@amsat.org>
Date: Wed, 2 Feb 2022 13:46:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2] hw/rx: rx-gdbsim DTB load address aligned of 16byte.
Content-Language: en-US
To: Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20220202103023.788916-1-ysato@users.sourceforge.jp>
In-Reply-To: <20220202103023.788916-1-ysato@users.sourceforge.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 2/2/22 11:30, Yoshinori Sato wrote:
> Linux kernel required alined address of DTB.
> But missing align in dtb load function.
> Fixed to load to the correct address.
> 
> v2 changes.
> Use ROUND_DOWN macro.
> 
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/rx/rx-gdbsim.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
> index 75d1fec6ca..2356af83a0 100644
> --- a/hw/rx/rx-gdbsim.c
> +++ b/hw/rx/rx-gdbsim.c
> @@ -142,7 +142,7 @@ static void rx_gdbsim_init(MachineState *machine)
>                   exit(1);
>               }
>               /* DTB is located at the end of SDRAM space. */
> -            dtb_offset = machine->ram_size - dtb_size;
> +            dtb_offset = ROUND_DOWN(machine->ram_size - dtb_size, 16 - 1);

Why did you add '-1'?

