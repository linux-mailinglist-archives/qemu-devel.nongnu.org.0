Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3635346D192
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 12:06:37 +0100 (CET)
Received: from localhost ([::1]:39826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muumR-0002pQ-FM
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 06:06:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muuky-00020O-3n
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 06:05:04 -0500
Received: from usb-smtp-delivery-124.mimecast.com ([170.10.151.124]:53988
 helo=us-smtp-delivery-124.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muukv-0000Ed-IP
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 06:05:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638961500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZbO0LnRrqLmc+0f803IugxgNgvQhh8eWZ/uaUGTo8o=;
 b=gzcWvTE+nPvd6ny1N1MYn/YI78BkvgpBFJKYkzQIxNOvIXEWTCiExXTdgAaqPS2pIE2RHC
 g2rU+TnnGycHHWD/EiWwEuYw/aWdevXujMADZjkXc5VVEoZW/bvHl/RMHzPq1wVOnycJNW
 SVd08k3PiXfnCWgx8BGLhxs1NcPNwlk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-TQjgCUzSNJaMmD_Xj67lsQ-1; Wed, 08 Dec 2021 06:04:59 -0500
X-MC-Unique: TQjgCUzSNJaMmD_Xj67lsQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 e14-20020a05622a110e00b002b0681d127eso2867303qty.15
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 03:04:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UZbO0LnRrqLmc+0f803IugxgNgvQhh8eWZ/uaUGTo8o=;
 b=qf/6X265XXHIcTi+tu0TjurrtnOQLrf9kaMQ9evZc1X/MQgGCoTpYkOIqwSMe5jIQy
 TQB48dSgCjoINU9h1ohKntgD2i2Ut1Q25X4E4BD1bikXqPlJpkgKAM4lGwjYAgAJ7xOe
 Qy+4NLc+EJlM5OQ7+lYhscxhs6S5k8Vu04VnmeUVeE3+xn3KoTPmz1rumxE6cI0AQrOh
 jXlc1FTZ3Mt1Bk9u3R3/Gxn+OM95bew2ZqsIMK4ZvCdUGKz8rr7uXiSMuPUqoER8GhaK
 bIL3e4uMj32lGGSICuPjojQsR5k8hGa/VaZ4XdKPHsEYSqqZMsFTCyhfF7eylVlZCzPl
 h/Rw==
X-Gm-Message-State: AOAM532MzahTcnV/rAbg5hKX70nA4hk/a5bfyzgt0WQGy0j7cf7g/Nok
 9N7I/265wYNcE6c/DqpbgOIKGY7sn1PjFc12J1ddBgoCMJvWN1MQQk2tJ8JrYDuSkaY3uoOC8hm
 GbgqfEKuPWTh2dgk=
X-Received: by 2002:ac8:5f4b:: with SMTP id y11mr6777504qta.489.1638961498874; 
 Wed, 08 Dec 2021 03:04:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgN0rWSvHKVHCI5PSeWvItw9tW3kzgnEh9zvBsDacWuW8j8anEVDgJ2qQvafxqnL1SqBttdg==
X-Received: by 2002:ac8:5f4b:: with SMTP id y11mr6777472qta.489.1638961498663; 
 Wed, 08 Dec 2021 03:04:58 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id f34sm1642977qtb.7.2021.12.08.03.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 03:04:58 -0800 (PST)
Message-ID: <acf34693-3097-6734-b2d6-e64817f26b1d@redhat.com>
Date: Wed, 8 Dec 2021 12:04:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 08/12] s390x/pci: don't fence interpreted devices without
 MSI-X
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
References: <20211207210425.150923-1-mjrosato@linux.ibm.com>
 <20211207210425.150923-9-mjrosato@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211207210425.150923-9-mjrosato@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.151.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 schnelle@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, david@redhat.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/12/2021 22.04, Matthew Rosato wrote:
> Lack of MSI-X support is not an issue for interpreted passthrough
> devices, so let's let these in.  This will allow, for example, ISM
> devices to be passed through -- but only when interpretation is
> available and being used.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-bus.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 451bd32d92..503326210a 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -1096,7 +1096,7 @@ static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>               pbdev->interp = false;
>           }
>   
> -        if (s390_pci_msix_init(pbdev)) {
> +        if (s390_pci_msix_init(pbdev) && !pbdev->interp) {
>               error_setg(errp, "MSI-X support is mandatory "
>                          "in the S390 architecture");
>               return;
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


