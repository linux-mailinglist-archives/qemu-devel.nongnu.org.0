Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8771316C399
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 15:14:38 +0100 (CET)
Received: from localhost ([::1]:57482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6ayr-0007dv-Hs
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 09:14:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46359)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanrin@gmail.com>) id 1j6ax3-00055H-0D
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 09:12:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanrin@gmail.com>) id 1j6ax1-0007pz-1V
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 09:12:43 -0500
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:33600)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanrin@gmail.com>)
 id 1j6awy-0007oQ-Rm; Tue, 25 Feb 2020 09:12:41 -0500
Received: by mail-il1-x133.google.com with SMTP id s18so10917700iln.0;
 Tue, 25 Feb 2020 06:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=tRAPXMCF17Bm+gpz8ZUoUHJqmrUw89mStx91TxrBdwU=;
 b=LtcCxBLrIGY8nYxp1X/mZiBHGTmwWAIMg+cTgfREevPELa9q+CpUog1xApDWKfoDeR
 //mDwO5ilzXOfXzSJbthnIOSxAmyz+z+424GzQeXWNVTrMv4Aasb3BxhjrXstm6PiWii
 HBn40TAZBQkLsOoKUM3sNFflSLrdrpNulhHObee2RunHbrs/oMLFU5jcO7ybTAjV+AW7
 tkK49ZBsvOxtY9l1xxgU5ZQhyRTWEBS0rDb2MIDzwQokUI3E8DbmiDMZxGOVW5yB6uCt
 PNmR6UCVlnV2V8l/6xswY1LWcULdORoqAwqp/i5JysCO979hJiMHF/CE5aiI6D0xgxaH
 6rBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=tRAPXMCF17Bm+gpz8ZUoUHJqmrUw89mStx91TxrBdwU=;
 b=q61JUGUwBVhwjUT/46zx6KHycOlLfFgdzL5l1aLaqc/V2CRyAPBXc/xtPf3RRRE/qE
 Zb+76RukVm6seq5tIOHg296IGZ2PNmxLir1QUP5flxXVULuIkf4kee8/iBgqG8lc5umF
 qcKTsW2bJ9Lit/MAmlj/MmXb/e9Rf5QvLR/z2uRJ7H3OKweRVjEVL07+nhCwVlDkYnmw
 HYcxeZSDq3i4KKAJSFaKCZOzE9AaemYMSrLCVCRuhemGIsLmX3WEydUBJ9Eu+hUoNY/L
 vIXSyJctAMJSVR3eNt80RMmkQvhnIBQmwi2LnSMnZ6QR7PXjOBeiYuQIQZ1O6CSKbT2H
 ps7w==
X-Gm-Message-State: APjAAAXBlskEV8qX//txzU3VHla6wctSlkE0bY7Zr0JjJMYbEw1lZ9iP
 SMAS4uIDHB96rEaxtMzKsHFAIj8wpX79EYb4VRnykQ==
X-Google-Smtp-Source: APXvYqwz+vJjFU8zdFaflkSaN/JoCFP+x54Jird/jRH4W5QNbHWDHOxfbAPPWi0X7BFlax3Vcmn+zLCuXyWQG9kkwps=
X-Received: by 2002:a92:844b:: with SMTP id l72mr66275392ild.262.1582639959158; 
 Tue, 25 Feb 2020 06:12:39 -0800 (PST)
MIME-Version: 1.0
References: <CAAxjCEzHQz4cG_8m7S6=CwCBoN5daQs+KVyuU5GL5Tq3Bky1NA@mail.gmail.com>
 <CAAxjCEx79Fkjw9tFbSMo+b1LGv2LNivLRXf1GS9JsYnXrNVVkQ@mail.gmail.com>
In-Reply-To: <CAAxjCEx79Fkjw9tFbSMo+b1LGv2LNivLRXf1GS9JsYnXrNVVkQ@mail.gmail.com>
From: Stefan Ring <stefanrin@gmail.com>
Date: Tue, 25 Feb 2020 15:12:27 +0100
Message-ID: <CAAxjCEwv61e87ZUz-jueL9AkzaNbY3pRoFmf2dah-p9W8nosWA@mail.gmail.com>
Subject: Re: Strange data corruption issue with gluster (libgfapi) and ZFS
To: qemu-block@nongnu.org, qemu-devel@nongnu.org, integration@gluster.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::133
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 24, 2020 at 1:35 PM Stefan Ring <stefanrin@gmail.com> wrote:
>
> What I plan to do next is look at the block ranges being written in
> the hope of finding overlaps there.

Status update:

I still have not found out what is actually causing this. I have not
found concurrent writes to overlapping file areas. But what I can say
is that by switching qemu_gluster_co_rw to the synchronous glusterfs
api (glfs_pwritev), the problem goes away.

Unfortunately, I have not yet been able to find exactly how the qcow2
file is grown. It looks like this happens just as a consequence of
writing beyond the end. Because contrary to my expectations, neither
qemu_gluster_co_pwrite_zeroes nor qemu_gluster_do_truncate is ever
called. My current line of thinking is that there must be something
special about in-flight writes which grow the file.

I find many instances with the following pattern:

current file length (= max position + size written): p
write request n writes from (p + hole_size), thus leaving a hole
request n+1 writes exactly hole_size, starting from p, thus completely
filling the hole
The two requests' in-flight times overlap.
hole_size can be almost any value (7-127).

I see fewer data errors than instances of this pattern though.

