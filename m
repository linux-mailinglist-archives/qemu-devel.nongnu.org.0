Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302C52D4994
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:57:43 +0100 (CET)
Received: from localhost ([::1]:40332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4ek-0004mc-6h
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kn3uE-0003Rf-Tf
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kn3u8-0008Oo-Ed
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q7qjMXEnz4gmEOrTYTFeWlkeTw4mZBNi+Nh6QEULJmE=;
 b=Imbt3mSRrdOiVrfEr9ZEdMVIlI3HLwPgsFHwFqEFBlhW4HccI+hfq/A4mWXL8Zhv/q63zH
 mRMNQsfahZzVKU7li0rt5gHJ6mRR8gCeOf8qAQ7KEsKH3YZ5mta6B1zBa/xG5rSLT4RoJR
 jm6w+uU4vTV7sE0PsIneDri913jXRqk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-X7WjHP_POluLuUsS6xfwuQ-1; Wed, 09 Dec 2020 13:09:29 -0500
X-MC-Unique: X7WjHP_POluLuUsS6xfwuQ-1
Received: by mail-wr1-f70.google.com with SMTP id j5so951408wro.12
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:09:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q7qjMXEnz4gmEOrTYTFeWlkeTw4mZBNi+Nh6QEULJmE=;
 b=UYr8pmOj9DM54eH7cXh2iO90JwiBGpSAmFMAL4VwUlwuDC4+YOvLaR2DyKBPHor+ns
 P9906lS8DoVNP78FA08PC4Dkc/fTC1qcHvvBacNnoGQbslLw3UEDPwpYgFVca05i4+UA
 LSkk6ntXjRSs/Jte3rMoq3yRWaa5Ctc/N+8p1C/s+R20Q85ZDKrttkYwB6WHQyej1q7s
 u66kNQf3+SsDmSsF1NlVhXt6fJF85g3BYHSOtI/uPF1zzUxYR4BPppJ8wAEaanrSdxNE
 mP8bt/tQ053iEaB+ndGBHMz+eei47Kv62mc20kTcgLFE3aR5rlld8UbW4qV3pFJ1MRqy
 E1kw==
X-Gm-Message-State: AOAM533VmvFnkw3+Cy++pajSW8Ei4VN7V/rOeAY4n8YP4DcXNgEGLr+C
 Uw/56rxFaPiibRCztWWZFy5s15Zygi1QI1Nj2SNxiVEeQ0RWTBxID6JA88qxbndfl3RjxA1VV+v
 D3TsEdo8Uzj2dcYY=
X-Received: by 2002:a5d:61ca:: with SMTP id q10mr4093373wrv.124.1607537367938; 
 Wed, 09 Dec 2020 10:09:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrAwmf97KbuBJUayaUGw2vnMsjMbfIjDgN2M/Yhyicf3ZGlklqHUu9ADad3M6t9qCW8VoEiQ==
X-Received: by 2002:a5d:61ca:: with SMTP id q10mr4093351wrv.124.1607537367776; 
 Wed, 09 Dec 2020 10:09:27 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n14sm4899491wmi.1.2020.12.09.10.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 10:09:27 -0800 (PST)
Subject: Re: [PATCH v3] tests/acceptance: test hot(un)plug of ccw devices
To: patchew-devel@redhat.com
References: <20201208122843.147186-1-cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <07eaa46e-336c-e28f-8904-127eb07d369c@redhat.com>
Date: Wed, 9 Dec 2020 19:09:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201208122843.147186-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo, Fam,

On 12/8/20 1:28 PM, Cornelia Huck wrote:
> Hotplug a virtio-net-ccw device, and then hotunplug it again.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> v2->v3:
> - do the dmesg cleanout and waiting for messages properly [Thomas]
> 
> Wainer: I dropped your r-b, as there had been too many changes for
>         me to be comfortable with retaining it
> 
> ---
>  tests/acceptance/machine_s390_ccw_virtio.py | 24 +++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Patchew failed applying this patch... Any idea what got wrong?

Switched to a new branch '20201208122843.147186-1-cohuck@redhat.com'
Applying: tests/acceptance: test hot(un)plug of ccw devices
error: sha1 information is lacking or useless
(tests/acceptance/machine_s390_ccw_virtio.py).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 tests/acceptance: test hot(un)plug of ccw devices
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Failed to apply patch:
[PATCH v3] tests/acceptance: test hot(un)plug of ccw devices

https://patchew.org/QEMU/20201208122843.147186-1-cohuck@redhat.com/


