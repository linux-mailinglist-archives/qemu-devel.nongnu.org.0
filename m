Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2993A5EC4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:03:00 +0200 (CEST)
Received: from localhost ([::1]:46104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiUl-0003uS-7N
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lsiHN-00070b-Iv
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:49:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lsiHK-0002jY-Km
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:49:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623660544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9PJUvsYcdcEqWBoSOtS8trFxOOVYGJ7+28zSQUGcYjc=;
 b=Rp74rpQ6L3sXXMqa7MdhTaVn7ox3/VtYclzc30QVUUhcCW6VpXo1gofXWp0FOOJLgcRCON
 qYqZENKIQA9C2RZ6jAbKmYXbt/Fdn/crHB27XwlvCCMt08vKUaLKRfSN7x0GZIXWvBBmjO
 qub7Yw/8LJHGK14Fd9TA1lwhY7UcWdQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-ruCm5SqhNteTDTk1BFJ9bw-1; Mon, 14 Jun 2021 04:49:00 -0400
X-MC-Unique: ruCm5SqhNteTDTk1BFJ9bw-1
Received: by mail-wr1-f69.google.com with SMTP id
 n4-20020a5d42040000b0290119fef97609so6718374wrq.18
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9PJUvsYcdcEqWBoSOtS8trFxOOVYGJ7+28zSQUGcYjc=;
 b=staiPLa93hkmojIKirly7g6z9GnlxMoeIJgHO1rmLS3ZdADFRk8wr0NeyQ3A0Y2K5q
 dqKAAAIsxdcRNtmBUaT2l+sWwqua3UODafGOsUt2txHxo3jrTxfNQZrGe1WMre12mVFl
 /vUVXcJUNa2gy6f7IfnY1Ly6p4rKDBWs+k/JBSCX/SH4jvI74i2hZ89Vl8KYDJrNDJxm
 GO3YT7x0cYpH7E2a4OSUu5nycvBZ6FtSkm8++2aAZe9SbToty/BkzmZEf5pA0Dskb4tg
 cxQhKk2ObAits3dukSAPh5wxNQpy5/PQNPYiXY68Rd8TvNuyYqH+cMG1o+5L0QtluhXL
 fpPg==
X-Gm-Message-State: AOAM533mDNE3GDwLrvZOws6n4fdYvZrzFlC3QqKNweOvLxWO9PMvwRCq
 hbpvLsvTJMxcAR+WrvKsvd9v3v93KpoUST2qJmBVJZiYIm7elFTZdeZFsAp1GtNB3IWFaZ/fwCd
 AtGFYik6s1XRUSto5b3BOkiOqlO5uU235yB32QVbgOv4+JeKgoB2s1+1ZN5Qi851GI/c=
X-Received: by 2002:a1c:7912:: with SMTP id l18mr14931528wme.135.1623660539475; 
 Mon, 14 Jun 2021 01:48:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0mHby3dids6bFFfBsX9QJwTzNoIFI7W2CVbIeO45IiqvDo6whysYACxX/J1e+S5ZyKtFieg==
X-Received: by 2002:a1c:7912:: with SMTP id l18mr14931496wme.135.1623660539179; 
 Mon, 14 Jun 2021 01:48:59 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 o20sm18540491wms.3.2021.06.14.01.48.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 01:48:58 -0700 (PDT)
Subject: Re: [PATCH v5 00/16] qemu_iotests: improve debugging options
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210604091723.13419-1-eesposit@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <f24a705f-25bc-e5e7-97d7-b01e4e9e89df@redhat.com>
Date: Mon, 14 Jun 2021 10:48:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604091723.13419-1-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.144, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 04/06/2021 11:17, Emanuele Giuseppe Esposito wrote:
> This series adds the option to attach gdbserver and valgrind
> to the QEMU binary running in qemu_iotests.
> It also allows to redirect QEMU binaries output of the python tests
> to the stdout, instead of a log file.
> 
> Patches 1-9 introduce the -gdb option to both python and bash tests,
> 10-14 extend the already existing -valgrind flag to work also on
> python tests, and patch 15-16 introduces -p to enable logging to stdout.
> 
> In particular, patches 1,6,11 focus on extending the QMP socket timers
> when using gdb/valgrind, otherwise the python tests will fail due to
> delays in the QMP responses.
> 
> This series is tested on the previous serie
> "qemu-iotests: quality of life improvements"
> but independent from it, so it can be applied separately.
> 
> It is also based on "iotests/check: move general long options to double dash"
> by Vladimir Sementsov-Ogievskiy.

Apologies to all the people following this series,

I realized that there is a discussion[*] on whether to use the 
"--option" notation vs "-option".

Therefore I am going to re-send this series without Vladimir's based-on 
(also because I got all necessary reviews, so it should be ready to be 
merged).

Thank you,
Emanuele

[*] = 
https://patchew.org/QEMU/20210526181659.365531-1-vsementsov@virtuozzo.com/#955ce8e3-eafe-79ab-ad4e-f81ecf08d20f@virtuozzo.com
> 
> Based-on: <20210526181659.365531-1-vsementsov@virtuozzo.com>
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
> v5:
> * base this serie on the double dash options, so define --gdb instead of -gdb
> * return error if -gdb and -valgrind are used together [Vladimir]
> * style changes (do not use subprocess_check_valgrind() but do the operation
>    inside the caller) [Vladimir]
> * minor fixes in commit messages [Vladimir]
> * create a common public function in patch 15 instead of using
>    _private fields [Vladimir]
> * use @contextmanager in patch 6 to skip gdb timeouts involving the
>    Timeout class [Vladimir]
> * apply John Snow patch to silence pylint warning in the CI tests
> 
> Emanuele Giuseppe Esposito (15):
>    python: qemu: add timer parameter for qmp.accept socket
>    python: qemu: pass the wrapper field from QEMUQtestmachine to
>      QEMUMachine
>    docs/devel/testing: add debug section to the QEMU iotests chapter
>    qemu-iotests: add option to attach gdbserver
>    qemu-iotests: delay QMP socket timers
>    qemu_iotests: insert gdbserver command line as wrapper for qemu binary
>    qemu-iotests: add gdbserver option to script tests too
>    docs/devel/testing: add --gdb option to the debugging section of QEMU
>      iotests
>    qemu-iotests: extend the check script to prepare supporting valgrind
>      for python tests
>    qemu-iotests: extend QMP socket timeout when using valgrind
>    qemu-iotests: allow valgrind to read/delete the generated log file
>    qemu-iotests: insert valgrind command line as wrapper for qemu binary
>    docs/devel/testing: add --valgrind option to the debug section of QEMU
>      iotests
>    qemu-iotests: add option to show qemu binary logs on stdout
>    docs/devel/testing: add -p option to the debug section of QEMU iotests
> 
> John Snow (1):
>    python: Reduce strictness of pylint's duplicate-code check
> 
>   docs/devel/testing.rst         | 30 ++++++++++++++++++++
>   python/qemu/machine/machine.py | 16 +++++++----
>   python/qemu/machine/qtest.py   |  9 ++++--
>   python/setup.cfg               |  5 ++++
>   tests/qemu-iotests/check       | 15 +++++++---
>   tests/qemu-iotests/common.rc   |  8 +++++-
>   tests/qemu-iotests/iotests.py  | 52 ++++++++++++++++++++++++++++++++--
>   tests/qemu-iotests/testenv.py  | 23 +++++++++++++--
>   8 files changed, 141 insertions(+), 17 deletions(-)
> 


