Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3569147238C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 10:11:32 +0100 (CET)
Received: from localhost ([::1]:34292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwhMo-0005o2-1z
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 04:11:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mwhL5-00051l-Pj
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 04:09:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mwhL3-0005zh-Fl
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 04:09:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639386580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ibmU6NqBXifrpbKVB+k8pLN0Wo1ehy/+rCbzu5bOAU=;
 b=AiS6OSz/T9UceJkaUW74KpNBt5gClDhzkMp8H2JbDOM/gvHUKPgayqWre6kjueiA2R8r3S
 hQMvLPLvoy3zFL9ALYO2OV8SYpgNZF8C3OspblpGyu/xctyndYPtmeKLE31V0nox3x7ZwP
 srtkkuhnShvgGhfQTqAXv1sslDxNt6c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-q86jdpUiPeiSlBg6bSXZ_w-1; Mon, 13 Dec 2021 04:09:39 -0500
X-MC-Unique: q86jdpUiPeiSlBg6bSXZ_w-1
Received: by mail-wr1-f72.google.com with SMTP id
 b1-20020a5d6341000000b001901ddd352eso3663762wrw.7
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 01:09:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+ibmU6NqBXifrpbKVB+k8pLN0Wo1ehy/+rCbzu5bOAU=;
 b=FSrwacUXbAhI5HOAI7V3BFimJqFQ9AhkNZ+dZ6IS7dux+ZQu4hZmBev8PtXCyrXr1f
 Tk2IYTi19ANVre0rJl/tMzUrKgrfz37lyjd9RpnQc+rm3SfiYm0K9+F//g5f2YGNSAoQ
 wFAuFroEKOVUBbrFaY2t5QPUB+iBjzQJ/tq5X8nP3tKLp3Kcx/qO0NvQZfrRuQWKuDY9
 rOnWqhRdLDwzZ6xuKKaGgY0OdqeSn1nucVQFg/ofYVnKNpEmqZAvGRv9CS8QmWLA0x9W
 JrHFSLzpWhYK2E0kcsVNivqWEo7wVGTWAItbiOzwIawtWhfZb/Itauh3C480Qg8yuDph
 aJLg==
X-Gm-Message-State: AOAM530x1GWAaCG0pho0ILMqD7/4IAq1ForDIquaksoaupKi0syKns2W
 NjZVFzpNlFHwNfL9Mx0N0Jy3XCgFE4TkfC97pYQ8rhLMxYSvJmP/HqZlzhWKzbX58Vh02VAF9LK
 5DBLdTfHgtDNeQA0=
X-Received: by 2002:a05:6000:2a4:: with SMTP id
 l4mr30983237wry.238.1639386577969; 
 Mon, 13 Dec 2021 01:09:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFYnNDqNHPF0KP2aJy+n5Q81s3g5Ewe6B7viDLZWqCcUWgwemXD4u9CdJaCHRS4ueU7pyOfg==
X-Received: by 2002:a05:6000:2a4:: with SMTP id
 l4mr30983216wry.238.1639386577793; 
 Mon, 13 Dec 2021 01:09:37 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id h15sm7031110wmq.32.2021.12.13.01.09.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 01:09:37 -0800 (PST)
Message-ID: <417b8a0e-be55-ea6d-a02c-8a2b8ad586c1@redhat.com>
Date: Mon, 13 Dec 2021 10:09:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 0/4] s390x/pci: some small fixes
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20211203142706.427279-1-mjrosato@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211203142706.427279-1-mjrosato@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/12/2021 15.27, Matthew Rosato wrote:
> A collection of small fixes for s390x PCI (not urgent).  The first 3 are
> fixes related to always using the host-provided CLP value when provided
> vs a hard-coded value.  The last patch adds logic for QEMU to report a
> proper DTSM clp response rather than just 0s (guest linux doesn't look
> at this field today).
> 
> Changes for v3:
> - Actually fix patch 4 this time (Pierre)
> 
> Matthew Rosato (4):
>    s390x/pci: use a reserved ID for the default PCI group
>    s390x/pci: don't use hard-coded dma range in reg_ioat
>    s390x/pci: use the passthrough measurement update interval
>    s390x/pci: add supported DT information to clp response
> 
>   hw/s390x/s390-pci-bus.c         |  1 +
>   hw/s390x/s390-pci-inst.c        | 15 +++++++++------
>   hw/s390x/s390-pci-vfio.c        |  1 +
>   include/hw/s390x/s390-pci-bus.h |  3 ++-
>   include/hw/s390x/s390-pci-clp.h |  3 ++-
>   5 files changed, 15 insertions(+), 8 deletions(-)

Thanks, I've queued the patches to my s390x-next branch now:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas


