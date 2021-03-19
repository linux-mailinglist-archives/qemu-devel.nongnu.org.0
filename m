Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36366341A86
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:58:25 +0100 (CET)
Received: from localhost ([::1]:44914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNCpk-0003nV-A3
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNCoR-0002nN-4n
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:57:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNCoM-0001fV-Ib
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:57:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616151418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Prt4pGyd2zKAYmmY97VJ33W1md1hEU0lt5gyhEY+0jA=;
 b=dslz4uRhiRTDXsH8gunyLboFZ3mLaFYdr6QwrOQuF4yKF+gCdC0U+gXo7QkG7g3iRV9po1
 zCuwZCawmhGEWOUigXDET5Jxz/AujSh9ysAX2kZvGZBSD6sjDs1phSfs+YY9gQVA/XIv79
 2Lz9T0IRjAzV9IRTnIb29022ifyhk0M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-zCo5qM4POkmrY4YEcuvF8A-1; Fri, 19 Mar 2021 06:56:56 -0400
X-MC-Unique: zCo5qM4POkmrY4YEcuvF8A-1
Received: by mail-wr1-f69.google.com with SMTP id s10so21643115wre.0
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 03:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Prt4pGyd2zKAYmmY97VJ33W1md1hEU0lt5gyhEY+0jA=;
 b=SCdRUDV7/3MZIfvwWgJ/JyROaMp1OMldjEx+mEuFCnUh5ALOJB7oepOajRFkE9Da6m
 dO27An8cpuRc88fwPXuQeluB855GQCyuUrc+cQBUOMfFyHRQtjzvG4+WtsOmLxKd9fWv
 1uCJcXSmB2YhkGNBhxm8+T1Qr8qBJOQOpetQl0EiWXHlSTQwIBrQAqyIfaNnalx8fJew
 fLjr0djt/BEgg9nTglrq6OB7ZBxu27phNyokHV0Jn9mmPVvsehMevCUzAQhxyJM5YBnv
 biComFZxM2qClXOl+4qK3/h7bC+9ILVZqYcNOYwlC3XVeksZhqnci7ftENX26ax0UcE5
 U+pg==
X-Gm-Message-State: AOAM532c77BaAxYLxo+PCpTpKwdUnp0rt0Q2Wn1l735sGAp09AtldrAN
 vkoIa7uV2PE5hvprUoVVXZR75yJSIig+g3h71XfIfJL/gnQ046DYI0hIxZSMrqcqt7uS5uTeqU0
 h1OHKgx+97+33SWs=
X-Received: by 2002:adf:ded1:: with SMTP id i17mr3912582wrn.349.1616151415262; 
 Fri, 19 Mar 2021 03:56:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsyox5O+m1Ro9q5HoNT39zpFG2YQYq3LBwN/bLJ3uHn6z4iGMft1UGNnjzx0oNuRHTL2w4FA==
X-Received: by 2002:adf:ded1:: with SMTP id i17mr3912573wrn.349.1616151415111; 
 Fri, 19 Mar 2021 03:56:55 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id e13sm8837752wrg.72.2021.03.19.03.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 03:56:54 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: gitlab-ci: cross-i386-system job timeouting
Message-ID: <e34b63a3-87e6-ff84-0a4c-306ac6091120@redhat.com>
Date: Fri, 19 Mar 2021 11:56:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

With all the recent pull requests merged, I'm now seeing
the cross-i386-system reaching the timeout limit:

[5225/5228] Linking target tests/qtest/tpm-tis-device-swtpm-test
[5226/5228] Linking target tests/unit/test-util-sockets
[5227/5228] Compiling C object
tests/unit/test-timed-average.p/test-timed-average.c.o
[5228/5228] Linking target tests/unit/test-timed-average
make: Nothing to be done for 'check-build'.
Running test qtest-aarch64/qom-test
Running test qtest-alpha/qom-test
Running test qtest-avr/qom-test
Running test qtest-hppa/qom-test
Running test qtest-m68k/qom-test
ERROR: Job failed: execution took longer than 1h20m0s seconds

Maybe it was borderline and the addition of a new machine with
new types was too much.

What to do now? Split the job yet again?

Thanks,

Phil.


