Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B7448738C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 08:28:51 +0100 (CET)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5jgA-000276-3A
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 02:28:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5jbL-0008Ec-DA
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 02:23:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5jbI-00047J-LE
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 02:23:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641540228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9676BDKdccMogxRre8rixWMoyOp+zbe9lBHjBXmmOM=;
 b=COMu+80s3m6niu9ZAJbqMSgyJYcCn/6eU7y7yYh9AwSsgas7f2JkY2FPWJPlIV+6DpaD09
 YxdXMJgiFGcnKeVzm3WkxvF2mxyhxo8zF36n57/RUK/vW8zn3q5N5CUkk8s2/o7CfDcEzP
 J8KA0LjkrLOiJ7lPKtujApfHeX8UewQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-D_4ab0X8MU-vRZJgh-7Q8w-1; Fri, 07 Jan 2022 02:23:46 -0500
X-MC-Unique: D_4ab0X8MU-vRZJgh-7Q8w-1
Received: by mail-wr1-f72.google.com with SMTP id
 k4-20020adfc704000000b001a32d86a772so1915434wrg.5
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 23:23:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q9676BDKdccMogxRre8rixWMoyOp+zbe9lBHjBXmmOM=;
 b=dCLASyGBC8Ehwvu1YYo5JOvluli37IiqiTPRnvXl9Fp71laDwdjZe3s2wP1LV25u6z
 ta9tmfm7W/eihT7qJi4NUtdgV/CjqLeExnCysjCtWlHQl/EP/5rDbua3MNSBbef3OcPe
 rZvU7zsraAaFRdqN0iTCSeuWBzaepn9PFFvC+JNWVdBq0d17JWkMFEgWi2nm8To5Qxm0
 kdE3qk0t9EpJxfRjowQjAFQx1WKQKU8qA+Rm8eciwjdWAO9Dhypixs5qosO1WHZETQB5
 4euCl7yjgvXabQQQgh0PzObVQmUS9baJLixOWu8y8ICDdDsTgpPzRlgyeTFoKq6V1QhG
 J0Ug==
X-Gm-Message-State: AOAM531Qb1jpkw1PecOUYijJ+JY/qVvODGizvzUN33rb2ymjUcBEMlDC
 gdeHKBcaof1EJwUWywookdldVmN/AR/eW1QmP4awbVLcHJNjeZhjf03p/0PKneyX20ux0MKcq9p
 JT/UDtHaqet2jLHQ=
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr9937487wmc.149.1641540225835; 
 Thu, 06 Jan 2022 23:23:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLk+q2VK5yrelC99o2ejsrQ5SzN619r748ZyNX5AQpeBLXOSP9o3vWq2xA/NArH7upL3maWQ==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr9937476wmc.149.1641540225673; 
 Thu, 06 Jan 2022 23:23:45 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id m6sm4866075wrp.34.2022.01.06.23.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 23:23:45 -0800 (PST)
Message-ID: <d086db31-a64c-40d3-3a2d-bd5d6a7ef5bb@redhat.com>
Date: Fri, 7 Jan 2022 08:23:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] q800: fix segfault with invalid MacROM
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220106122247.771454-1-laurent@vivier.eu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220106122247.771454-1-laurent@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.691, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/01/2022 13.22, Laurent Vivier wrote:
> "qemu-system-m68k -M q800 -bios /dev/null" crahses with a segfault
> in q800_init().
> This happens because the code doesn't check that rom_ptr() returned
> a non-NULL pointer .
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/756
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   hw/m68k/q800.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index e4c7c9b88ad0..6261716c8f7e 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -672,10 +672,16 @@ static void q800_init(MachineState *machine)
>   
>           /* Remove qtest_enabled() check once firmware files are in the tree */
>           if (!qtest_enabled()) {
> -            if (bios_size < 0 || bios_size > MACROM_SIZE) {
> +            if (bios_size == -1) {
>                   error_report("could not load MacROM '%s'", bios_name);
>                   exit(1);
>               }
> +            if (bios_size != MACROM_SIZE) {
> +                error_report("Invalid size for MacROM '%s': %d bytes,"
> +                             " expected %d bytes", bios_name, bios_size,
> +                             MACROM_SIZE);
> +                exit(1);
> +            }
>   
>               ptr = rom_ptr(MACROM_ADDR, MACROM_SIZE);
>               stl_phys(cs->as, 0, ldl_p(ptr));    /* reset initial SP */

Reviewed-by: Thomas Huth <thuth@redhat.com>


