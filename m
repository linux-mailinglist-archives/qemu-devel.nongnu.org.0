Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9682A429CBF
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 06:50:09 +0200 (CEST)
Received: from localhost ([::1]:51022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma9js-0002ng-Aw
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 00:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ma9ir-00028i-TL
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 00:49:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ma9io-0004cA-8l
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 00:49:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634014140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jjiBF4XLl3AOBEsGy3g3FRU9+8PTu/iuT7dDiswxn8A=;
 b=h8sQqlMRO6Bl/4p2XHvY2tsb/An3hZSERNdEa+JdeyjzcXCQeO7OyGkZdBsCMb7kYEtqWk
 DFAnLinpOEui0ZBBcskWoY+FQwh0t1WdJCAl43OjKLFm7ZldTMtgq86Txwpw3d+6/Xb4Ut
 3CCjhe6dKLgGLidZWaXkHXSJe32HI7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-in3dfkkWNKGiHBfpllRRYg-1; Tue, 12 Oct 2021 00:48:57 -0400
X-MC-Unique: in3dfkkWNKGiHBfpllRRYg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E4A91006AA2;
 Tue, 12 Oct 2021 04:48:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8604F19723;
 Tue, 12 Oct 2021 04:48:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 07D5B113865F; Tue, 12 Oct 2021 06:48:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] Trim some trailing space from human-readable output
References: <20211009152401.2982862-1-armbru@redhat.com>
 <a3e15dc2-5c33-d785-7bb8-b70e1722ce3f@redhat.com>
Date: Tue, 12 Oct 2021 06:48:48 +0200
In-Reply-To: <a3e15dc2-5c33-d785-7bb8-b70e1722ce3f@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 12 Oct 2021 00:28:06
 +0200")
Message-ID: <87wnmionkf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: jiri@resnulli.us, ehabkost@redhat.com, david@redhat.com, groug@kaod.org,
 qemu-devel@nongnu.org, jcmvbkbc@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 10/9/21 17:24, Markus Armbruster wrote:
>> I noticed -cpu help printing enough trailing spaces to make the output
>> at least 84 characters wide.  Looks ugly unless the terminal is wider.
>> Ugly or not, trailing spaces are stupid.
>>=20
>> The culprit is this line in x86_cpu_list_entry():
>>=20
>>     qemu_printf("x86 %-20s  %-58s\n", name, desc);
>>=20
>> This prints a string with minimum field left-justified right before a
>> newline.  Change it to
>>=20
>>     qemu_printf("x86 %-20s  %s\n", name, desc);
>>=20
>> which avoids the trailing spaces and is simpler to boot.
>>=20
>> A search for the pattern with "git-grep -E '%-[0-9]+s\\n'" found a few
>> more instances.  Change them similarly.
>>=20
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  monitor/hmp-cmds.c         | 2 +-
>>  target/i386/cpu-dump.c     | 4 ++--
>>  target/i386/cpu.c          | 2 +-
>>  target/ppc/cpu_init.c      | 2 +-
>>  target/s390x/cpu_models.c  | 4 ++--
>>  target/xtensa/mmu_helper.c | 2 +-
>>  6 files changed, 8 insertions(+), 8 deletions(-)
>
> Nitpicking, do you mind prefixing the patch subject with 'monitor:'?

You're right, the code I patch is called from HMP commands, and probably
not from anywhere else.

> Otherwise:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks!


