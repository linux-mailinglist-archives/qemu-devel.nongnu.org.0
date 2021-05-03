Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E0E371108
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 06:50:34 +0200 (CEST)
Received: from localhost ([::1]:35896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldQXR-0008Sd-3R
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 00:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldQWF-00082G-Sa
 for qemu-devel@nongnu.org; Mon, 03 May 2021 00:49:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldQWB-0003bj-6E
 for qemu-devel@nongnu.org; Mon, 03 May 2021 00:49:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620017352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j1dUc9tXyEm+n3v2gdTydVj1Qo/VAiSNfI15d+EYvWw=;
 b=g/j2Ymo3GuzBbsA0PVluW5g8suF2Bebbw1pQUCPvqSJe22FwmgWxUFWznRiSMuM7gqICnf
 3+REWAH6fxHAgYJXCVuCDyOaXGZNMctWmj5CFzYtQC3vVfj4I3IAjngL5yyDabD71OQilu
 373Wjv8Igc1p8wbDTaATzUsNB/IJVMg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-HUQjm-PRNp-yEmBrU-ESdQ-1; Mon, 03 May 2021 00:49:11 -0400
X-MC-Unique: HUQjm-PRNp-yEmBrU-ESdQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 4-20020adf91840000b029010d9c088599so3233957wri.10
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 21:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j1dUc9tXyEm+n3v2gdTydVj1Qo/VAiSNfI15d+EYvWw=;
 b=W2G2ONgf/abj7poQoI8Fn9ObGe+LNLIDA8Arj0AAdHC80Z2xoASkjyB24+6WPF8Tpz
 WvJ9hlCSCr6gVtnhqIF4DOA+vi75zIkxFkKq3AlLOIr1p2ettUZLzn338GT2MQBfj99D
 mk7wRtztM0N0xoxHyzO1xB6lkbh28mFsS4k6inxav7p11b4wnuBCK0q2SVHtlZCSzaSd
 SMUWV1y+LTi3knNxCrzlEo4q7agf2XA3O7ePh/rjVWY/Rim3F8Obbb35te6+PiZGXWTB
 Oye2pgsNpKZ2UWqGOpcNvH6pkiQoOqpDqfalwQcGD8szmYTQj7wDkmCQr6YiiKbWCJuI
 gzew==
X-Gm-Message-State: AOAM530Ki54XI7toJ/rhmGDdz4aE7YjwS+CZ4wDyZ1xP/ujJ7kDkNkxc
 WqOYUOyBSO+Q3zscjTEb9uDkawXAqrB2g7devRnZC7bE8vIUrl1K6L+MDBal9ZI7kz+A+2DAoAQ
 KoNDSeJ5tNkq+edQ=
X-Received: by 2002:adf:fc46:: with SMTP id e6mr22293858wrs.169.1620017350122; 
 Sun, 02 May 2021 21:49:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwflNXRlrcD1r2FpfjM0nfy9JKMaDaiFJBAg4T96jz834Ld/oTD4YmV65SITEYBy0HZZwPC7w==
X-Received: by 2002:adf:fc46:: with SMTP id e6mr22293834wrs.169.1620017349930; 
 Sun, 02 May 2021 21:49:09 -0700 (PDT)
Received: from thuth.remote.csb (p5791d0bc.dip0.t-ipconnect.de.
 [87.145.208.188])
 by smtp.gmail.com with ESMTPSA id u2sm19873832wmc.22.2021.05.02.21.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 21:49:09 -0700 (PDT)
Subject: Re: Let's remove some deprecated stuff
To: Alistair Francis <alistair23@gmail.com>,
 Markus Armbruster <armbru@redhat.com>
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
 <CAKmqyKPYu1Y5EaAvVgB9U4kCh4yBJG_75r6ivdvMuZDN6F3ZcQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <17b136e5-5811-27e2-224a-47795eb68bb5@redhat.com>
Date: Mon, 3 May 2021 06:49:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPYu1Y5EaAvVgB9U4kCh4yBJG_75r6ivdvMuZDN6F3ZcQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/05/2021 03.41, Alistair Francis wrote:
> On Thu, Apr 29, 2021 at 8:00 PM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> If you're cc'ed, you added a section to docs/system/deprecated.rst that
>> is old enough to permit removal.  This is *not* a demand to remove, it's
>> a polite request to consider whether the time for removal has come.
>> Extra points for telling us in a reply.  "We should remove, but I can't
>> do it myself right now" is a valid answer.  Let's review the file:
>>
>>      System emulator command line arguments
>>      --------------------------------------
>>
>> Kővágó, Zoltán:
>>
>>      ``QEMU_AUDIO_`` environment variables and ``-audio-help`` (since 4.0)
>>      '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>>
>>      The ``-audiodev`` argument is now the preferred way to specify audio
>>      backend settings instead of environment variables.  To ease migration to
>>      the new format, the ``-audiodev-help`` option can be used to convert
>>      the current values of the environment variables to ``-audiodev`` options.
>>
>> Kővágó, Zoltán:
>>
>>      Creating sound card devices and vnc without ``audiodev=`` property (since 4.2)
>>      ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>>
>>      When not using the deprecated legacy audio config, each sound card
>>      should specify an ``audiodev=`` property.  Additionally, when using
>>      vnc, you should specify an ``audiodev=`` property if you plan to
>>      transmit audio through the VNC protocol.
>>
>> Gerd Hoffmann:
>>
>>      Creating sound card devices using ``-soundhw`` (since 5.1)
>>      ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>>
>>      Sound card devices should be created using ``-device`` instead.  The
>>      names are the same for most devices.  The exceptions are ``hda`` which
>>      needs two devices (``-device intel-hda -device hda-duplex``) and
>>      ``pcspk`` which can be activated using ``-machine
>>      pcspk-audiodev=<name>``.
>>
>> [...]
>>
>> Alistair Francis:
>>
>>      RISC-V ``-bios`` (since 5.1)
>>      ''''''''''''''''''''''''''''
>>
>>      QEMU 4.1 introduced support for the -bios option in QEMU for RISC-V for the
>>      RISC-V virt machine and sifive_u machine. QEMU 4.1 had no changes to the
>>      default behaviour to avoid breakages.
>>
>>      QEMU 5.1 changes the default behaviour from ``-bios none`` to ``-bios default``.
>>
>>      QEMU 5.1 has three options:
>>       1. ``-bios default`` - This is the current default behavior if no -bios option
>>            is included. This option will load the default OpenSBI firmware automatically.
>>            The firmware is included with the QEMU release and no user interaction is
>>            required. All a user needs to do is specify the kernel they want to boot
>>            with the -kernel option
>>       2. ``-bios none`` - QEMU will not automatically load any firmware. It is up
>>            to the user to load all the images they need.
>>       3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmwrae.
>>
> 
> This has already been acted upon in the code, we now default to
> including a "bios" with RISC-V softmmu which is what this is
> describing.
> 
> Do we need to take any action to indicate that it's already in effect?

deprecated.rst is mainly thought for the things that only have been marked 
as deprecated, but not changed yet. Once it's done, the items normally get 
moved to docs/system/removed-features.rst instead.

  Thomas


