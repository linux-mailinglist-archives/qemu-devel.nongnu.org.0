Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D3D3C9371
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 23:56:45 +0200 (CEST)
Received: from localhost ([::1]:56054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ms0-0001pO-43
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 17:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m3mqX-0000Mg-MR
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 17:55:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m3mqU-0004OX-IS
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 17:55:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626299710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KOz7jbah9fO1QUcFMWLndQ9P6v1zS9Bs73oTA5gfz9c=;
 b=ZXncJHcPzLNBubglh/RNnm81HQDvbfiJ8d6e3pyHbiON42t+dhEM9dTSr0dn4ScDRspqcm
 hZUkpLo2mWZivhFOw9KT6xoZ10NOkMgi/E08SzS29VdSBnhXZ72VpYmI6qoYhkm1AZPNuj
 3QaMIzTob8zif+5/O8wYoopuMQEbmmY=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-tQ9bWpQSP8a0yjkqAwFcCQ-1; Wed, 14 Jul 2021 17:55:08 -0400
X-MC-Unique: tQ9bWpQSP8a0yjkqAwFcCQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 z45-20020a9f37300000b02902a163c1db68so748308uad.19
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 14:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KOz7jbah9fO1QUcFMWLndQ9P6v1zS9Bs73oTA5gfz9c=;
 b=IAjTEroub4+3Ta2cxKnccrI1pX5t9bv2qHqvxR1c45IPkfWFykdBpVQoXJPCNt9+5v
 ZsQNRbVgi3B13umBZnNnGkTXW03UsPRrQ/tZM1SYES5SnfiKqfSyLQSp0JWl8CPQeuMR
 2Z0W+/B9HXtJMz2D82D9zmO733COrEkDx3iI64p8Jvmgp1iGfP6bBbiHB0zyqIKNWy7h
 nUpFCMfoUK+BNWjO9qAuyTx8/2CTq91vMnHcFvBoYZrNErhzNG2Yj6u42pl+hlFmJCtu
 NmdlOVt07U77s0FaPCZ9OEsUa5Q/0oLFqBKEswCJCfJxNkVqnAEnG7jE+vpQjMgZc20q
 5VYw==
X-Gm-Message-State: AOAM532u+17ES7q2fS/7nr3ZuDs5w+pUXvNT380qFW8HEIVXr0ST6HQD
 GLAAoahbw+EeJ9ENdBvRETfv681ivUJKj1BYMDE4lAl8zs0H8osBU4wtakCLta8KJK0jgrbNsOp
 id8AIRXWyDXg2i28T2KehLuQ1tr9wO3Y=
X-Received: by 2002:a05:6102:2131:: with SMTP id f17mr91170vsg.1.1626299708393; 
 Wed, 14 Jul 2021 14:55:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsn8bNj3OeafQgy3jKQ7AxOB3fOfjUA4J23JaRxwQWaq7mHUgenL20ZQg6ZF/QIOEmYflwmexMumBUIQIV0To=
X-Received: by 2002:a05:6102:2131:: with SMTP id f17mr91161vsg.1.1626299708257; 
 Wed, 14 Jul 2021 14:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210714174051.28164-1-crosa@redhat.com>
 <20210714174051.28164-5-crosa@redhat.com>
In-Reply-To: <20210714174051.28164-5-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 14 Jul 2021 18:54:42 -0300
Message-ID: <CAKJDGDbjFMZ2fs8brbdFXEFv0JLQt54sux3v9G5V9tKQD5-CCg@mail.gmail.com>
Subject: Re: [PATCH 4/6] tests/acceptance/virtio-gpu.py: combine kernel
 command line
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14, 2021 at 2:41 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> Both tests use the same kernel command line arguments, so there's no
> need to have a common and then an additional set of arguments.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/virtio-gpu.py | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


