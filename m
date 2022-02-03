Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6585C4A9122
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 00:25:12 +0100 (CET)
Received: from localhost ([::1]:33650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFlTS-0004Sz-TR
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 18:25:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nFlRC-0003ct-6L
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 18:22:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nFlR8-0005TR-Bk
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 18:22:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643930565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IYJnluxBh2O6RyFvJpg5ZZJlxXVRHd/Sl5CCLugL93o=;
 b=C+kPVJfvgHBqtxJaLMnwk9/AjjEeie5KdhVb+A381hYxFWoPyP4OsPbJsqMqone1vvA2OM
 YU/RFCoMSJvURSIr56wYgTr8Nnd4wlDJZ2zPSe4ar/pxOuUYQPhKYQlT/Pk/k9V44wFcjz
 URb6wta2YgdnqaTrdjWDYKlrrvmP7XA=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-hoVqJh85Nyql1tb5e8hEzA-1; Thu, 03 Feb 2022 18:22:44 -0500
X-MC-Unique: hoVqJh85Nyql1tb5e8hEzA-1
Received: by mail-ua1-f70.google.com with SMTP id
 q19-20020ab04a13000000b002fef2f854a6so2487712uae.7
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 15:22:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IYJnluxBh2O6RyFvJpg5ZZJlxXVRHd/Sl5CCLugL93o=;
 b=7F0SjgzzU/svTWRRYS7jv9tudS8/xz9PpM9xee4OSECxmyYSIE5RNoJCkIHL5CirRo
 VnzzxxRgY3/QR93tlnZgoQSsjg9IGdzjj0bi/a3/n+RS1gElT726xmPPjVfM6oO5DdrF
 WxXbOoApYI3zAIRD+sJ9954JlCKGY7S7OtrfvaYowBi4Ne22EQbI3/Yf9BdZFwJEusnq
 c4pKgDcx1iKd0FxgrOe8kFRc1SntdJSCn5y6tLb1NGTMlMs/ELAd6BaVjTOLc8GTFKTB
 xqzeA5yPw4O8J4nOpOznzXjERTq3mqNfOIAoAJZZ0zfgDJRZWE2dtVljvd6QjSSdYerS
 dMkg==
X-Gm-Message-State: AOAM531HzKyReXclbMdXewupzFHg2LNuF0k09XldqFbJpVCBFrip4U9N
 THlCSNW+g/L+Eix01em1f3D1qp+D66rJbbeSDTFs/WxyipRg4WoiUHkP9xx4/4AKcWsR/ANx2V3
 j8M0/xk6F5iRBYIq7MCHCCGUPh6yx+Sw=
X-Received: by 2002:a67:f70f:: with SMTP id m15mr38652vso.61.1643930563593;
 Thu, 03 Feb 2022 15:22:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxP/VCtkANtsOR1pbPbK7ETDXXhCVMdBCsESa56A+yKhK+REkI4OvwRlKN6ewBSayFj4IRHJrg48Hsyy7WLWg0=
X-Received: by 2002:a67:f70f:: with SMTP id m15mr38649vso.61.1643930563399;
 Thu, 03 Feb 2022 15:22:43 -0800 (PST)
MIME-Version: 1.0
References: <20220203015946.1330386-1-jsnow@redhat.com>
 <CAFEAcA_OXJ6C1UTFXiy6x1gp4VRmaWQY7ntU8N-3-O+TGcsKQQ@mail.gmail.com>
 <CAFn=p-ZeG2XM_cP3hpKN-Cagk4T1Sr05YEDhtwmR4+_VOjVt7w@mail.gmail.com>
 <CAFEAcA9fJMQizPmd1rUh7wPgPoz4dAXQPP07DzDFQK1ieN72VA@mail.gmail.com>
In-Reply-To: <CAFEAcA9fJMQizPmd1rUh7wPgPoz4dAXQPP07DzDFQK1ieN72VA@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 3 Feb 2022 18:22:32 -0500
Message-ID: <CAFn=p-Zpvf4W1zZtnv5a9sn=38=dgsa7HUMnYM7dk7xW7gRB3g@mail.gmail.com>
Subject: Re: [PULL 0/4] Python patches
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 3, 2022 at 11:52 AM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Thu, 3 Feb 2022 at 16:38, John Snow <jsnow@redhat.com> wrote:
>
> > On Thu, Feb 3, 2022, 11:20 AM Peter Maydell <peter.maydell@linaro.org> =
wrote:
> >> Summary of Failures:
> >>
> >> 1/1 qemu:block / qemu-iotests qcow2 ERROR          243.14s   exit stat=
us 1

I'm not too familiar with this new test runner, yet. (Is this error
even anything to do with the python lib? I guess I can't rule it
out...)
I just got a clean run of 'make vm-build-netbsd', so I'm using that
output as reference and making some guesses.

If I search the output for 'qcow2', I see the following output (with
possibly many lines between each hit):

1/1 qemu:block / qemu-iotests qcow2        RUNNING
>>> MALLOC_PERTURB_=3D205 PYTHON=3D/usr/pkg/bin/python3.7 /bin/sh /home/qem=
u/qemu-test.lj6FNa/build/../src/tests/qemu-iotests/../check-block.sh qcow2
=E2=96=B6 1/1 qcow2 001                            OK
=E2=96=B6 1/1 qcow2 002                            OK
=E2=96=B6 1/1 qcow2 004                            OK

... and so on and so forth ...

=E2=96=B6 1/1 qcow2 299                            OK
=E2=96=B6 1/1 qcow2 313                            SKIP
=E2=96=B6 1/1 qcow2 nbd-qemu-allocation            SKIP
=E2=96=B6 1/1 qcow2 qsd-jobs                       OK
1/1 qemu:block / qemu-iotests qcow2        OK             176.35s   74
subtests passed


I tried modifying 040 to fail on purpose, and I see:

=E2=96=B6 1/1 qcow2 039                            OK
=E2=96=B6 1/1 qcow2 040                            FAIL
=E2=96=B6 1/1 qcow2 041                            OK

[...]

=E2=96=B6 1/1 qcow2 nbd-qemu-allocation            OK
=E2=96=B6 1/1 qcow2 qsd-jobs                       OK
1/1 qemu:block / qemu-iotests qcow2        ERROR          106.06s
exit status 1
Summary of Failures:
1/1 qemu:block / qemu-iotests qcow2 ERROR          106.06s   exit status 1


I don't think I see it on the output you mailed, but can you point out
which test is failing, at least? Grepping for 'FAIL' should be
helpful.

--js


