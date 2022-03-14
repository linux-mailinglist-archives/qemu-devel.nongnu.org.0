Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4822B4D8CB8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:46:14 +0100 (CET)
Received: from localhost ([::1]:58562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTqdx-0005q2-6i
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:46:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTqcU-00055d-I0
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:44:42 -0400
Received: from [2607:f8b0:4864:20::1134] (port=37371
 helo=mail-yw1-x1134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTqcS-0002NG-Qp
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:44:42 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2e5757b57caso21291027b3.4
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 12:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3zO7JIgWOqx9FAkGXWFDPSuEAexIvyhk21HyYz3uBdY=;
 b=ajwrXzW8ms3aDz5VTlGaR6yne4fwjxPzJsR2VGR7LFwSWvmaSXKeYFs50nlWKHPMSg
 jGjU/s0Jel1SgSWFy90keLcYY6Hs3L9JQdG2tQRg4Yx19K6t6CX/rHsRd3s9Q8f6tjoX
 aKWvglmzdn2fMohl77poUQn9R3qyAaSLmd4B7BpU8oSSMKd8yX2lCV3ckY41ueDnh0KM
 yOkdWCNepYncO6yDMynBsuA807S6IPF0KHX1mjXOFNRkBoCa49HfR0Swvt+bX3YWk17a
 Za/MkAY3b0FmoJa3lrUSvsDp9NX4CUpNUvbMgrTKq7P33hTv6cRJr3mFvSoI/H8acvhQ
 u/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3zO7JIgWOqx9FAkGXWFDPSuEAexIvyhk21HyYz3uBdY=;
 b=A2jPqfYl+YmGLOZe/f85Jhguvm4Kb8aqhwVPT+AiWYZmrodgsJoVd7mJ6f7Fu1sile
 460RbvvcEgBdZKQoeXeJ1ZGgRPyZ9hnUg0ZIE5bwf2wW5O43c9dsEMXzN+FnAkYQikZp
 Ccvp8vb3svUcvADp+jOH+8HwzkJ3a66xybKRETrazf3H4JyQxtTzka/LzPtFYNYYSU5u
 ZTAZmBJCDfKDczDob8xS74VqL1UtdQ6zYkUsQiu1kLaEGv+0iN2V7Y8iYpDCsEMsQRsu
 dNGlsUkFZa48TM9kJ22pz0RooVQczhEcl2rPgyKLLvTvWPCLmhkIpLyMl/l6bHX2Xc3I
 QJCg==
X-Gm-Message-State: AOAM530I9nwcyIwjnHRa2vNW7s8LadxoSo7Q8BZHTMW9DQgqxihb6YWc
 0XNtjndzXC2DtjFbtGwvrwdtJChsoi++VA0c9z5Wtg==
X-Google-Smtp-Source: ABdhPJzKugoVFA9pe0wsktC7VKtunIhOZYcTivIozKAZqYlchBDiVKTHRDmyXPjl07ax3Db+++9aGUzL0RaI4PZAg50=
X-Received: by 2002:a0d:d611:0:b0:2e5:7821:eb4f with SMTP id
 y17-20020a0dd611000000b002e57821eb4fmr2394899ywd.64.1647287079746; Mon, 14
 Mar 2022 12:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220302182936.227719-1-dgilbert@redhat.com>
 <CAFEAcA9CrHEu8F7PGGTvsdyLnFJhan9V9FkHDgvapje+_E=hVA@mail.gmail.com>
 <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com> <Yieku+cTxY0Xyp5C@work-vm>
 <CAFEAcA-Y_8KTxCPoSN3P0Cgfe6cEN74b-5U1SeKtAP7FdzFvZA@mail.gmail.com>
 <Yi92SN2Z3OZi82pS@redhat.com>
 <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
 <CAFEAcA-bhoyo+EfQGOuHWeEWC8-M-tGv=fXjEAJ6XX==iiO14w@mail.gmail.com>
In-Reply-To: <CAFEAcA-bhoyo+EfQGOuHWeEWC8-M-tGv=fXjEAJ6XX==iiO14w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2022 19:44:28 +0000
Message-ID: <CAFEAcA96Jx4XsdveTVgxkqWT-TBVm_K06sN+U+fofnxzGaVOWw@mail.gmail.com>
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

On Mon, 14 Mar 2022 at 18:58, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Mon, 14 Mar 2022 at 17:15, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> >
> > On Mon, 14 Mar 2022 at 17:07, Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
> > > So the test harness is waiting for a reply to 'query-migrate'.
> > >
> > > This should be fast unless QEMU has hung in the main event
> > > loop servicing monitor commands, or stopped.
> >
> > I was kind of loose with the terminology -- I don't remember whether
> > it was actually hung in the sense of stopped entirely, or just
> > "sat in a loop waiting for a migration state that never arrives".
> > I'll try to look more closely if I can catch it in the act again.
>
> I just hit the abort case, narrowing it down to the
> /i386/migration/multifd/tcp/zlib case, which can hit this without
> any other tests being run:

> This test seems to fail fairly frequently. I'll try a bisect...

On this s390 machine, this test has been intermittent since
it was first added in commit 7ec2c2b3c1 ("multifd: Add zlib compression
multifd support") in 2019. On that commit (after 31 successful
runs):

# random seed: R02S17937f515046216afcc72143266b3e1f
# Start of i386 tests
# Start of migration tests
# Start of multifd tests
# Start of tcp tests
# starting QEMU: exec ./build/i386/i386-softmmu/qemu-system-i386
-qtest unix:/tmp/qtest-861747.sock -qtest-log /dev/null -chardev
socket,path=3D/tmp/qtest-861747.qmp,id=3Dchar0 -mon
chardev=3Dchar0,mode=3Dcontrol -display none -accel kvm -accel tcg -name
source,debug-threads=3Don -m 150M -serial
file:/tmp/migration-test-7qODSs/src_serial -drive
file=3D/tmp/migration-test-7qODSs/bootsect,format=3Draw    -accel qtest
qemu-system-i386: -accel kvm: invalid accelerator kvm
qemu-system-i386: falling back to tcg
# starting QEMU: exec ./build/i386/i386-softmmu/qemu-system-i386
-qtest unix:/tmp/qtest-861747.sock -qtest-log /dev/null -chardev
socket,path=3D/tmp/qtest-861747.qmp,id=3Dchar0 -mon
chardev=3Dchar0,mode=3Dcontrol -display none -accel kvm -accel tcg -name
target,debug-threads=3Don -m 150M -serial
file:/tmp/migration-test-7qODSs/dest_serial -incoming defer -drive
file=3D/tmp/migration-test-7qODSs/bootsect,format=3Draw    -accel qtest
qemu-system-i386: -accel kvm: invalid accelerator kvm
qemu-system-i386: falling back to tcg
Memory content inconsistency at 5cff000 first_byte =3D 2 last_byte =3D 1
current =3D 0 hit_edge =3D 1
Memory content inconsistency at 5d00000 first_byte =3D 2 last_byte =3D 1
current =3D 0 hit_edge =3D 1
Memory content inconsistency at 5d01000 first_byte =3D 2 last_byte =3D 1
current =3D 0 hit_edge =3D 1
Memory content inconsistency at 5d02000 first_byte =3D 2 last_byte =3D 1
current =3D 0 hit_edge =3D 1
Memory content inconsistency at 5d03000 first_byte =3D 2 last_byte =3D 1
current =3D 0 hit_edge =3D 1
Memory content inconsistency at 5d04000 first_byte =3D 2 last_byte =3D 1
current =3D 0 hit_edge =3D 1
Memory content inconsistency at 5d05000 first_byte =3D 2 last_byte =3D 1
current =3D 0 hit_edge =3D 1
Memory content inconsistency at 5d06000 first_byte =3D 2 last_byte =3D 1
current =3D 0 hit_edge =3D 1
Memory content inconsistency at 5d07000 first_byte =3D 2 last_byte =3D 1
current =3D 0 hit_edge =3D 1
Memory content inconsistency at 5d08000 first_byte =3D 2 last_byte =3D 1
current =3D 0 hit_edge =3D 1
and in another 118 pages**
ERROR:/home/linux1/qemu/tests/qtest/migration-test.c:268:check_guests_ram:
assertion failed: (bad =3D=3D 0)
Bail out! ERROR:/home/linux1/qemu/tests/qtest/migration-test.c:268:check_gu=
ests_ram:
assertion failed: (bad =3D=3D 0)
Aborted (core dumped)

-- PMM

