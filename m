Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814015B08B7
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 17:39:47 +0200 (CEST)
Received: from localhost ([::1]:55860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVx9W-0006sr-0t
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 11:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1oVx6x-0004L9-OX
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 11:37:09 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:38778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1oVx6v-0001ov-3c
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 11:37:06 -0400
Received: by mail-qv1-xf30.google.com with SMTP id i15so2302783qvp.5
 for <qemu-devel@nongnu.org>; Wed, 07 Sep 2022 08:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=+7cGvg4K0XvZZ8RhfQjW0cIqMiUI4b7X7zacj0/r/oc=;
 b=HpAhmXfzqhH+2deWH+5Lqz5mlSGivw/QJ3chBSbVq6VYwC4v8D3hYIqwVsXMfyMfk/
 ZYA8K4ebA/t6JIKRCVPChsVtYCdd3wFe4A8VSolw3mzpH3hXYbY3uhptok7CQPG2NlTy
 E+apcKjWK4/MLK1CJQ41cOeEmiEAS1w9CD4NrdKUqxnS4/Er/PBLgMPbZe4i5J6vqKYG
 EP7jnJPssvMxJFALZXYla6PExXNId13okQhl0B/PcY5NOCPGlMT8ZLf5A+FPrtmBb/4h
 EESlSETwWc7MkB7b3fldzMWCHBXhjkE1JqMlFLAurTluCyhKuHETIXfVcGBgjYIcf+iw
 LsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=+7cGvg4K0XvZZ8RhfQjW0cIqMiUI4b7X7zacj0/r/oc=;
 b=Syiu91GRimHONOX6o+qxk/vT249a5R5PISN0rIKYKdYvoMT5CXZRrg3LjLqk2tHIT2
 0q3lLbiDQOcgyKvfoQH4wRp0KrFcDnn4K1uDeYRJYvLeEoRIY2tUGpd36F2lz1pVszyb
 b5Rtn8HuYwXdCPYo2Wur0vCM1AembvLXgaepqbqZQgKQTHVe0jTdpbvVuxExrQz8W1zz
 0iuVBIRR+Gg4I3oOJ4gpnNrLnxgMOR1xjAVSUwOXpYlNYE2HoXzlJTU+DsP5oXJxwrOO
 yngv6nQgOdfTszGIvk0jpUOkOJW+ju3+HPaa3yUtS29cauUnFehmi4OfYzxfTjtGWbbH
 GLbQ==
X-Gm-Message-State: ACgBeo25fJDoZ5wzAc4gdtsxaqwNSkpftX5ig2W4XJz2EtC8ucezivws
 Lc7YZIALBDF3ZcG5q/dNoMHA/vqicfI7cXLf2f8N/IDST/Fizw==
X-Google-Smtp-Source: AA6agR5eGOmOyw+6y6DaIwizhuQlBdBnIZHAVOARUH0Z3mNdHb2J5mHgoXimUHqFaOagcq6LVYbdUL1f6JmeEmbB1vU=
X-Received: by 2002:a05:6214:5181:b0:473:1a26:99f6 with SMTP id
 kl1-20020a056214518100b004731a2699f6mr3602050qvb.47.1662565023383; Wed, 07
 Sep 2022 08:37:03 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 7 Sep 2022 08:36:52 -0700
Message-ID: <CAO=notwARj6d+UygiU4-JBKMJtyOhHmcNFp7C5jwqJReFT-kew@mail.gmail.com>
Subject: Seeing qtest assertion failure with 7.1
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Peter Foley <pefoley@google.com>
Content-Type: multipart/alternative; boundary="000000000000a2fe8c05e8181577"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=venture@google.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a2fe8c05e8181577
Content-Type: text/plain; charset="UTF-8"

# Start of nvme tests
# Start of pci-device tests
# Start of pci-device-tests tests
# starting QEMU: exec ./qemu-system-aarch64 -qtest
unix:/tmp/qtest-1431.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-1431.qmp,id=char0 -mon chardev=char0,mode=control
-display none -M virt, -cpu max -drive
id=drv0,if=none,file=null-co://,file.read-zeroes=on,format=raw -object
memory-backend-ram,id=pmr0,share=on,size=8 -device
nvme,addr=04.0,drive=drv0,serial=foo -accel qtest

#
ERROR:../../src/qemu/tests/qtest/libqtest.c:338:qtest_init_without_qmp_handshake:
assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
stderr:
double free or corruption (out)
socket_accept failed: Resource temporarily unavailable
**
ERROR:../../src/qemu/tests/qtest/libqtest.c:338:qtest_init_without_qmp_handshake:
assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
../../src/qemu/tests/qtest/libqtest.c:165: kill_qemu() detected QEMU death
from signal 6 (Aborted) (core dumped)

I'm not seeing this reliably, and we haven't done a lot of digging yet,
such as enabling sanitizers, so I'll reply back to this thread with details
as I have them.

Has anyone seen this before or something like it?

Patrick

--000000000000a2fe8c05e8181577
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"># Start of nvme tests<br># Start of pci-device tests<br># =
Start of pci-device-tests tests<br># starting QEMU: exec ./qemu-system-aarc=
h64 -qtest unix:/tmp/qtest-1431.sock -qtest-log /dev/null -chardev socket,p=
ath=3D/tmp/qtest-1431.qmp,id=3Dchar0 -mon chardev=3Dchar0,mode=3Dcontrol -d=
isplay none -M virt, -cpu max -drive id=3Ddrv0,if=3Dnone,file=3Dnull-co://,=
file.read-zeroes=3Don,format=3Draw -object memory-backend-ram,id=3Dpmr0,sha=
re=3Don,size=3D8 -device nvme,addr=3D04.0,drive=3Ddrv0,serial=3Dfoo -accel =
qtest<br><br># ERROR:../../src/qemu/tests/qtest/libqtest.c:338:qtest_init_w=
ithout_qmp_handshake: assertion failed: (s-&gt;fd &gt;=3D 0 &amp;&amp; s-&g=
t;qmp_fd &gt;=3D 0)<br>stderr:<br>double free or corruption (out)<br>socket=
_accept failed: Resource temporarily unavailable<br>**<br>ERROR:../../src/q=
emu/tests/qtest/libqtest.c:338:qtest_init_without_qmp_handshake: assertion =
failed: (s-&gt;fd &gt;=3D 0 &amp;&amp; s-&gt;qmp_fd &gt;=3D 0)<br>../../src=
/qemu/tests/qtest/libqtest.c:165: kill_qemu() detected QEMU death from sign=
al 6 (Aborted) (core dumped)<div><br></div><div>I&#39;m not seeing this rel=
iably, and we haven&#39;t done a lot of digging yet, such as enabling sanit=
izers, so I&#39;ll reply back to this thread with details as I have them.</=
div><div><br></div><div>Has anyone seen this before or something like it?</=
div><div><br></div><div>Patrick</div></div>

--000000000000a2fe8c05e8181577--

