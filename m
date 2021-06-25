Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4343B48B0
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:18:44 +0200 (CEST)
Received: from localhost ([::1]:48446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqPb-0001Qt-7i
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqOQ-0000hT-R9
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:17:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqOP-0003ja-5f
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:17:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624645048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FB+MhKPXqEi77/RhWbRm2e5hI9cqj4TL0FORm4TJ+20=;
 b=L2OyoX8mY1yKtMIt+ISwtwI8LVMqY1hGF59BWbrzdrVnws0buFYZPSTzLFXuI75OXcw3Hf
 lDpcydFytuD4N4JkoTEIauX34CfpsEcHEEIYk9qLTwal7YJ26WAk+vIZX4rF28kD/n8Of4
 eKOtmCOWk0KWqRvJsuv+hNiPoxu/xcw=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-ozD0GYDOOJidDcVGGWLQ1A-1; Fri, 25 Jun 2021 14:17:25 -0400
X-MC-Unique: ozD0GYDOOJidDcVGGWLQ1A-1
Received: by mail-vk1-f198.google.com with SMTP id
 s1-20020a1ff4010000b029024e2e9504e3so3325400vkh.16
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 11:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FB+MhKPXqEi77/RhWbRm2e5hI9cqj4TL0FORm4TJ+20=;
 b=K0Dn5Bn4LJmmitZlv9NlC6Kww1u9i7O8GCIgxzv/DwIpTkklczfsUMjrs6jCVe4V4O
 wGWnctYgA3YMa1N856mVV9pj+2BpTnTvoWhsI2mSd7iiMAm04W972lL847XnBLRvhHM3
 Ces6OxH4/txmBGpUjDqqqxgUekc982hWEv5u37D1lxi857MkOCQEVlpq5p1UCgv3hajv
 SRfS+gxAfN5BOJKpdzVeIGKz/9EV33zsGYI7QACGjZ6wZ9qU8HjeAFpOXRs2YRrblrx1
 V1KGClktMZXKe1sD3PEAfh+7lHHvbTLat3zLj1cPJWZW4mbkxMvLpBOGMOadSj0vZHJ6
 IsIg==
X-Gm-Message-State: AOAM532rMfVEu8lepbb6BR6eRC8107f2/EYhuv9faU7fqAw5hehJvpI1
 vR13n0nksbuup3uKgb1rwDxwSuSaKTrpvPVmQTBq44pbloSu2yGOjqMO8FIqLcoF3X0Ut45e0DM
 iD4+VYZrovked1IH12JBL4l3MNaWA1JQ=
X-Received: by 2002:ab0:7412:: with SMTP id r18mr6432208uap.124.1624645044916; 
 Fri, 25 Jun 2021 11:17:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHL4Dko76VOWaFO1QY8XOJV9BszYPzsOK4s+sYCLYnlgCkq/6NDp4XcRSP9Nbnfl6ekNcOLjZHZ4HUIoObjT4=
X-Received: by 2002:ab0:7412:: with SMTP id r18mr6432179uap.124.1624645044727; 
 Fri, 25 Jun 2021 11:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-2-jsnow@redhat.com>
In-Reply-To: <20210625154540.783306-2-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 25 Jun 2021 15:16:58 -0300
Message-ID: <CAKJDGDboVBhJZdA801-ZArm6RG360yDY3T8VTxWY59XwVYtjgQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] python: expose typing information via PEP 561
To: John Snow <jsnow@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 25, 2021 at 12:46 PM John Snow <jsnow@redhat.com> wrote:
>
> https://www.python.org/dev/peps/pep-0561/#specification
>
> Create 'py.typed' files in each subpackage that indicate to mypy that
> this is a typed module, so that users of any of these packages can use
> mypy to check their code as well.
>
> Note: Theoretically it's possible to ditch MANIFEST.in in favor of using
> package_data in setup.cfg, but I genuinely could not figure out how to
> get it to include things from the *source root* into the *package root*;
> only how to include things from each subpackage. I tried!
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/py.typed | 0
>  python/qemu/qmp/py.typed     | 0
>  python/qemu/utils/py.typed   | 0
>  python/setup.cfg             | 4 ++++
>  4 files changed, 4 insertions(+)
>  create mode 100644 python/qemu/machine/py.typed
>  create mode 100644 python/qemu/qmp/py.typed
>  create mode 100644 python/qemu/utils/py.typed
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


