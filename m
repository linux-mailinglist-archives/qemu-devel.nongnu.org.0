Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAFB5B4FD8
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 18:05:51 +0200 (CEST)
Received: from localhost ([::1]:38008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXPSw-00024q-Em
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 12:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oXPPi-0006bh-U3
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 12:02:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oXPPf-0000ho-UI
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 12:02:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662912145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kWdYHi0/TYsCnaYbaBhdu5xrU49KOBkcsd8oowdo3fY=;
 b=MuYI60Qh5IYEInscRsBwjeEbATD7beqys1G4OkB4LfpiLHR8IrejsIaguDO2m4JvKirMuE
 8rPc9DzAO/RKygZF6q0+Yp4fx0lcf1MBbw7jeOk/1o3hOS/Nz6MgxrmFR+8sDBsxLkjnAn
 T6SmCFKfUmjtExzS+rxq2MYoLaCiPK4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-156-KOBNuiZfPWSWSrdDpLic1w-1; Sun, 11 Sep 2022 12:02:23 -0400
X-MC-Unique: KOBNuiZfPWSWSrdDpLic1w-1
Received: by mail-wm1-f72.google.com with SMTP id
 j19-20020a05600c1c1300b003ab73e4c45dso5900643wms.0
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 09:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=kWdYHi0/TYsCnaYbaBhdu5xrU49KOBkcsd8oowdo3fY=;
 b=D58vm1sU3gFdrdVWo39YB5pWMJlxCBuNfS3JQaMzJV7GcCjZnPv+orDSMRBOMv+Sx8
 NVhJygpEkVSzsQvbEuueAl3hkbk+9Yht703eiO+mkYHuvIrPnHZpTpEnQRrFGjN91fIQ
 L795t9e2B4acLyEbmSrIXEBTrKKnOu+WyhOzB/NBA1Ek70y3ra2/QQEcQRSszwESCCpn
 2CTL+A+EEq5sNSDq4isgxzLBELBh5/BEuVlcFO9IP8XJChKjvlUl5gAb+NZAmT5xRcPU
 AL+Y7y0c8bZP09/PmaiOZEUJ0mPTTMyDE/vEdhGTSMZHfrBCAwZJE1IRySgt6c5pEBQi
 grRQ==
X-Gm-Message-State: ACgBeo2rBgPPJxZP/U1o6ejjGIncgYJH/k0Dj5cqZxBNluJaP0zOPkIW
 3q+Bq3qCG/+TSQM1TEePKGD6AyPGvB+83ORIGahjoGCcSFcjQ5hznJ49SAe7r595sDGgsURrDEM
 QL36eyDhXRw5pQV0=
X-Received: by 2002:a05:600c:1e13:b0:3b4:74c3:620b with SMTP id
 ay19-20020a05600c1e1300b003b474c3620bmr4290820wmb.168.1662912142407; 
 Sun, 11 Sep 2022 09:02:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6GDpRI158toabifv2YS9B8hCOJ8cUZX5/YU0nLKbsU71KbcKZRRdpHGPBeTzwzOsM3Z5XkCg==
X-Received: by 2002:a05:600c:1e13:b0:3b4:74c3:620b with SMTP id
 ay19-20020a05600c1e1300b003b474c3620bmr4290798wmb.168.1662912142189; 
 Sun, 11 Sep 2022 09:02:22 -0700 (PDT)
Received: from [10.134.72.224]
 (host86-187-239-252.range86-187.btcentralplus.com. [86.187.239.252])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a05600c1c9000b003b47b913901sm3637108wms.1.2022.09.11.09.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Sep 2022 09:02:21 -0700 (PDT)
Message-ID: <a1430a34-9a02-327f-e84a-05dbbb51692e@redhat.com>
Date: Sun, 11 Sep 2022 17:02:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/8] tests: Make all tests that use q35 depend on it being
 compiled in
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Gerd Hoffmann <kraxel@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20220902173452.1904-1-quintela@redhat.com>
 <20220902173452.1904-7-quintela@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220902173452.1904-7-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.101, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 02/09/2022 19.34, Juan Quintela wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   tests/qtest/meson.build | 27 +++++++++++++++++----------
>   1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index e910cb32ca..67b3b678d3 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -51,13 +51,16 @@ qtests_i386 = \
>     (config_all_devices.has_key('CONFIG_WDT_IB700') ? ['wdt_ib700-test'] : []) +              \
>     (config_all_devices.has_key('CONFIG_PVPANIC_ISA') ? ['pvpanic-test'] : []) +              \
>     (config_all_devices.has_key('CONFIG_PVPANIC_PCI') ? ['pvpanic-pci-test'] : []) +          \
> -  (config_all_devices.has_key('CONFIG_HDA') ? ['intel-hda-test'] : []) +                    \
> +  (config_all_devices.has_key('CONFIG_HDA') ? ['intel-hda-test'] : []) +		    \

White space damage?

>     (config_all_devices.has_key('CONFIG_I82801B11') ? ['i82801b11-test'] : []) +             \
>     (config_all_devices.has_key('CONFIG_IOH3420') ? ['ioh3420-test'] : []) +                  \
> -  (config_all_devices.has_key('CONFIG_LPC_ICH9') ? ['lpc-ich9-test'] : []) +              \
> -  (config_all_devices.has_key('CONFIG_USB_UHCI') ? ['usb-hcd-uhci-test'] : []) +            \
> +  (config_all_devices.has_key('CONFIG_LPC_ICH9') and
> +   config_all_devices.has_key('CONFIG_Q35') ? ['lpc-ich9-test'] : []) +			    \
> +  (config_all_devices.has_key('CONFIG_USB_UHCI') and
> +   config_all_devices.has_key('CONFIG_Q35') ? ['usb-hcd-uhci-test'] : []) +		    \

Are you sure about the UHCI test? I did not spot any "q35" in 
tests/qtest/usb-hcd-uhci-test.c ...?

  Thomas


