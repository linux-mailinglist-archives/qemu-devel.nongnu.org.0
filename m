Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0896F45A410
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 14:44:46 +0100 (CET)
Received: from localhost ([::1]:54066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpW6G-0008WQ-Ai
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 08:44:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mpW3v-000708-GQ
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:42:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mpW3s-0003hN-0Q
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637674934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/uDMv58ZkoNzkQqF3xkKPqzX6sUz4aetdX1BYFdHnsI=;
 b=VOTDVQAou/EPoDcpvnGq29WDYB1PiSXTmhTXECwoiTtE2ieKxbjy+tKCq5IBx+q0k7pulp
 0xIKGbWbjZIKb/gC6udRAqq6wdIll3X8edO3jjEubwnfeWbCstxp4/CNHOaESbxF6tS4Fq
 AgtrvwJ0AfcpYaBpDmhpvMQFF6Ehqos=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-XBp0ydwAPNCK7qn2F-p0RA-1; Tue, 23 Nov 2021 08:42:13 -0500
X-MC-Unique: XBp0ydwAPNCK7qn2F-p0RA-1
Received: by mail-wm1-f70.google.com with SMTP id
 y141-20020a1c7d93000000b0033c2ae3583fso1087349wmc.5
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 05:42:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/uDMv58ZkoNzkQqF3xkKPqzX6sUz4aetdX1BYFdHnsI=;
 b=qCsDdq/Snwlk3a1QUmZIl77BXYqRPm2TMeaX0KQf9BXBUbFIAbLHryNAzB/ypEyNax
 Qo4nFyuzLRQszCa/C67Ii//2TDn4DVLHdZF+mxTnzib+baUNOywdJAc2U3B1HFuaJIDz
 lg/Vb7miI8u+5R70TNxQuGQQi7fTXMmOK1DWjgOqRxHGS0oiL/dS05g/CYamOAm1zhvu
 kHmR/5t651qH/lWnwS5vDCPKGg45q/U+za+oN853pWL/war9oJT1y62xUxh1Tk67lI1w
 UyVCpcVSLh2SmcH74YLpfaGQ5O3rxXupom3Kmg/+yPFrWEG+SeMja69Rln8ZethANhaJ
 wKFw==
X-Gm-Message-State: AOAM5325yL6flElIiWFUOwLLZBMoFU0YD/8IJ7RnK2EwovrG2F1yG/VP
 QKcdhch9VItZPBA2QUJySwQF7fFjIh/XP/+th5ciddWmSKHVtcetmbgzIpWLSr7QYMp3Akh5ks8
 9DoXC4TWXh7s+9QA=
X-Received: by 2002:a05:600c:a05:: with SMTP id
 z5mr3215028wmp.73.1637674932249; 
 Tue, 23 Nov 2021 05:42:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwz9vkMqU+OXbJ1UOES6AwV9YSZibzNi/QEUWH9XzisIc/BX2tohTnG4lUJTmFkZC577LJdHw==
X-Received: by 2002:a05:600c:a05:: with SMTP id
 z5mr3214980wmp.73.1637674931990; 
 Tue, 23 Nov 2021 05:42:11 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id v15sm11974975wro.35.2021.11.23.05.42.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 05:42:11 -0800 (PST)
Message-ID: <1cca5391-18e9-8e29-9c8b-0d44010cdecd@redhat.com>
Date: Tue, 23 Nov 2021 14:42:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-6.2 v3 2/2] tests/qtest/fdc-test: Add a regression
 test for CVE-2021-20196
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211118120635.4043197-1-philmd@redhat.com>
 <20211118120635.4043197-3-philmd@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211118120635.4043197-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.515, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, Darren Kenny <darren.kenny@oracle.com>,
 Markus Armbruster <armbru@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.11.21 13:06, Philippe Mathieu-Daudé wrote:
> From: Alexander Bulekov <alxndr@bu.edu>
>
> Without the previous commit, when running 'make check-qtest-i386'
> with QEMU configured with '--enable-sanitizers' we get:
>
>    AddressSanitizer:DEADLYSIGNAL
>    =================================================================
>    ==287878==ERROR: AddressSanitizer: SEGV on unknown address 0x000000000344
>    ==287878==The signal is caused by a WRITE memory access.
>    ==287878==Hint: address points to the zero page.
>        #0 0x564b2e5bac27 in blk_inc_in_flight block/block-backend.c:1346:5
>        #1 0x564b2e5bb228 in blk_pwritev_part block/block-backend.c:1317:5
>        #2 0x564b2e5bcd57 in blk_pwrite block/block-backend.c:1498:11
>        #3 0x564b2ca1cdd3 in fdctrl_write_data hw/block/fdc.c:2221:17
>        #4 0x564b2ca1b2f7 in fdctrl_write hw/block/fdc.c:829:9
>        #5 0x564b2dc49503 in portio_write softmmu/ioport.c:201:9
>
> Add the reproducer for CVE-2021-20196.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> Message-Id: <20210319050906.14875-2-alxndr@bu.edu>
> [PMD: Rebased, use global test_image]
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/qtest/fdc-test.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)

Not sure if I’m doing something wrong, but:

Using the global test_image brings a problem, namely that this test 
fails unconditionally (for me at least...?), with the reason being that 
the global QEMU instance (launched by qtest_start(), quit by 
qtest_end()) still has that image open, so by launching a second 
instance concurrently, I get this:

qemu-system-x86_64: Failed to get "write" lock
Is another process using the image [/tmp/qtest.xV4IxX]?

So either we need to use a different image file, or we need to quit the 
global instance before using it (e.g. putting a qtest_end() at the 
beginning of test_cve_*()), although the latter just seems wrong.

Second, I can’t make this test fail.  When I apply this patch first (to 
master) and run it, I don’t get a SIGSEGV.

Hanna


