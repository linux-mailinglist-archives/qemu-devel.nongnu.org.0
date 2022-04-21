Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F229150AC4D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 01:46:49 +0200 (CEST)
Received: from localhost ([::1]:34106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhgVc-0006DE-HV
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 19:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhgUH-0005MK-OL
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 19:45:25 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:35517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhgUF-0007BZ-PM
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 19:45:25 -0400
Received: by mail-pg1-x534.google.com with SMTP id r83so5963263pgr.2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 16:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=e9T91M1vCMrvm9CWmrTbSa9UWnz31jMKaPeZYh3kOfM=;
 b=i6XiaKDaBp2Xsp8KsO4hJDA9TRErRcMYTXx7X9pvb8yZmvDXpxuZfycOh71rNRaws8
 y4lYtdjGFdcYIX4ltmyDnaF1fI7bDD/FU33oWaLJFU+DHw0TmNRAPAQOTWxEtwmeNaiN
 2j5i9Ms00sODDkp7MUgPso7z9TSOPsLovEC33xoEKtT7APYpKHgOqTIQkjlZ+tEvy3Wm
 mHJ2b/KhbyGv3w4Zi+diFjWHNs9Iki3NpTWTImL8UzkfdKX9OP084TcXoVd+nxDDsLMo
 RhxZW0GAVN0NZDLiP4E/LG7jYViF38IV4KShq1MHcgve3A142qtuYDittTASSKxqzj9i
 kYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e9T91M1vCMrvm9CWmrTbSa9UWnz31jMKaPeZYh3kOfM=;
 b=fjo8joXUy4FfdhVpPi7uglVn+ckq/za53g3wgtnUey12mmh2BeXPz5JcNHbDhSLhUd
 irJfqFz4XwxP/lIrv1LgbRUy8+M5rtrYhAmNBFnJMo0ajquYcCOcWJHVJF5XTgWnN7nT
 JZH3dDbX5hZ5SD+45liaw5xSOqAsO4u+F8g6+qveZviJUpI7gQZeTgq5J0lGTdIHAAEd
 mAjgFfK7iHShPD0hxutaWxxMARYvYTw+OgUBbYMHJHdK3kuDiHD58F3yrHPlXH+AJW0O
 vah9oaTVJC/5tbtG/ldO6yZruRwyHuaceZIO1tnT2sxEtXoORFj/Xx0VIT53km3eSFAE
 1/sQ==
X-Gm-Message-State: AOAM532Hsq9zSmmyBtDeR0Ln/Ao2sv+fU4SSz123DLu0rOHnP1ruq41b
 iAJ+7/NIkOO4dOstGAP5KZp7Lg==
X-Google-Smtp-Source: ABdhPJzvA/r/IgVPm6xIi1ubN913D579cf/6B/4tA/7FmywGDP1t2FrZvrg6jmtMYm5TxzyycSSjRQ==
X-Received: by 2002:aa7:92c8:0:b0:4fd:c1aa:3e11 with SMTP id
 k8-20020aa792c8000000b004fdc1aa3e11mr2064748pfa.29.1650584717829; 
 Thu, 21 Apr 2022 16:45:17 -0700 (PDT)
Received: from [192.168.65.107] (50-78-183-178-static.hfc.comcastbusiness.net.
 [50.78.183.178]) by smtp.gmail.com with ESMTPSA id
 d15-20020a630e0f000000b003a408836badsm242640pgl.45.2022.04.21.16.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 16:45:16 -0700 (PDT)
Message-ID: <ae980dec-1c72-17e6-9151-43fc6b0b9a54@linaro.org>
Date: Thu, 21 Apr 2022 16:45:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/17] Python patches
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220421151600.984189-1-jsnow@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220421151600.984189-1-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/22 08:15, John Snow wrote:
> The following changes since commit b1efff6bf031a93b5b8bf3912ddc720cc1653a61:
> 
>    Merge tag 'pull-ppc-20220420-2' of https://gitlab.com/danielhb/qemu into staging (2022-04-20 21:54:24 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/jsnow/qemu.git tags/python-pull-request
> 
> for you to fetch changes up to 47430775ed1a48d7beb2c7b8d7feaab73104ec46:
> 
>    python/qmp: remove pylint workaround from legacy.py (2022-04-21 11:01:00 -0400)
> 
> ----------------------------------------------------------------
> Python patches
> 
> This PR finalizes the switch from Luiz's QMP library to mine.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



> 
> ----------------------------------------------------------------
> 
> John Snow (17):
>    python/machine: permanently switch to AQMP
>    scripts/bench-block-job: switch to AQMP
>    iotests/mirror-top-perms: switch to AQMP
>    iotests: switch to AQMP
>    python/aqmp: add explicit GPLv2 license to legacy.py
>    python/aqmp: relicense as LGPLv2+
>    python/qmp-shell: relicense as LGPLv2+
>    python/aqmp-tui: relicense as LGPLv2+
>    python: temporarily silence pylint duplicate-code warnings
>    python/aqmp: take QMPBadPortError and parse_address from qemu.qmp
>    python/aqmp: fully separate from qmp.QEMUMonitorProtocol
>    python/aqmp: copy qmp docstrings to qemu.aqmp.legacy
>    python: remove the old QMP package
>    python: re-enable pylint duplicate-code warnings
>    python: rename qemu.aqmp to qemu.qmp
>    python: rename 'aqmp-tui' to 'qmp-tui'
>    python/qmp: remove pylint workaround from legacy.py
> 
>   python/README.rst                             |   2 +-
>   python/qemu/qmp/README.rst                    |   9 -
>   python/qemu/aqmp/__init__.py                  |  59 ---
>   python/qemu/aqmp/legacy.py                    | 177 -------
>   python/qemu/aqmp/py.typed                     |   0
>   python/qemu/machine/machine.py                |  18 +-
>   python/qemu/machine/qtest.py                  |   2 +-
>   python/qemu/qmp/__init__.py                   | 445 ++----------------
>   python/qemu/{aqmp => qmp}/error.py            |   0
>   python/qemu/{aqmp => qmp}/events.py           |   2 +-
>   python/qemu/qmp/legacy.py                     | 315 +++++++++++++
>   python/qemu/{aqmp => qmp}/message.py          |   0
>   python/qemu/{aqmp => qmp}/models.py           |   0
>   python/qemu/{aqmp => qmp}/protocol.py         |   4 +-
>   python/qemu/{aqmp => qmp}/qmp_client.py       |  16 +-
>   python/qemu/{aqmp => qmp}/qmp_shell.py        |  11 +-
>   .../qemu/{aqmp/aqmp_tui.py => qmp/qmp_tui.py} |  17 +-
>   python/qemu/{aqmp => qmp}/util.py             |   0
>   python/qemu/utils/qemu_ga_client.py           |   4 +-
>   python/qemu/utils/qom.py                      |   2 +-
>   python/qemu/utils/qom_common.py               |   4 +-
>   python/qemu/utils/qom_fuse.py                 |   2 +-
>   python/setup.cfg                              |  11 +-
>   python/tests/protocol.py                      |  14 +-
>   scripts/cpu-x86-uarch-abi.py                  |   2 +-
>   scripts/device-crash-test                     |   4 +-
>   scripts/qmp/qmp-shell                         |   2 +-
>   scripts/qmp/qmp-shell-wrap                    |   2 +-
>   scripts/render_block_graph.py                 |   4 +-
>   scripts/simplebench/bench_block_job.py        |   5 +-
>   tests/qemu-iotests/iotests.py                 |   3 +-
>   tests/qemu-iotests/tests/mirror-top-perms     |  11 +-
>   32 files changed, 422 insertions(+), 725 deletions(-)
>   delete mode 100644 python/qemu/qmp/README.rst
>   delete mode 100644 python/qemu/aqmp/__init__.py
>   delete mode 100644 python/qemu/aqmp/legacy.py
>   delete mode 100644 python/qemu/aqmp/py.typed
>   rename python/qemu/{aqmp => qmp}/error.py (100%)
>   rename python/qemu/{aqmp => qmp}/events.py (99%)
>   create mode 100644 python/qemu/qmp/legacy.py
>   rename python/qemu/{aqmp => qmp}/message.py (100%)
>   rename python/qemu/{aqmp => qmp}/models.py (100%)
>   rename python/qemu/{aqmp => qmp}/protocol.py (99%)
>   rename python/qemu/{aqmp => qmp}/qmp_client.py (97%)
>   rename python/qemu/{aqmp => qmp}/qmp_shell.py (98%)
>   rename python/qemu/{aqmp/aqmp_tui.py => qmp/qmp_tui.py} (98%)
>   rename python/qemu/{aqmp => qmp}/util.py (100%)
> 


