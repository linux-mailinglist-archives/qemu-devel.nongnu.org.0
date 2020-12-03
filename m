Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9817D2CDD2D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 19:17:43 +0100 (CET)
Received: from localhost ([::1]:39520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kktAk-0003iH-NF
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 13:17:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kkt7B-0002Qc-Bg
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 13:14:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kkt78-0003SF-Fj
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 13:14:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607019237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l5MaQiNHNzIGuDVIjUBN3GTXl6T6M9fK5lcznL/n5z0=;
 b=DE1AjouTi0QWfPJGStBNqpTwvG90Um2KPcqJFKxaLIw7cnmFy0dFmahbO43zqFhpRT3PUY
 RgstPL0z7c/QGAf2fwDNPH7Qwo1mtvROe5M5M3d6lS7QJgrBQU/rV+gtpGEQrusTfFuKck
 HZxFbTF+GIHfCFAACS65mrz/xRUKRBY=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-uSyvGeaxPpu-AXv_7z2BGQ-1; Thu, 03 Dec 2020 13:13:55 -0500
X-MC-Unique: uSyvGeaxPpu-AXv_7z2BGQ-1
Received: by mail-vk1-f200.google.com with SMTP id s12so981145vke.18
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 10:13:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l5MaQiNHNzIGuDVIjUBN3GTXl6T6M9fK5lcznL/n5z0=;
 b=Qw9K3goue5nvxkgzf7Z1S6CKsHs5mQiJqZXUWRYOm+E62qYHKD+ZI2PF+cUDuCFwkB
 z0LHnpdJswiTCAWOz+kqMkxvuYZjwRD6Z1g8koK8P6pMB9JNdoZevPySt4GsdkvCa16M
 A3mE5026IMCE3b0hC/zhkr4rdpc3K773NvHXCXyyq33Z9hAV2qNSniFoYb9l+9/4Id6D
 vTCqts5lFUa6YwPqlnMbd5/Hn8Amh9ZJE5/oP70sVsbvUwfPnlDwmpEBAir/4zOlaisd
 TGj0eyabLISi9tvx4AU/vkjpINdfaDfefDHT84uigKJlw93fXICWIwKRO4HIhhTGyEBO
 gF/g==
X-Gm-Message-State: AOAM532KlB74a3CGM9EfFW+bEhdH90qHVgUa8IVW4+gbR9q6Y80Foa/+
 STk9ebe/gGiHgqTMI2UIF06XHAd0LvjRSU3kxwkYaGoSc3sWPMNWVHz4q3vT6fkz+rPvALON9QR
 WJ1bBrXp04BZnMFRMbyFGo+UEBseTlXU=
X-Received: by 2002:a05:6102:30aa:: with SMTP id
 y10mr3631546vsd.45.1607019235455; 
 Thu, 03 Dec 2020 10:13:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBcuJZtDUmHfaD+9BSd6lYNafBqDHMPzM7rI7eja4/pRvg4kSDZFdFqFpYmUhJMGUC3FhpA4C2yt4PFhO8abE=
X-Received: by 2002:a05:6102:30aa:: with SMTP id
 y10mr3631519vsd.45.1607019235229; 
 Thu, 03 Dec 2020 10:13:55 -0800 (PST)
MIME-Version: 1.0
References: <20201202215747.2719507-1-crosa@redhat.com>
 <20201202215747.2719507-2-crosa@redhat.com>
 <b00dc7be-cf66-34a0-3260-2a9cfcddde77@redhat.com>
 <20201203165033.GB2787993@localhost.localdomain>
 <20201203170233.GK2952498@redhat.com>
 <20201203172959.GA2792185@localhost.localdomain>
In-Reply-To: <20201203172959.GA2792185@localhost.localdomain>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 3 Dec 2020 15:13:44 -0300
Message-ID: <CAKJDGDZhiuvVd9tODWM+ysX-8S4oerf+JZNd2RSHWGRstwfPpA@mail.gmail.com>
Subject: Re: [PATCH-for-5.2? 1/1] Acceptance tests: bump Fedora to 32
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 3, 2020 at 2:30 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> On Thu, Dec 03, 2020 at 05:02:33PM +0000, Daniel P. Berrang=C3=A9 wrote:
> > I think the problem with the Fedora acceptance is that we'll be constan=
tly
> > chasing a moving target. Every URL we pick will go away 6-12 months lat=
er.
> > IOW, while the acceptance test pass today, in 6 months time they'll be
> > failing.  IOW,  switching to F32 doesn't solve the root cause, it just
> > pushs the problem down the road for 6 months until F32 is EOL and hits
> > the same URL change problem.
> >
>
> Just FIY, the tests will not FAIL when the images are removed from the
> official locations.  This is what happens Today:
>
>    JOB ID     : e85527a9d75023070f15b833eac0f91f803afc83
>    JOB LOG    : /home/cleber/avocado/job-results/job-2020-12-03T12.21-e85=
527a/job.log
>     (1/1) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_q35_kvm: =
CANCEL: Failed to download/prepare boot image (0.33 s)
>    RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0=
 | CANCEL 1
>    JOB HTML   : /home/cleber/avocado/job-results/job-2020-12-03T12.21-e85=
527a/results.html
>    JOB TIME   : 0.76 s
>

In the CI, enabling the GitLab cache will help, but will also hide the
URL change problem when it happens.

It is also true if the person ran the test and it successfully
downloaded the image once. For people running the test for the first
time, it will look like your output.


