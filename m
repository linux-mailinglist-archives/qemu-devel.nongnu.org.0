Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802913A3439
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 21:42:04 +0200 (CEST)
Received: from localhost ([::1]:44078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrQYw-0002zW-E6
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 15:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lrQXD-0001ME-CD
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 15:40:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lrQX9-0000KL-J9
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 15:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623354004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yzo4oSzeqPBYgPfESv6whtPgfSy6HKYhRS3NDSMi1Y0=;
 b=F2D4YVG2sR/WvQwVIwkia19bHx/JiTQ/cynMruEEJu4MwyhqG3oA4PXL+/jCdROOcKhF9Z
 tUv5erwDbjLbxnfk5dlkpw7xZIGnT6xhfwl+21w+gRgoEpWrrdMjQKnEx3pgN8EzaUzCkR
 fdpUVZSVcylUM2bo+r9fJhktyKDGdtQ=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-OG7mCS92OmaVYUeVhFnFSw-1; Thu, 10 Jun 2021 15:40:03 -0400
X-MC-Unique: OG7mCS92OmaVYUeVhFnFSw-1
Received: by mail-ua1-f69.google.com with SMTP id
 78-20020a9f26540000b02902426fc5ddd3so1414709uag.16
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 12:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yzo4oSzeqPBYgPfESv6whtPgfSy6HKYhRS3NDSMi1Y0=;
 b=OmgteiDQlhb+Z3R6R3XHDwosH5cQly/3SnyzbR+ANT5+ICx30rLoaniz3qxJ1DHWEf
 gedQ9sPMiT6WmYvkrCa9yeS73JCqv6/+ibo0QEpqZyGaVNFeZ820eOD+hdpA542xbaul
 xD2LKbrb2+i8oaJwJR17xWdckm28Q164oXBD3gTz9YUpzaZR4j30eK1MbGdGc6MY2EM9
 Hn3CpfGlBXTD88KnbeN9JcLSQ6nroDUUimE+X1tdly0UBI3teFePfu16+3F+LMfkXURc
 a+8du9CVJJbrWDMq0ymYUSqncAmJDM3p+qtCbqpD/cHdlOGJ7APue8vrGRQYea3/dIVm
 1w9g==
X-Gm-Message-State: AOAM533rfexfeAHDUMFM3Z4u3rZBnVqMLLBNZ0EIaVRIquYPLlnKBSeG
 Hx5kO0g3TuW8PV4dbmDyu9Cst+1UxJEX7ZV4tFHdl3RszFYXfL0FU/piGKD+GE6zV+XwxCdRCCM
 uJqZ9kq00BCEz1fOUwX1geWFLnpuN96U=
X-Received: by 2002:a05:6102:3123:: with SMTP id
 f3mr1420356vsh.50.1623354002497; 
 Thu, 10 Jun 2021 12:40:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF3GTXxyLLjBgTbaqvwnTGjFbcX5EiUQdt1z8DHwsYCbKOvhHE7qX5hcdZJOYRzD4/ZY3m9LUq/Zq2qdKwyFA=
X-Received: by 2002:a05:6102:3123:: with SMTP id
 f3mr1420332vsh.50.1623354002197; 
 Thu, 10 Jun 2021 12:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210608140938.863580-1-crosa@redhat.com>
 <20210608140938.863580-3-crosa@redhat.com>
 <f2c7ab9f-27b4-aa04-75f5-fcb8a36a4668@redhat.com>
 <CA+bd_6J-eA_VXyJZHEe3WiS2Cged+C=Ugs5YOGv4k01aczRAZw@mail.gmail.com>
In-Reply-To: <CA+bd_6J-eA_VXyJZHEe3WiS2Cged+C=Ugs5YOGv4k01aczRAZw@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 10 Jun 2021 16:39:35 -0300
Message-ID: <CAKJDGDbjwpVMWCPBnBay=-AkA6rwXYWKYxXA3npmm84DKsWp1g@mail.gmail.com>
Subject: Re: [PATCH 2/4] Python QEMU utils: introduce a generic feature list
To: Cleber Rosa Junior <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 8, 2021 at 8:55 PM Cleber Rosa Junior <crosa@redhat.com> wrote:
>
>
>
> On Tue, Jun 8, 2021 at 5:42 PM Wainer dos Santos Moschetta <wainersm@redh=
at.com> wrote:
>>
>> Hi,
>>
>> On 6/8/21 11:09 AM, Cleber Rosa wrote:
>> > Which can be used to check for any "feature" that is available as a
>> > QEMU command line option, and that will return its list of available
>> > options.
>> >
>> > This is a generalization of the list_accel() utility function, which
>> > is itself re-implemented in terms of the more generic feature.
>> >
>> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> > ---
>> >   python/qemu/utils/__init__.py |  2 ++
>> >   python/qemu/utils/accel.py    | 15 ++----------
>> >   python/qemu/utils/feature.py  | 44 +++++++++++++++++++++++++++++++++=
++
>> >   3 files changed, 48 insertions(+), 13 deletions(-)
>> >   create mode 100644 python/qemu/utils/feature.py
>> >
>> > diff --git a/python/qemu/utils/__init__.py b/python/qemu/utils/__init_=
_.py
>> > index 7f1a5138c4..1d0789eaa2 100644
>> > --- a/python/qemu/utils/__init__.py
>> > +++ b/python/qemu/utils/__init__.py
>> > @@ -20,12 +20,14 @@
>> >
>> >   # pylint: disable=3Dimport-error
>> >   from .accel import kvm_available, list_accel, tcg_available
>> > +from .feature import list_feature
>> >
>> >
>> >   __all__ =3D (
>> >       'get_info_usernet_hostfwd_port',
>> >       'kvm_available',
>> >       'list_accel',
>> > +    'list_feature',
>> >       'tcg_available',
>> >   )
>> >
>> > diff --git a/python/qemu/utils/accel.py b/python/qemu/utils/accel.py
>> > index 297933df2a..b5bb80c6d3 100644
>> > --- a/python/qemu/utils/accel.py
>> > +++ b/python/qemu/utils/accel.py
>> > @@ -14,13 +14,11 @@
>> >   # the COPYING file in the top-level directory.
>> >   #
>> >
>> > -import logging
>> >   import os
>> > -import subprocess
>> >   from typing import List, Optional
>> >
>> > +from qemu.utils.feature import list_feature
>> >
>> > -LOG =3D logging.getLogger(__name__)
>> >
>> >   # Mapping host architecture to any additional architectures it can
>> >   # support which often includes its 32 bit cousin.
>> > @@ -39,16 +37,7 @@ def list_accel(qemu_bin: str) -> List[str]:
>> >       @raise Exception: if failed to run `qemu -accel help`
>> >       @return a list of accelerator names.
>> >       """
>> > -    if not qemu_bin:
>> > -        return []
>> > -    try:
>> > -        out =3D subprocess.check_output([qemu_bin, '-accel', 'help'],
>> > -                                      universal_newlines=3DTrue)
>> > -    except:
>> > -        LOG.debug("Failed to get the list of accelerators in %s", qem=
u_bin)
>> > -        raise
>> > -    # Skip the first line which is the header.
>> > -    return [acc.strip() for acc in out.splitlines()[1:]]
>> > +    return list_feature(qemu_bin, 'accel')
>> >
>> >
>> >   def kvm_available(target_arch: Optional[str] =3D None,
>> > diff --git a/python/qemu/utils/feature.py b/python/qemu/utils/feature.=
py
>> > new file mode 100644
>> > index 0000000000..b4a5f929ab
>> > --- /dev/null
>> > +++ b/python/qemu/utils/feature.py
>> > @@ -0,0 +1,44 @@
>> > +"""
>> > +QEMU feature module:
>> > +
>> > +This module provides a utility for discovering the availability of
>> > +generic features.
>> > +"""
>> > +# Copyright (C) 2022 Red Hat Inc.
>> Cleber, please, tell me how is the future like! :)
>
>
> I grabbed a sports almanac.  That's all I can say. :)
>
> Now seriously, thanks for spotting the typo.
>
>>
>> > +#
>> > +# Authors:
>> > +#  Cleber Rosa <crosa@redhat.com>
>> > +#
>> > +# This work is licensed under the terms of the GNU GPL, version 2.  S=
ee
>> > +# the COPYING file in the top-level directory.
>> > +#
>> > +
>> > +import logging
>> > +import subprocess
>> > +from typing import List
>> > +
>> > +
>> > +LOG =3D logging.getLogger(__name__)
>> > +
>> > +
>> > +def list_feature(qemu_bin: str, feature: str) -> List[str]:
>> > +    """
>> > +    List available options the QEMU binary for a given feature type.
>> > +
>> > +    By calling a "qemu $feature -help" and parsing its output.
>>
>> I understand we need a mean to easily cancel the test if given feature
>> is not present. However, I'm unsure this generic list_feature() is what
>> we need.
>>
>> The `-accel help` returns a simple list of strings (besides the header,
>> which is dismissed). Whereas `-machine help` returns what could be
>> parsed as a tuple of (name, description).
>>
>> Another example is `-cpu help` which will print a similar list as
>> `-machine`, plus a section with CPUID flags.
>>
>
> I made sure it worked with both "accel" and "machine", but you're right a=
bout many other "-$feature help" that won't conform to the mapping ("-chard=
ev help" is probably the only other one that should work).  What I thought =
about was to keep the same list_feature(), but make its parsing of items fl=
exible.  Then it could be reused for other list_$feature() like methods.  A=
t the same time, it could be an opportunity to standardize a bit more of th=
e "help" outputs.
>
> For instance, I think it would make sense for "cpu" to keep showing the a=
mount of information it shows, but:
>
> 1) The first item could be the name of the relevant "option" (the cpu mod=
el) for that feature (cpu), instead of, say, "x86". Basically reversing the=
 order of first and second, or first and third fields.
> 2) Everything *after* an empty line would be extra information, not neces=
sarily an option available for that feature.
>
> But, this is most probably not going to be achieved in the short term.
>
> What I can do here, is to hide list_feature(), say call it _list_feature(=
) so that we don't duplicate code, and expose a list_machine().

I have reviewed the code and it looks good to me, but +1 for
`list_machine()` and other `list_<specific>` functions. We can handle
different cases on its own function and make it easier to use.

>
> Let me know what you think.
>
> Thanks,
> - Cleber.
>
>>
>> If confess I still don't have a better idea, although I feel it will
>> require a OO design.
>>
>> Thanks!
>>
>> - Wainer
>>
>> > +
>> > +    @param qemu_bin (str): path to the QEMU binary.
>> > +    @param feature (str): feature name, matching the command line opt=
ion.
>> > +    @raise Exception: if failed to run `qemu -feature help`
>> > +    @return a list of available options for the given feature.
>> > +    """
>> > +    if not qemu_bin:
>> > +        return []
>> > +    try:
>> > +        out =3D subprocess.check_output([qemu_bin, '-%s' % feature, '=
help'],
>> > +                                      universal_newlines=3DTrue)
>> > +    except:
>> > +        LOG.debug("Failed to get the list of %s(s) in %s", feature, q=
emu_bin)
>> > +        raise
>> > +    # Skip the first line which is the header.
>> > +    return [item.split(' ', 1)[0] for item in out.splitlines()[1:]]
>>


