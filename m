Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EF8E0D63
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 22:41:35 +0200 (CEST)
Received: from localhost ([::1]:44224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iN0yE-0007Rz-7A
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 16:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46790)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iN0wx-0006bE-EZ
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 16:40:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iN0wv-0003EC-KT
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 16:40:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43342
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iN0wv-0003Dv-D7
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 16:40:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571776811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1FfLdU1bYtMC5WDl8iivrnpDaIU5b/Yck0Rr/byTFAs=;
 b=dKyjJMVaCCl/a0otNOfeBP8kx2a1nOzCENygNR4fPe6uIEjntakXbc6QwRtZbkFn9xUjnf
 Liq1LTxny/W/5Xp2/EaIDd29WKCsz7ZmiohXXsL9gK3vgHval0Q7UkAF2SnyWScT8TgHUi
 gfDBpCutTzks46rF5nd5ABBpUcOogYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-TmzJscmtN_yNcXV4BToUww-1; Tue, 22 Oct 2019 16:40:09 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D0E247B;
 Tue, 22 Oct 2019 20:40:08 +0000 (UTC)
Received: from [10.3.117.0] (ovpn-117-0.phx2.redhat.com [10.3.117.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB5C85D6A9;
 Tue, 22 Oct 2019 20:40:04 +0000 (UTC)
Subject: Re: [RFC PATCH] iothread: add set_iothread_poll_* commands
To: "yezhenyu (A)" <yezhenyu2@huawei.com>, stefanha@redhat.com,
 pbonzini@redhat.com, dgilbert@redhat.com
References: <5DAEB9D3.3080503@huawei.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <95fde68e-9730-ce22-b59d-c5e20f86d0c1@redhat.com>
Date: Tue, 22 Oct 2019 15:40:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <5DAEB9D3.3080503@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: TmzJscmtN_yNcXV4BToUww-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: jiangyiwen <jiangyiwen@huawei.com>, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/22/19 3:12 AM, yezhenyu (A) wrote:
> Since qemu2.9, QEMU added three AioContext poll parameters to struct
> IOThread: poll_max_ns, poll_grow and poll_shrink. These properties are
> used to control iothread polling time.
>=20
> However, there isn't properly hmp commands to adjust them when the VM is
> alive. It's useful to adjust them online when observing the impact of
> different property value on performance.
>=20
> This patch add three hmp commands to adjust iothread poll-* properties
> for special iothread:
>=20
> set_iothread_poll_max_ns: set the maximum polling time in ns;
> set_iothread_poll_grow: set how many ns will be added to polling time;
> set_iothread_poll_shrink: set how many ns will be removed from polling
> time.
>=20
> Signed-off-by: Zhenyu Ye <yezhenyu2@huawei.com>
> ---
> hmp-commands.hx | 42 ++++++++++++++++++++
> hmp.c | 30 +++++++++++++++
> hmp.h | 3 ++
> include/sysemu/iothread.h | 6 +++
> iothread.c | 80 +++++++++++++++++++++++++++++++++++++++
> qapi/misc.json | 23 +++++++++++
> 6 files changed, 184 insertions(+)

Looking at just the QMP...

> +++ b/qapi/misc.json
> @@ -675,6 +675,29 @@
> { 'command': 'query-iothreads', 'returns': ['IOThreadInfo'],
> 'allow-preconfig': true }
>=20
> +##
> +# @set-iothread-poll-param:
> +#
> +# Set poll-* properties for a special iothread.
> +# The poll-* name can be poll_max_ns/poll_grow/poll_shrink.

This should be an enum.

> +#
> +# Notes: can not set the QEMU main loop thread, which is not declared
> +# using the -object iothread command-line option. The poll_ns property c=
an not
> +# be set manually, which is auto-adjust.

You failed to document the parameters (iothread_id, name, value).

> +#
> +# Example:
> +#
> +# -> { "execute": "set-iothread-poll-param",
> +# "arguments": { "iothread_id": "1",
> +# "name": "poll_max_ns",
> +# "value": 1000 } }
> +# <- { "return": {} }
> +#
> +# Since 3.0

4.2 is the earliest this can make it in.

> +##
> +{ 'command': 'set-iothread-poll-param',
> + 'data': {'iothread_id': 'str', 'name': 'str', 'value': 'int'} }

Our naming convention prefers 'iothread-id'.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


