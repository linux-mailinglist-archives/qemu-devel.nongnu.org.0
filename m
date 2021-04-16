Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5738236244E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 17:44:54 +0200 (CEST)
Received: from localhost ([::1]:39036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXQeL-0005uG-F0
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 11:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lXQbg-0004fM-Qz
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:42:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lXQbe-0005A5-Rz
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618587726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hJ2CgBzXIAv16dlfXO/kx1g366euPNJd/aubXw4gMu4=;
 b=CP+DvH74tQ+jKgupIUbKzq7B3V4uaWO+4D+qkXkcRualiVEQcJHVGu71tYYPqTP/0aE2oy
 TVOtRiCvaeJ33j5Zdl24ozkkCSKC4VnHK92NFsKoaxiX1CB6xP4utLR19Lx6XPYrzY/iBy
 IK4dhmJSrFHYMPfUu/+CNlplYC5VQpI=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-6ObsfJ7KPxiez1GcVsz9OA-1; Fri, 16 Apr 2021 11:42:04 -0400
X-MC-Unique: 6ObsfJ7KPxiez1GcVsz9OA-1
Received: by mail-ua1-f70.google.com with SMTP id
 k8-20020ab059c80000b02901dbe33ea7f9so1954748uad.17
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 08:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hJ2CgBzXIAv16dlfXO/kx1g366euPNJd/aubXw4gMu4=;
 b=rWxhb9bkaDXDcaA2INvFQmYY2iNYHeixa4BHud81fmyfhwzHfqYLGvVX6SX5HrwfUr
 2cwpPEAL2eChSVR+4upd1xokpdYwaLLhbHaSsjZRxq7ZbZUWWBSDXZZNN5c12q/Lub0E
 7GizexBhUjSZLdJfR1B+OjXWP/Rz2LFSDnG75zl9TgvsB+tKjt05xGJZoqWlsK4OY0l8
 STBslTCVlO+9QPlUQjZHNb+6mEDM7ChSteaMeA6hM5lk8KK3zbd8FNeDPhBumNAfOP09
 BlqmjmefHrwN/4NoxQYpkFVnh6SPEoC5/1f5sLv6YoMto/hm8mV7YgimdCVkB3e5PRC4
 r5HA==
X-Gm-Message-State: AOAM532mBOlm9vGjtmr2pEklcq02vj3GmUWGGwHf0KDzYuUAng+qc0VZ
 jP0HpYAHsIqwr06/2GvqqIG1c3YWbOMuw2o2Kj21Uw6/bd3ehueyzOiRQfLRaVQnXox+k1HAGOS
 V4oJtOquRfPRH8xcIl9OdJ5LGRLICB50=
X-Received: by 2002:a1f:cc47:: with SMTP id c68mr7768923vkg.19.1618587724044; 
 Fri, 16 Apr 2021 08:42:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzN1ATd2TW2cRNGY82gefuC5cnllbCmAb0hMMx+dUuybD2eVmlhU0Xm+B2QX8PP50SzBF9b+jLAQwlsM6AcWI=
X-Received: by 2002:a1f:cc47:: with SMTP id c68mr7768910vkg.19.1618587723903; 
 Fri, 16 Apr 2021 08:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-4-crosa@redhat.com>
In-Reply-To: <20210415215141.1865467-4-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 16 Apr 2021 12:41:38 -0300
Message-ID: <CAKJDGDbJ=em63tyegJeL63CT0ZDMg6H8Q7z3p-oAsRb1bBYWbQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] tests/acceptance/linux_ssh_mips_malta.py: drop
 identical setUp
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Auger Eric <eric.auger@redhat.com>,
 "open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 15, 2021 at 6:52 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> These tests' setUp do not do anything beyong what their base class do.
> And while they do decorate the setUp() we can decorate the classes
> instead, so no functionality is lost here.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/linux_ssh_mips_malta.py | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


