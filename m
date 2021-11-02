Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7F6442E66
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:46:00 +0100 (CET)
Received: from localhost ([::1]:57418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtAt-00039T-Rk
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhsQh-0003sT-6N
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:58:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhsQf-0001p0-Ev
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:58:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635854292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xUxWa7yerhIztGIgQsTUPJplMIG89bQw7RBNzde83UA=;
 b=iWZuqeSUzUY/inWMyBGgwYmwIzMllgqCuumrp9NRexFVpq2PMuhXyIToF4q8DrQc8XRrkF
 jjERUtJp99Z+qZcdbjtV1kYro7HzWB5NC+TlQA/KzaHahof6OVrxvX1JGczltiojFAlvdc
 1FHTzGRaW6AF79yHS5qExQzEYGGKNSk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-jT3ml1FCPBq6tHkLF8NfAQ-1; Tue, 02 Nov 2021 07:58:09 -0400
X-MC-Unique: jT3ml1FCPBq6tHkLF8NfAQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m1-20020a1ca301000000b003231d5b3c4cso1019280wme.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xUxWa7yerhIztGIgQsTUPJplMIG89bQw7RBNzde83UA=;
 b=DBnYFs+adsrhE2RMGLkIMWuI5j+cMLocCx1NMW9u6bgFiwr7s/ra5CZRqSbsq24poE
 TLQf8B5VwwOQ81eiE+JwjsQQY2LEmyrEv8FE28bTvCTboEgjW48x3DdHnMcoezjZQbLc
 RRxmi6fvv0M9RwM4oG8YU4BU30uqBDCjtu8ZDpJ9K1i18BpA0IMwfNw9HIwY/bbrbBKw
 TBLJwCi+Xsid4PeMTsruDCp2f773gdcaaJZjSaiKYUIms7vtGEjU2bnX/C9JEeqNwr/s
 GKlSobkpdbM0sCdT4pPT7sHYDUE+5ZWNFkWuWhpyxsNC8UGMLsmqqVh2QUeiuLYvBor/
 /XPw==
X-Gm-Message-State: AOAM532KEUPAVBULSJssu40lktwF6TppDNGLiyAEWmKjOIVB7QKWOaaH
 cNvrU2RvJYiV/fEt/8LXMPxCNQ8brpymPUhxAvEzANEUD49QzY8thE7oPW5PJY+32mC4Y26gdBW
 pcAYBCH97sxjYK6c=
X-Received: by 2002:a05:600c:1d01:: with SMTP id
 l1mr6570550wms.44.1635854288402; 
 Tue, 02 Nov 2021 04:58:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0Yd0V9f945c16bls4P6ajmEUN/OQA5Vxc8vaOeUgaZapK3stxuiHaaLuSphYDehGFoPiWKg==
X-Received: by 2002:a05:600c:1d01:: with SMTP id
 l1mr6570517wms.44.1635854288172; 
 Tue, 02 Nov 2021 04:58:08 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r1sm2609193wmr.36.2021.11.02.04.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 04:58:07 -0700 (PDT)
Message-ID: <33772fc0-01e6-46e8-f600-8d4d3e242714@redhat.com>
Date: Tue, 2 Nov 2021 12:58:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/5] hw/core: Remove uses of obsolete QERR_ definitions
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20211029230147.2465055-1-philmd@redhat.com>
 <dd5b1f66-e06d-bfb3-9927-1f8a59255769@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <dd5b1f66-e06d-bfb3-9927-1f8a59255769@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 10:51, Damien Hedde wrote:
> On 10/30/21 01:01, Philippe Mathieu-Daudé wrote:
>> QERR_ definitions are obsolete since 2015... Remove their
>> uses in hw/core/.
>>
>> Philippe Mathieu-Daudé (5):
>>    hw/core: Remove use of QERR_UNSUPPORTED
>>    hw/core: Remove use of QERR_FEATURE_DISABLED
>>    hw/core: Remove uses of QERR_DEVICE_NO_HOTPLUG
>>    hw/core: Remove uses of QERR_PROPERTY_VALUE_BAD
>>    hw/core: Remove uses of QERR_INVALID_PARAMETER_VALUE
>>
>>   include/qapi/qmp/qerror.h        | 6 ------
>>   hw/core/machine-qmp-cmds.c       | 3 ++-
>>   hw/core/nmi.c                    | 2 +-
>>   hw/core/qdev-properties-system.c | 2 +-
>>   hw/core/qdev-properties.c        | 2 +-
>>   hw/core/qdev.c                   | 3 ++-
>>   monitor/misc.c                   | 3 +--
>>   softmmu/cpus.c                   | 3 +--
>>   softmmu/qdev-monitor.c           | 9 ++++-----
>>   target/i386/cpu.c                | 2 +-
>>   10 files changed, 14 insertions(+), 21 deletions(-)
>>
> 
> Hi Philippe,
> 
> In my patches you just pulled (patch 9). There is a new
> QERR_INVALID_PARAMETER_VALUE in qdev-monitor.c. Maybe it is worth
> fixing it as well.

I didn't want to delay your series and miss the soft freeze for this
cleanup, so I decided to let it go and get it merged after the
release, eventually via QAPI or qemu-trivial tree.

> anyway
> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

Thanks :)


