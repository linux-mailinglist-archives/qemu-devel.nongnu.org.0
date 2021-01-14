Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27AB2F6BC6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 21:07:41 +0100 (CET)
Received: from localhost ([::1]:56876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08uC-0004LR-QX
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 15:07:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l08sK-00032O-KU
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 15:05:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l08sH-00008J-R5
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 15:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610654741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/QG8pJWE23Mer06lSrjQoLgERt9d/+b8JTOcfqPijtY=;
 b=Zk/DEFOEA4ORxfJiB+80EFpbhNyLXf0v7E61CZVDuoAm6swnC9NpGOs+0R8d11SJskgJ7i
 FdycnvOsfl7o4g7JfQJIN8tFBCgNiJPaEVxKnMmrVCi2fu88+X0BZ4Mw2iiiNGy35eiHJZ
 tOKzoWMPJYCu5mf31LqhkTAoy+rpwPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-lrQ4LsylO0GmGUs5RuPXrw-1; Thu, 14 Jan 2021 15:05:39 -0500
X-MC-Unique: lrQ4LsylO0GmGUs5RuPXrw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39C141DDE0
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 20:05:38 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-194.ams2.redhat.com
 [10.36.112.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 033795D9C2;
 Thu, 14 Jan 2021 20:05:36 +0000 (UTC)
Subject: Re: [PATCH 1/2] meson.build: Declare global edk2_targets /
 install_edk2_blobs variables
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114174509.2944817-1-philmd@redhat.com>
 <20210114174509.2944817-2-philmd@redhat.com>
 <a0990c43-c2f9-503d-782e-e4002709e53b@redhat.com>
 <dec726cf-5247-dcbe-914a-a54b0d4b2b03@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <174f3a18-22b2-eb15-f91c-99b690e4fbc1@redhat.com>
Date: Thu, 14 Jan 2021 21:05:36 +0100
MIME-Version: 1.0
In-Reply-To: <dec726cf-5247-dcbe-914a-a54b0d4b2b03@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/14/21 20:57, Philippe Mathieu-Daudé wrote:
> On 1/14/21 8:49 PM, Laszlo Ersek wrote:
>> On 01/14/21 18:45, Philippe Mathieu-Daudé wrote:
>>> Globally declare in the main meson.build:
>>> - the list of EDK2 targets,
>>> - whether the EDK2 blobs have to be installed.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>> Patch trivial to review using 'git-diff --ignore-all-space'
>>> ---
>>>  meson.build                     |  8 ++++++++
>>>  pc-bios/descriptors/meson.build | 30 ++++++++++++++++--------------
>>>  pc-bios/meson.build             |  5 +----
>>>  3 files changed, 25 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index 3d889857a09..ecc45d04d6a 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -88,6 +88,14 @@
>>>    }
>>>  endif
>>>  
>>> +edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu' ]
>>> +install_edk2_blobs = false
>>> +if get_option('install_blobs')
>>> +  foreach target : target_dirs
>>> +    install_edk2_blobs = install_edk2_blobs or target in edk2_targets
>>> +  endforeach
>>> +endif
>>> +
>>>  ##################
>>>  # Compiler flags #
>>>  ##################
>>> diff --git a/pc-bios/descriptors/meson.build b/pc-bios/descriptors/meson.build
>>> index 7040834573d..ac6ec66b007 100644
>>> --- a/pc-bios/descriptors/meson.build
>>> +++ b/pc-bios/descriptors/meson.build
>>> @@ -1,14 +1,16 @@
>>> -foreach f: [
>>> -  '50-edk2-i386-secure.json',
>>> -  '50-edk2-x86_64-secure.json',
>>> -  '60-edk2-aarch64.json',
>>> -  '60-edk2-arm.json',
>>> -  '60-edk2-i386.json',
>>> -  '60-edk2-x86_64.json'
>>> -]
>>> -  configure_file(input: files(f),
>>> -                 output: f,
>>> -                 configuration: {'DATADIR': qemu_datadir},
>>> -                 install: get_option('install_blobs'),
>>> -                 install_dir: qemu_datadir / 'firmware')
>>> -endforeach
>>> +if install_edk2_blobs
>>> +  foreach f: [
>>> +    '50-edk2-i386-secure.json',
>>> +    '50-edk2-x86_64-secure.json',
>>> +    '60-edk2-aarch64.json',
>>> +    '60-edk2-arm.json',
>>> +    '60-edk2-i386.json',
>>> +    '60-edk2-x86_64.json'
>>> +  ]
>>> +    configure_file(input: files(f),
>>> +                   output: f,
>>> +                   configuration: {'DATADIR': qemu_datadir},
>>> +                   install: get_option('install_blobs'),
>>> +                   install_dir: qemu_datadir / 'firmware')
>>> +  endforeach
>>> +endif
>>> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
>>> index fab323af84e..6a341b6cea0 100644
>>> --- a/pc-bios/meson.build
>>> +++ b/pc-bios/meson.build
>>> @@ -1,7 +1,4 @@
>>> -if 'arm-softmmu' in target_dirs or \
>>> -    'aarch64-softmmu' in target_dirs or \
>>> -    'i386-softmmu' in target_dirs or \
>>> -    'x86_64-softmmu' in target_dirs
>>> +if install_edk2_blobs
>>>    bzip2 = find_program('bzip2', required: true)
>>>    fds = [
>>>      'edk2-aarch64-code.fd',
>>>
>>
>> I vaguely understand what this patch does (I haven't followed the meson
>> conversion), but I'm unsure why it does that.
>>
>> Is this patch useful in itself, or only in preparation for patch#2?
> 
> Well, something I forgot to mention is it disable the configure_file()
> calls when arm/aarch64/i386/x86_64-softmmu targets are not selected.
> 
> (currently if you configure a restricted set of targets, such
> --target-list=riscv64-softmmu,ppc-softmmu, it is called, and
> the json descriptors files are installed, even if these targets
> don't require them).
> 

Oof, sorry for missing that.

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Laszlo


