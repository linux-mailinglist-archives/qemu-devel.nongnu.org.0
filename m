Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5145E428E51
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 15:40:52 +0200 (CEST)
Received: from localhost ([::1]:51166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZvXu-0002LN-Ci
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 09:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mZvW8-0000zT-K7
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:39:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mZvW7-0005xi-0a
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:39:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633959538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RazWng8CC3gcu6NmN41BjqsKaqvMehbMwDEYltZ6XlA=;
 b=fLY7o4TJGEcS4cJXsx/7JzP2Sw4zHW+Uxbv68EvutMq2ITny87Px0xSzwZ7YpmbHGwXm57
 dtV2EoIJiTXxkplJyu0sFhOZiaQORCKLMZ6Je7cUq0Fcg0oAz3sx+IJnfswopghWgstypw
 JgXhwsM+FDh/vpfb/ET4HJGYEBIsxiI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-PBPhJvOyPKiNDKJ6BFQ8Rw-1; Mon, 11 Oct 2021 09:38:57 -0400
X-MC-Unique: PBPhJvOyPKiNDKJ6BFQ8Rw-1
Received: by mail-ed1-f72.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so15913410edi.12
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 06:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RazWng8CC3gcu6NmN41BjqsKaqvMehbMwDEYltZ6XlA=;
 b=Xr1h9pqseZpMDTXrut1ehjdAvONiMJ4aF0d7moYjL8JorH0P6ocRBPjMhU8zCf3zzf
 HO2lrAvBymiY1KEs41Gp46RLYFDOOuRXQx1WssiXtNbybg+bXk7qYmyn6DvwftoVGXfD
 p/5dlp3JZJz6vIaSoAJjkxD/06yCYUAuZbPekT+vDivNHW78GGq33tzd83QFJhIVyGyw
 G/mabL9TjCVzqxAZBl78v9a3IcqxF+Z0OC8/ddOnNjhEncy5s6R/D+nzJQxCgrCJUuTA
 zKGa8ucnqv0KxOxAJSBq4WN8Iluy6w3VxvKuLshOYgytk40Gb8MW5EUHWLk/TNn3BqbF
 Uo4w==
X-Gm-Message-State: AOAM531+91FS14XSCv+aUg9JUpBxWZQSUNS130h9Dy4tEvpOK0+xmxM1
 wk5CZuLL38bbQJE5EyBTeRDx/xt3/pdfQ6eepy5a1bWEHJADOJ+0kMUQ613JpAjm6LFvtQEm82I
 oo/ieJnsGWsXWTSA=
X-Received: by 2002:a17:906:5a8d:: with SMTP id
 l13mr26794473ejq.95.1633959536120; 
 Mon, 11 Oct 2021 06:38:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlByCSbBAX1bqQ0OuIaS/TJ+KmhYNPuxCCTBAMUXk5AMF1rxZ6R8Fc4T588S1bwAeN2GqBhA==
X-Received: by 2002:a17:906:5a8d:: with SMTP id
 l13mr26794447ejq.95.1633959535913; 
 Mon, 11 Oct 2021 06:38:55 -0700 (PDT)
Received: from thuth.remote.csb (tmo-097-184.customers.d1-online.com.
 [80.187.97.184])
 by smtp.gmail.com with ESMTPSA id y4sm3522567ejr.101.2021.10.11.06.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 06:38:55 -0700 (PDT)
Subject: Re: [PATCH] s390x/ipl: check kernel command line size
To: Marc Hartmayer <mhartmay@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211006092631.20732-1-mhartmay@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4683659f-1efe-7c1a-070e-21803f5c8100@redhat.com>
Date: Mon, 11 Oct 2021 15:38:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006092631.20732-1-mhartmay@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/10/2021 11.26, Marc Hartmayer wrote:
> Check if the provided kernel command line exceeds the maximum size of the s390x
> Linux kernel command line size, which is 896 bytes.
> 
> Reported-by: Sven Schnelle <svens@linux.ibm.com>
> Signed-off-by: Marc Hartmayer <mhartmay@linux.ibm.com>
> ---
>   hw/s390x/ipl.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
> index 1821c6faeef3..a58ea58cc736 100644
> --- a/hw/s390x/ipl.c
> +++ b/hw/s390x/ipl.c
> @@ -38,6 +38,7 @@
>   #define KERN_IMAGE_START                0x010000UL
>   #define LINUX_MAGIC_ADDR                0x010008UL
>   #define KERN_PARM_AREA                  0x010480UL
> +#define KERN_PARM_AREA_SIZE             0x000380UL
>   #define INITRD_START                    0x800000UL
>   #define INITRD_PARM_START               0x010408UL
>   #define PARMFILE_START                  0x001000UL
> @@ -190,10 +191,19 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
>            * loader) and it won't work. For this case we force it to 0x10000, too.
>            */
>           if (pentry == KERN_IMAGE_START || pentry == 0x800) {
> -            char *parm_area = rom_ptr(KERN_PARM_AREA, strlen(ipl->cmdline) + 1);
> +            size_t cmdline_size = strlen(ipl->cmdline) + 1;
> +            char *parm_area = rom_ptr(KERN_PARM_AREA, cmdline_size);
> +
>               ipl->start_addr = KERN_IMAGE_START;
>               /* Overwrite parameters in the kernel image, which are "rom" */
>               if (parm_area) {
> +                if (cmdline_size > KERN_PARM_AREA_SIZE) {
> +                    error_setg(errp,
> +                               "kernel command line exceeds maximum size: %lu > %lu",

I think the first %lu should be %zd instead?

Apart from that, the patch looks fine to me... so if you agree, I can fix 
that up when picking up the patch.

  Thomas


> +                               cmdline_size, KERN_PARM_AREA_SIZE);
> +                    return;
> +                }
> +
>                   strcpy(parm_area, ipl->cmdline);
>               }
>           } else {
> 


