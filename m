Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178DC3388C8
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:37:20 +0100 (CET)
Received: from localhost ([::1]:41400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKeER-00032J-5s
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKeAN-0008Hm-NN
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:33:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKeAJ-00024z-KP
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:33:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615541582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2iKoSW/91e6gyB8JMKTi1bVP3eHM2tXuuiokfPxufVQ=;
 b=LqC20B0LDlcIwm7RKRfD4WlZ5X5sqnTtAMVq6NBaUL+mmjjwjgwB4wl59MU3gQlCFrWp1N
 ftqDNU9U0v1e8rlqu+kUQ1EzEbwLghBsLfw0WN4FW1FPSz6I4j+Xsn14bVczB3+3Jbun6t
 5jtV937U8/A/c2ubb7wMKFmJBjXN02k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-LDyd8n26PIGK42kjCakKBw-1; Fri, 12 Mar 2021 04:32:58 -0500
X-MC-Unique: LDyd8n26PIGK42kjCakKBw-1
Received: by mail-wr1-f72.google.com with SMTP id e13so10886181wrg.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 01:32:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2iKoSW/91e6gyB8JMKTi1bVP3eHM2tXuuiokfPxufVQ=;
 b=SXt4ecb8juCcSbeRJ7ttYs4D0JBCpJhOmw9AAZzYWYdVZ+mpY2eCdPC4rhh3ApRed3
 cf+K5meVX3AfWuD8EhfnaG0CRCWt+sApn3FdAm0W1HZoMKglDT5qE3Cv5Gq+HIiSEwIG
 lMHCuFs3Z0idiqxGgHm8SX3Ya1KkIN641LO0j7bdnwJbFGcGpk8Ra7889jo5diD/5dtR
 66FsR39uDuqIczPfvXvzz1EKVLb+Sef2A4ot4tEN0AjFL6xzmMinifBrv2OKRv/ym2SA
 6WH6TVM8XKH0m2ju5TFTHRaQZyzKUgwj7xDOG9FRbtPcrIldFrGZgx0pvpX2RdtDtLyz
 FZ3g==
X-Gm-Message-State: AOAM530kOq+wlGyQWC39uwJ3icQfVPigEfWj95TiLtdYaOCOdjX/hXfr
 okaGduVbyyqPBC8jFxnVPCnpQ5qrAYFb3K3U8ine8u6n9xbLI4eyL0axBTv5kNd9XsbkArVVSMS
 E4Syc15pfInVbgbI=
X-Received: by 2002:a05:600c:47d7:: with SMTP id
 l23mr12399699wmo.155.1615541577633; 
 Fri, 12 Mar 2021 01:32:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxd7vdLSzqCeHoJ6FmcMGqClPxTFwOaOCR5TME6v6EgVjN8SWaII7NlRIoA+fZINCm0pXQ+tw==
X-Received: by 2002:a05:600c:47d7:: with SMTP id
 l23mr12399683wmo.155.1615541577447; 
 Fri, 12 Mar 2021 01:32:57 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s20sm1493860wmj.36.2021.03.12.01.32.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 01:32:57 -0800 (PST)
Subject: Re: [PATCH 4/6] qtest/arm-cpu-features: Check KVM availability at
 runtime
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-5-philmd@redhat.com>
 <4c8f9841-1fda-db4f-57fd-bf764f3a0962@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <414c6e5f-2a7b-1c4d-46b7-53aadf592dfc@redhat.com>
Date: Fri, 12 Mar 2021 10:32:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <4c8f9841-1fda-db4f-57fd-bf764f3a0962@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 10:05 AM, Paolo Bonzini wrote:
> On 12/03/21 00:12, Philippe Mathieu-Daudé wrote:
>> -#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel
>> tcg "
>> +#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
> 
> Wouldn't qtest_init simply fail here if KVM is not available?

I guess my previous approach was what you suggested.
The previous patch (bios-tables-test) is a better example:

  g_autofree char *args = NULL;

  args = test_acpi_create_args(data, params, use_uefi);
  data->qts = qtest_init_for_accel(args, "tcg");
  if (data->tcg_only && !data->qts) {
     g_test_skip("TCG not available, skipping test");
     return;
  } else {
     // check data->qts or the following will abort
  }

Having qtest_init_for_accel() calling qtest_quit(),
but this makes the tests logic more complex IMO...

Is that what you have in mind?


