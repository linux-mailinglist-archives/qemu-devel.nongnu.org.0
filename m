Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38082C4BAD
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 00:41:24 +0100 (CET)
Received: from localhost ([::1]:50536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki4Pb-0004DG-H3
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 18:41:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1ki4O6-0003Z1-Lt
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 18:39:50 -0500
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c]:32815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1ki4O4-0003bM-C9
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 18:39:50 -0500
Received: by mail-vk1-xa2c.google.com with SMTP id b190so94278vka.0
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 15:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=VSBr/D7mAOS1NzV3BzV0CnLIML/lYoPpJRPPrtcUyEc=;
 b=YyIDvNiH5oAlgFJvsUzAd7PmUoQDgcxkDEsedE8zf9I4hyFrGYkbJkyOTyg4UTJW9V
 CVD5dgVlojVPg6eaEv2JIWgFjZ3SlpPXR/ei3lcwoSTCRD5QJ5in6JOREEb554zWiGMx
 9mUxlGfc1q2ora0cKEXY7hZmFjf97vHQ0nUCu0QjZ0MYtzUKo65Cm01K8b6qkDbIZyD+
 FcZ7/b4PCizp1b+4TJKTCHDcaC6ZVjJIbytTg4rfaRw5KVrodUbx0xwr8ECEISJo2ADV
 iYz8pe4IY2qvpsj88ot/YstQLBIebo45hi1POSA0UGATwzTttmDPfXFd1bhP6M5GcVW+
 anTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=VSBr/D7mAOS1NzV3BzV0CnLIML/lYoPpJRPPrtcUyEc=;
 b=Qturp92/M8tqSaIx5Y9jTv93YDlIfyJrV41VqdWhW4S79iAtUnO4wLUim+OJQFZSwM
 Kg+qJm8RCkUMWM2HC9dxxjz3QaHHO0/vTyHnDETs4o0qXq+UaxrBB1xxN/AtJMB/HcKn
 NSpOLzKG//NBQho1Gn8wBTMhHrogqlcFIeSAs8EAC/YYNHC0Z9ANSGP8tIKNWvWpyMpa
 0pUUzlZ/Y0sW2KZ6lVu6RFMaDDjLokKj0eKj4cxnYxDKoIdAvE2iDsb15nY9CywTiTxh
 y41uqYZvhgVmdYGuQkdeuBM5eV6ezdhph/Z4UecKDCe5TpLCFXpDRqzYAeXuc1UJgoRx
 joGg==
X-Gm-Message-State: AOAM532JGdQyue9nI7m5z/UTvJUaaHGKn7yF6FsjzOKLcegRB7Ty4C8U
 a1O4gbL+yGBUtRi3H6FhnRBtBdfeFN/3E8DqGUTq26ZqzvhDnEzh
X-Google-Smtp-Source: ABdhPJwRFpmPxn1UCmKZJ871Pz2ODK57/Zd21lRZPpcqsggLac5z02p40vQ/5GyJlF7wNG2UEBpUt1F2ju+RpWOqlzA=
X-Received: by 2002:a1f:ad09:: with SMTP id w9mr368833vke.9.1606347585071;
 Wed, 25 Nov 2020 15:39:45 -0800 (PST)
MIME-Version: 1.0
From: Doug Evans <dje@google.com>
Date: Wed, 25 Nov 2020 15:39:08 -0800
Message-ID: <CADPb22TfGZjr85z=5+Vc9fNqooGq5JTTos1h-rta8d3eG0SQew@mail.gmail.com>
Subject: [DISCUSSION] Running one qtest test: how?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000321b4005b4f6f141"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=dje@google.com; helo=mail-vk1-xa2c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000321b4005b4f6f141
Content-Type: text/plain; charset="UTF-8"

Hi.

I can run a subset of qtest tests with "make check-qtest-TARGET", but
that's the limit of the granularity that I can find. Why would one want
more granularity? When adding a test one wants the edit/test cycle as short
as possible and needlessly running other tests is a pain.

It'd be really nice to be able to specify one test via make check. I
realize I can pass V=1 and get some help to dig further. And if I grep for
my test in Makefile.mtest I can reduce the number of tests down to just the
test binary I want (e.g., "make run-test-229" to run qtest-i386/qos-test,
the 229 will vary tree to tree). I don't mind the 229, it's
machine generated but it's easy to find and will be reasonably stable in
one build (though ideally one could pass the test name to "make" instead of
NNN). But I still want more granularity. What I really want is:

$ make run-test-229 TEST_OPTS="-p /foo/bar"

so that only test /foo/bar is run (see the output of qos-test --help).
qos-test binaries can contain dozens of tests, I just want one of them.

Am I missing something? What do others do when adding a test?

I'm happy to work on a patch to let one pass additional parameters to the
test binary as in the above example. Guidance for what will be acceptable
appreciated. Different test binaries will take different parameters: A
general mechanism to pass arbitrary additional parameters to the test
binary (.test.cmd.NNN in mtest-speak) would be quite useful.

--000000000000321b4005b4f6f141
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hi.=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">I can run a subset of qt=
est tests with &quot;make check-qtest-TARGET&quot;, but that&#39;s the limi=
t of the granularity that I can find. Why would one want more granularity? =
When adding a test one wants the edit/test cycle as short as possible and n=
eedlessly running other tests is a pain.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">It&#39;d be really nice to be able to specify one test via =
make check. I realize I can pass V=3D1 and get some help to dig further. An=
d if I grep for my test in Makefile.mtest I can reduce the number of tests =
down to just the test binary I want (e.g., &quot;make run-test-229&quot; to=
 run qtest-i386/qos-test, the 229 will vary tree to tree). I don&#39;t mind=
 the 229, it&#39;s machine=C2=A0generated=C2=A0but it&#39;s easy to find an=
d will be reasonably stable in one build (though ideally one could pass the=
 test name to &quot;make&quot; instead of NNN). But I still want more granu=
larity. What I really want is:<br><br>$ make run-test-229 TEST_OPTS=3D&quot=
;-p /foo/bar&quot;</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">so tha=
t only test /foo/bar is run (see the output of qos-test --help). qos-test b=
inaries can contain dozens of tests, I just want one of them.</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">Am I missing something? What do others=
 do when adding a test?</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br>I&#39;m happy to work on a patch to let one pass additional pa=
rameters to the test binary as in the above example. Guidance for what will=
 be acceptable appreciated. Different test binaries will take different par=
ameters: A general mechanism to pass arbitrary additional parameters to the=
 test binary (.test.cmd.NNN in mtest-speak) would be quite useful.</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div></div>

--000000000000321b4005b4f6f141--

