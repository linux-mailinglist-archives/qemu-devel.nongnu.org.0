Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F9F79EA5
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 04:25:36 +0200 (CEST)
Received: from localhost ([::1]:57544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsHpX-0005A6-Og
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 22:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48440)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <renyime@gmail.com>) id 1hsHod-0004jI-D0
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 22:24:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <renyime@gmail.com>) id 1hsHoc-00070z-BN
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 22:24:39 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:39593)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <renyime@gmail.com>) id 1hsHoc-00070S-6S
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 22:24:38 -0400
Received: by mail-io1-xd41.google.com with SMTP id f4so124694008ioh.6
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 19:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=72ICqquRQENwv3/hU6ZRqytjmwXItHFkkRfKKtHBzN4=;
 b=svvRqOgMBOxLuKFpZeAXQbmwag19xWqUBsPv6yYJ8/lzDt0JPCa3r6mbMUMDzGJbZ6
 QZTuThMWh7/rsEXZlLRCHW5fZFfjHocZkmFVyu1luhV6vEwvLQcIKjm2RzniEyuzcl/u
 hzwfwP7y1dhy0TWfkamqnq8wqni4RuYriSUScxmGHkfFFFYZQpTthVpdJtEOAkxULnxs
 HvktoO/EMHFusyZ/xt3HA93CpQaOjWE/ylHXVwKrh2UaclN+3c3dAgc1U6qX6dPxH6TZ
 kyL3ryOoQpPFOX1x0mhstRB8RiXpSPI6HF0wBPGIIboYgFAiojtw/suJGBukfLJ2dz6K
 8yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=72ICqquRQENwv3/hU6ZRqytjmwXItHFkkRfKKtHBzN4=;
 b=anjcLP3vd00H/vTpseWTVe/49zE6ZaAjin0JOIU/3bsQGxzfWTnE5EpuOZ59U5hs93
 SFpgXYmVE1jIH/osE/r/hG+jaiO7PStcuHYe9kvtVVdr9R2lA6Pit77eUH56ytSNhV7n
 jLq0tcYd6cN+BEx87V8JuIhzmU8F4PD30QEIfSCt409fPhJx3NE2ufw1TrlpsYfLbVna
 RUr6CQxFjqmvZUJLw5e7q5amxKav6aGDeHL3DJBWF7tXXOJH7lgw3aqCzzCk6pUd0LAz
 UQOG5heU8hDodHjXi83hoj87KPMntt1LNEbZfb+sG+iDdxc6vZxRHbE/AsfS1juDjY+4
 Gd7Q==
X-Gm-Message-State: APjAAAUc3DMAJjdHsQQxfcgniuQ96cJCQOrerZBwZb9gr8/QxKYP7g93
 ayHpjp3wriNtvF5RVOAiMJ86+WFMVo6oTJHIZ6o=
X-Google-Smtp-Source: APXvYqxDIXyolH5xDUfmkBuQwPgHnTziJ64uhf4Ck/zS6cdS1cf9bvQbZav7a03oz0bR0umLKy7qtktVo1oS6eVzbDQ=
X-Received: by 2002:a02:c9d8:: with SMTP id c24mr64510879jap.38.1564453477031; 
 Mon, 29 Jul 2019 19:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <1564387281-12321-1-git-send-email-ivanren@tencent.com>
 <1564387281-12321-4-git-send-email-ivanren@tencent.com>
 <20190730004157.GB17604@richard>
In-Reply-To: <20190730004157.GB17604@richard>
From: Ivan Ren <renyime@gmail.com>
Date: Tue, 30 Jul 2019 10:24:25 +0800
Message-ID: <CA+6E1==NodF8MfSJjdcAe3yBQ-1mkONdks3uD5YWsrf5HvkYAg@mail.gmail.com>
To: Wei Yang <richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d41
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v2 3/3] migration: update ram_counters for
 multifd sync packet
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks
I'll send a new version with these suggest info and review info.

On Tue, Jul 30, 2019 at 8:42 AM Wei Yang <richardw.yang@linux.intel.com>
wrote:

> On Mon, Jul 29, 2019 at 04:01:21PM +0800, Ivan Ren wrote:
> >Multifd sync will send MULTIFD_FLAG_SYNC flag info to destination, add
> >these bytes to ram_counters record.
> >
> >Signed-off-by: Ivan Ren <ivanren@tencent.com>
>
> Also this is suggested by me, it would be better to add Suggested-by.
>
> >---
> > migration/ram.c | 2 ++
> > 1 file changed, 2 insertions(+)
> >
> >diff --git a/migration/ram.c b/migration/ram.c
> >index 88ddd2bbe2..20b6eebb7c 100644
> >--- a/migration/ram.c
> >+++ b/migration/ram.c
> >@@ -1085,6 +1085,8 @@ static void multifd_send_sync_main(RAMState *rs)
> >         p->flags |= MULTIFD_FLAG_SYNC;
> >         p->pending_job++;
> >         qemu_file_update_transfer(rs->f, p->packet_len);
> >+        ram_counters.multifd_bytes += p->packet_len;
> >+        ram_counters.transferred += p->packet_len;
> >         qemu_mutex_unlock(&p->mutex);
> >         qemu_sem_post(&p->sem);
> >     }
> >--
> >2.17.2 (Apple Git-113)
> >
>
> --
> Wei Yang
> Help you, Help me
>
