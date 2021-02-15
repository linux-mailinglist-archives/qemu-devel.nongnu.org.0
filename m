Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5D431C22F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 20:08:35 +0100 (CET)
Received: from localhost ([::1]:36082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBjEY-0000Gf-Ci
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 14:08:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lBjDJ-0008Cq-P0
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:07:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lBjDH-00061I-OI
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:07:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613416034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j0T3n0gf6XzQtem1wYch2QAggucfETu5fyP+Kz62h28=;
 b=LQGzWPz+RuFHpmIqrww7mKYqp7YYKm8ZcqQlJhlHCalvi9feWqPZaFfDYHWx5Ze0dMFw6N
 jLoKu4EWmccquULcub1VY/zlbaQmona5YftdrPgwNbBJuXZKnqiHYKtoyYRUHQAJdQk8pO
 YGvTmqMWM19ts4iaVq3nUpCOq7brXAw=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-iVbtCX06MFSjaut67weZ4Q-1; Mon, 15 Feb 2021 14:07:11 -0500
X-MC-Unique: iVbtCX06MFSjaut67weZ4Q-1
Received: by mail-vs1-f71.google.com with SMTP id s198so1267327vsc.14
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 11:07:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j0T3n0gf6XzQtem1wYch2QAggucfETu5fyP+Kz62h28=;
 b=t0bEm0E7IcFop5dWksDzVcksJdnB7z2U7JVIg0HYbX2jT8sJs5D5eJijjVEjqkTVIr
 pTbJVTQr62i/pQZHZt5nKB+fNB3nsh1KNM0wtpR5KXtz6YadQyMN+0TjP2YIbgKXZCut
 q3AGqm2FCPXKn9SvgQq6eOC9o2KRkbkozH18K0MVUHg+oi9VFAGkVxSsZ3E4u6E1f5Nf
 19pxqzYym3F9VLDX+g+MqH9RFJAYHueIA7ErYr75H6In6UMLmVo+xReYDqfI5iHEZExX
 j4nSo5JD8x2wJFlLGs2SrvJbShxw7uNzUzfOCFxFzYIqljF7SbKfnFh+rHFh00ut849P
 qjUQ==
X-Gm-Message-State: AOAM531eqiyADCo66S2gUDjncExxMoz5o79sG4VU4DWPnmaWaZ2PyQp/
 XAAWot0nvUbT5W4Lw6As6oRG6mGKpipzp+MpraDjV8b4CchqxFHa6EHUZmhZPLJ9h/71oeFtcWP
 iERQxpZN5ujBBBCiS7XOEt64+cLz79Ao=
X-Received: by 2002:a67:ac2:: with SMTP id 185mr8601100vsk.50.1613416031428;
 Mon, 15 Feb 2021 11:07:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdvdhnRtTXkMOrHvA/K7H3Cur+YbnLGXQkCxiU/D3altfBYZlyYKlVt51xOv2wyxvd/E1jJLA83HX0Usiwv8Y=
X-Received: by 2002:a67:ac2:: with SMTP id 185mr8601084vsk.50.1613416031248;
 Mon, 15 Feb 2021 11:07:11 -0800 (PST)
MIME-Version: 1.0
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-15-crosa@redhat.com>
In-Reply-To: <20210203172357.1422425-15-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 15 Feb 2021 16:06:45 -0300
Message-ID: <CAKJDGDbjy3z6XRc+_cag4FzRTjU==eqLkDkVh1rDv+Z2gXQXbw@mail.gmail.com>
Subject: Re: [PATCH 14/22] Acceptance Tests: introduce LinuxTest base class
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Eric Auger <eauger@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 3, 2021 at 2:24 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> This is basically the infrastructure around "boot_linux.py" tests, but
> now made into a base class for general use.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 87 +++++++++++++++++++++
>  tests/acceptance/boot_linux.py            | 94 ++---------------------
>  tests/acceptance/virtiofs_submounts.py    |  6 +-
>  3 files changed, 94 insertions(+), 93 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index bf54e419da..b06692a59d 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py

I found it not so intuitive to have the base class defined here. I see
the number of base classes for the tests growing in the future. A
common place for base classes for tests would be better, just like the
`qemu.utils` you are defining somewhere else. Anyway, this is a design
decision that can be changed later, so

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


