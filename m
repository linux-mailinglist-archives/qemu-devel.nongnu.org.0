Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 344C52D9ABB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 16:20:32 +0100 (CET)
Received: from localhost ([::1]:57292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopeJ-0003hp-6r
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 10:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kopZ8-0001Tf-BL
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:15:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kopZ5-0004GT-LG
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:15:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607958907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SHZNwMD0f8Yf199PQCVB01FLx80xd4fDLjMC5MD9UBM=;
 b=XuwCMKQFJkjwc86JX9COCUhAfV27pLVop5o5AyxVcZhxvl/gxMHnawPUQwXuX73vbWSq2v
 LSiVfSn9JOBIp/lz6fQXU0HAeAZW0OWHciptRmUQsgiB/w/Gg3lPH2zoFJ7yoZGbz01HTf
 8omPvoVvc/lRAec4Z2N/reRSOMETTwM=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-6phETH_UMyWx8DmW628wLg-1; Mon, 14 Dec 2020 10:15:05 -0500
X-MC-Unique: 6phETH_UMyWx8DmW628wLg-1
Received: by mail-vk1-f197.google.com with SMTP id n24so3894699vkm.2
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 07:15:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SHZNwMD0f8Yf199PQCVB01FLx80xd4fDLjMC5MD9UBM=;
 b=GyMFMAMzOYsru2ZW4UJ0XTUlT5xBFJYomY7wr9ukEyIjlwIJk9QNHTmi2DbDITECoc
 8rAoudDnP1CvrMeimVP7P0HpHrt7NDLh61347LNrternoNVXJOPdYgQ7FRfnlxYXqLLq
 sl88N1WpEulv3Qjpwvrx5/UzTpqBDOi3o1eq7EF9d74AFYr5ldI82ySePXNmJiJtEFz8
 Pzom211IcJIj051ShlaRxoKKTA8DHFRMwoKAKBfVqi3073eeriBAgSXuW7AX6abNBGby
 odt3fmj6PIcQu6RtbHPdeBHhNh1YI27cCDkfu6hhCMsB5rHgp2dxiLMu/nj/LQ50hke2
 bJBg==
X-Gm-Message-State: AOAM531KwgaGLC5cWF7Pox6/7hHX6h5EVR0CxWUBZ/adz1yjytuX+/HP
 bAzSY8zzYF4FxQa8TC1wqoh5BiHatMqBGWDbgXmcOBBR2FLGpLmhtIXESUwTiXZmug3Ft/29XzG
 ja/v11h04XuZB4VMxHjn4zBSDmWPOY8Q=
X-Received: by 2002:ab0:26a:: with SMTP id 97mr24197048uas.110.1607958904991; 
 Mon, 14 Dec 2020 07:15:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTyV/kD1eQEXPgAJrTcv4UYY9EcCuwpeQ3zEvxZHDlEbHhXkHc7ibBdFd8zhbwBSDZSI/hvUWNPBPDhE4s0Jo=
X-Received: by 2002:ab0:26a:: with SMTP id 97mr24197028uas.110.1607958904822; 
 Mon, 14 Dec 2020 07:15:04 -0800 (PST)
MIME-Version: 1.0
References: <20201211173134.376078-1-thuth@redhat.com>
 <15276695-1718-e3a9-907e-c6e145294a87@redhat.com>
 <ee0257d8-3b38-5baf-5552-8c0f3f09ce37@redhat.com>
 <20201214123920.1aae5cb7.cohuck@redhat.com>
In-Reply-To: <20201214123920.1aae5cb7.cohuck@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 14 Dec 2020 12:14:53 -0300
Message-ID: <CAKJDGDaMS8OfZ__kVndWrQYofdqFRr9ueUdqd1RNbc=5mRJ5KA@mail.gmail.com>
Subject: Re: [PATCH 0/3] tests/acceptance: Test virtio-rng and -balloon on
 s390x
To: Cornelia Huck <cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 8:39 AM Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Sat, 12 Dec 2020 08:15:13 +0100
> Thomas Huth <thuth@redhat.com> wrote:
>
> > On 11/12/2020 21.10, Willian Rampazzo wrote:
> > > On 12/11/20 2:31 PM, Thomas Huth wrote:
> > >> Add two more simple tests to check that virtio-rng and virtio-balloon
> > >> are at least (very) basically working on s390x.
> > >>
> > >> Based-on: 20201204121450.120730-1-cohuck@redhat.com
> > >>
> > >> Thomas Huth (3):
> > >>    tests/acceptance: Extract the code to clear dmesg and wait for CRW
> > >>      reports
> > >>    tests/acceptance/machine_s390_ccw_virtio: Test virtio-rng via
> > >>      /dev/hwrng
> > >>    tests/acceptance/machine_s390_ccw_virtio: Test the virtio-balloon
> > >>      device
> > >>
> > >>   tests/acceptance/machine_s390_ccw_virtio.py | 59 +++++++++++++++------
> > >>   1 file changed, 43 insertions(+), 16 deletions(-)
> > >>
> > >
> > > One observation, test_s390x_devices tends to get longer and difficult to
> > > debug in case of problems. If a test covers one specific device type, It
> > > will improve readability, flexibility, and debugging. In case you don't want
> > > to spend time breaking this into multiple tests, I'll be glad to do that
> > > after the whole series is merged.
> >
> > Theoretically yes, but practically we also want to run the tests as fast as
> > possible. Quite a bit of time is used to boot the kernel, so if we add a new
> > test for each and every device, that would increase the test time quite a
> > bit. Thus I'd rather prefer to keep everything in one single test instead
> > for now.
>
> I agree.
>
> Is there any other way to make this more debuggable?

I have some ideas in mind but I need to run some tests. I'm fine
merging the current code and improving it later.


