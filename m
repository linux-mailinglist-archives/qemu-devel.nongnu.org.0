Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904FC496750
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 22:33:39 +0100 (CET)
Received: from localhost ([::1]:40788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB1XO-0007Nc-5c
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 16:33:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB147-0000eS-Sp
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 16:03:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB145-0000Ya-LM
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 16:03:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642799001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zaD8wwAK2PHHn4ubYfTWM9OzHvY1rzbTtKhQaUd+bSE=;
 b=cQT8wbrWLbo2Bm0GdQ3mbQMhRK//ySOzAz0Age9z+Yx2F7WvA9c+mjI7WnLZz0zYeUXD8c
 OnHSrBpizZOztfWGoxPbrg5bCqXmi86/u1IJ6WHf2RZDwrLq/hFAcJ9mCguGXY3oMSBTUf
 /Rozuqe3KcZviywpVNvR2P9BMkmnwCQ=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-YrzdXttyP9ymedosyKktKw-1; Fri, 21 Jan 2022 16:03:17 -0500
X-MC-Unique: YrzdXttyP9ymedosyKktKw-1
Received: by mail-vk1-f199.google.com with SMTP id
 r127-20020a1fc185000000b00316ae4a27efso1785001vkf.2
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 13:03:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zaD8wwAK2PHHn4ubYfTWM9OzHvY1rzbTtKhQaUd+bSE=;
 b=0uDoU0mNBx1XiVfC9Ik6KEAaxvcsqZ6q4Bzn7fDWcPnFescpusOo0XHf2tTzexhMfN
 uHBYuWmNwVFAlwm3BHufsEErq4xTD5ey3+OFIn46eJO+FrZJ2BtgBOE5vXYwJjN3CmZi
 7VvvK8ZgVh0UvRjQB/NsSk4nQTuQzL6xW6DsXK7HHr1goaygQSGmKdEdLpCf3Drqwzx/
 5cYS1S5Y2qDpLUtudA/PjFcX8329wJQFJNfTksk/Hd2mmbQKBHLyBLKIblaCGiTpvzVk
 ZVQVljahOIPC/JPFhv63Ba3YSNW+ztk1v6URKOhpsVQouq6QalcOHnDvYofdx6Q+RmF7
 eYow==
X-Gm-Message-State: AOAM532a4eV0AeG0Mv/8veNR1m+axLN3YmR9mmHoK4lfNn3epfNstg2D
 Y+E2A6htO/UgOxai6R/fgIEWByUD1c8MS+hxEWPqQewr4srlopupJVq13ZVkGyraiwwbpO/LCj3
 1VPTYsnNjZ23Kp4wMACWh8SWCy3+lOxY=
X-Received: by 2002:a05:6122:130a:: with SMTP id
 e10mr2587168vkp.24.1642798997132; 
 Fri, 21 Jan 2022 13:03:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZWz1B6Tt9kQkAFP/PpL/Yrtvy0F2MVqQ5Y35isp/1i+Bd1iA2ia/aUM/F5StlrNlYbnGwyO6gZtudrjr3h08=
X-Received: by 2002:a05:6122:130a:: with SMTP id
 e10mr2587156vkp.24.1642798996829; 
 Fri, 21 Jan 2022 13:03:16 -0800 (PST)
MIME-Version: 1.0
References: <20220121005221.142236-1-jsnow@redhat.com>
 <87ee50vr11.fsf@p50.localhost.localdomain>
In-Reply-To: <87ee50vr11.fsf@p50.localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Date: Fri, 21 Jan 2022 16:03:06 -0500
Message-ID: <CAFn=p-aFqt-CoWPUcgTh+QkcMMyit3gBf_Bgqk9+s7GBuf70Hw@mail.gmail.com>
Subject: Re: [PATCH] python: pin setuptools below v60.0.0
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel <qemu-devel@nongnu.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 21, 2022 at 2:15 PM Cleber Rosa <crosa@redhat.com> wrote:
>
>
> John Snow <jsnow@redhat.com> writes:
>
> > setuptools is a package that replaces the python stdlib 'distutils'. It
> > is generally installed by all venv-creating tools "by default". It isn't
> > actually needed at runtime for the qemu package, so our own setup.cfg
> > does not mention it as a dependency.
> >
> > However, tox will create virtual environments that include it, and will
> > upgrade it to the very latest version. the 'venv' tool will also include
> > whichever version your host system happens to have.
> >
> > Unfortunately, setuptools version 60.0.0 and above include a hack to
> > forcibly overwrite python's built-in distutils. The pylint tool that we
> > use to run code analysis checks on this package relies on distutils and
> > suffers regressions when setuptools >= 60.0.0 is present at all, see
> > https://github.com/PyCQA/pylint/issues/5704
> >
> > Instruct tox and the 'check-dev' targets to avoid setuptools packages
> > that are too new, for now. Pipenv is unaffected, because setuptools 60
> > does not offer Python 3.6 support, and our pipenv config is pinned
> > against Python 3.6.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  python/Makefile  | 2 ++
> >  python/setup.cfg | 1 +
> >  2 files changed, 3 insertions(+)
> >
>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> Tested-by: Cleber Rosa <crosa@redhat.com>
>

Infinite gratitude. I've staged this patch and will send a PR shortly
(Assuming I can determine that the failures I'm seeing on GitLab right
now are not my fault.)

Thanks,
--js


