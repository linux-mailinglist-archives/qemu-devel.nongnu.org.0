Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3FC3B1F15
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 18:56:22 +0200 (CEST)
Received: from localhost ([::1]:60150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw6Am-0005At-Uz
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 12:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lw69B-00042g-0C
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 12:54:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lw696-0001rM-S3
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 12:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624467275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tXaeuQZ5m+k4Ka6cghkT5P81QqcmXIh7jTGvyGi3jvE=;
 b=IgvY8BFOaa3hP+gASuoj5I9tHiwQdsJbL1kPvKkEVGszYhFeAWpnPaEGuOFLTV51kZeK9M
 Do9VwMox4AhKiFGciqOi5miAnD7DNUNUD/TnQnW6En9MgJnWn7EMAakehRN9TXhL1CkR71
 YXqCFiUgBUwbmkl1vs55v6HIA/uSOzA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-HvnVL5KuO2uOQvA8Fp_5ow-1; Wed, 23 Jun 2021 12:54:33 -0400
X-MC-Unique: HvnVL5KuO2uOQvA8Fp_5ow-1
Received: by mail-wm1-f72.google.com with SMTP id
 j2-20020a05600c1c02b02901cecbe55d49so250910wms.3
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 09:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tXaeuQZ5m+k4Ka6cghkT5P81QqcmXIh7jTGvyGi3jvE=;
 b=pqrOnYUiZb28HH9IA4zhxndndwrz7/N0KVYAmjjHogBARXFZNeMDq175bY6kyK7q48
 87qjE7+EuksFW/BTKy34Oc3jEjziAEJHaBSNwPnv3cIV22/CSSS170X4SZM7IlLWipUY
 /Nxt97Q02HL10ggWIBiImgoiCMLnnRZtfZUOIlX+LGSTNsjGRtwQ3FNuV4eBJyDMo5LA
 Kpaqw1nYpQeAcYM7m+Vc0DxW9sZFwi6b2KZxAXHevbzFwgqR2ZjY/O8UgRk0we6w2sL4
 B2vp5mhB/renLjwaW7dX3dCEP98xMNrmZjPbpnOjRzGJB9dOD2q8A01EIGxV+5YA0uHy
 bKZw==
X-Gm-Message-State: AOAM5306vXhZOtxEQ7og9+XUHcB6heZOMmtrpJXrX7AXHVDc6G6XRFOD
 dN4EJTRhkIIYvJewWCMa9Gp/eASRETpgPbSScuzRMJnRyXKuO0+EPmXF3VQ1kqYjNPKzInrbeYa
 EyLgs/llWC4Cj13Y=
X-Received: by 2002:a5d:4044:: with SMTP id w4mr1149907wrp.201.1624467272872; 
 Wed, 23 Jun 2021 09:54:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWcbI6h1VGaVybYpWQUBYKYUCXbxxqBnE8HzSLWEZm7DE3LEHX7UcypPVqHU0wGZ/ccV11xQ==
X-Received: by 2002:a5d:4044:: with SMTP id w4mr1149893wrp.201.1624467272700; 
 Wed, 23 Jun 2021 09:54:32 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id b11sm6286094wmj.25.2021.06.23.09.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 09:54:32 -0700 (PDT)
Subject: Re: [PATCH v7 0/6] hw/block/fdc: Allow Kconfig-selecting ISA
 bus/SysBus floppy controllers
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210614193220.2007159-1-philmd@redhat.com>
 <599f64bd-6d47-34a7-14be-b414d65490a1@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0ac75790-cda9-2f5f-75f3-12c5464e7cbb@redhat.com>
Date: Wed, 23 Jun 2021 18:54:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <599f64bd-6d47-34a7-14be-b414d65490a1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/23/21 5:56 PM, John Snow wrote:
> On 6/14/21 3:32 PM, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> The floppy disc controllers pulls in irrelevant devices (sysbus in
>> an ISA-only machine, ISA bus + isa devices on a sysbus-only machine).
>>
>> This series clean that by extracting each device in its own file,
>> adding the corresponding Kconfig symbols: FDC_ISA and FDC_SYSBUS.

> Staged again,
> 
> https://gitlab.com/jsnow/qemu/-/pipelines/326076557
> 
> will send PR as soon as the CI is done.

🤞


