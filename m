Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F038B3B69C0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 22:37:51 +0200 (CEST)
Received: from localhost ([::1]:34472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxy0t-0001qB-1h
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 16:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxxyZ-0006m2-Bq
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 16:35:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxxyV-0001ii-DL
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 16:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624912522;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GyrT0XMiEG6wIwGXfFMLZeyJGBNmxMgTdZLejIjLbkY=;
 b=Hckc96wZei9NaNVvx6qnlRu90w6sAXK0ahEyvw44FXCvcCDt4i+24pvzQ+9YJvBSouzUTs
 6ZdCFdozDaTsc5A8dX8Dc3MpwDpI9SG5qVBHwUBbCXhO6qceS3hbtqfKCorWyDo2DaMgg7
 doEo0elCQjEd6wNQYGewf2AL0CD1CQM=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-RKjJroIHPIywFRgZO6fJ9g-1; Mon, 28 Jun 2021 16:35:13 -0400
X-MC-Unique: RKjJroIHPIywFRgZO6fJ9g-1
Received: by mail-pg1-f199.google.com with SMTP id
 b17-20020a63a1110000b02902231e33459dso12667233pgf.17
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 13:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=GyrT0XMiEG6wIwGXfFMLZeyJGBNmxMgTdZLejIjLbkY=;
 b=B3UWEzJ6IYgrkWSFgMYDmTr5hGatn7KhXlltqsEcd4cvBFJt9GhTDDNEFh1Wyl15wC
 qmFQEfXLmeCyYmEjUxDX8DZY//uUjetPvM1Vyx9R4Wk6zG5W4+eTN7Bqc2pietMXlnTv
 nqw++YR3WdCDntQrlv6a66XtkBv0KquXw2sf1+L/aTuQZXvFLusH749VcqYxyoALg5K0
 QMKT3m1zo2yTq/cgBBsJmj7sPayCh39ZpkOuW6vfUhVfoyGztyKgb42IjvCivAD225lF
 irBqbKVCQXYGeV/j3hupoimoobxK/CdUdJNDgMh7UzzMloLZZpz/6M7PzEIU6kbn1Rti
 DQlQ==
X-Gm-Message-State: AOAM530QTf+ZFpOVZjivc03Y+Vjuj1hoyNd1fmLA8O31l+OO6TCNyeAe
 3ReKk45MyD9DPYHhcj4DI9NfhYKDJgb6Jkn2z9veY6IF6kHJ0SjhhJIwtOQC1/3z5hWwhu2/Pxm
 kICgCB3k+KixwySU=
X-Received: by 2002:a17:90a:fe87:: with SMTP id
 co7mr2180413pjb.167.1624912512209; 
 Mon, 28 Jun 2021 13:35:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVaq3skV4i3S46f3vuA3R9apNTzriTnjfBgUmlWZcU6OrAJCr4Pl4QX148mEEq9p/znTyIxA==
X-Received: by 2002:a17:90a:fe87:: with SMTP id
 co7mr2180396pjb.167.1624912512006; 
 Mon, 28 Jun 2021 13:35:12 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id 201sm15609178pfz.150.2021.06.28.13.35.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 13:35:11 -0700 (PDT)
Subject: Re: [PATCH 04/11] python: README.rst touchups
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-5-jsnow@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <cbdfde96-e55d-7bef-79e5-1813fbd46ae5@redhat.com>
Date: Mon, 28 Jun 2021 17:35:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210625154540.783306-5-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: wainersm@redhat.com
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/25/21 12:45 PM, John Snow wrote:
> Clarifying a few points; removing the reference to 'setuptools' because
> it referenced anywhere else in this document and doesn't really provide
> any useful information to a Python newcomer.
>
> Adjusting the language elsewhere to be less ambiguous and have fewer
> run-on sentences.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/README.rst | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>
> diff --git a/python/README.rst b/python/README.rst
> index dcf993819d..107786ffdc 100644
> --- a/python/README.rst
> +++ b/python/README.rst
> @@ -7,8 +7,7 @@ then by package (e.g. ``qemu/machine``, ``qemu/qmp``, etc).
>   
>   ``setup.py`` is used by ``pip`` to install this tooling to the current
>   environment. ``setup.cfg`` provides the packaging configuration used by
> -``setup.py`` in a setuptools specific format. You will generally invoke
> -it by doing one of the following:
> +``setup.py``. You will generally invoke it by doing one of the following:
>   
>   1. ``pip3 install .`` will install these packages to your current
>      environment. If you are inside a virtual environment, they will
> @@ -17,12 +16,13 @@ it by doing one of the following:
>   
>   2. ``pip3 install --user .`` will install these packages to your user's
>      local python packages. If you are inside of a virtual environment,
> -   this will fail; you likely want the first invocation above.
> +   this will fail; you want the first invocation above.
>   
> -If you append the ``-e`` argument, pip will install in "editable" mode;
> -which installs a version of the package that installs a forwarder
> -pointing to these files, such that the package always reflects the
> -latest version in your git tree.
> +If you append the ``--editable`` or ``-e`` argument to either invocation
> +above, pip will install in "editable" mode. This installs the package as
> +a forwarder ("qemu.egg-link") that points to the source tree. In so
> +doing, the installed package always reflects the latest version in your
> +source tree.
>   
>   Installing ".[devel]" instead of "." will additionally pull in required
>   packages for testing this package. They are not runtime requirements,
> @@ -30,6 +30,7 @@ and are not needed to simply use these libraries.
>   
>   Running ``make develop`` will pull in all testing dependencies and
>   install QEMU in editable mode to the current environment.
> +(It is a shortcut for ``pip3 install -e .[devel]``.)
>   
>   See `Installing packages using pip and virtual environments
>   <https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/>`_
> @@ -39,7 +40,7 @@ for more information.
>   Files in this directory
>   -----------------------
>   
> -- ``qemu/`` Python package source directory.
> +- ``qemu/`` Python 'qemu' namespace package source directory.
>   - ``tests/`` Python package tests directory.
>   - ``avocado.cfg`` Configuration for the Avocado test-runner.
>     Used by ``make check`` et al.


