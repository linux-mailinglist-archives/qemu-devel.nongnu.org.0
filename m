Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA68A2D9AA0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 16:14:43 +0100 (CET)
Received: from localhost ([::1]:49860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopYh-0000Mm-1i
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 10:14:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kopXD-0007ZX-M2
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:13:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kopXB-000452-KV
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:13:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607958788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MnthGPhCTRv14vf+7Nzowf0LHPKf5Hy4MQANVJVqFsw=;
 b=GjjgIv0u/Va+K8jcxAwkjTQ1bzh/8MEGDi950W/B/RlN8UUx0XLrSm7xlMVTRv9Rv2iO4g
 PRUjTLGeeKRYHC8H/BXQZdC7lJocrNgCZW4KDaTzbcWGFyfciSxCf/ARFGmoyQ6MjKaZZP
 HGrHo6jbSJObKQJ0mZhVvSzxASLaMLc=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-PS7z4zqiOzKxWXwNxeqPTA-1; Mon, 14 Dec 2020 10:13:07 -0500
X-MC-Unique: PS7z4zqiOzKxWXwNxeqPTA-1
Received: by mail-vk1-f198.google.com with SMTP id t9so7284479vkd.19
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 07:13:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MnthGPhCTRv14vf+7Nzowf0LHPKf5Hy4MQANVJVqFsw=;
 b=eeqCVPvZMA9PWAUORlc+FnCxCfhGrMGXe6CwddD4Pri75WjHzun8XqStD8DdNrm3Z5
 rmz4wUvswtQIF9C18ytg4vY7pBWgS+HLyApRuT4RWPQApg26b+JADbhpGIStn25Vig1I
 hOzW4+L+4t3B0cZ4uxpUd6uFXqKKoTaL1riUFCSAZOiK/iZPMwNn5JtvPdp0rE4eCQLF
 sbQTv+42SlfqsDWsjV+pkLoMY0SEYbd3OwQZVM8rPhDa3UFEWnl+611EnYLZ5bWlnHP3
 T4NisJZCnZWC2/9R1RjXIsHqRVBs/nT8cwLFjAiPkgKtFOo5k6CteQQ38S2SQRLJkOoo
 xSwA==
X-Gm-Message-State: AOAM533embMupMBk2JUKTCcb6fbjOqa1+aIH7EHHWrVeFpEeOjVzHqjJ
 UF8tZOc1P3pGoiv22yUfk7eLwQqXeIZeiOTm52Igaon6cnUvsajcw9XnhM5/Oe2X8OoMzT52oMa
 li72OMHN5emrtUqnPlC2VxbAfrE9o4Wo=
X-Received: by 2002:a05:6102:7d8:: with SMTP id
 y24mr5339550vsg.50.1607958786602; 
 Mon, 14 Dec 2020 07:13:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyY9ECnPSW0MVh6nOZO/nvs5BDsaOTwpzOGx94yZXbaeYzRYyoTn4CPU2GmsLuVaKg2uCO91P6miNcIDueiow4=
X-Received: by 2002:a05:6102:7d8:: with SMTP id
 y24mr5339522vsg.50.1607958786366; 
 Mon, 14 Dec 2020 07:13:06 -0800 (PST)
MIME-Version: 1.0
References: <20201211173134.376078-1-thuth@redhat.com>
 <15276695-1718-e3a9-907e-c6e145294a87@redhat.com>
 <ee0257d8-3b38-5baf-5552-8c0f3f09ce37@redhat.com>
In-Reply-To: <ee0257d8-3b38-5baf-5552-8c0f3f09ce37@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 14 Dec 2020 12:12:55 -0300
Message-ID: <CAKJDGDaKLzt1Bc-pQdDZpJEZj3faMrrHE1GHmWtKGjJ55yy86g@mail.gmail.com>
Subject: Re: [PATCH 0/3] tests/acceptance: Test virtio-rng and -balloon on
 s390x
To: Thomas Huth <thuth@redhat.com>
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Dec 12, 2020 at 4:15 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 11/12/2020 21.10, Willian Rampazzo wrote:
> > On 12/11/20 2:31 PM, Thomas Huth wrote:
> >> Add two more simple tests to check that virtio-rng and virtio-balloon
> >> are at least (very) basically working on s390x.
> >>
> >> Based-on: 20201204121450.120730-1-cohuck@redhat.com
> >>
> >> Thomas Huth (3):
> >>    tests/acceptance: Extract the code to clear dmesg and wait for CRW
> >>      reports
> >>    tests/acceptance/machine_s390_ccw_virtio: Test virtio-rng via
> >>      /dev/hwrng
> >>    tests/acceptance/machine_s390_ccw_virtio: Test the virtio-balloon
> >>      device
> >>
> >>   tests/acceptance/machine_s390_ccw_virtio.py | 59 +++++++++++++++------
> >>   1 file changed, 43 insertions(+), 16 deletions(-)
> >>
> >
> > One observation, test_s390x_devices tends to get longer and difficult to
> > debug in case of problems. If a test covers one specific device type, It
> > will improve readability, flexibility, and debugging. In case you don't want
> > to spend time breaking this into multiple tests, I'll be glad to do that
> > after the whole series is merged.
>
> Theoretically yes, but practically we also want to run the tests as fast as
> possible. Quite a bit of time is used to boot the kernel, so if we add a new
> test for each and every device, that would increase the test time quite a
> bit. Thus I'd rather prefer to keep everything in one single test instead
> for now.

That is, indeed, a good point!


>
> > As far as code concerned,
> >
> > Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> > Tested-by: Willian Rampazzo <willianr@redhat.com>
>
> Thanks!
>
>  Thomas
>


