Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97043A065A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 23:43:52 +0200 (CEST)
Received: from localhost ([::1]:50436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqjVn-00007R-T9
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 17:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lqjUp-00074j-28
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 17:42:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lqjUk-00056h-S3
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 17:42:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623188566;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0fgjCWt/RsxGbAO9kAY8ue+uTG/z8jZeRxNZgZD0vIU=;
 b=EvHAer1J4uf4TlpUqeyMzWGTC8cih/gcRuEH4QgxU1unYneoVwiolrECxnc+nYTSZPWE/f
 QDvfmdFGDMXYp01gWd5UeUL8b59LSsRS+FU5O2201F9d4oZnCFO85z/uLeLiBBe4KwaPIW
 cxpA4sraP27WjScumBcqNmPLghaQCWQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-kejlmhhBNwejlKILYtcLDg-1; Tue, 08 Jun 2021 17:42:43 -0400
X-MC-Unique: kejlmhhBNwejlKILYtcLDg-1
Received: by mail-qt1-f198.google.com with SMTP id
 f17-20020ac87f110000b02901e117339ea7so10148045qtk.16
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 14:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=0fgjCWt/RsxGbAO9kAY8ue+uTG/z8jZeRxNZgZD0vIU=;
 b=VtRb8fE07AhLsclrIecu2NEEUzHwuasIRyoXuTg/UVq7PYXPKEIQtuViivvDZfOASj
 onakPJ9HHQs1WMqGBAynI6MWUEafjI9/72feljY/o9Z+Jgcw+GvjxCag0neC4VLuSYFL
 AY5t5wWJMnPb1UnjPOVCwQS9PWGykYNrIbov4Ce8Wr/6Q9TB2mq4OnjtiWvngnKTSj6x
 PhEpEEpZKtvwxFgRnJFxlJoS6CvIhvd68ID18XZWNdwTLNIZKyY9sSkFXauayWnkAUKg
 uiNEoyI9mV+oTCyYXDvg7noEXv44mLCGbwAdQ2OcW0JSohMpki0S1WVbTUYpw8Mq9H/4
 9bPA==
X-Gm-Message-State: AOAM532Aru/D9sX/mO8SeXjnnqm4hDnUVaZBzxc83dAuMrwBcwOLEDXp
 xQlnaEWO6g9QnxG0kVPp1qqwlqDD7PN+A1DGhAKGpLe6J519GPduq+6ht1A8dUH0QIvlAherzQ1
 En20CdG4CljSaQwg=
X-Received: by 2002:a05:620a:f03:: with SMTP id
 v3mr24277605qkl.96.1623188562553; 
 Tue, 08 Jun 2021 14:42:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVmwSgpNP8bMUmqxn81Xf/lvqL1AClaelt8LAK7vETcDYLaLr5MlgLBffMQLRzBmnyt6lF3g==
X-Received: by 2002:a05:620a:f03:: with SMTP id
 v3mr24277574qkl.96.1623188562287; 
 Tue, 08 Jun 2021 14:42:42 -0700 (PDT)
Received: from wainer-laptop.localdomain ([201.90.138.4])
 by smtp.gmail.com with ESMTPSA id e127sm13015142qkf.62.2021.06.08.14.42.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 14:42:41 -0700 (PDT)
Subject: Re: [PATCH 2/4] Python QEMU utils: introduce a generic feature list
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210608140938.863580-1-crosa@redhat.com>
 <20210608140938.863580-3-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <f2c7ab9f-27b4-aa04-75f5-fcb8a36a4668@redhat.com>
Date: Tue, 8 Jun 2021 18:42:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608140938.863580-3-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 6/8/21 11:09 AM, Cleber Rosa wrote:
> Which can be used to check for any "feature" that is available as a
> QEMU command line option, and that will return its list of available
> options.
>
> This is a generalization of the list_accel() utility function, which
> is itself re-implemented in terms of the more generic feature.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   python/qemu/utils/__init__.py |  2 ++
>   python/qemu/utils/accel.py    | 15 ++----------
>   python/qemu/utils/feature.py  | 44 +++++++++++++++++++++++++++++++++++
>   3 files changed, 48 insertions(+), 13 deletions(-)
>   create mode 100644 python/qemu/utils/feature.py
>
> diff --git a/python/qemu/utils/__init__.py b/python/qemu/utils/__init__.py
> index 7f1a5138c4..1d0789eaa2 100644
> --- a/python/qemu/utils/__init__.py
> +++ b/python/qemu/utils/__init__.py
> @@ -20,12 +20,14 @@
>   
>   # pylint: disable=import-error
>   from .accel import kvm_available, list_accel, tcg_available
> +from .feature import list_feature
>   
>   
>   __all__ = (
>       'get_info_usernet_hostfwd_port',
>       'kvm_available',
>       'list_accel',
> +    'list_feature',
>       'tcg_available',
>   )
>   
> diff --git a/python/qemu/utils/accel.py b/python/qemu/utils/accel.py
> index 297933df2a..b5bb80c6d3 100644
> --- a/python/qemu/utils/accel.py
> +++ b/python/qemu/utils/accel.py
> @@ -14,13 +14,11 @@
>   # the COPYING file in the top-level directory.
>   #
>   
> -import logging
>   import os
> -import subprocess
>   from typing import List, Optional
>   
> +from qemu.utils.feature import list_feature
>   
> -LOG = logging.getLogger(__name__)
>   
>   # Mapping host architecture to any additional architectures it can
>   # support which often includes its 32 bit cousin.
> @@ -39,16 +37,7 @@ def list_accel(qemu_bin: str) -> List[str]:
>       @raise Exception: if failed to run `qemu -accel help`
>       @return a list of accelerator names.
>       """
> -    if not qemu_bin:
> -        return []
> -    try:
> -        out = subprocess.check_output([qemu_bin, '-accel', 'help'],
> -                                      universal_newlines=True)
> -    except:
> -        LOG.debug("Failed to get the list of accelerators in %s", qemu_bin)
> -        raise
> -    # Skip the first line which is the header.
> -    return [acc.strip() for acc in out.splitlines()[1:]]
> +    return list_feature(qemu_bin, 'accel')
>   
>   
>   def kvm_available(target_arch: Optional[str] = None,
> diff --git a/python/qemu/utils/feature.py b/python/qemu/utils/feature.py
> new file mode 100644
> index 0000000000..b4a5f929ab
> --- /dev/null
> +++ b/python/qemu/utils/feature.py
> @@ -0,0 +1,44 @@
> +"""
> +QEMU feature module:
> +
> +This module provides a utility for discovering the availability of
> +generic features.
> +"""
> +# Copyright (C) 2022 Red Hat Inc.
Cleber, please, tell me how is the future like! :)
> +#
> +# Authors:
> +#  Cleber Rosa <crosa@redhat.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.  See
> +# the COPYING file in the top-level directory.
> +#
> +
> +import logging
> +import subprocess
> +from typing import List
> +
> +
> +LOG = logging.getLogger(__name__)
> +
> +
> +def list_feature(qemu_bin: str, feature: str) -> List[str]:
> +    """
> +    List available options the QEMU binary for a given feature type.
> +
> +    By calling a "qemu $feature -help" and parsing its output.

I understand we need a mean to easily cancel the test if given feature 
is not present. However, I'm unsure this generic list_feature() is what 
we need.

The `-accel help` returns a simple list of strings (besides the header, 
which is dismissed). Whereas `-machine help` returns what could be 
parsed as a tuple of (name, description).

Another example is `-cpu help` which will print a similar list as 
`-machine`, plus a section with CPUID flags.

If confess I still don't have a better idea, although I feel it will 
require a OO design.

Thanks!

- Wainer

> +
> +    @param qemu_bin (str): path to the QEMU binary.
> +    @param feature (str): feature name, matching the command line option.
> +    @raise Exception: if failed to run `qemu -feature help`
> +    @return a list of available options for the given feature.
> +    """
> +    if not qemu_bin:
> +        return []
> +    try:
> +        out = subprocess.check_output([qemu_bin, '-%s' % feature, 'help'],
> +                                      universal_newlines=True)
> +    except:
> +        LOG.debug("Failed to get the list of %s(s) in %s", feature, qemu_bin)
> +        raise
> +    # Skip the first line which is the header.
> +    return [item.split(' ', 1)[0] for item in out.splitlines()[1:]]


