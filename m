Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9D83B0972
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:44:58 +0200 (CEST)
Received: from localhost ([::1]:39526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvia8-0003bo-UI
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lviZ5-0002Rq-DR
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:43:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lviZ1-0002Hx-LO
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624376627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ADzJDPuEwP98wT36zXm16Uoxm5ZtT/koCTDGza/FYg=;
 b=epf9FF1v9O+iT7dMcmJgyGZjcDsGoGeITfpDp8P7/AmcnSlHL0q0o0w0NE3Oow4H8rLsdJ
 KZSaxW8x8OKFPrSz5WF5A3WdxS7WLjt9goZALt6BHqUTTZR3PDWp7d8PegXEi+mZ2lZ8fy
 mkano6scoQZOWOr1lsA7AKOD3DgUzg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322--obpgjEXP5uiIqco9FPATQ-1; Tue, 22 Jun 2021 11:43:43 -0400
X-MC-Unique: -obpgjEXP5uiIqco9FPATQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 819AC804143;
 Tue, 22 Jun 2021 15:43:42 +0000 (UTC)
Received: from [10.10.118.71] (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 293495D6AD;
 Tue, 22 Jun 2021 15:43:32 +0000 (UTC)
Subject: Re: [PATCH 2/4] Python QEMU utils: introduce a generic feature list
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210608140938.863580-1-crosa@redhat.com>
 <20210608140938.863580-3-crosa@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <474df81f-e061-2110-1a17-bbad4a8d0038@redhat.com>
Date: Tue, 22 Jun 2021 11:43:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608140938.863580-3-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 10:09 AM, Cleber Rosa wrote:
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
> 

It's messy stuff, but all of machine.py is pretty messy stuff right now. 
No real qualms with more messy stuff going into qemu.utils for the time 
being.

Eventually, we will want to come up with a more universal way to 
interrogate features present in QEMU binaries. Using introspection data 
or QMP queries would be my preferred (and ideally SOLE) way to detect 
QEMU features.

But that's something to worry about later, I suppose.

As long as it passes the CI and doesn't break any tests, I'll toss you 
my ACK here and trust your judgment:

Acked-by: John Snow <jsnow@redhat.com>

--js


