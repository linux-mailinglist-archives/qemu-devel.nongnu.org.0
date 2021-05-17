Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFA8382B11
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:30:24 +0200 (CEST)
Received: from localhost ([::1]:46036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libS3-0004no-EW
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1liaxY-0003dj-1b
 for qemu-devel@nongnu.org; Mon, 17 May 2021 06:58:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1liaxU-0001pX-VE
 for qemu-devel@nongnu.org; Mon, 17 May 2021 06:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621249128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lNjIA89QTeEsEjYOIrBUNsIb9fLDPAS0lmsFeSxUGuE=;
 b=hyC4iXkAzgGDo4p7LUKUccVk6QU+9ng0+AfEXAVFHT1SGEuXw8W88FI66XDQCE2VgbwYVZ
 Nys2WSHhcKqrLi1183f3AeDI6ifdHQsVCDr2C/DetlPc35Mwd1+Pi5hblU3VTVuSna6v1s
 1bbNH1uyYtkcf6g8Z7D6EqdjRSSgP5s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-hijfy1tsPdOvxdxQ_HKP7w-1; Mon, 17 May 2021 06:58:44 -0400
X-MC-Unique: hijfy1tsPdOvxdxQ_HKP7w-1
Received: by mail-wr1-f72.google.com with SMTP id
 36-20020adf91a70000b029010ec34b3f27so3656823wri.10
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 03:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lNjIA89QTeEsEjYOIrBUNsIb9fLDPAS0lmsFeSxUGuE=;
 b=MmhJ98hP2xodD1hcGnoq+obfiMWEZbtgCn+xzX01ooOrkhPBa/Zan7/zX6j8FdcXkE
 4ExiGE6Y7+noqClDfk4kHOd8ZkpEhRO3yZcW8wHu9ltD6tcRJGPL1z2ECVIEkkuTw6zZ
 cFdp8efDCvhdfYSNb/lfEABrnaMk1LeyapmcNq37cn2OVaZCMHMxxHG7BzqkolEKWGN+
 o4ohFyqgtpr7rSrrCt9PQO+rIUdT5YEo0/q4j9qDKPkPPUHgCewjuIO1WzJhxQHW/p9O
 cClHgWZZRurHSVT9edbVaZ9pV//lH8auKdJMMm2TaTOSWd6QPkTyQvdfcmQ69v3g4sWd
 yLvA==
X-Gm-Message-State: AOAM532eufRgadDljH+CyYaWZO6bvHjlo3oX2Yxdzm1SQCK8JtderTNN
 h3OKpWM7D4bzHYS2dcK4Lx9SMYAc9k/9GfMb5kWQ/EK6RQcIMR80v7rU7zQ7w70zJsiWqxxaTec
 6QA+Ka9NKyBkCxZQ=
X-Received: by 2002:a05:600c:3643:: with SMTP id
 y3mr22496466wmq.159.1621249123344; 
 Mon, 17 May 2021 03:58:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4qvQzqe632RrIuYr/JxsN2c3xP8ULhehAVuKf0daIIpUPPXnOcOS7r62i4CPNqp790kfOcw==
X-Received: by 2002:a05:600c:3643:: with SMTP id
 y3mr22496394wmq.159.1621249123170; 
 Mon, 17 May 2021 03:58:43 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id u9sm14617084wmc.38.2021.05.17.03.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 03:58:42 -0700 (PDT)
Subject: Re: [PULL v9 00/13] Cgs patches
To: David Gibson <david@gibson.dropbear.id.au>, pasic@linux.ibm.com,
 dgilbert@redhat.com, pair@us.ibm.com, qemu-devel@nongnu.org,
 brijesh.singh@amd.com
References: <20210208060538.39276-1-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <814d9c38-1de2-bf4a-ff57-595eb6672562@redhat.com>
Date: Mon, 17 May 2021 12:58:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210208060538.39276-1-david@gibson.dropbear.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, mtosatti@redhat.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 ehabkost@redhat.com, kvm@vger.kernel.org, mst@redhat.com, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, mdroth@linux.vnet.ibm.com,
 Greg Kurz <groug@kaod.org>, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, pragyansri.pathi@intel.com, jun.nakajima@intel.com,
 andi.kleen@intel.com, pbonzini@redhat.com,
 David Hildenbrand <david@redhat.com>, frankja@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

On 2/8/21 7:05 AM, David Gibson wrote:

> ----------------------------------------------------------------
> Generalize memory encryption models
...

>  create mode 100644 backends/confidential-guest-support.c
>  create mode 100644 docs/confidential-guest-support.txt
>  create mode 100644 docs/papr-pef.txt
>  create mode 100644 hw/ppc/pef.c
>  create mode 100644 include/exec/confidential-guest-support.h
>  create mode 100644 include/hw/ppc/pef.h

Could we have an entry in MAINTAINERS for these files?

Thanks,

Phil.


