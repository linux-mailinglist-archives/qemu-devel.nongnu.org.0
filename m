Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E464D362446
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 17:42:10 +0200 (CEST)
Received: from localhost ([::1]:34556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXQbh-0003zK-VM
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 11:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lXQZt-00034O-Be
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:40:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lXQZq-0004CG-6z
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618587612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h9aMIoabz7EF8aG8KVZgl6vIDE/kt8sWXCBHacmawAo=;
 b=UBAOcDDUXvr44chdgPPanmNN+f65TKplOtOU8OpnsTjQHq/Wu+S2/5OyZQPpFlWqksApRY
 DSCQ+hDDH39yqt5xlQgM6LtC+aE524SJDJmxwbk5uN79KUl1PJIb1Rmwr8p1hwrrTTVSXO
 ZKahYcg0ce4CnaziyeVWnp85S/y4yGw=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-rfZz9qgKNhySnPWjJFFiow-1; Fri, 16 Apr 2021 11:39:43 -0400
X-MC-Unique: rfZz9qgKNhySnPWjJFFiow-1
Received: by mail-ua1-f70.google.com with SMTP id
 q5-20020a9f38450000b02901e7f4035131so1943822uad.10
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 08:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h9aMIoabz7EF8aG8KVZgl6vIDE/kt8sWXCBHacmawAo=;
 b=QR85jT0cr7/wn8mBkaaPXJPSL1HST+ZXRY2nvBkcv7u7fNI2EO4TCyoX4tOI7yPFLq
 zLZa+zAOSd4ScEta+Vm0h2HKvW2aBjWmeo+TJ/7hvvL+kNYpNBNi7IkTxAWW4ZU2d/v2
 mMu6Jma/SJn4+jrYB/6GJFrqOhJSBkqXnHBovAQQ6axZpy1vBWRAt6mxqCZy3aqVmpuN
 rwQuehGgnjQIbnBTyAHL6hW/djL2nlSlIxi+LGJAUF7QVtWOv8TpNhQ4DFTQqwJAtIVZ
 SdaZxfxqYcxjpFGQEd3fO7FGWWs1bvzu2Tylv4VAY5qvfr8hFyCqiZ1+srqyzBj9K9Ao
 DX1g==
X-Gm-Message-State: AOAM532fx4OmsjfchsoU/meMkhDNlrC7xc5zE6aDKcns2KYcH0WBiXRj
 rhrZbChCWqa0Xdd+W23npV3YpuoFB70/G2IB04g6MmznhxCr8Y2DOxmZqs1O1sMuEzH/KUoQ6BZ
 ePVW2FFIpvkO7gPqJqdwZiO2XEh+On6o=
X-Received: by 2002:ab0:4042:: with SMTP id h60mr7161388uad.133.1618587583146; 
 Fri, 16 Apr 2021 08:39:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/Xt2dXPQuqucEOqX2icbASN+a7YfoXxZ0TcOzQS4HuG5gSdbbZAdZZYKsy8NmsVeMYfxo0qEIUioOZQWY7Oc=
X-Received: by 2002:ab0:4042:: with SMTP id h60mr7161366uad.133.1618587582986; 
 Fri, 16 Apr 2021 08:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-3-crosa@redhat.com>
In-Reply-To: <20210415215141.1865467-3-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 16 Apr 2021 12:39:16 -0300
Message-ID: <CAKJDGDbPfxpYLg29q8d7tg12xE9a7u+7nd8zX34kHZrbKaEyrQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] Acceptance tests: do not try to reuse packages from
 the system
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
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
> The premise behind the original behavior is that it would save people
> from downloading Avocado (and other dependencies) if already installed
> on the system.  To be honest, I think it's extremely rare that the
> same versions described as dependencies will be available on most
> systems.  But, the biggest motivations here are that:
>
>  1) Hacking on QEMU in the same system used to develop Avocado leads
>     to confusion with regards to the exact bits that are being used;
>

Indeed!

>  2) Not reusing Python packages from system wide installations gives
>     extra assurance that the same behavior will be seen from tests run
>     on different machines;
>
> With regards to downloads, pip already caches the downloaded wheels
> and tarballs under ~/.cache/pip, so there should not be more than
> one download even if the venv is destroyed and recreated.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


