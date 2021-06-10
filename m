Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19D53A344A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 21:48:55 +0200 (CEST)
Received: from localhost ([::1]:49708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrQfe-00076c-SA
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 15:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lrQeD-0006Hp-1r
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 15:47:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lrQeB-0005Tg-Iq
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 15:47:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623354442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OE4BCNi4mAgkVKgkU28zgXa1PJN2JQ5c7u3VoD/dUA4=;
 b=iUTf0++z/JxNwT0QD+upL2Ebx5zW8hBaduETFHpE37vAySV6gJ4AXa8PvBYaZVA60sUsMI
 YDo9/3GuEqFzbnmuuE6kWFf1RuJx6eLdOamlcK8KPpP+wnMK9DzbQ1n2k6+psSUTJDP779
 QJMt0JveYggCNvBpTUtzAtrKdkjwGgY=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-mGJ0WQ5AN5ypNYwjSBhKfg-1; Thu, 10 Jun 2021 15:47:19 -0400
X-MC-Unique: mGJ0WQ5AN5ypNYwjSBhKfg-1
Received: by mail-vs1-f71.google.com with SMTP id
 v27-20020a67c89b0000b02902227f70aa8fso1453416vsk.6
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 12:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OE4BCNi4mAgkVKgkU28zgXa1PJN2JQ5c7u3VoD/dUA4=;
 b=r+8revXA+YBI6Pnfw7clb6+cD8sGgCLWsC/diXjBtmwF9jPe1uV3q4Atp+luribegr
 ytLGEBLoy79MWv847/TXs7IGJWD/EwAESH3Ad3qbHFHvbOZFRjO+H4d5GJhcUwBc8knJ
 T11LL8/DjxbBmZGiMdAKZsGOP2csG6HDgoZ4RRxDd659CpzwBgYZo90o1Q0tte954CVB
 wAsdc/lC/KifN5xzjb+b+A+YQgfDB5U8od3gYaV+uQia3SqUAmyJvn6eeyPEwbwHzx1S
 5sV9ZvGfOcSigBS5tM1qaLH7g3K5v0b/B9aw+zh6sarzTQWGhRImTM7dwcikorOVyoFo
 qPDg==
X-Gm-Message-State: AOAM533M7ZOqohAjz0lLf/HdSU3PMFa2yjBGgxEKxEMDC4ZOqQTszeXA
 YOm1dH3Hbw66stwkN0MhPBJjxdRfMmlev8j8diK8Eal24BGuXTvqUd5rhFPx7TS2W1OQyUEn1B5
 2pPmK3T3qQ5jHc/Bc8d6gcJ4JpgaLLK4=
X-Received: by 2002:a05:6102:3123:: with SMTP id
 f3mr1446662vsh.50.1623354439040; 
 Thu, 10 Jun 2021 12:47:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIMEDSUXa+fgGUrXRw8U9Pp4TZkLY7splwTOmRbgeDWevhuUBzWiCE369zW0Inl/FRdQ1JCu0ista0rvb00Wg=
X-Received: by 2002:a05:6102:3123:: with SMTP id
 f3mr1446635vsh.50.1623354438780; 
 Thu, 10 Jun 2021 12:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210608140938.863580-1-crosa@redhat.com>
 <20210608140938.863580-4-crosa@redhat.com>
In-Reply-To: <20210608140938.863580-4-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 10 Jun 2021 16:46:52 -0300
Message-ID: <CAKJDGDbJ+9sC0QsbNFYMOjPunQ2fD7jybja6REgZafG4j7sjgg@mail.gmail.com>
Subject: Re: [PATCH 3/4] Acceptance Tests: introduce method to require a
 feature and option
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 8, 2021 at 11:09 AM Cleber Rosa <crosa@redhat.com> wrote:
>
> In this context, and according to the qemu.utils.list_feature() utility
> function, a feature is something is available as a QEMU command line
> option that can take the "help" value.
>
> This builds on top of that utility function, and allows test writers
> to require, for instance, the "x-remote" (option) machine type
> (feature).
>
> This example is actually applied here to the reespective test, given
> that the option is conditionally built, and the test will ERROR
> without it.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 29 ++++++++++++++++++++++-
>  tests/acceptance/multiprocess.py          |  1 +
>  2 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 93c4b9851f..432caff4e6 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -11,6 +11,7 @@
>  import logging
>  import os
>  import shutil
> +import subprocess
>  import sys
>  import uuid
>  import tempfile
> @@ -45,7 +46,8 @@
>  from qemu.utils import (
>      get_info_usernet_hostfwd_port,
>      kvm_available,
> -    tcg_available,
> +    list_feature,
> +    tcg_available
>  )
>
>  def is_readable_executable_file(path):
> @@ -182,6 +184,31 @@ def _get_unique_tag_val(self, tag_name):
>              return vals.pop()
>          return None
>
> +    def require_feature(self, feature, option=None):
> +        """
> +        Requires a feature to be available for the test to continue
> +
> +        It takes into account the currently set qemu binary, and only checks
> +        for by running a "qemu -$feature help" command.  If the specific option
> +        is given, it checks if it's listed for the given feature.
> +
> +        If the check fails, the test is canceled.
> +
> +        :param feature: name of a QEMU feature, such as "accel" or "machine"
> +        :type feature: str
> +        :param option: the specific value for the feature.  For instance,
> +                       if feature is "machine", option can be "q35".
> +        type option: str
> +        """
> +        try:
> +            options_available = list_feature(self.qemu_bin, feature)

Looking at this code, the previous patch makes more sense the way it is now :)

Maybe, splitting it into multiple `list_` functions will make the code
here more complex.

Anyway, I'll let you decide.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


