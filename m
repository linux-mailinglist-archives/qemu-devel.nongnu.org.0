Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB59569756
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 03:20:00 +0200 (CEST)
Received: from localhost ([::1]:52406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9GBT-0003zU-19
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 21:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9GAE-0003Kt-Ea
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 21:18:42 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9GAC-0003K8-VX
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 21:18:42 -0400
Received: by mail-pf1-x429.google.com with SMTP id n12so16369694pfq.0
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 18:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=SQIOeQtn2ZlJnreXFgrXpMPDg+Y+CTxPnbzK2mCRmsc=;
 b=mdceAbzRIkjyU7nuUomb3QDNR1itnSCdXa32ZJG/J8X1OuNneQTzAbSmtYLDkUD0bD
 fs2hXESZyjOeGXPcliQu/Pwcs0JpOTXVuAlQiWtRq66IHVQ+Z9R+eXkhlfqwwfY1mjTg
 LS/La4X2bP+VPw0Of6inqG42IBg7E8/dPMP1nulMcalAsAjUM/bwgdGMwYPUYY/2/TDe
 01e2CqdJGrgT6wQd9zg0M6wPjZVMyYuA7ShFKJnND1azgp2bZrsT+3Hv8CnkauVYlANW
 nT3nlJR2mG7IyH5BWhv+CZEKmPKqgoOEAgGqEmIyGbg3MzuTQGg1pZCPsuHIPyeXXUai
 yYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=SQIOeQtn2ZlJnreXFgrXpMPDg+Y+CTxPnbzK2mCRmsc=;
 b=OqDn7NfQHFGq7V66NGKnUVJqUZLRoBf+hD6ILN2ErxF7YVzaP3T9oI6Lsx1lbWq0/v
 BFXw+biM81ejl09srIrMexae1T3OMcDVQmG025dUTe4ZFzbzxABC1caH5YWtZolEeKZi
 UT4jrqlZF4osmv1EoNcLcX+eK8EEJqwiAmlFZvr8HVMmqrEtLLjq0xjERRt1LQDD4Sme
 Gbfe6FRnuPqahDU99YtpnyJy2RrF3EHsZ7LN1w21ES6OXFD74MFHkg10BwsjuF58LiAu
 TD07E4z7XtC23uyMWlvFvp4rkPhab0GCrVDWhWk+1WyuOkpGpxFG6Zn86Su/K75VNFsr
 RmKQ==
X-Gm-Message-State: AJIora+QM3FZBAAMdG6QU5zutdeN93P9ZKXtWQQ9Vki6Y8HFZOt/Uv5W
 BQZQvzryOaT5Zdk185Gsw6dNkw==
X-Google-Smtp-Source: AGRyM1sGwmYoCUPSRTL7wZWpWqDHUl1ZZTzElYONoneO+Yo5Wd3wwulxRhAcFu4Q/eW70JaWRd69Aw==
X-Received: by 2002:a17:902:ce8f:b0:16b:fbc1:9529 with SMTP id
 f15-20020a170902ce8f00b0016bfbc19529mr8670569plg.159.1657156719048; 
 Wed, 06 Jul 2022 18:18:39 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 w205-20020a627bd6000000b00528c7ac7f27sm190925pfc.81.2022.07.06.18.18.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 18:18:38 -0700 (PDT)
Message-ID: <fc85a25a-2679-b3c0-ad21-04a2a590dc5a@linaro.org>
Date: Thu, 7 Jul 2022 06:48:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
From: Richard Henderson <richard.henderson@linaro.org>
Subject: vhost-user-test failure
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Seen on my ubuntu 22.04 laptop:

  86/591 qemu:qtest+qtest-i386 / qtest-i386/qos-test                               ERROR 
        10.74s   killed by signal 6 SIGABRT



# child process (/i386/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virti

o-net/virtio-net-tests/vhost-user/reconnect/subprocess [1677921]) stderr: "qemu-

system-i386: -chardev socket,id=chr-reconnect,path=/tmp/vhost-test-MdgDF8/reconn

ect.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp

/vhost-test-MdgDF8/reconnect.sock,server=on\nqemu-system-i386: Failed to set msg

  fds.\nqemu-system-i386: vhost VQ 0 ring restore failed: -22: Invalid argument (

22)\nqemu-system-i386: Failed to set msg fds.\nqemu-system-i386: vhost VQ 1 ring

  restore failed: -22: Invalid argument (22)\n**\nERROR:../src/tests/qtest/vhost-

user-test.c:809:wait_for_rings_started: assertion failed (ctpop64(s->rings) == c

ount): (1 == 2)\n"

Bail out! ERROR:../src/tests/qtest/qos-test.c:189:subprocess_run_one_test: child

  process (/i386/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/v

irtio-net-tests/vhost-user/reconnect/subprocess [1677921]) failed unexpectedly

stderr:

**

ERROR:../src/tests/qtest/qos-test.c:189:subprocess_run_one_test: child process 
(/i386/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/reconnect/subprocess 
[1677921]) failed unexpectedly



The failure appears to be timeout related, so it's not consistent, but some of the error 
messages embedded in that block suggest the test never really got started correctly?


r~

