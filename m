Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFAD2E812F
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 17:11:36 +0100 (CET)
Received: from localhost ([::1]:35860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv0Y3-00044e-Ag
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 11:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv0VW-0003Gb-2j; Thu, 31 Dec 2020 11:08:58 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv0VU-0007Er-BQ; Thu, 31 Dec 2020 11:08:57 -0500
Received: by mail-wr1-x434.google.com with SMTP id m5so20375842wrx.9;
 Thu, 31 Dec 2020 08:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9dwaNETCjHx9RteZJLXXuzByX1jETCsZA4mjKswgWtI=;
 b=iDHKwiLp0j1yrN+jONeUiLymiRzjK9L6BzztzINPkQZa6s+AtOvUWGTx249JM61w7C
 a81Msq/VsocttTyTS8i0XF5x81sqL+FHoVhlhoQuQCP2Ld+uOPa++u4T21kY16evQOZA
 tcxZNYVkTBveW2SuGJID7JFZQXmZ3xojgplpWNT6SKErJ9zNE+N1jNn0T6DC/VlrtCtC
 uwKUcsffVZsYSkL059idlsxpgyyzffEsMKSK1+2PCFkOqy8NWyQFd96h+1/uQMsrnPHq
 DTIoQJL7ZYqPzIxk2HQn3u9d/Pjqedfpk9vy1ZPT8ERkprsk0mLa/X265x55LkCtEv++
 9GFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9dwaNETCjHx9RteZJLXXuzByX1jETCsZA4mjKswgWtI=;
 b=HoLikpLXXnML/05hX2HJJph/tePIYph81JMLRcVvpbkH6DN6gwOco6t735s6s5vyOO
 NlMo36DPmZf3ZC9/IYc0t2iAK7W3uSbvhNijYNyVRGr1DZU1G7G5SaNuxuPKSOLqbWX5
 I+FVrh4lN09+IVN/S3KMS3tJN0LfBZAfqK0bbk2GeYo7FiI5YVxxCit9FQGuc8gSCtk8
 V+nuKAe7IAfFbS+Cz/eVAx4YOH8qetIXd/DQY4gJUGs72DEJujsykNR3fqaUgjAfI0j3
 1FRzJ8koH0MOD9NYsKhPfXAC9gzvH7Zq6lQ3IFQ1VXyCoeKr0+z5b6J+I9GIBAGS/bvx
 Kq2Q==
X-Gm-Message-State: AOAM533sb/T42++oybgcPhFWfK5iJgpII7gvD390ZRhY5EWbkvZgOObo
 PvPzr580IpJDquAzTJ8hqiY=
X-Google-Smtp-Source: ABdhPJz59t9Z6KIg5faiZ+VxHQLrOIUqYl8CE9X8argKeDNtKLp/xgpZ0WJ0RXXTArz7QqS0GWQRrQ==
X-Received: by 2002:adf:a441:: with SMTP id e1mr64436915wra.385.1609430934360; 
 Thu, 31 Dec 2020 08:08:54 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id h83sm14003583wmf.9.2020.12.31.08.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Dec 2020 08:08:53 -0800 (PST)
Subject: Re: [PATCH v2 2/3] sam460ex: Remove FDT_PPC dependency from KConfig
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1609413115.git.balaton@eik.bme.hu>
 <a55cd539835084bd322695c483273dc4b144ccbc.1609413115.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d1c8b8ea-63a7-37d7-f5d7-d4dc5ddefbe9@amsat.org>
Date: Thu, 31 Dec 2020 17:08:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a55cd539835084bd322695c483273dc4b144ccbc.1609413115.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.399,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/31/20 12:11 PM, BALATON Zoltan via wrote:
> Dependency on FDT_PPC was added in commit b0048f76095
> ("hw/ppc/Kconfig: Only select FDT helper for machines using it") but
> it does not seem to be really necessary so remove it again.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
> v2: Do not remove PPC405, reworded commit message
> 
>  hw/ppc/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 8548f42b0d..f1e1be208e 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -64,7 +64,6 @@ config SAM460EX
>      select SMBUS_EEPROM
>      select USB_EHCI_SYSBUS
>      select USB_OHCI
> -    select FDT_PPC
>  
>  config PREP
>      bool
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


