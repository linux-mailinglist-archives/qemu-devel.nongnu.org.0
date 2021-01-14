Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE332F5F72
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 12:04:49 +0100 (CET)
Received: from localhost ([::1]:45264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l00Qq-0007YV-9Y
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 06:04:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l00Pj-00076c-KQ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:03:39 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:39092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l00Ph-0004Ii-AH
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:03:39 -0500
Received: by mail-wm1-x32f.google.com with SMTP id u14so93007wmq.4
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 03:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=3lADIhkx/ITNywPg1+QLTzFc3SnZ3zBqjpDltiu2Sew=;
 b=Yic8t7WhH07aY+BEJ8co9FKoJhLfhmux0KlD4TN8cb60neevdob1IZbm/8bS02UZMU
 sRgerpNmJEvwrkgN/yNZ7bLok8NHZiNya0Pbl1vd2B53YxcuK3pN4NZR/itb87elFOMK
 nJpmkGDkC0/Rp4e6qUTQoNf6FgH1bJexjzBzxGkACA1hkRK8cLb1WjIbrS1cLtrLkKQQ
 NgkH257GLn2iftSvzH0lgFii/Q/XBs34vXra0qCR403V5IhTykckjRfj++LUfd8A/eAA
 VigxYL1vxSuI+s2IzxNPuXzLZPhcqc+ZzVX0lYxPXxXLeyFbpjWMIfY6z6Wey84syBG+
 l4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=3lADIhkx/ITNywPg1+QLTzFc3SnZ3zBqjpDltiu2Sew=;
 b=i90BDBm3pkC1SeO233mjYNgliWIcSVM72OQZcGih4ejoVrRsxHg6H4qpkD6OmbUn47
 lxa1qdx/bj9o6pRli+drqvutyOcIxldPUI/cUPLNFVwfFuj5gtTO69WWzTWTLWp1lZVz
 TGtxaZvezXBNZR8zru9Z0ImIyfa1rXzLlKVglmsYT49hzpPK4BEc/y44huUtSwzZ+spi
 te/KaTYlTHD/wjwnw1yUclOef7Q/oP3eHTABkOCYLnd+itanG8AEPFas5fuCrIvGPHJH
 2IVKWfuPsRn01dB+W4VhDy5Xul4ngWClbs4T6/1h0d2R+GTDlaQN++4mNviAaZqeP0W9
 mwDA==
X-Gm-Message-State: AOAM5304+SNlmBrj5wqi9/Z7L85D4Y0iRljOYJKJh2bVfnneE8s3liHB
 C938Ead7QAJMn7EJpWz3x77TdQ==
X-Google-Smtp-Source: ABdhPJylfmBXHF7ZHnQ2xLCn2A8sHtLeZFqWxtxpMHBeO4y81TNvk0pCAeerw0xFwbwgSWjgufnaew==
X-Received: by 2002:a1c:4604:: with SMTP id t4mr3283747wma.17.1610622215348;
 Thu, 14 Jan 2021 03:03:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n11sm10245757wra.9.2021.01.14.03.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 03:03:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4D8B11FF7E;
 Thu, 14 Jan 2021 11:03:33 +0000 (GMT)
References: <20210113093101.550964-1-armbru@redhat.com>
 <CAFEAcA8HmqWuzny9bmpXNLtsK7nuRaxPW3j6ZZougn7Y+tX7+A@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/7] Yank patches patches for 2021-01-13
Date: Thu, 14 Jan 2021 11:02:20 +0000
In-reply-to: <CAFEAcA8HmqWuzny9bmpXNLtsK7nuRaxPW3j6ZZougn7Y+tX7+A@mail.gmail.com>
Message-ID: <87r1mnlr0a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 13 Jan 2021 at 09:31, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> This pull request is on behalf of Lukas.  Hope that's okay.
>>
>> The following changes since commit f8e1d8852e393b3fd524fb005e38590063d99=
bc0:
>>
>>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20=
210112-1' into staging (2021-01-12 21:23:25 +0000)
>>
>> are available in the Git repository at:
>>
>>   git://repo.or.cz/qemu/armbru.git tags/pull-yank-2021-01-13
>>
>> for you to fetch changes up to 91d48e520a4a4f72e97aeb333029694f5d57cc93:
>>
>>   tests/test-char.c: Wait for the chardev to connect in char_socket_clie=
nt_dupid_test (2021-01-13 10:21:17 +0100)
>>
>> ----------------------------------------------------------------
>> Yank patches patches for 2021-01-13
>>
>> ----------------------------------------------------------------
>> Lukas Straub (7):
>>       Introduce yank feature
>>       block/nbd.c: Add yank feature
>>       chardev/char-socket.c: Add yank feature
>>       migration: Add yank feature
>>       io/channel-tls.c: make qio_channel_tls_shutdown thread-safe
>>       io: Document qmp oob suitability of qio_channel_shutdown and io_sh=
utdown
>>       tests/test-char.c: Wait for the chardev to connect in char_socket_=
client_dupid_test
>
>
> Applied, thanks.

This broke the check-unit and check-softfloat build task in Travis

  https://travis-ci.org/github/qemu/qemu/jobs/754436018

Likely because of missing stubs for the yank commands:

  FAILED: qemu-io=20

  gcc  -o qemu-io qemu-io.p/qemu-io.c.o -Wl,--as-needed -Wl,--no-undefined =
-pie -Wl,--whole-archive libblock.fa libcrypto.fa libauthz.fa libqom.fa lib=
io.fa -Wl,--no-whole-archive -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -m64=
 -fstack-protector-strong -Wl,--start-group libqemuutil.a subprojects/libvh=
ost-user/libvhost-user-glib.a subprojects/libvhost-user/libvhost-user.a lib=
block.fa libcrypto.fa libauthz.fa libqom.fa libio.fa @block.syms -lgnutls -=
pthread -lutil -lm -lgthread-2.0 -lglib-2.0 -lgthread-2.0 -lglib-2.0 -lxml2=
 /usr/lib/x86_64-linux-gnu/libiscsi.so -laio -lgthread-2.0 -lglib-2.0 /usr/=
lib/x86_64-linux-gnu/libz.so /usr/lib/x86_64-linux-gnu/libnfs.so /usr/lib/g=
cc/x86_64-linux-gnu/9/../../../x86_64-linux-gnu/libzstd.so -lssh /usr/lib/x=
86_64-linux-gnu/libcurl.so /usr/lib/gcc/x86_64-linux-gnu/9/../../../x86_64-=
linux-gnu/libbz2.so -lgnutls -lnettle -lgnutls -lpam -lgnutls -Wl,--end-gro=
up

  /usr/bin/ld: libblock.fa(block_nbd.c.o): in function `nbd_close':

  /home/travis/build/qemu/qemu/build/../block/nbd.c:2358: undefined referen=
ce to `yank_unregister_instance'

  /usr/bin/ld: libblock.fa(block_nbd.c.o): in function `nbd_client_handshak=
e':

  /home/travis/build/qemu/qemu/build/../block/nbd.c:1879: undefined referen=
ce to `yank_unregister_function'

  /usr/bin/ld: libblock.fa(block_nbd.c.o): in function `nbd_reconnect_attem=
pt':

  /home/travis/build/qemu/qemu/build/../block/nbd.c:605: undefined referenc=
e to `yank_unregister_function'

  /usr/bin/ld: libblock.fa(block_nbd.c.o): in function `nbd_co_establish_co=
nnection':

  /home/travis/build/qemu/qemu/build/../block/nbd.c:453: undefined referenc=
e to `yank_register_function'

  /usr/bin/ld: /home/travis/build/qemu/qemu/build/../block/nbd.c:491: undef=
ined reference to `yank_register_function'

  /usr/bin/ld: libblock.fa(block_nbd.c.o): in function `nbd_connection_entr=
y':

  /home/travis/build/qemu/qemu/build/../block/nbd.c:765: undefined referenc=
e to `yank_unregister_function'

  /usr/bin/ld: libblock.fa(block_nbd.c.o): in function `nbd_open':

  /home/travis/build/qemu/qemu/build/../block/nbd.c:2283: undefined referen=
ce to `yank_register_instance'

  /usr/bin/ld: libblock.fa(block_nbd.c.o): in function `nbd_establish_conne=
ction':

  /home/travis/build/qemu/qemu/build/../block/nbd.c:1799: undefined referen=
ce to `yank_register_function'

  /usr/bin/ld: libblock.fa(block_nbd.c.o): in function `nbd_open':

  /home/travis/build/qemu/qemu/build/../block/nbd.c:2298: undefined referen=
ce to `yank_unregister_instance'

  /usr/bin/ld: /home/travis/build/qemu/qemu/build/../block/nbd.c:2292: unde=
fined reference to `yank_unregister_instance'

  collect2: error: ld returned 1 exit status

>
> Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
> for any user-visible changes.
>
> -- PMM


--=20
Alex Benn=C3=A9e

