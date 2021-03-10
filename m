Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E103343B9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:54:08 +0100 (CET)
Received: from localhost ([::1]:45752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK263-0003MX-VS
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:54:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lK1M8-0000iQ-PJ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:06:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lK1M6-0005gO-Pq
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615392397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mX3l5qwdH/+aWeskGwyEjL5wfjz+higTTweVhP1RlPU=;
 b=FtANUiSxRsyD6wlA7Tx0ChI5vlsygi9mrDYnbHpArEIoQ2FCy/H2vaAPqR204sxfAP/Kvl
 Mx9Xu1uc/8UdJDDLbnurY6zfUxrZ4IIvAAsoI8TFzbSrv2q8AYdJrbKRQDkBTD071hpHS2
 BHaXDhjzWkflfwklvMULKHX+1lbUonA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-reytUPqbOFuPhpuYCveXEw-1; Wed, 10 Mar 2021 11:06:35 -0500
X-MC-Unique: reytUPqbOFuPhpuYCveXEw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD7056D4E1;
 Wed, 10 Mar 2021 16:06:34 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05FC917B37;
 Wed, 10 Mar 2021 16:06:32 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>
References: <20210309165035.967853-1-thuth@redhat.com>
 <87y2ev2lmr.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] usb: Un-deprecate -usbdevice (except for -usbdevice
 audio which gets removed)
Message-ID: <23db3eef-7b13-62cb-a164-12d82b763886@redhat.com>
Date: Wed, 10 Mar 2021 17:06:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87y2ev2lmr.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/2021 14.17, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> When trying to remove the -usbdevice option, there were complaints that
>> "-usbdevice braille" is still a very useful shortcut for some people.
> 
> Pointer?  I missed it.
> 
>> Thus we never remove this option. Since it's not such a big burden to
>> keep it around, and it's also convenient in the sense that you don't
>> have to worry to enable a host controller explicitly with this option,
>> we should remove it from he deprecation list again, and rather properly
>> document the possible device for this option instead.
>>
>> However, there is one exception: "-usbdevice audio" should go away, since
>> audio devices without "audiodev=..." parameter are also on the deprecation
>> list and you cannot use "-usbdevice audio" with "audiodev".
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> To be frank, I don't like this.  At all.
> 
> -usbdevice comes with its own ad hoc mini-language, parsed by
> usbdevice_create().  Syntax is DRIVER[:PARAMS], where PARAMS defaults to
> "" and is parsed by an optional DRIVER-specific LegacyUSBFactory.

Oh, there is still parameter parsing code left? I thought we'd remove it 
after removing the other legacy devices that actually took parameters... so 
yes, at least the parameter-related code in usbdevice_create() should go 
away, too.

> We already dropped multiple drivers: "host", "serial", "disk", "net"
> (commit 99761176e, v2.12), and "bt" (commit 43d68d0a9, v5.0).

Right, these were the really ugly ones that used their own parameter parsing 
code.

> We've kept "audio" (dropped in this patch), "tablet", "mouse",
> "keyboard", "braille", "ccid", and "wacom-tablet".  Only "mouse",
> "tablet", "braille" are documented (fixed in this patch).
> 
> One more has crept in: "u2f-key" (commit bb014a810, v5.2).  It's buggy:
> 
>      $ qemu-system-x86_64 -S -usbdevice u2f-key
>      qemu-system-x86_64: -usbdevice u2f-key: '-usbdevice' is deprecated, please use '-device usb-...' instead
>      **
>      ERROR:../qom/object.c:508:object_initialize_with_type: assertion failed: (type->abstract == false)
>      Bail out! ERROR:../qom/object.c:508:object_initialize_with_type: assertion failed: (type->abstract == false)
>      Aborted (core dumped)
> 
> Broken right in the commit that added the stuff.  The sugar never
> worked, and should be taken out again.

Ouch, that should get removed again immediately, of course.

> Without a factory, "-usbdevice BAR" is sugar for
> 
>      -device BAZ -machine usb=on
> 
> "braille" is the only driver with a factory.  "-usbdevice braille" is
> sugar for
> 
>    -device usb-braille,chardev=braille -chardev braille,id=braille
>    -machine usb=on
> 
> It's buggy:
> 
>      $ qemu-system-x86_64 -S -usbdevice braille
>      qemu-system-x86_64: -usbdevice braille: '-usbdevice' is deprecated, please use '-device usb-...' instead
> [three seconds tick by...]
>      Segmentation fault (core dumped)

That's a separate issue.

> It neglects to actually parse PARAMS:
> 
>      $ qemu-system-x86_64 -S -usbdevice braille:"I'm a Little Teapot"
>      qemu-system-x86_64: -usbdevice braille:I'm a Little Teapot: '-usbdevice' is deprecated, please use '-device usb-...' instead
> [three seconds tick by...]
>      Segmentation fault (core dumped)
> 
> The whole machinery in support of optional PARAMS has long become
> useless.

Right, we should get rid of the remainders of parameter parsing here.

> I fail to see why we could drop the sugar for serial, disk, net and host
> devices, but not for the others.
 >
> The only one that has something approaching a leg to stand on is
> braille.  Still, I fail to see why having to specify a backend is fine
> for any number of other devices, but not for braille.

As explained in the mails from Samuel and Paolo, it's still used out there, 
so we should not break this without an easy replacement.

Gerd, can you please un-queue my patch again. I'll rework it wrt. u2f-key 
and the legacy parameter parsing code.

  Thomas


