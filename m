Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8703699EA
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 20:41:46 +0200 (CEST)
Received: from localhost ([::1]:53722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la0kL-0004gA-O6
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 14:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1la0is-0003Kx-1g
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 14:40:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1la0ip-0001qF-BS
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 14:40:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619203210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j/FLLHUduchN5EEFtYun+V/QVcYRoCHFdY7N0cKSJ/E=;
 b=cWBzKkDQSQbU7DCxpaQOKDT3TnS9ERY+r2sZ/wGEni6xH4bAsU1MGKanQFyyhWnIYlK9cT
 SyQ87g1cZRjmtUA3ieQUsiZlfnt1WI8SCsaF2gmya729Xl+g2ZHsa8Pzr01N0KHzoqmHLQ
 9EdhtOPuG/kf/Ohp14mpsTudB56dDCM=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-4d2RiDlFPqay_R3RhaNl3Q-1; Fri, 23 Apr 2021 14:40:07 -0400
X-MC-Unique: 4d2RiDlFPqay_R3RhaNl3Q-1
Received: by mail-vs1-f70.google.com with SMTP id
 g1-20020a67d4810000b029022258d5038cso5032542vsj.15
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 11:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j/FLLHUduchN5EEFtYun+V/QVcYRoCHFdY7N0cKSJ/E=;
 b=ltu/Tbhnn47i2nT0LxasSQVQ0ket7RDWB/DpfIxf6D9nJJUteMGS9PZweFh0bYEYFK
 NB9IfcYpxINiUekKrkYoUzGGuyzJZ7nOzCijFvWpvfg5YGzqy5Po07FUjJiYFb+fzmcQ
 lfBk4TqbM5k1aIUrx4rWjAQGHrEkfS4QLU4qKpCqeUCBpiwl+jsPyUyFw5kdWg+F3u/5
 8PUROAqGfq3IZr5qwTo4gTAN5DN1GW3CXwcfQ4F/CXN24kbcLRx5m7pZqZWh3bVbApKq
 TupRGDjgmfOpI8nmebwzxXD/zv9IK8so1g42zfy7zHpGbjPWQ9oO/RztnhSab3gWSD2B
 hnDA==
X-Gm-Message-State: AOAM531DJrhlILtUOnCdtg6LQuGo+KEZXIyQ4ZYQurkzZ2JPV7z/FoTH
 sZ59M0fiTNg3ru28SJF5/5gRKxO0UqHYCcQn62y1Lcasll0FY21Y4yJ8oCf6w1fyCGnlXL6YgbB
 apEKsflBdw5VE2+TfV/3oXIWIm5WGQYY=
X-Received: by 2002:a05:6122:2ad:: with SMTP id
 13mr5132763vkq.11.1619203206697; 
 Fri, 23 Apr 2021 11:40:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKnT/jvHSTV7hFpfD+nIoKeDeyOmPIW2Tp2MgsHfxPLyS26t5TjCoJ/uhwdexVqZx1cQYMBxxModSJaN5jKGE=
X-Received: by 2002:a05:6122:2ad:: with SMTP id
 13mr5132736vkq.11.1619203206506; 
 Fri, 23 Apr 2021 11:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210419145435.14083-1-alex.bennee@linaro.org>
 <20210419145435.14083-11-alex.bennee@linaro.org>
In-Reply-To: <20210419145435.14083-11-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 23 Apr 2021 15:39:40 -0300
Message-ID: <CAKJDGDY1WQbhp9R_VC0jHBhthhfGSuwBz-hxntPPc1kcKTzg7Q@mail.gmail.com>
Subject: Re: [PATCH v1 10/25] tests/docker: Added libbpf library to the docker
 files.
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Andrew Melnychenko <andrew@daynix.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 11:54 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
> From: Andrew Melnychenko <andrew@daynix.com>
>
> The series of patches for eBPF RSS adds libbpf dependency for qemu.
> https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg08887.html
>
> With this patch, libbpf added:
>   Alpine - added libbpf-dev
>   Centos 8 - added libbpf-devel
>   Fedora - added libbpf-devel
>
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20210406082947.672708-2-andrew@daynix.com>
> ---
>  tests/docker/dockerfiles/alpine.docker  | 1 +
>  tests/docker/dockerfiles/centos8.docker | 1 +
>  tests/docker/dockerfiles/fedora.docker  | 1 +
>  3 files changed, 3 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


