Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7400C496715
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 22:07:05 +0100 (CET)
Received: from localhost ([::1]:56012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB17g-0004DF-Gd
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 16:07:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB0wB-0001VK-Lm
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:55:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB0w5-0007ii-9b
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:55:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642798504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3oKFoov2wK5u3W2x9wII/xsh9vNITZSJSHQUUIbzJJQ=;
 b=axJBLEyOd2C4Kq+fSVNki+bovLjscbp1O64EPaYJp2qBqW/8e1VHXVunZ/GIbL6cS2iP3K
 1INvkuL/yDuZi7YGlD7nd2Yp9rwdX6eW/j7kIHksRdPXQLZs7xnfQ92/2/pmsskFVWd406
 7znNL4xaGGFnEsxEOM9C7n+8MlS4HQs=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-YHUHYkEVNz-BdZHqOsn0jQ-1; Fri, 21 Jan 2022 15:55:03 -0500
X-MC-Unique: YHUHYkEVNz-BdZHqOsn0jQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 a11-20020ab0080b000000b002feae8ac89aso6270663uaf.23
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 12:55:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3oKFoov2wK5u3W2x9wII/xsh9vNITZSJSHQUUIbzJJQ=;
 b=TZTumC/x9B53OWF/80QrltNWe2DjafkXUwEV3w5hMiaUBzybAZI7e4l7unSCG2HnS+
 N/T5ClKzdu/6PO7qWeZH79GCbWU5eVGE2JIZIMBChkWgGbd8PE2RW8zLQrdmtCrxvGnU
 tJCSgctr1RPb6Gxl27frUNGoKmcrpx8Q0l/HiihUmiGXZqC4wie8czEJ8nURSP/E/Da5
 ROZDdMKOxVyZJ6HoZtgH9gdIXB028VhLW/KOWGLpLLB0lCzNYda2vcGmMGh35ESnejAr
 ORDmlIlOC6mlnbseIjJwIbCDDW6kSWomUihSe4znL/0FxnF0FCu38Nh5ZQ2kBEpJF9oB
 wGaA==
X-Gm-Message-State: AOAM530ZRj1TX6io/JHic/Tznqau94cZQwHdtzAWEl6rUcJW5POxpiyh
 GtvHGxmvYpy7R0QrlmVvVED+engmUQjFgAlmH7i0qdHEUdVFZuBPyDmtGbmdnNFgzhZYJ6b83et
 1bu+1oDPGpwtKCapGQfCGLR+n5egE96w=
X-Received: by 2002:a67:c117:: with SMTP id d23mr2575115vsj.35.1642798502361; 
 Fri, 21 Jan 2022 12:55:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9bKR+yZOdExGqCQ4ui2A0ZVgW6xUX9YLdTEzScVlBwgmQ6rDWGWXrC46COEy1pEtxYFlEvA6XJGFW0h+ZUa4=
X-Received: by 2002:a67:c117:: with SMTP id d23mr2575111vsj.35.1642798502154; 
 Fri, 21 Jan 2022 12:55:02 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-boicm8NU6-jimC8qyJVfA3BymcK8687ddBWoQ5LFu6HQ@mail.gmail.com>
In-Reply-To: <CAFn=p-boicm8NU6-jimC8qyJVfA3BymcK8687ddBWoQ5LFu6HQ@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 21 Jan 2022 15:54:51 -0500
Message-ID: <CAFn=p-a1p3zF=HgREUhhREn1H0LVcKXJCUFV1CNsKXXfGWqZtw@mail.gmail.com>
Subject: Re: tests/tcg/multiarch/threadcount failing on GitLab
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 21, 2022 at 3:53 PM John Snow <jsnow@redhat.com> wrote:
>
> lately, I've been seeing this test fail under the clang-user job; see
> https://gitlab.com/jsnow/qemu/-/jobs/2002782042
>
> make[2]: *** [../Makefile.target:156: run-threadcount] Error 124
> make[1]: *** [/builds/jsnow/qemu/tests/tcg/Makefile.qemu:102:
> run-guest-tests] Error 2
> make: *** [/builds/jsnow/qemu/tests/Makefile.include:63:
> run-tcg-tests-sh4-linux-user] Error 2
>
> (In this branch I've staged some Python code changes, but I would hope
> that's not related to this.)
>

Oh, and this one:

make[2]: *** [../Makefile.target:159:
run-plugin-threadcount-with-libbb.so] Error 124
make[1]: *** [/builds/jsnow/qemu/tests/tcg/Makefile.qemu:102:
run-guest-tests] Error 2
make: *** [/builds/jsnow/qemu/tests/Makefile.include:63:
run-tcg-tests-sh4-linux-user] Error 2
make: *** Waiting for unfinished jobs....

from https://gitlab.com/jsnow/qemu/-/jobs/2002782036 under the
'build-user' tests.

Something you already know about?

> --js


