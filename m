Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B9947BF3C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 13:01:21 +0100 (CET)
Received: from localhost ([::1]:33250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzdpX-0001hG-Rp
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 07:01:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzdnZ-0000ZO-Rc
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:59:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzdnW-0003t5-PQ
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:59:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640087951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFSQ125wrOqCH5qFqS/ylAI+rpS/b8ljEQg4CHyzYps=;
 b=Db1N+J/KrDPY4xVw5ZHYzswYuC8USLlTBy/6qs/Lb3PCRJoc4irs4v3BPJfBWCOCz2TZAa
 zmkxg7GfJ/tAkel2szszCKWLQidAp4Xe4pVhHeNdWf8TkHILxKwcqH5efGW0bTPYzJ0C+v
 DuTo9veND3mVGMFKgaeepEqNDxUqR6I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-Z6KDM_-fNOyItL53EzCpjg-1; Tue, 21 Dec 2021 06:59:08 -0500
X-MC-Unique: Z6KDM_-fNOyItL53EzCpjg-1
Received: by mail-wm1-f69.google.com with SMTP id
 205-20020a1c00d6000000b003335d1384f1so1181064wma.3
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 03:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DFSQ125wrOqCH5qFqS/ylAI+rpS/b8ljEQg4CHyzYps=;
 b=SF2FME859byN9gkcK8R8oQPLQtm3ItIn/I52ZqkgH33lrrnjmPBEqP/fETbydJfyR0
 toFuQnVpJG7GhiUfoqT281F/zZ799qWgMNXZm0SubdPUyvHTLPST0esq65wU+3O4qDWW
 2owYKmGv8mSo05PhgdluQj7aaC0T1dy8HPC9y++NHiKOtogza8Icyq4AkkrnLKX3f/Vi
 2LsvFR850bf+52wJsy9N8LwkJFDmAoYzySo+/50URIrTMuyPTbXO07Sd8oF+wSyC3g2T
 7cCm5vDJY+h8euZCsXLv+P6HKhi723Eckho36vqtq2ufLdBDMa5Ly9NDyuyII29pNm4b
 dqsQ==
X-Gm-Message-State: AOAM533I3fv8/D+TlacXbNlp7vXWIuWJRe22yQH0RAtgmmPgjr6SfypY
 RQK0vs1f1th841tYO5uZaUOynvRQkmeSvIiULx81aY0y46ceB97vqaDUOPcuiBOerBWcHtL89vq
 nJNtxARG9ZW3QNMg=
X-Received: by 2002:a05:600c:4e15:: with SMTP id
 b21mr2449404wmq.91.1640087947116; 
 Tue, 21 Dec 2021 03:59:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbXFCOfBt1H4vvJsUbqZ755Mzg8Eu3hliargeYatf7PfmVhfumoQtUYovYrHBGKKhBR8pv/g==
X-Received: by 2002:a05:600c:4e15:: with SMTP id
 b21mr2449391wmq.91.1640087946881; 
 Tue, 21 Dec 2021 03:59:06 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id d13sm13394283wru.41.2021.12.21.03.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 03:59:06 -0800 (PST)
Message-ID: <0f468714-96bd-1e5a-0e40-b7fd5f920964@redhat.com>
Date: Tue, 21 Dec 2021 12:59:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: QOM
To: abhijeet inamdar <abhijeetinamdar3005@gmail.com>,
 qemu-discuss <qemu-discuss@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
References: <CAP4GjT2fC_bTkoNd=21MrdoC1hKk_jejDBdc8KiNvr86aOyAwA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <CAP4GjT2fC_bTkoNd=21MrdoC1hKk_jejDBdc8KiNvr86aOyAwA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Abhijeet,

On 12/21/21 12:27, abhijeet inamdar wrote:
> Hi,
> 
> 1)What does QOM stand for?

QOM: "QEMU Object Model"

See https://qemu-project.gitlab.io/qemu/devel/qom.html

> 2)Can anyone tell what this error means? 
> 
> (qemu) Unexpected error in object_property_find() at
> /home/ocp/vcpu-playground/vcpu_on_qemu/qemu-4.2.0/qom/object.c:1177:
> qemu-system-arm: Property '.sysbus-irq[0]' not found
> Aborted (core dumped).

I suppose you are trying to connect a device gpio/irq output line
to another device input, likely using sysbus_connect_irq().

The API is "connect the N-th output line from the SysBus device
to this qemu_irq handler", where qemu_irq is the input line.

Apparently your SysBus device doesn't have any output line
registered. These are registered using sysbus_init_irq().
The first call register the first output IRQ, and so on.

Some objects have their QOM interface documented, for
example to use the ARM GIC see:
https://gitlab.com/qemu-project/qemu/-/blob/master/include/hw/intc/arm_gic.h#L22

Hope that helps.

Regards,

Phil.


