Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6B54B0006
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 23:20:06 +0100 (CET)
Received: from localhost ([::1]:51760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHvJl-0006Hy-IC
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 17:20:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuxB-00075U-Bs; Wed, 09 Feb 2022 16:56:45 -0500
Received: from [2607:f8b0:4864:20::62c] (port=33739
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHux9-0008NR-CV; Wed, 09 Feb 2022 16:56:44 -0500
Received: by mail-pl1-x62c.google.com with SMTP id k17so168894plk.0;
 Wed, 09 Feb 2022 13:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FQF/RI5yDWstAddWtXzcIND/EXlK8OkYIB4Hk/BeNYI=;
 b=LMQ7elvEui1dXkJmuhht+ksVpIENB5Db3XyccJDcaXTYVfAiRuMFydh7l0ufHealqh
 83tVuhxuMOCJ/KFYafUQH9mXpXzdt4i9P08QEoCZ7us635a6G7pMq++bcSrqRUrhUmwC
 p1A0qMVhB1csVScw5sQBjue/88L5yjntVj5jX2ed3554kDPFmqilZohi+bj5a8abjoly
 Yc2Fw01ZJNVD6Wlpdu7aaa3kUF5eFQmF6lWsSgLSYIrpr8FbUWC94RYfWgaEp374Dmby
 bcC7/6k+0BLhm5k6dmlPWRqkoIUIx1WzBxri3HLlIfQVKi/TA8Ge1RBQyMdVmLMTTeLN
 ssiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FQF/RI5yDWstAddWtXzcIND/EXlK8OkYIB4Hk/BeNYI=;
 b=iFVAVbD3pViv+CAO5xnkxTgKI3nbUADqj29DtGDCJYLStp0csJB6XHMv4BpqhW0T4P
 BkF4C+rR5RFP12Vt2vfWrNniVo0lgJs0VkYqiVXRzt6lUarSTKj86Nr85WWlfpIebf0+
 iJ+W/6vFm58hE0MxdZai9qvHYKymeW62iX4EPzry2Nn3nCLYRVmaOBugYZunOYO03LsD
 7G80YjasKpCgfcXcjF81/qANTdNlu8c9SuE690xYmGceJdWfQCuE+VStodRCE0ybe2TT
 3xQtV1QLoiTio2mXFrSsx/xfK7SL0Q6hAYZXQzuWPEuZuCIZ2X1mWhVASNC6hqiDku1T
 8UCw==
X-Gm-Message-State: AOAM531ZyLSE6cfelNjdXyvcDk5aBO0WrRV9fT8XsU5nxkPOICQaCl8a
 IKI/YxSjmv8kwYTCB2UY6kY=
X-Google-Smtp-Source: ABdhPJzNvEdcuxD88NZlP6QgaQAfBawY3O5hq9ZM2iDlM3zgLM2EhzAk+C7M7w1i3iQTfkqIFfZTJQ==
X-Received: by 2002:a17:90b:3810:: with SMTP id
 mq16mr5871696pjb.26.1644443801630; 
 Wed, 09 Feb 2022 13:56:41 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id nv13sm7362488pjb.17.2022.02.09.13.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 13:56:41 -0800 (PST)
Message-ID: <8e22656c-5b79-c9bc-92cd-bd6623a4eba3@amsat.org>
Date: Wed, 9 Feb 2022 22:56:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] hw/block/fdc-isa: Respect QOM properties when building AML
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "open list:Floppy" <qemu-block@nongnu.org>
References: <20220209191558.30393-1-shentey@gmail.com>
In-Reply-To: <20220209191558.30393-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

On 9/2/22 20:15, Bernhard Beschow wrote:
> Other ISA devices such as serial-isa use the properties in their
> build_aml functions. fdc-isa not using them is probably an oversight.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/block/fdc-isa.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/block/fdc-isa.c b/hw/block/fdc-isa.c
> index 3bf64e0665..ab663dce93 100644
> --- a/hw/block/fdc-isa.c
> +++ b/hw/block/fdc-isa.c
> @@ -216,6 +216,7 @@ int cmos_get_fd_drive_type(FloppyDriveType fd0)
>   
>   static void fdc_isa_build_aml(ISADevice *isadev, Aml *scope)
>   {
> +    FDCtrlISABus *isa = ISA_FDC(isadev);
>       Aml *dev;
>       Aml *crs;
>       int i;
> @@ -227,11 +228,13 @@ static void fdc_isa_build_aml(ISADevice *isadev, Aml *scope)
>       };
>   
>       crs = aml_resource_template();
> -    aml_append(crs, aml_io(AML_DECODE16, 0x03F2, 0x03F2, 0x00, 0x04));
> -    aml_append(crs, aml_io(AML_DECODE16, 0x03F7, 0x03F7, 0x00, 0x01));
> -    aml_append(crs, aml_irq_no_flags(6));
>       aml_append(crs,
> -        aml_dma(AML_COMPATIBILITY, AML_NOTBUSMASTER, AML_TRANSFER8, 2));
> +        aml_io(AML_DECODE16, isa->iobase + 2, isa->iobase + 2, 0x00, 0x04));
> +    aml_append(crs,
> +        aml_io(AML_DECODE16, isa->iobase + 7, isa->iobase + 7, 0x00, 0x01));
> +    aml_append(crs, aml_irq_no_flags(isa->irq));
> +    aml_append(crs,
> +        aml_dma(AML_COMPATIBILITY, AML_NOTBUSMASTER, AML_TRANSFER8, isa->dma));
>   
>       dev = aml_device("FDC0");
>       aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0700")));

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

