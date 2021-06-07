Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759D939DD2A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 14:58:48 +0200 (CEST)
Received: from localhost ([::1]:48698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqEq7-0007Bz-5I
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 08:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lqEpH-0006VA-Gx
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 08:57:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lqEpE-0008Oz-QA
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 08:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623070671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4mRXFW89hudJjd17BunlQ3pb8vnhH0uL56LJbmoJtJg=;
 b=hgKhumLNgNqkxR/safy5z36NJ4JCQrda/sU2jYlZ569vzJ0G4BL4Bv0/kRkeetm6fNuE6p
 adzuAlcuM30IfoM6G710IWX5NLA41m/Pra7CHSMtj+zcfyTBU11HoH4EHk8vBCd5HXXxoG
 W2IPNBEQt4J2Us2gmBIkzl/NHVSd5dI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-Ck8yagjZOOSdfPWlAFym7w-1; Mon, 07 Jun 2021 08:57:46 -0400
X-MC-Unique: Ck8yagjZOOSdfPWlAFym7w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D30D801B14;
 Mon,  7 Jun 2021 12:57:45 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-75.ams2.redhat.com
 [10.36.114.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ABE15D9C0;
 Mon,  7 Jun 2021 12:57:43 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH] configure: Define NCURSES_WIDECHAR if we're
 using curses
To: Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
References: <1496414138-7622-1-git-send-email-peter.maydell@linaro.org>
 <5b59b9d2-8b9c-e204-098f-b540f8bd1117@weilnetz.de>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <32204168-460d-237c-c542-1a1f3757db6d@redhat.com>
Date: Mon, 7 Jun 2021 14:57:41 +0200
MIME-Version: 1.0
In-Reply-To: <5b59b9d2-8b9c-e204-098f-b540f8bd1117@weilnetz.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, patches@linaro.org,
 =?UTF-8?Q?Rainer_M=c3=bcller?= <raimue@codingfarm.de>,
 Chad Joan <chadjoan@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/06/21 20:13, Stefan Weil wrote:
> Am 02.06.17 um 16:35 schrieb Peter Maydell:
> 
>> We want the wide character functions from the ncurses header.
>> Unfortunately it doesn't provide them by default, but only
>> if either:
>>   * NCURSES_WIDECHAR is defined (for ncurses 20111030 and up)
>>   * _XOPEN_SOURCE/_XOPEN_SOURCE_EXTENDED are suitably defined
>>
>> So far we have been implicitly relying on the latter, because
>> for GNU libc when we define _GNU_SOURCE this causes libc
>> to define the _XOPEN_SOURCE macros for us. Unfortunately
>> this doesn't work on all libcs, because some (like OSX and
>> musl libc) do not define _XOPEN_SOURCE when _GNU_SOURCE
>> is defined.
>>
>> We can't fix this by defining _XOPEN_SOURCE ourselves, because
>> that also means "and don't provide any functions that aren't in
>> that standard", and not all libcs provide any way to override
>> that to also get the non-standard functions. In particular
>> FreeBSD has no such mechanism, and OSX's _DARWIN_C_SOURCE
>> doesn't reenable everything (for instance getpagesize()
>> is still not prototyped if _DARWIN_C_SOURCE and _XOPEN_SOURCE
>> are both defined).
>>
>> So we have to define NCURSES_WIDECHAR. (This will only work
>> if your ncurses is at least 20111030, as older versions
>> don't honour this macro.)
> 
> 
> I answer to this very old e-mail because I noticed today that defining
> NCURSES_WIDECHAR does not work with the latest MacOS on M1:
> 
> Apple still delivers a curses.h which indicates NCURSES_VERSION "5.7"
> (20081102). It does not know NCURSES_WIDECHAR, but support for curses
> can be enabled with _XOPEN_SOURCE_EXTENDED=1.
> 
> I used this patch for git master:
> 
> diff --git a/meson.build b/meson.build
> index 626cf932c1..513332a76d 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -606,7 +606,7 @@ if have_system and not get_option('curses').disabled()
>      endif
>    endforeach
>    msg = get_option('curses').enabled() ? 'curses library not found' : ''
> -  curses_compile_args = ['-DNCURSES_WIDECHAR']
> +  curses_compile_args = ['-DNCURSES_WIDECHAR',
> '-D_XOPEN_SOURCE_EXTENDED=1']
>    if curses.found()
>      if cc.links(curses_test, args: curses_compile_args, dependencies:
> [curses])
>        curses = declare_dependency(compile_args: curses_compile_args,
> dependencies: [curses])
> 
> 
> Then curses is detected and works when configure is given the right
> PKG_CONFIG_PATH:
> 
> PKG_CONFIG_PATH=/opt/homebrew/Library/Homebrew/os/mac/pkgconfig/11
> ./configure

_XOPEN_SOURCE_EXTENDED is only supposed to make a difference in SUSv2.
If MacOS needs it, whatever, but I don't view it as a good idea for any
other host OS.

Just my two cents, since I've been CC'd.

Laszlo


