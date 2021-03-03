Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E5D32B8B8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 15:50:00 +0100 (CET)
Received: from localhost ([::1]:55392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHSp4-0007Tf-Kr
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 09:49:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lHSoA-00074U-PE
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:49:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lHSo5-00032Y-6v
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:49:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614782935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1cpc/5oODZm0QlIAXj36f+5MaHlSbzBsWXHOAE5VF88=;
 b=fHYJ7/e/RQfvGBDwBn+ES65D+Y6vhIIqeMehN/7sWaebCnrGwJkn4MPZsC/RYaIi5dizXB
 qCrhefg7Jv8gBqe+2hg3onb+qlxCbIOuaWK5QbLdxvnBnc9Cm6EAMAlcpkKOABvQrSSkst
 Dt+Hjcx7OJctbEQX9p0UTVFXi005828=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-2if1-IekNCO2oT-1rkOhTw-1; Wed, 03 Mar 2021 09:48:54 -0500
X-MC-Unique: 2if1-IekNCO2oT-1rkOhTw-1
Received: by mail-ua1-f70.google.com with SMTP id m62so939438uam.16
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 06:48:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1cpc/5oODZm0QlIAXj36f+5MaHlSbzBsWXHOAE5VF88=;
 b=oVQmI2aJWw4G/rYKJjiz3W7XrOl4Kid1IgPzjc6l7Y3a54L0LWH566ZYJu4QlunASk
 bwSBbJHhXAhNvM5bLQ7rbfMlG9bWwY7eThkyZsajjQIJy/M5+eaAwc2a5kG+r2IXCkym
 9L49eFHFpnJ+gULwPv7MPv3nsNIHBExEuVFUnCHJM84lKrTwRQs5ECuXTyojQ02lBry6
 HHftOoLVRuSYJfhAIgrQ4mwZyqyATbX+k4G/V1PWvbs/yMd1P6MUjM4hUnnKKxL9u2Gd
 E9S58kPmOoDYfQ7FRcAiH/GT9986CT3+81Q5/rk5YO4x31ugl+5Os7Fwal6gm9AzZ0Ho
 wWzw==
X-Gm-Message-State: AOAM531RsgLXqIZ9lI78SfGI8J6tDeqAxzNVVOTmFGlbjUKeF09EcWVR
 dzrdj4nuWKnn0fKzIB4ljpx+V0Qd8ZsLsFtG4elCOl+XrKzAMmHfHtOWl9Hka/kx5D2RmqHXee5
 dfN94WB4OfcOgjyGKvS5zCqHBcNyDLA0=
X-Received: by 2002:a67:fe99:: with SMTP id b25mr2126129vsr.45.1614782933875; 
 Wed, 03 Mar 2021 06:48:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/lKLwl5DwHgRNrL3qvgeezJBlyqYD7ehj25Cz7n5i+V0PVmTYosm2b9fTmC3NzaMNSP+T2/grKqnciJPudaQ=
X-Received: by 2002:a67:fe99:: with SMTP id b25mr2126120vsr.45.1614782933659; 
 Wed, 03 Mar 2021 06:48:53 -0800 (PST)
MIME-Version: 1.0
References: <20210303130646.1494015-1-philmd@redhat.com>
 <20210303130646.1494015-3-philmd@redhat.com>
In-Reply-To: <20210303130646.1494015-3-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 3 Mar 2021 11:48:27 -0300
Message-ID: <CAKJDGDbPO0PXX6DJVewgJCgitiCcV5iPHhjqRveytZaysLH1dA@mail.gmail.com>
Subject: Re: [PATCH 2/3] docker: EDK2 build job depends on EDK2 container
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 3, 2021 at 10:10 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Add missing dependency build-edk2 -> docker-edk2.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  .gitlab-ci.d/edk2.yml | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


