Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303AD3B874B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:57:02 +0200 (CEST)
Received: from localhost ([::1]:58240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lydWH-0000Xo-94
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lydVO-00084w-EW
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:56:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lydVJ-0006Sy-6w
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:56:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625072159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vZuURuRTpzqEhktk4VXZXTDByJ6rr1s7uEEzIMjrANI=;
 b=WO0mJ2Tm7Lzwr+dpmzVBlxMQAVijr/0OvSMr6yLmXMjQtasdkfVqf+lGw6KuzhqHrP3S1E
 /XZAS3a3IctTbS31x/cCLJP2LB5mtYvf2YLLea47VieueZIq5KQ0VJYPHgDdR1hrNNRZ1b
 HC6il9XWXaIhY/XmD4uVueXhkuAqDyA=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-_wFK9mLONGefTeNkbkTQzA-1; Wed, 30 Jun 2021 12:55:56 -0400
X-MC-Unique: _wFK9mLONGefTeNkbkTQzA-1
Received: by mail-vs1-f72.google.com with SMTP id
 e25-20020a67e1990000b0290272d600a2fbso1247224vsl.21
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 09:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vZuURuRTpzqEhktk4VXZXTDByJ6rr1s7uEEzIMjrANI=;
 b=MOyb0PvXKzeOfSJtYfU1yHkwAk7QINoAX2NOm2mxwYmSvyJJAEsc5SbXw0AevMP9ZY
 mrQPd6YG5vP/tsze4XVJZqG9rGx7KS+LRhLYA/eMhADLAo3FC6oTVjBNlTlEOnYaZ9A/
 L6TUYBRngtG48wW2CtHzWbgAedEeBFr6YKlKYqWcZHRwAnf9jcMyNUehbtcfB9D7tsWB
 BoyruMRqo5PqAkivp1YOpgc+wrCoVmlhJHI5XWQ7TOPx0kO3ykKo9znCY3uwxaoonYzS
 MJ5xWUk/1B/fVmmrMOxKqXqLYxjTABgEIeCuKdakEgpHg0n1azdBff+Qgmsoi5IEzT6U
 8YjA==
X-Gm-Message-State: AOAM533d5jzvsehWgLK50dMWgqc8i5q/pDWlc890Agrns75rE9Wj7rPg
 JF1AafPJPOLt31XRXAWifleeFFcYWQK26/Jkh70Ye3SRWS5la4mLga9Sm1U+wnvgE3LM6LELdfi
 O0t5UwzpGF/FhuqMfBkqf7V/D1SyFFaw=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr35716230uam.110.1625072155614; 
 Wed, 30 Jun 2021 09:55:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwihZPvxQbBM4ihn2VZoDwvNhA/hpLSL/PlZyhu+trD1ykJoAKxoo1PTz71gVgFuhY/I5VtSWAQz0QOq6HW/Sw=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr35716205uam.110.1625072155452; 
 Wed, 30 Jun 2021 09:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210630012619.115262-1-crosa@redhat.com>
 <20210630012619.115262-4-crosa@redhat.com>
In-Reply-To: <20210630012619.115262-4-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 30 Jun 2021 13:55:29 -0300
Message-ID: <CAKJDGDZKJ1Gf0KiGbsrS6Y6G-H1h8BJyGwSu7th-umVwrBUGDw@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] Jobs based on custom runners: docs and
 gitlab-runner setup playbook
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29, 2021 at 10:26 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> To have the jobs dispatched to custom runners, gitlab-runner must
> be installed, active as a service and properly configured.  The
> variables file and playbook introduced here should help with those
> steps.
>
> The playbook introduced here covers the Linux distributions and
> has been primarily tested on OS/machines that the QEMU project
> has available to act as runners, namely:
>
>  * Ubuntu 20.04 on aarch64
>  * Ubuntu 18.04 on s390x
>
> But, it should work on all other Linux distributions.  Earlier
> versions were tested on FreeBSD too, so chances of success are
> high.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Tested-by: Willian Rampazzo <willianr@redhat.com>

Re-tested just in case and it looks really good, thanks!


