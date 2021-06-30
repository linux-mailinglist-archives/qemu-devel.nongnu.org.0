Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7773B85C1
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:07:02 +0200 (CEST)
Received: from localhost ([::1]:55418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lybnp-0003Nt-98
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lybl5-0000iz-1P
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:04:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lybky-0002y8-Kg
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:04:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625065443;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4gqYUo0eq2qbvOHtwRD0uEcWnu0MoXONK22FI1V+gYo=;
 b=JJkBRTvXZSAMkAx6X0X9APCcVcJenywJv+/21DkvA+XSS+T3PFbaCktZQZj7jY3QhphJZK
 87Zr4aYJiZOQARM3WFCwLhKDUuOlt1PLoTT/8IIRElRFmqxyRa/w4D/I7DZk719YWj53Us
 cY+pc6tDGbYGFcTcvGoqx9wx2G/taIY=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-qPgfwDbGPf2O7ng3Slf2Jg-1; Wed, 30 Jun 2021 11:04:02 -0400
X-MC-Unique: qPgfwDbGPf2O7ng3Slf2Jg-1
Received: by mail-pg1-f199.google.com with SMTP id
 j17-20020a63cf110000b0290226eb0c27acso1850690pgg.23
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 08:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=4gqYUo0eq2qbvOHtwRD0uEcWnu0MoXONK22FI1V+gYo=;
 b=m1lptkFWYBI81hAMkyWQ2olwjK3JBI9uhryA4RTqhNVAz6NwN3akZkvH38Wy40mFoI
 Q/POf9ykmFac3WyllyLn5u/lx5sZMFbg5hrlOgJYt9MwTiZpI/IwG81azR5sI30j9mLr
 eb0Qw2kWdOEiozH2C30xgFA/AHU5DVbdg2xEeZHpO6OrAvKuTAvNlo81Bm8sv5R5V1uB
 fjuuqI2nBqtLESaJxarZKyRaJruz8McP0I7zXFbtpOWE6myfUDGYsjnhHw0fsN+hAhen
 SO7/KC2xsbGiOjM/yFboDA0Dk6zXIANCPU2pGGtSGqQ0SpPFH0cCmLtUoeu+ExxEY1fM
 x7ow==
X-Gm-Message-State: AOAM531/OylIkF0PhbNWUWnqGxoPdBtUSnCB6Oqmm8xkO4pUh2FczRPn
 ZlqyIu/wQN0tt4QpEQRIs7olKEBl4zACuXkGK/6wZEOXs4cPZ8sTJd4jjSS5sAtxVvRCPXPph1h
 x5RSeFDHNgjPWsfY=
X-Received: by 2002:a17:902:ee44:b029:128:fd7a:a84d with SMTP id
 4-20020a170902ee44b0290128fd7aa84dmr8365124plo.69.1625065441214; 
 Wed, 30 Jun 2021 08:04:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRhw6zjiq0Tow12Wu03tnvW8eubFn8GZRCVzzTyy0uHKj6CSZ133VXoj0LLnFeg/ozSmg0zQ==
X-Received: by 2002:a17:902:ee44:b029:128:fd7a:a84d with SMTP id
 4-20020a170902ee44b0290128fd7aa84dmr8365100plo.69.1625065440965; 
 Wed, 30 Jun 2021 08:04:00 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id la17sm12066601pjb.34.2021.06.30.08.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 08:03:59 -0700 (PDT)
Subject: Re: [PATCH v3 15/15] python: Fix broken ReST docstrings
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210629214323.1329806-1-jsnow@redhat.com>
 <20210629214323.1329806-16-jsnow@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <856bc8ea-a6c4-127f-3653-605c778eaf56@redhat.com>
Date: Wed, 30 Jun 2021 12:03:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210629214323.1329806-16-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Reply-To: wainersm@redhat.com
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/29/21 6:43 PM, John Snow wrote:
> This patch *doesn't* update all of the docstring standards across the
> QEMU package directory to make our docstring usage consistent. It
> *doesn't* fix the formatting to make it look pretty or reasonable in
> generated output. It *does* fix a few small instances where Sphinx would
> emit a build warning because of malformed ReST -- If we built our Python
> docs with Sphinx.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
>
> ---
>
> You'll have to take my word for it for now, or, to test that (ugly
> though it may be) a theoretical Sphinx build would produce no build
> errors:
>
>> cd ~/src/qemu/python
>> sphinx-apidoc --separate --private --no-toc --module-first \
>      --implicit-namespaces --full --ext-intersphinx --ext-coverage \
>      --ext-viewcode qemu/ -o docs/
>> sed -i '1s|^|import os; import sys; sys.path.insert(0, os.path.abspath("../"))\n|' docs/conf.py
>> make -C docs html
>> rm -rf docs/
> I am preparing to add Sphinx, but need to fix these annoyances first so
> that regressions are easy to spot as fixes are applied across the
> tree. I plan to use my forthcoming Asynchronous QMP series as a test
> pilot for documenting our docstring standards. Assuming it goes well, I
> will update the docstrings elsewhere in this package at that time.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/machine/__init__.py | 6 +++---
>   python/qemu/machine/machine.py  | 3 ++-
>   python/qemu/qmp/__init__.py     | 1 +
>   python/qemu/qmp/qom_common.py   | 2 +-
>   python/qemu/utils/accel.py      | 2 +-
>   5 files changed, 8 insertions(+), 6 deletions(-)
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>
> diff --git a/python/qemu/machine/__init__.py b/python/qemu/machine/__init__.py
> index 728f27adbe..9ccd58ef14 100644
> --- a/python/qemu/machine/__init__.py
> +++ b/python/qemu/machine/__init__.py
> @@ -4,10 +4,10 @@
>   This library provides a few high-level classes for driving QEMU from a
>   test suite, not intended for production use.
>   
> -- QEMUMachine: Configure and Boot a QEMU VM
> - - QEMUQtestMachine: VM class, with a qtest socket.
> + | QEMUQtestProtocol: send/receive qtest messages.
> + | QEMUMachine: Configure and Boot a QEMU VM
> + | +-- QEMUQtestMachine: VM class, with a qtest socket.
>   
> -- QEMUQtestProtocol: Connect to, send/receive qtest messages.
>   """
>   
>   # Copyright (C) 2020-2021 John Snow for Red Hat Inc.
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index e3345dfa1b..d47ab3d896 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -545,7 +545,8 @@ def set_qmp_monitor(self, enabled: bool = True) -> None:
>           @param enabled: if False, qmp monitor options will be removed from
>                           the base arguments of the resulting QEMU command
>                           line. Default is True.
> -        @note: call this function before launch().
> +
> +        .. note:: Call this function before launch().
>           """
>           self._qmp_set = enabled
>   
> diff --git a/python/qemu/qmp/__init__.py b/python/qemu/qmp/__init__.py
> index 376954cb6d..269516a79b 100644
> --- a/python/qemu/qmp/__init__.py
> +++ b/python/qemu/qmp/__init__.py
> @@ -279,6 +279,7 @@ def accept(self, timeout: Optional[float] = 15.0) -> QMPMessage:
>                           None). The value passed will set the behavior of the
>                           underneath QMP socket as described in [1].
>                           Default value is set to 15.0.
> +
>           @return QMP greeting dict
>           @raise OSError on socket connection errors
>           @raise QMPConnectError if the greeting is not received
> diff --git a/python/qemu/qmp/qom_common.py b/python/qemu/qmp/qom_common.py
> index f82b16772d..a59ae1a2a1 100644
> --- a/python/qemu/qmp/qom_common.py
> +++ b/python/qemu/qmp/qom_common.py
> @@ -156,7 +156,7 @@ def command_runner(
>           """
>           Run a fully-parsed subcommand, with error-handling for the CLI.
>   
> -        :return: The return code from `.run()`.
> +        :return: The return code from `run()`.
>           """
>           try:
>               cmd = cls(args)
> diff --git a/python/qemu/utils/accel.py b/python/qemu/utils/accel.py
> index 297933df2a..386ff640ca 100644
> --- a/python/qemu/utils/accel.py
> +++ b/python/qemu/utils/accel.py
> @@ -36,7 +36,7 @@ def list_accel(qemu_bin: str) -> List[str]:
>       List accelerators enabled in the QEMU binary.
>   
>       @param qemu_bin (str): path to the QEMU binary.
> -    @raise Exception: if failed to run `qemu -accel help`
> +    @raise Exception: if failed to run ``qemu -accel help``
>       @return a list of accelerator names.
>       """
>       if not qemu_bin:


