Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D2B3B48E3
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:43:38 +0200 (CEST)
Received: from localhost ([::1]:46388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqnh-0004aY-RE
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqlG-0002Z2-MU
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:41:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqlA-0000xx-Vg
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:41:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624646460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dq4IeCK8E5icdrW8a8kXEy9B1u95gfQMlTPHiQYdYuU=;
 b=FtspkKUbRrnoSp2zAB7QADDGfI8tVOb9tbQkIjFhMF4LTWpCpJxzWr1EQy9h4yYz5dDtFu
 B3EBDkF6h01n7ptk/kDTql5Xckj9G8Z7S4bWif5ioSDOjGXACm9WHCnw7iruCuGoVFC8YC
 EPYaW5MExn5i9EoYdUuXG8/PkX9PbxQ=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-HvywxAG4O8-SmiElGJu_Cg-1; Fri, 25 Jun 2021 14:40:56 -0400
X-MC-Unique: HvywxAG4O8-SmiElGJu_Cg-1
Received: by mail-ua1-f69.google.com with SMTP id
 i8-20020a9f3b080000b029023c932e01b8so2694485uah.3
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 11:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dq4IeCK8E5icdrW8a8kXEy9B1u95gfQMlTPHiQYdYuU=;
 b=Xf4+uV0enP0YMeskbni34wDv3BzX8Rm7skWk2FSv2ZifaaSdg6sxd6XAkeD29eiKRn
 giYiHbxro/NcfTY9WjKyK/ocNKwfbiVQvtBIYkJIfb/AmqXNm7+gAYVW1J2pr2kluBEn
 Wx/QvEfbiA83fO1BrHWMftRsbYq1Is1uOntJzNQTOMoEzOsfhZ3LKKPfGzaxL3X+cW/h
 ZyO0NgSKQ7dfyMjRwKKxZ6C3o+GiqqewYwnkwCdZr4Moys2HVhCWr+Q1sjv1OoNG88d0
 kAVhj+v64utrMED9bdNWB5QqUK1c9DJwYhY7IrhyCeE5iQgAS0NFzbKSA6jJuJ5xByd5
 FqUw==
X-Gm-Message-State: AOAM532E965ujiZ2atwGwWPZqTZaXl9zdZCrA3L3j3K9MDBy6ReBdcLD
 Gs2pCzzXmyYJ9/gV/Q7WyW/hFjoq8phJ3zrRZv/hWEk/+xnD7k/qzemzIvH1yzwZL4T/2vgSiG6
 eNV5ee+76mXXpOlQbNyZ7KL0tyZH8UCM=
X-Received: by 2002:ab0:7642:: with SMTP id s2mr13235586uaq.133.1624646456225; 
 Fri, 25 Jun 2021 11:40:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN/3MdzCbdnMkhFi0ExthwQfUNgmsQRHtpK+EI38brG2hUB0r4iQgB+3x6+Bqii0uHFSTsiZxabSnqH03+2og=
X-Received: by 2002:ab0:7642:: with SMTP id s2mr13235569uaq.133.1624646456097; 
 Fri, 25 Jun 2021 11:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-12-jsnow@redhat.com>
In-Reply-To: <20210625154540.783306-12-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 25 Jun 2021 15:40:30 -0300
Message-ID: <CAKJDGDayjK+k89CxbmCg52XL1jhLRUdUj3YznL=QZB0W6vZA_Q@mail.gmail.com>
Subject: Re: [PATCH 11/11] python: remove auto-generated pyproject.toml file
To: John Snow <jsnow@redhat.com>
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
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
> For reasons that at-present escape me, pipenv insists on creating a stub
> pyproject.toml file. This file is a nuisance, because its mere presence
> changes the behavior of various tools.
>
> For instance, this stub file will cause "pip install --user -e ." to
> fail in spectacular fashion with misleading errors. "pip install -e ."
> works okay, but for some reason pip does not support editable installs
> to the user directory when using PEP517.
>
> References:
>   https://github.com/pypa/pip/pull/9990
>   https://github.com/pypa/pip/issues/7953
>
> As outlined in ea1213b7ccc, it is still too early for us to consider
> moving to a PEP-517 exclusive package. We must support support older

s/support support/support/

> distributions, so squash the annoyance for now. (Python 3.6 shipped Dec
> 2016, PEP517 support showed up in pip sometime in 2019 or so.)
>
> Add 'pyproject.toml' to the 'make clean' target, and also delete it
> after every pipenv invocation issued by the Makefile.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


