Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 144DE2F612A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 13:42:29 +0100 (CET)
Received: from localhost ([::1]:48360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l01xL-0007oe-TN
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 07:42:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l01vx-0007Ly-9N
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 07:41:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l01vu-0005wh-DK
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 07:41:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610628057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YVjGNdbfFq0Q9BL25ZmGhnOvkkQD0aG0HGsEsbHmGKA=;
 b=TGw9ph6FkprBj3U1L+oV/ECS7qKnRwTlnogVGo2GIfu2bIqyncI/3tiNzx7bEB07d/KuEZ
 KhTNmqLsEmDTMpuly6JIL34FyMwIcZ71cgv7lDvgEyS0YmhcFuLeQSbCNZA4gf32Nk6aYt
 AS5R9+uasBrCVjTmXKm7dfDTuwRiZik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-7OSp3cHePlyhszHMqaxmuw-1; Thu, 14 Jan 2021 07:40:55 -0500
X-MC-Unique: 7OSp3cHePlyhszHMqaxmuw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 247EE1005D4F;
 Thu, 14 Jan 2021 12:40:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEC285D6AD;
 Thu, 14 Jan 2021 12:40:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5B70411386A7; Thu, 14 Jan 2021 13:40:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PULL 0/7] Yank patches patches for 2021-01-13
References: <20210113093101.550964-1-armbru@redhat.com>
 <CAFEAcA8HmqWuzny9bmpXNLtsK7nuRaxPW3j6ZZougn7Y+tX7+A@mail.gmail.com>
 <87r1mnlr0a.fsf@linaro.org>
Date: Thu, 14 Jan 2021 13:40:52 +0100
In-Reply-To: <87r1mnlr0a.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Thu, 14 Jan 2021 11:02:20 +0000")
Message-ID: <87bldrsncb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On Wed, 13 Jan 2021 at 09:31, Markus Armbruster <armbru@redhat.com> wrot=
e:
>>>
>>> This pull request is on behalf of Lukas.  Hope that's okay.
>>>
>>> The following changes since commit f8e1d8852e393b3fd524fb005e38590063d9=
9bc0:
>>>
>>>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-2=
0210112-1' into staging (2021-01-12 21:23:25 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>   git://repo.or.cz/qemu/armbru.git tags/pull-yank-2021-01-13
>>>
>>> for you to fetch changes up to 91d48e520a4a4f72e97aeb333029694f5d57cc93=
:
>>>
>>>   tests/test-char.c: Wait for the chardev to connect in char_socket_cli=
ent_dupid_test (2021-01-13 10:21:17 +0100)
>>>
>>> ----------------------------------------------------------------
>>> Yank patches patches for 2021-01-13
>>>
>>> ----------------------------------------------------------------
>>> Lukas Straub (7):
>>>       Introduce yank feature
>>>       block/nbd.c: Add yank feature
>>>       chardev/char-socket.c: Add yank feature
>>>       migration: Add yank feature
>>>       io/channel-tls.c: make qio_channel_tls_shutdown thread-safe
>>>       io: Document qmp oob suitability of qio_channel_shutdown and io_s=
hutdown
>>>       tests/test-char.c: Wait for the chardev to connect in char_socket=
_client_dupid_test
>>
>>
>> Applied, thanks.
>
> This broke the check-unit and check-softfloat build task in Travis
>
>   https://travis-ci.org/github/qemu/qemu/jobs/754436018
>
> Likely because of missing stubs for the yank commands:
>
>   FAILED: qemu-io=20
>
>   gcc  -o qemu-io qemu-io.p/qemu-io.c.o -Wl,--as-needed -Wl,--no-undefine=
d -pie -Wl,--whole-archive libblock.fa libcrypto.fa libauthz.fa libqom.fa l=
ibio.fa -Wl,--no-whole-archive -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -m=
64 -fstack-protector-strong -Wl,--start-group libqemuutil.a subprojects/lib=
vhost-user/libvhost-user-glib.a subprojects/libvhost-user/libvhost-user.a l=
ibblock.fa libcrypto.fa libauthz.fa libqom.fa libio.fa @block.syms -lgnutls=
 -pthread -lutil -lm -lgthread-2.0 -lglib-2.0 -lgthread-2.0 -lglib-2.0 -lxm=
l2 /usr/lib/x86_64-linux-gnu/libiscsi.so -laio -lgthread-2.0 -lglib-2.0 /us=
r/lib/x86_64-linux-gnu/libz.so /usr/lib/x86_64-linux-gnu/libnfs.so /usr/lib=
/gcc/x86_64-linux-gnu/9/../../../x86_64-linux-gnu/libzstd.so -lssh /usr/lib=
/x86_64-linux-gnu/libcurl.so /usr/lib/gcc/x86_64-linux-gnu/9/../../../x86_6=
4-linux-gnu/libbz2.so -lgnutls -lnettle -lgnutls -lpam -lgnutls -Wl,--end-g=
roup
>
>   /usr/bin/ld: libblock.fa(block_nbd.c.o): in function `nbd_close':
>
>   /home/travis/build/qemu/qemu/build/../block/nbd.c:2358: undefined refer=
ence to `yank_unregister_instance'
[...]
>   collect2: error: ld returned 1 exit status


Reproduced locally:

    $ ../configure --disable-system --disable-user --enable-tools
    $ make

Lukas, can you take care of this?


