Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5516B3B6E8A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 09:09:15 +0200 (CEST)
Received: from localhost ([::1]:57348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly7rt-0008O2-Pu
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 03:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ly7r4-0007bb-Ah
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 03:08:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ly7r1-0008Sn-Kz
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 03:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624950498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aTPm6ipEbzoer31+NA4LJl9OJaoTxuBiYCCJpwsuxFQ=;
 b=eLTWjX1HTBXnK69RV+YKVnc5SU5DviXLNpR/Zp0KQQvFK8HZcSBoCvNzpJno50maaAS61z
 RsWEpLSC6PqnQpCU1PmG8z016C24axYuMCayxajMDUQ54TDpEQ/N0d5NbEBNVdJ9V/JOy5
 avfcSwwEjNNWauJZmktlOIGI6KhlTnA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-SUU8gZ9kNdWm49ZVNw64Kw-1; Tue, 29 Jun 2021 03:08:13 -0400
X-MC-Unique: SUU8gZ9kNdWm49ZVNw64Kw-1
Received: by mail-ed1-f70.google.com with SMTP id
 z5-20020a05640235c5b0290393974bcf7eso11039594edc.2
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 00:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aTPm6ipEbzoer31+NA4LJl9OJaoTxuBiYCCJpwsuxFQ=;
 b=lMfr7ExJ62pPm/fdZc2PBXzoeQrtr6w80WirudcuGT9uIV31G6FRAIkeoCG9sCXj0b
 atymSaAgwsCBroB+1N1cOsIYwRHUBHYjP5YSo+H1Fbn71nO4SWcrwSlXOzD/1XFNk8/L
 YUvZzDEJiCpDUOs5W5IAVBW3PX3NVD1C3tuUWmkGM/s128fNT7g+xJHA6nDU3IQnaaUd
 gwJ4EG9C32UudBppzpMrR/w0zg/yqcPezDLswgfpQmaOufpGu604eMV6HAuh9NFa5L2i
 igGFJkVHpKESSqb5lGZpuWWe3f3b2wKXComUBxMTEFta6QER5Haga5UQv2j3sxaDAMnA
 YTPA==
X-Gm-Message-State: AOAM531PxP4tJ8xOHiyQLxXrkSJMrd/69WzPbo/v3ncVsa0NlMRJn3iQ
 DEwu/r2H0AN3acWOqFTmQoVqtasEDITgtiwXmH00EZ0tFW/aKXxm/gXBhdbgUXOOGJmjtoUj6+1
 ENKmWvCGyxop+CFs=
X-Received: by 2002:a05:6402:5248:: with SMTP id
 t8mr38851420edd.110.1624950492425; 
 Tue, 29 Jun 2021 00:08:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGibcioeZOxQSTam7sNeDiw23iFCKE+uxuR7j6/7Zv7a87RAt9VhRt/fqOb8+jPIT05R0LZQ==
X-Received: by 2002:a05:6402:5248:: with SMTP id
 t8mr38851413edd.110.1624950492341; 
 Tue, 29 Jun 2021 00:08:12 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 g12sm10575018edb.23.2021.06.29.00.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 00:08:11 -0700 (PDT)
Subject: Re: [PATCH v7 00/16] qemu_iotests: improve debugging options
To: John Snow <jsnow@redhat.com>
References: <20210628123150.56567-1-eesposit@redhat.com>
 <CAFn=p-ZS3TO6rPAGxS3o7HMXtuOV-2ptwRBhRhQY3Pm4UKZ1Tg@mail.gmail.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <84f3464b-7105-4737-dc8c-a89caaa9bb32@redhat.com>
Date: Tue, 29 Jun 2021 09:08:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFn=p-ZS3TO6rPAGxS3o7HMXtuOV-2ptwRBhRhQY3Pm4UKZ1Tg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 28/06/2021 18:48, John Snow wrote:
> 
> 
> On Mon, Jun 28, 2021 at 8:32 AM Emanuele Giuseppe Esposito 
> <eesposit@redhat.com <mailto:eesposit@redhat.com>> wrote:
> 
>     This series adds the option to attach gdbserver and valgrind
>     to the QEMU binary running in qemu_iotests.
>     It also allows to redirect QEMU binaries output of the python tests
>     to the stdout, instead of a log file.
> 
>     Patches 1-9 introduce the -gdb option to both python and bash tests,
>     10-14 extend the already existing -valgrind flag to work also on
>     python tests, and patch 15-16 introduces -p to enable logging to stdout.
> 
>     In particular, patches 1,6,11 focus on extending the QMP socket timers
>     when using gdb/valgrind, otherwise the python tests will fail due to
>     delays in the QMP responses.
> 
>     Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com
>     <mailto:eesposit@redhat.com>>
> 
> 
> Don't forget that you have my Acked-By on patches 1-3, I'm content with 
> a Block maintainer staging this entire series.
> 

Sorry I forgot to update that. Will add the acked-by and together with 
Eric's changes will respin once more.

Thank you,
Emanuele

>     ---
>     v7:
>     * While using debugging tests with gdb, I found out that there is a
>        timer also in bash scripts (common.qemu). Modify patch 8 to remove
>        the timer when gdb is used.
> 
>     Emanuele Giuseppe Esposito (15):
>        python: qemu: add timer parameter for qmp.accept socket
>        python: qemu: pass the wrapper field from QEMUQtestmachine to
>          QEMUMachine
>        docs/devel/testing: add debug section to the QEMU iotests chapter
>        qemu-iotests: add option to attach gdbserver
>        qemu-iotests: delay QMP socket timers
>        qemu_iotests: insert gdbserver command line as wrapper for qemu
>     binary
>        qemu-iotests: add gdbserver option to script tests too
>        docs/devel/testing: add -gdb option to the debugging section of QEMU
>          iotests
>        qemu-iotests: extend the check script to prepare supporting valgrind
>          for python tests
>        qemu-iotests: extend QMP socket timeout when using valgrind
>        qemu-iotests: allow valgrind to read/delete the generated log file
>        qemu-iotests: insert valgrind command line as wrapper for qemu binary
>        docs/devel/testing: add -valgrind option to the debug section of QEMU
>          iotests
>        qemu-iotests: add option to show qemu binary logs on stdout
>        docs/devel/testing: add -p option to the debug section of QEMU
>     iotests
> 
>     John Snow (1):
>        python: Reduce strictness of pylint's duplicate-code check
> 
>       docs/devel/testing.rst         | 30 +++++++++++++++++++++
>       python/qemu/machine/machine.py | 16 +++++++----
>       python/qemu/machine/qtest.py   |  9 ++++---
>       python/setup.cfg               |  5 ++++
>       tests/qemu-iotests/check       | 15 ++++++++---
>       tests/qemu-iotests/common.qemu |  7 ++++-
>       tests/qemu-iotests/common.rc   |  8 +++++-
>       tests/qemu-iotests/iotests.py  | 49 ++++++++++++++++++++++++++++++++--
>       tests/qemu-iotests/testenv.py  | 23 ++++++++++++++--
>       9 files changed, 144 insertions(+), 18 deletions(-)
> 
>     -- 
>     2.31.1
> 


