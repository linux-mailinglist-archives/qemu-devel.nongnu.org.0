Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CE0490C0F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 17:06:42 +0100 (CET)
Received: from localhost ([::1]:40458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9UWn-0004TP-DW
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 11:06:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9U5q-0007lu-PO
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 10:38:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9U5o-0000en-4w
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 10:38:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642433926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wOusBN6XfQOfHOxleziR5QfImcP1X7Da7CkR+CRdf1o=;
 b=iOjTe+mmWzidd+0CKo6qeTJlkP7CAy32LbyQQUn5AIjZv3hptsrGzpc9GMMmM78FKc3PSe
 Na0BETaXa4Z77MRUuXfFwu+Sk7YW0jvpU4hP/E7q73Z502P3c6ykcpcqHFxEqjV7Q5u6s6
 jS3SsxauFU0AjCxwLvJUJVBLtf4gl1w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-OuAUwQ3SNWSnPCdNSVSuXg-1; Mon, 17 Jan 2022 10:38:40 -0500
X-MC-Unique: OuAUwQ3SNWSnPCdNSVSuXg-1
Received: by mail-wm1-f71.google.com with SMTP id
 n25-20020a05600c3b9900b00348b83fbd0dso134045wms.0
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 07:38:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wOusBN6XfQOfHOxleziR5QfImcP1X7Da7CkR+CRdf1o=;
 b=7wrIuFgHcj3wiwEWUMyevrzqiASoq5GoN2Sr1Ttk/Vr11YQ6NeI9pCKbwYzSRzvOdi
 WTBXaSeuED4JsqWRc+zlJ/ibPq7oPRLEbhnJnsk6d3OmqOslcbwkzzSSkSAw2f0oSz2v
 53LCo77y+Q6OkKk7atXTK15U2t8lANU3Sd1lqFGpAeGm/Jiyn/GG3PA+/GLtugQ1pR/X
 1SgfR5Mq7RHprRRzqEHANmOKEs6SL2d6Qe1KD9PPHt7eIoc4hCsaqdFshKUaUSf4yHIK
 p0RK+BHmKJTgyp70tjNVKVzUJmR/w7MHfetWbJquwk3ZrlnecbLh9di+50AQOuPmdNKE
 +fmg==
X-Gm-Message-State: AOAM530R00CtFgJgLPhjz3r7UCDKk23Fx/xLiJNpNEQ0g2hjac1/5DPI
 Lw2vHZg+P3zA0LuGiRCOh5znG4KDJNxka4xnKiZ86I0ntvLZnSCyR3b1AuALbRWZfaMi9F29x3z
 rguvcI4NFh383yQc=
X-Received: by 2002:a05:600c:364b:: with SMTP id
 y11mr18294648wmq.156.1642433908586; 
 Mon, 17 Jan 2022 07:38:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzobrH/M5S9n0iOAFC2L0Ob4FJaT4FkMiqTq/8tKjyizFX/APce3EwLHrb4nAWo53clG/YK7Q==
X-Received: by 2002:a05:600c:364b:: with SMTP id
 y11mr18294636wmq.156.1642433908407; 
 Mon, 17 Jan 2022 07:38:28 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id o1sm3562904wri.12.2022.01.17.07.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 07:38:27 -0800 (PST)
Message-ID: <9f55cf89-9d58-b1c5-0d97-d0730498b62f@redhat.com>
Date: Mon, 17 Jan 2022 16:38:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 4/9] s390x/pci: enable for load/store intepretation
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
References: <20220114203849.243657-1-mjrosato@linux.ibm.com>
 <20220114203849.243657-5-mjrosato@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220114203849.243657-5-mjrosato@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 schnelle@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, david@redhat.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/01/2022 21.38, Matthew Rosato wrote:
> Use the associated vfio feature ioctl to enable interpretation for devices
> when requested.  As part of this process, we must use the host function
> handle rather than a QEMU-generated one -- this is provided as part of the
> ioctl payload.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-bus.c          | 70 +++++++++++++++++++++++++++++++-
>   hw/s390x/s390-pci-inst.c         | 63 +++++++++++++++++++++++++++-
>   hw/s390x/s390-pci-vfio.c         | 52 ++++++++++++++++++++++++
>   include/hw/s390x/s390-pci-bus.h  |  1 +
>   include/hw/s390x/s390-pci-vfio.h | 15 +++++++
>   5 files changed, 199 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 01b58ebc70..a39ccfee05 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
...
> @@ -1360,6 +1427,7 @@ static Property s390_pci_device_properties[] = {
>       DEFINE_PROP_UINT16("uid", S390PCIBusDevice, uid, UID_UNDEFINED),
>       DEFINE_PROP_S390_PCI_FID("fid", S390PCIBusDevice, fid),
>       DEFINE_PROP_STRING("target", S390PCIBusDevice, target),
> +    DEFINE_PROP_BOOL("interp", S390PCIBusDevice, interp, true),
>       DEFINE_PROP_END_OF_LIST(),
>   };

Since this is something that the user can see, would it maybe make sense to 
provide a full word instead of an abbreviation here? I.e. "interpret" or 
"interpretation" instead of "interp" ?

  Thomas


