Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1FD489409
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 09:47:05 +0100 (CET)
Received: from localhost ([::1]:60752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6qKV-000116-J9
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 03:47:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qHY-0007hY-Aj
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:44:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qHV-000606-QK
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:43:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641804237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J9yP53f9Z1NdDU5rDSA2jZVl/xEXKKwnNxYJyXJ50tY=;
 b=C6P2xoJ8AYNmA1CMmGvhQ9owc5N32zgDdjGH6ZU0L574cF54JqI3/clzn1fGaxaWOfuLfW
 HqlcR1SYe2+hlKVw7PjoahUPnuSdumV6hJ8bhLKU6dgfNFtnYKrVOXwZPcCa8vlb2NVpU4
 Cmlnvh9ZOLdCZVbf/U0KfNoU2Sa5BFI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-woYwVCOpPVm3Akf-LHXojA-1; Mon, 10 Jan 2022 03:43:54 -0500
X-MC-Unique: woYwVCOpPVm3Akf-LHXojA-1
Received: by mail-ed1-f70.google.com with SMTP id
 z3-20020a05640240c300b003f9154816ffso9469537edb.9
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 00:43:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=J9yP53f9Z1NdDU5rDSA2jZVl/xEXKKwnNxYJyXJ50tY=;
 b=mSUc72C3TFwXSY1reaqbXCbALDw4uQs9/YqRcezPqQjpOjGphhS4K9NGHbBlSwk2Yv
 KSaWPVSVG3olODJYKDnHX14VxvAXchJCVG0YfekdEiZC1Oi4P53Y0zNFpRp+x+WMVe5V
 B52yz2BXSf12O2pRAZv4hWIuS/nnh/KJBCo63Ru2Li2fgKDYSLKu4DmYpcFJrYMjyj/q
 1YIJF42XSiIzWPkUZuC8FtF2N0ccVvZphGSf+BL6Tb7nhXuxxxwqUEI69lBAVRPjldHV
 UwzlPgS6HENqZsx6I6qVmDs9VwAivzNfujU17Zy51JcK7wxeUY5IPTdrazU3NG1CgtO1
 QtmQ==
X-Gm-Message-State: AOAM530T99Vj2ywChF11SUCT3LoCAlGH9gx5ByWWUF61gMGHFjZqR9Py
 6bORYEHYDgNVR0xsAoOKAP1+BvARJB9FrqaB13NyBRnsrCBOe2hLIEFHdhp96wqFO7MQthAGHNc
 gLy44pHp5/rWAB1Y=
X-Received: by 2002:a05:6402:154a:: with SMTP id
 p10mr11603102edx.20.1641804233259; 
 Mon, 10 Jan 2022 00:43:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHyJpiQSH0ljFvM8gV278DGhieFhG41LcVv0a0eSKYMgdxfyJOjxeqGHyqfKMD+MfmlgNNmw==
X-Received: by 2002:a05:6402:154a:: with SMTP id
 p10mr11603071edx.20.1641804232951; 
 Mon, 10 Jan 2022 00:43:52 -0800 (PST)
Received: from ?IPV6:2003:cb:c701:cf00:ac25:f2e3:db05:65c3?
 (p200300cbc701cf00ac25f2e3db0565c3.dip0.t-ipconnect.de.
 [2003:cb:c701:cf00:ac25:f2e3:db05:65c3])
 by smtp.gmail.com with ESMTPSA id ku25sm1329257ejc.108.2022.01.10.00.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:43:52 -0800 (PST)
Message-ID: <eb2290fd-23a5-ea1b-3692-9954db000981@redhat.com>
Date: Mon, 10 Jan 2022 09:43:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/9] hw/pci: Restrict pci-bus stub to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220104085431.2122999-1-f4bug@amsat.org>
 <20220104085431.2122999-3-f4bug@amsat.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220104085431.2122999-3-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.01.22 09:54, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Neither tools nor user-mode emulation require the PCI bus stub.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  stubs/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/stubs/meson.build b/stubs/meson.build
> index 363f6fa785d..d359cbe1ad7 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -26,7 +26,6 @@
>  stub_ss.add(files('module-opts.c'))
>  stub_ss.add(files('monitor.c'))
>  stub_ss.add(files('monitor-core.c'))
> -stub_ss.add(files('pci-bus.c'))
>  stub_ss.add(files('qemu-timer-notify-cb.c'))
>  stub_ss.add(files('qmp_memory_device.c'))
>  stub_ss.add(files('qmp-command-available.c'))
> @@ -51,6 +50,7 @@
>  endif
>  if have_system
>    stub_ss.add(files('fw_cfg.c'))
> +  stub_ss.add(files('pci-bus.c'))
>    stub_ss.add(files('semihost.c'))
>    stub_ss.add(files('usb-dev-stub.c'))
>    stub_ss.add(files('xen-hw-stub.c'))

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


