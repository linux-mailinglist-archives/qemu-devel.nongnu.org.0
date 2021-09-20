Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1D841183E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:31:44 +0200 (CEST)
Received: from localhost ([::1]:55666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSLGh-0004Jn-45
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mSLAk-0004Yc-Nu
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 11:25:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mSLAh-0004sc-UX
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 11:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632151529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m/VHbA4Ssvpr02hFTnrMMjM9cK1Lf1JZI6K/6MNc9gA=;
 b=fLX8mbC8XIv3zLCkksLRrmvXdH+TCkHT0wCdzZXyMNemKCSwVU6c0WXfl1lR2/eToJXRsE
 3jcFJsCLZnURuaOIVA/lXV8VEPuId7tBAhmj0uo4CD3mM7oFzM3HQlaKeGXR6GVHSNCj2h
 odpjc+5zgcMX+UoV8niQDLqWJcfY1z0=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-HJrK-gA3PDOwvSwdJaRtKg-1; Mon, 20 Sep 2021 11:25:27 -0400
X-MC-Unique: HJrK-gA3PDOwvSwdJaRtKg-1
Received: by mail-pl1-f198.google.com with SMTP id
 c10-20020a170902aa4a00b0013b8ac279deso7136162plr.9
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 08:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m/VHbA4Ssvpr02hFTnrMMjM9cK1Lf1JZI6K/6MNc9gA=;
 b=pbfhujQO5ffGZpxDsoByxiAAXhYIudi3U9qorGPT9SE88C7reWNnjIc4Gw0y0BBQaB
 V1VtBPjZ/OI5j0f3DiP1F+kkb5i7MIsf/v/L2e+xFIoGD/OAAp9/MOgFc6zwVY8dWcau
 H3nQxH6YVzFtCKl0+Ip0zcjvhToRYEfROLscf4Wycv5ElO4bAk1s4oo8aqcLEW3lcwhI
 hzrPtUPorfAF+mH1NPlgrqjbWhkgHNKhfq/gVfH0JGNVYyBLgFt8GrNtjg3bQ+40RcEP
 QOoEnf6q2dg8tnE1r0ewW0KyJQhdNALmbfG5ErTt6XAAJ9NxcN/rlJC89K604mLvh6rY
 E6Lg==
X-Gm-Message-State: AOAM533xH2DcCvHkp2ZLzTl9TbKtEhOoKxpD3kC0cvR15VhHzxLo8taL
 dp/xL3xAP+i+JsNqLl/dH/zX6rOkBC4fMXSUvlVA6IqkR3lm6fQagKVMNb2tMom5MgpZsbwyiSh
 p+QTdlAsmhuiuGVj4QS9ayy8dE8/vlzs=
X-Received: by 2002:a63:b204:: with SMTP id x4mr23259208pge.212.1632151526445; 
 Mon, 20 Sep 2021 08:25:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw09tn3A5y1Of8t6o8C6hDesrpG+4UNvz3MzYQk2cOp0mRFYaPQcLhUx+GFOutwNgYXu7as6gVBLfqN/SFLgvE=
X-Received: by 2002:a63:b204:: with SMTP id x4mr23259182pge.212.1632151526137; 
 Mon, 20 Sep 2021 08:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9_e4hAisAwGrNu5hK6vioPzpJ_JQD5Jd9VF=YmQ=7moA@mail.gmail.com>
In-Reply-To: <CAFEAcA9_e4hAisAwGrNu5hK6vioPzpJ_JQD5Jd9VF=YmQ=7moA@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 20 Sep 2021 12:24:59 -0300
Message-ID: <CAKJDGDZP8iWvj2aiEKD3eRwHEe9Gu629S+_Oon5biY+a-Z2ySQ@mail.gmail.com>
Subject: Re: how do I run a single acceptance test?
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Peter,

On Mon, Sep 20, 2021 at 7:56 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Hi; I'm trying to bisect a problem that's causing an acceptance
> test failure, but docs/devel/testing.rst doesn't have any info about
> how to run just one acceptance test rather than the whole lot
> via 'make check-acceptance'. Is this possible?
>
I know this was discussed on IRC, but just for documenting on the
mailing list, you can use the following, as an example, to run all the
tests from file boot_linux_console.py:

build/tests/venv/bin/avocado run build/tests/acceptance/boot_linux_console.py

Or, if you want to run a specific test:

build/tests/venv/bin/avocado run
build/tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_sh4_r2d

I'll send an update to the documentation explaining the above.

Regards,

Willian


> (It's pretty slow to have to run the whole thing, because we still
> have those horrifically slow BootLinuxAarch64 tests in there which
> eat the bulk of the time and are not interesting for this bisection.)
>
> thanks
> -- PMM
>


