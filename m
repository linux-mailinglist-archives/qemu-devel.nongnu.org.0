Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9194D8BF9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 19:59:41 +0100 (CET)
Received: from localhost ([::1]:54530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTpuu-0004Un-RQ
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 14:59:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTptz-0003mO-Jb
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:58:43 -0400
Received: from [2607:f8b0:4864:20::1134] (port=33119
 helo=mail-yw1-x1134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTptx-000477-Un
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:58:43 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2dbd8777564so176170007b3.0
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 11:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7XdawcoUFHF/aEFOtwJPzGUkoYDiZBbFc+14QSrQ/h4=;
 b=OjzJSKKxn0SAGw2ctl4RG39MVmRrLejE8mWgfMIbrnHLppv8emxn0VgvR3n+pz8Y/S
 7CQ0MtkjeJ76lXSwRW3MB71bXChFlPuLqaEWs/17r4uEwk0Qzpyb+qzn+SRv0+8bDBNj
 2Rk9i+MSDoJDNdvRzMifov8qpR2l+4hqHZsyr+duPMjzP4w7p4JrtiiUy6I1nVQNMZ3m
 HLgKi1Bzc9vLFEuytIFjOTCX9oRjiSY8JfJzF8xZKdqKEWzjvgFGIzBEQkGEFEhLNqbc
 9UwEWjoTZ2QRfhhNBs1h8kuAiQv26PXoSwVFE+MKBrSHboT8A0gzCCDXCMbWIcthFAHZ
 do+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7XdawcoUFHF/aEFOtwJPzGUkoYDiZBbFc+14QSrQ/h4=;
 b=eXY2zy1FUyGOE420Z3u9q5XT1bSeDSTrMko6jv5nRa+hqPNRwkdgDUenrylE0VeeMq
 4So/8olHw7A8V+vi2B2s4Ht+p5dwqgKiz+hZBXEiwPTHHvC61Z9AsmdFLpq5QFQWM9Zg
 L1bVIS1gRutuO1DesQlyo3d4A3mTlPMLLYndUGz0UgvDt74j4G8GEmFKL9V5WXu8qeQK
 ohj+K+T+xM+TFBWezcUuExkg7wwkTluNrrmQAk/lNvI5adoO872MQPxU6UdReewMLAce
 JjyuA0KEjRsU+QCPJBLeZ4Nb74qYHAtcn8X65uW1Ylub3x8eJf2x9pSo5Idp/z1dZxS1
 z2EQ==
X-Gm-Message-State: AOAM533ugBdAnIAboMNg4pQESSzLdAHvHLYXdWCbF/rfmd+ZRTnpIexm
 dOQQxjK07/UjytBys8+fDsPsSXLCcDLFrR4tEb8y4Q==
X-Google-Smtp-Source: ABdhPJxDGzoi/MwwRwi8sfHkraEi6Q6vA/IhMLSm7nHfJmJ34UvEl8XaOpCOoce/nHkbmUKV+ccCMH70IOKUZHMCa3k=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr21362045ywb.257.1647284320732; Mon, 14
 Mar 2022 11:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220302182936.227719-1-dgilbert@redhat.com>
 <CAFEAcA9CrHEu8F7PGGTvsdyLnFJhan9V9FkHDgvapje+_E=hVA@mail.gmail.com>
 <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com> <Yieku+cTxY0Xyp5C@work-vm>
 <CAFEAcA-Y_8KTxCPoSN3P0Cgfe6cEN74b-5U1SeKtAP7FdzFvZA@mail.gmail.com>
 <Yi92SN2Z3OZi82pS@redhat.com>
 <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2022 18:58:29 +0000
Message-ID: <CAFEAcA-bhoyo+EfQGOuHWeEWC8-M-tGv=fXjEAJ6XX==iiO14w@mail.gmail.com>
Subject: Re: [PULL 00/18] migration queue
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, quintela@redhat.com, s.reiter@proxmox.com,
 qemu-devel@nongnu.org, peterx@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 hreitz@redhat.com, f.ebner@proxmox.com, jinpu.wang@ionos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 at 17:15, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Mon, 14 Mar 2022 at 17:07, Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
> > So the test harness is waiting for a reply to 'query-migrate'.
> >
> > This should be fast unless QEMU has hung in the main event
> > loop servicing monitor commands, or stopped.
>
> I was kind of loose with the terminology -- I don't remember whether
> it was actually hung in the sense of stopped entirely, or just
> "sat in a loop waiting for a migration state that never arrives".
> I'll try to look more closely if I can catch it in the act again.

I just hit the abort case, narrowing it down to the
/i386/migration/multifd/tcp/zlib case, which can hit this without
any other tests being run:

$ QTEST_QEMU_BINARY=3D./qemu-system-i386 ./tests/qtest/migration-test
-tap -k -p /i386/migration/multifd/tcp/zlib
# random seed: R02S37eab07b59417f6cd7e26d94df0d3908
# Start of i386 tests
# Start of migration tests
# Start of multifd tests
# Start of tcp tests
# starting QEMU: exec ./qemu-system-i386 -qtest
unix:/tmp/qtest-782502.sock -qtest-log /dev/null -chardev
socket,path=3D/tmp/qtest-782502.qmp,id=3Dchar0 -mon
chardev=3Dchar0,mode=3Dcontrol -display none -accel kvm -accel tcg -name
source,debug-threads=3Don -m 150M -serial
file:/tmp/migration-test-H8Ggsm/src_serial -drive
file=3D/tmp/migration-test-H8Ggsm/bootsect,format=3Draw    -accel qtest
# starting QEMU: exec ./qemu-system-i386 -qtest
unix:/tmp/qtest-782502.sock -qtest-log /dev/null -chardev
socket,path=3D/tmp/qtest-782502.qmp,id=3Dchar0 -mon
chardev=3Dchar0,mode=3Dcontrol -display none -accel kvm -accel tcg -name
target,debug-threads=3Don -m 150M -serial
file:/tmp/migration-test-H8Ggsm/dest_serial -incoming defer -drive
file=3D/tmp/migration-test-H8Ggsm/bootsect,format=3Draw    -accel qtest
Memory content inconsistency at 5f76000 first_byte =3D 2 last_byte =3D 1
current =3D 2 hit_edge =3D 1
Memory content inconsistency at 5f77000 first_byte =3D 2 last_byte =3D 1
current =3D 2 hit_edge =3D 1
Memory content inconsistency at 5f78000 first_byte =3D 2 last_byte =3D 1
current =3D 2 hit_edge =3D 1
Memory content inconsistency at 5f79000 first_byte =3D 2 last_byte =3D 1
current =3D 2 hit_edge =3D 1
Memory content inconsistency at 5f7a000 first_byte =3D 2 last_byte =3D 1
current =3D 2 hit_edge =3D 1
Memory content inconsistency at 5f7b000 first_byte =3D 2 last_byte =3D 1
current =3D 2 hit_edge =3D 1
Memory content inconsistency at 5f7c000 first_byte =3D 2 last_byte =3D 1
current =3D 2 hit_edge =3D 1
Memory content inconsistency at 5f7d000 first_byte =3D 2 last_byte =3D 1
current =3D 2 hit_edge =3D 1
Memory content inconsistency at 5f7e000 first_byte =3D 2 last_byte =3D 1
current =3D 2 hit_edge =3D 1
Memory content inconsistency at 5f7f000 first_byte =3D 2 last_byte =3D 1
current =3D 2 hit_edge =3D 1
and in another 17 pages**
ERROR:../../tests/qtest/migration-test.c:276:check_guests_ram:
assertion failed: (bad =3D=3D 0)
Bail out! ERROR:../../tests/qtest/migration-test.c:276:check_guests_ram:
assertion failed: (bad =3D=3D 0)
Aborted (core dumped)

This test seems to fail fairly frequently. I'll try a bisect...

thanks
-- PMM

