Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C719371701
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 16:48:04 +0200 (CEST)
Received: from localhost ([::1]:54020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldZre-0007ik-TI
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 10:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ldZqP-0007BT-2C
 for qemu-devel@nongnu.org; Mon, 03 May 2021 10:46:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ldZqM-0006NS-IW
 for qemu-devel@nongnu.org; Mon, 03 May 2021 10:46:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620053200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X13Vf8sdKgEomruYzvtM8iFFtQv1p965J5/gLQOT/XM=;
 b=i2wIZDLYOnp/fPkuUsTyAHAHZb6iT+pKWkscImwBIiKkr/YUaK1kTKL3iQeORsGw5L0hGE
 hmvp8czbN9FCloB/DU68N/uaT6+uzJV4DkGAtQyV5QKO7njJkoHo28NJ0Q8HYOJd8GB5jP
 uYOxPkoHkLWLWYdqqeLK/DMhDzjrT7U=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-v7RPiAcQPTu07znxx5NMow-1; Mon, 03 May 2021 10:46:36 -0400
X-MC-Unique: v7RPiAcQPTu07znxx5NMow-1
Received: by mail-vk1-f197.google.com with SMTP id
 w19-20020a1f94130000b02901e9c73307d5so779843vkd.5
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 07:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X13Vf8sdKgEomruYzvtM8iFFtQv1p965J5/gLQOT/XM=;
 b=X8FNyjJiJirWVcZCQzSHlddCo2NXQtbcLbzjQFIHsS9hGk6renqbrRUzdu13EN7YIk
 8Tj+HEUNvlysQJVgtKNYfdJeJnnlEPh1p+aHUbsE2HrGxsBPTRsNp6NaUcbmR2gN6D2J
 E4S7sPGjq5fUge+OAdeJgDcI1EZ1JYgE3hx8M0E9CDrCHFCDxDm5l7mYkcBvQUjBnQZF
 2k5YyddF6JqSk4PG2FyniOc4P0Bpxfb3/2bejmPr/rjnuuKpSac0zJTAQT0ALpL5b+1p
 1JK9u0jDq/jwJaIY+A3odAFaJn1beaggqA3ijmduZ6A0waEhGrTaqHXaLQwVwjgm2wZY
 jloQ==
X-Gm-Message-State: AOAM532NakdYNagjDzQeH2itpL48oTLAjm9/QZk2agNcJHnlPT2u96Xn
 6JSCyI/+MnYRDyQ6w4/s4l4TfGAOhtByp8v3UXBvx2T4m9sM4HIMdOtP0VSVakt4/t+S0TQdHSB
 gUbCb8BeC5kbRZa+9qj497/a2NwOj7oM=
X-Received: by 2002:a05:6102:a89:: with SMTP id
 n9mr16269968vsg.45.1620053195663; 
 Mon, 03 May 2021 07:46:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbV3bGU4J5QcvNxoSPABdQT6i7Nx+/1btIxyicz6yOaH7k0FO0hsAvbMFhSsfx2+ZUjzEx2moNDjYR1R5zbJE=
X-Received: by 2002:a05:6102:a89:: with SMTP id
 n9mr16269919vsg.45.1620053195304; 
 Mon, 03 May 2021 07:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <ac0e8d46-6e57-b454-9162-17dc2f3b6534@amsat.org>
 <CAKJDGDb5GXTLB=7nmdu9_znrf4tVHS+6Rto5vdzYXyNcLG+x8Q@mail.gmail.com>
 <c753b71a-b0a4-a182-976d-00c36edc5e4a@amsat.org>
In-Reply-To: <c753b71a-b0a4-a182-976d-00c36edc5e4a@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 3 May 2021 11:46:09 -0300
Message-ID: <CAKJDGDYuw-A+63wMvDcp7gK8QowoDDN-TwMCFv3i6=kvOqjUdQ@mail.gmail.com>
Subject: Re: Problem with Avocado and QEMU console
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 3, 2021 at 10:36 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 5/3/21 3:12 PM, Willian Rampazzo wrote:
> > Hi Philippe,
> >
> > On Mon, May 3, 2021 at 9:59 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
> >>
> >> Hi Cleber, Willian,
> >>
> >> Avocado marked the test_mips64el_fuloong2e as failed while
> >> it succeeded:
> >> https://gitlab.com/qemu-project/qemu/-/jobs/1231363571
> >>
> >> Apparently the first part of the console output is missing.
> >> (Normal console output attached).
> >>
> >> Any idea what could be the cause?
> >>
> >
> > The log shows the following:
> >
> > 12:00:37 ERROR| avocado.core.exceptions.TestFail: Failure message
> > found in console: "Kernel panic - not syncing". Expected: "Kernel
> > command line: printk.time=3D0 console=3DttyS0"
> >
> > Does your comment about "console output missing" means the expected
> > message was supposed to be on this missing part?
>
> Yes, "the first part is missing" so Avocado didn't see the expected
> message pass, but the messages emitted *after* it are logged.
>

Okay, got it.

The reason for it to fail is here:
https://gitlab.com/qemu-project/qemu/-/blob/master/tests/acceptance/boot_li=
nux_console.py#L53.
The way the `wait_for_console_pattern` method is defined tells the
test to fail if that `failure_message` is found.

I'm still checking why the test missed the first part.


