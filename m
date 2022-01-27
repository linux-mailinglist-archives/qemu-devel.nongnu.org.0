Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D0C49E3DF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 14:52:03 +0100 (CET)
Received: from localhost ([::1]:41790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5Bz-0007Pa-4Y
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 08:52:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD59J-0005hX-CN
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 08:49:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD59C-000701-0H
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 08:49:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643291347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LJWP9+EHu4SKX8Jm9vZuNaXjdgRE+OV3tD6/rAGy8kA=;
 b=IYuekYcBFaU5XqZwZ3Of+f3Rq6SVt9IRSU5vJ1biPJfvUxjzdmGqFPy30A6PVrNFdfgEvb
 JOr1hombJlGDa22hSNO94Z9YUj8JuqWIqw1hHF0Ip/kfdUviSzAi/ZU2/q9VSZSDvcFpaZ
 zApUpkWR+Ndw/YieQ/GCGYwn7sLYyoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-pUzEH1U9NpWOXCrzjaxSRg-1; Thu, 27 Jan 2022 08:49:04 -0500
X-MC-Unique: pUzEH1U9NpWOXCrzjaxSRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22A7118B9F03;
 Thu, 27 Jan 2022 13:49:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26FA67D710;
 Thu, 27 Jan 2022 13:48:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AC89E113864A; Thu, 27 Jan 2022 14:48:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] schemas: add missing vim modeline
References: <20211220145624.52801-1-victortoso@redhat.com>
 <87lez1bfhr.fsf@linaro.org>
Date: Thu, 27 Jan 2022 14:48:57 +0100
In-Reply-To: <87lez1bfhr.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Thu, 27 Jan 2022 11:07:46 +0000")
Message-ID: <87h79pp9va.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Blake <eblake@redhat.com>, Victor Toso <victortoso@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Victor Toso <victortoso@redhat.com> writes:
>
>> Similar to f7160f3218 "schemas: Add vim modeline"
>>
>> Signed-off-by: Victor Toso <victortoso@redhat.com>
>> ---
>>  qapi/audio.json  | 1 +
>>  qapi/compat.json | 1 +
>>  qapi/replay.json | 1 +
>>  qapi/trace.json  | 1 +
>>  4 files changed, 4 insertions(+)
>>
>> diff --git a/qapi/audio.json b/qapi/audio.json
>> index 9cba0df8a4..fe3b506ec3 100644
>> --- a/qapi/audio.json
>> +++ b/qapi/audio.json
>> @@ -1,4 +1,5 @@
>>  # -*- mode: python -*-
>> +# vim: filetype=3Dpython
>
> I realise we have Emacs mode annotations here as well and I'm not going
> to start a holy war but I thought we used .editorconfig to avoid messing
> directly with the individual files. So something like:
>
>   [*.json]
>   indent_style =3D space
>   emacs_mode =3D python
>   vim_filetype =3D python
>
> should also do the job.

Most schema files have lines for both Emacs and vim.  Some have only the
former, and this patch adds the latter to them.  Seems fair to me.

Perhaps we could get rid of them all instead.  As far as I can tell,
.editorconfig doesn't work for stock Emacs out of the box, though.


