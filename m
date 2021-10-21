Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F3943628D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 15:14:01 +0200 (CEST)
Received: from localhost ([::1]:53612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdXtO-0007G0-Vs
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 09:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdXr6-0005ue-EB
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 09:11:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdXr4-0008Kh-Ey
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 09:11:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634821893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CftjE5Nb6DylUlfZ6grrMU5QwF73EESqCQTVwox8PNY=;
 b=UZTUXotVfkPqVbn7Hv0I4aptAOoZK6TWMzBDbWSYYu0fSJDhLvfJ84imjxOVJKG1hB7JTd
 b+v/RSVNydZMTtBq/A2+HwvRF+0axjyPli3U0UDEaFzkJQfKWFEsOB6+VJYa70TcDFLu+N
 mo1JS4XrboQIa+4UZX0ndkvXbel4bI4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-jZnrAWfgMX2HUdxjkbUQCg-1; Thu, 21 Oct 2021 09:11:32 -0400
X-MC-Unique: jZnrAWfgMX2HUdxjkbUQCg-1
Received: by mail-wr1-f70.google.com with SMTP id
 s1-20020adfc541000000b001645b92c65bso173224wrf.6
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 06:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=CftjE5Nb6DylUlfZ6grrMU5QwF73EESqCQTVwox8PNY=;
 b=FXjWu5hgxXb6kadg0aL2MvG0K/BMa0VDKMf0TLssFFwlHhCBgK4v9p2+bTWzIxzUvW
 WVN3nmse3hq5pCVL080/6azz690Ve16AyRQ6dsW7fBlABvQP0AjyYKT3SA9gAm1cSsuw
 DqntehtUDNqBX/yiinEyp5a+Ed5uIEVLo2k4qHBbbjgaHSjVEWoqix23XwCQYqtcWLH5
 ehhy/727OADYGFuuxahURQHeJ1fLQc7sHTRQMbIIgmc2+CKr+SHEyJ5R6FJu4fxUEI2J
 aUs7fZgyuuJl57i9SX8+aymujLG4aKBEId5rv0CiIA4oqzcK02qnq1a1gxTrbllY1p3P
 kQDw==
X-Gm-Message-State: AOAM532qsGZLEgydGgS6HDKqiX6fwrIEaj9GRM4q6nG6rBGfjS694K/B
 iPggStqc2gkWJQOVGtyqwpe1U8jnEMMJhD9Fq6L67tDUMZXtlIoIrBPTRTukIz5km7L6iGUzjog
 L1K/fxzCR5JQ9AI4=
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr7394420wrd.24.1634821890292; 
 Thu, 21 Oct 2021 06:11:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbY8oyDO9bYslSvdaTHxCV+Vio4bl+idnNC7eJ7k/vaMQE8RanwlhGIajan/sxQa83NMo8rg==
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr7394384wrd.24.1634821890046; 
 Thu, 21 Oct 2021 06:11:30 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g8sm4856439wrx.26.2021.10.21.06.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 06:11:29 -0700 (PDT)
Message-ID: <fad02feb-09f3-4ef8-a2eb-bec76e2ee968@redhat.com>
Date: Thu, 21 Oct 2021 15:11:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [gdbstub] redirecting qemu console output to a debugger
To: Sid Manning <sidneym@quicinc.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <BYAPR02MB550976DDDA818CEB090B41C5BEBF9@BYAPR02MB5509.namprd02.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <BYAPR02MB550976DDDA818CEB090B41C5BEBF9@BYAPR02MB5509.namprd02.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.867, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Sid,

Cc'ing maintainers:

$ ./scripts/get_maintainer.pl -f  chardev/char.c
"Marc-André Lureau" <marcandre.lureau@redhat.com> (maintainer:chardev)
Paolo Bonzini <pbonzini@redhat.com> (reviewer:Character device...)

$ ./scripts/get_maintainer.pl -f  gdbstub.c
"Alex Bennée" <alex.bennee@linaro.org> (maintainer:GDB stub)
"Philippe Mathieu-Daudé" <philmd@redhat.com> (reviewer:GDB stub)

On 10/21/21 14:37, Sid Manning wrote:
> Currently when I attach a debugger (lldb) to my qemu session all of the output goes to the shell running qemu not to the debugger.  Fixing this meant that I needed to point the semi-hosting output to the gdb chardev.  I started qemu like this:
> 
> -s -S -semihosting-config target=auto,chardev=ch0 -chardev gdb,id=ch0
> 
> But this failed with the error:
> -chardev gdb,id=ch0: 'gdb' is not a valid char driver name
> 
> In order to fix this I needed to change the stub's chardev from internal to external:
> 
> @@ -3446,7 +3446,7 @@ static void char_gdb_class_init(ObjectClass *oc, void *data)
>  {
>      ChardevClass *cc = CHARDEV_CLASS(oc);
>  
> -    cc->internal = true;
> +    cc->internal = false;
>      cc->open = gdb_monitor_open;
>      cc->chr_write = gdb_monitor_write;
>  }
> 
> Afterward console output was routed to the debugger.  This is the only chardev device I found that is marked as internal so I suspect this is the wrong thing to do.  What is the proper way to redirect output from qemu to the debugger?

commit 777357d758d937c9dd83082c39aff9f1e53e9ba3
Author: Marc-André Lureau <marcandre.lureau@redhat.com>
Date:   Wed Dec 7 18:39:10 2016 +0300

    chardev: qom-ify

    Turn Chardev into Object.

    qemu_chr_alloc() is replaced by the qemu_chardev_new() constructor.
    It will call qemu_char_open() to open/intialize the chardev with the
    ChardevCommon *backend settings.

    The CharDriver::create() callback is turned into a
    ChardevClass::open() which is called from the newly introduced
    qemu_chardev_open().

    "chardev-gdb" and "chardev-hci" are internal chardev and aren't
    creatable directly with -chardev. Use a new internal flag to disable
    them. We may want to use TYPE_USER_CREATABLE interface instead, or
    perhaps allow -chardev usage.

    Although in general we keep typename and macros private, unless
    the type is being used by some other file, in this patch, all types
    and common helper macros for qemu-char.c are in char.h. This is to
    help transition now (some types must be declared early, while some
    aren't shared) and when splitting in several units. This is to be
    improved later.

    Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
    Reviewed-by: Eric Blake <eblake@redhat.com>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

I'm not sure why "chardev-gdb" is internal, maybe because it uses
static state as singleton, so can't be TYPE_USER_CREATABLE?

  static GDBState gdbserver_state;

But TYPE_DBUS_VMSTATE is TYPE_USER_CREATABLE and have:

static void
dbus_vmstate_complete(UserCreatable *uc, Error **errp)
{
    DBusVMState *self = DBUS_VMSTATE(uc);
    g_autoptr(GError) err = NULL;

    if (!object_resolve_path_type("", TYPE_DBUS_VMSTATE, NULL)) {
        error_setg(errp, "There is already an instance of %s",
                   TYPE_DBUS_VMSTATE);
        return;
    }
    ...

So it should be possible to have TYPE_CHARDEV_GDB implement
TYPE_USER_CREATABLE and check for singleton the same way,
then remove the ChardevClass::internal field IMO...

But let see what the maintainers prefer :)

Regards,

Phil.


