Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD0130FA12
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:47:57 +0100 (CET)
Received: from localhost ([::1]:60616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ijU-0002jJ-Qo
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7hnO-0001lE-RT
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:47:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7hnK-0008RQ-Hp
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:47:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612457269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FANuDbx/nRP7NfEN+rlR+ZjzbXf+twWzXv3dTOtJnqA=;
 b=TrfGMgkcY6FG43DU6UnHV1QcEgNBHaxi1Weu/C/CkTVqBR0Gj6CVhdtjhBkbROFSk/QvXa
 FchRRUjrJtmc7HAASgIJHNEDBBNaMhrIwiEv+Q1AtvA6IpS6xB/G8L+nO97i8jaSe6kgci
 RrFmksdaEM1Wc98i276MUG/TT+YcjOk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-0Vs8d4wgO1iZicLpQunFew-1; Thu, 04 Feb 2021 11:47:46 -0500
X-MC-Unique: 0Vs8d4wgO1iZicLpQunFew-1
Received: by mail-ej1-f72.google.com with SMTP id by20so3013152ejc.1
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 08:47:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=FANuDbx/nRP7NfEN+rlR+ZjzbXf+twWzXv3dTOtJnqA=;
 b=YxCE2AxkJPc0qvzFpToKqAM+b3VHGMEUHvuuVAUyhFgbRWvr9i1eq3ADWjL28hUeLn
 4SZkUkgqvhK0biOPsJBBE2AgHEugSnvfIndv8kTUW4iTWg71KS2kPGxU2sDd+NMT2gCx
 woViNr6Z3uVTuxrjUw+d18N+fetOGxp0AWqmTgeoSw3qDrDuzvALMs/T56SEts51HAPD
 QofQPM94O4ZCte/MgTnK7YO7UUr4UsSxRtnfZaBhBmzHOuQG49iKoXWbDaYW9QhZ9rJw
 r2VGMngHlgyVCabzodrzLVfCe10NuZbNKVzGL6o3dHMZpWFnKQkolm8DPNTYuvY+P3Nd
 r+/g==
X-Gm-Message-State: AOAM530WYDsSuArQJJygKOHbG9tjukNEKxkjPuldtjF+4Do3vEGHaIZP
 hR32SYEUvXwsa0BXVcfNeTBKlr/nCMjUNLdACy78giNiaf9oIrozv3CRDvjg8jKrqXleoysohp/
 XisIlUi7lRQxL+NIK6VadhGN4n9xR1Ia5chKFRzCsxIbMN5/Ei1igRsAdptaBVYWn
X-Received: by 2002:a05:6402:2211:: with SMTP id
 cq17mr8611504edb.167.1612457264707; 
 Thu, 04 Feb 2021 08:47:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBGXjKTaFujSRrXYyism7t1HQ3ayDD98R+Xx9IIL/aoEEEu78zx2tdGKyB0E4enZQ/84dGHQ==
X-Received: by 2002:a05:6402:2211:: with SMTP id
 cq17mr8611474edb.167.1612457264411; 
 Thu, 04 Feb 2021 08:47:44 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id u17sm2712156ejr.59.2021.02.04.08.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 08:47:43 -0800 (PST)
To: Qemu-block <qemu-block@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: iotest 30 failing
Message-ID: <818b08af-3077-7003-63eb-614fa459d01c@redhat.com>
Date: Thu, 4 Feb 2021 17:47:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
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
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Based on commit 1ed9228f63e (ericb/tags/pull-nbd-2021-02-02-v2)
I got:

  TEST   iotest-qcow2: 030 [fail]
--- /builds/philmd/qemu/tests/qemu-iotests/030.out
+++ 030.out.bad
@@ -1,5 +1,47 @@
-...........................
+WARNING:qemu.machine:qemu received signal 11; command:
"/builds/philmd/qemu/build/tests/qemu-iotests/../../qemu-system-x86_64
-display none -vga none -chardev
socket,id=mon,path=/tmp/tmphop581f2/qemu-12072-monitor.sock -mon
chardev=mon,mode=control -qtest
unix:path=/tmp/tmphop581f2/qemu-12072-qtest.sock -accel qtest
-nodefaults -display none -accel qtest -drive
if=virtio,id=drive0,file=/builds/philmd/qemu/build/tests/qemu-iotests/scratch/img-8.img,format=qcow2,cache=writeback,aio=threads,backing.backing.backing.backing.backing.backing.backing.backing.node-name=node0,backing.backing.backing.backing.backing.backing.backing.node-name=node1,backing.backing.backing.backing.backing.backing.node-name=node2,backing.backing.backing.backing.backing.node-name=node3,backing.backing.backing.backing.node-name=node4,backing.backing.backing.node-name=node5,backing.backing.node-name=node6,backing.node-name=node7,node-name=node8"
+.........EE.................

https://gitlab.com/philmd/qemu/-/jobs/1008007132


