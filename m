Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855512EFA7E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 22:29:11 +0100 (CET)
Received: from localhost ([::1]:57436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxzJm-0002q9-3f
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 16:29:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kxzIP-0002N8-DE
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 16:27:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kxzIN-0004ut-Bk
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 16:27:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610141262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IdG+krK1mBJelKJknnp3nKPkPiIv8LzqNl3+kCLKxPQ=;
 b=VCKA2q5IFVsOBYgkfIt+Y0NuC/X7RCPRspcZCIRAWmdmKVPL9eRF+suIsIN9VbPSYzt6JR
 E51UiXWaS/tjv7DnYoTLE2XVxIm2Lgr5Lhuu8TFuMPOkJezzDItA+BdyswPG0u0mZUUpfZ
 kV4AGbqbs9sWcomMFM2p7IH5fbhREEo=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-fvBAwD0xMEWUnAcHnwNMJA-1; Fri, 08 Jan 2021 16:27:38 -0500
X-MC-Unique: fvBAwD0xMEWUnAcHnwNMJA-1
Received: by mail-vk1-f200.google.com with SMTP id 84so5988594vkx.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 13:27:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IdG+krK1mBJelKJknnp3nKPkPiIv8LzqNl3+kCLKxPQ=;
 b=ITUGd4DJ70Ux03ULpXJEp9Lq4cRhTWcViBJS3YB7XABhOQkylQgfsoflOGajrv8KwY
 aSJCz+CLm0pJgwdzUvPVryPrS68R5pE+aL4vJE6hPkQrZH+JSbd+UjBymRXrn4gP1Naw
 2zHbRnPPBC7/s+FMH2gJTKEoLyrgLf/IoisDY+ls7bAM3faABNhG5NIfLISWOxx80MVO
 2VdobEOvmH5G+epm2F0fNoLQZwky68SdKJjP8xlZSVhoUT0zPiT9AuuHtoVWe9jQWRrr
 cJXJNSuE4Wt0Vf/XdT+IM+k3xPLbn6S88mH7kgDT9scKyRTNILMOd8AHhfgurRc1TIAi
 E+DA==
X-Gm-Message-State: AOAM530mbti9AvanaXU4FDcXeXbcVKQrPOEtBd+fbjn2dwwJs5Hmiwzp
 CHp4EJMYG1nlYgZFqdtlQnz9KnjeEoJBWVVPQVwo8KaHfqgYFlx/J9xxYRDTKVnNQcQNHtgtLfX
 xRrVXeCJJsa2Ycug+prV7Ghw0lo4DhoU=
X-Received: by 2002:a1f:8d92:: with SMTP id p140mr4985328vkd.19.1610141258084; 
 Fri, 08 Jan 2021 13:27:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6RQ6Jksm0VZzYCc/saQVCUvujKk7Wf6VddJ9NSCiH4Ba8gGkckGG6sQK2CTnXN4TUnkYRrTMlwjo7c19V6x4=
X-Received: by 2002:a1f:8d92:: with SMTP id p140mr4985311vkd.19.1610141257859; 
 Fri, 08 Jan 2021 13:27:37 -0800 (PST)
MIME-Version: 1.0
References: <20210108185645.86351-1-thuth@redhat.com>
In-Reply-To: <20210108185645.86351-1-thuth@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 8 Jan 2021 18:27:27 -0300
Message-ID: <CAKJDGDYp-fSE1KBg9=4f=v5uQAWA+y-r2QitxmLHcDfBapn7Wg@mail.gmail.com>
Subject: Re: [PATCH] tests/acceptance: Fix race conditions in s390x tests &
 skip fedora on gitlab-CI
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 8, 2021 at 3:59 PM Thomas Huth <thuth@redhat.com> wrote:
>
> There was a race condition in the first test where there was already the
> "crw" output in the dmesg, but the "0.0.4711" entry has not been created
> in the /sys fs yet. Fix it by waiting until it is there.
>
> The second test has even more problems on gitlab-CI. Even after adding some
> more synchronization points (that wait for some messages in the "dmesg"
> output to make sure that the modules got loaded correctly), there are still
> occasionally some hangs in this test when it is running in the gitlab-CI.
> So far I was unable to reproduce these hangs locally on my computer, so
> this issue might take a while to debug. Thus disable the 2nd test in the
> gitlab-CI until the problems are better understood and fixed.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/acceptance/machine_s390_ccw_virtio.py | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Willian Rampazzo <willianr@redhat.com>

JOB ID     : 6b2b3c1f6f6b0c4c2e9fd694b475bd12c193adbd
JOB LOG    : /home/linux1/src/qemu.dev/build/tests/results/job-2021-01-08T16.24-6b2b3c1/job.log
 (1/2) tests/acceptance/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_devices:
PASS (8.78 s)
 (2/2) tests/acceptance/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora:
PASS (23.86 s)
RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
| CANCEL 0
JOB TIME   : 33.02 s


