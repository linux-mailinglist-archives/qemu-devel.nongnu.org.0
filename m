Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF56C3B0E76
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 22:17:20 +0200 (CEST)
Received: from localhost ([::1]:54602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvmpj-0000Ps-FT
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 16:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lvmnq-0007su-Tf
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 16:15:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lvmno-0000u7-Es
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 16:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624392917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rtJkuasNi3dl2YT9FFS7usOA8EY4L1M2Da/F7vvM9DA=;
 b=EQ/9aSWXS1jAjKNrimdDuH9sQ0bIqxM5gMWszEJQOlhBmE1iN+8N/ZKHZ9xVlfm3UVtQVy
 j7XDGQowkmlPM5QtcqZxU/VICF6HF4Kz3eFimq7uIUm84bjoXOota73joybIglgbS+aZR5
 r2KbhtVVAToh6uZ2D0EwNxD6ukkebPA=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-du-fRpX0O8ORxHUdrKtWFw-1; Tue, 22 Jun 2021 16:15:16 -0400
X-MC-Unique: du-fRpX0O8ORxHUdrKtWFw-1
Received: by mail-vs1-f70.google.com with SMTP id
 k67-20020a6724460000b029025ff03ce7c2so129210vsk.7
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 13:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rtJkuasNi3dl2YT9FFS7usOA8EY4L1M2Da/F7vvM9DA=;
 b=rfEVUo5d+EhcpqYZceItI2JYsb68pM5U2nOSrtgs0dIwyi/VFGcYTRJNQZRii4SxBz
 A2i4KcB15TYyfZsdQYAnPIbCf2cfhcZu9ujEpwW7Ti42KORNOUNHAz5XI2Z4Na2osc28
 uXQ6r0/srOySyNd3e6+SS6bpMbUf5aPwPGQdeahNpW8id550s3+ctl3rNgvKfEwur0Yt
 eLhvoW0pxbASgkbBumey9ciarJhNo1xrWN697DGsbQbxuHIZJRXWbENbOV+aVQa9zjO9
 tERXz+qNOa0Bn4fsozvy4aOWxrgj/jjczyuaSZT9lstSAd55z7cPlQfNXMb6EqFaiwjM
 8stA==
X-Gm-Message-State: AOAM531Hupkvnzs7Vqkkkz/tASRj0It30fgh3bY9s9y2WnF8wxu3cqR2
 R/+uTZBt4vHe2hPJVtkHlXGBZWK9CJNnZH0Xu0K83adw2LUEo0kbkTeoiude5LFZeFnM85DdRQj
 ooZejQaGF+p4fz7U0Ti0ic/7K1xQlVKg=
X-Received: by 2002:a9f:2370:: with SMTP id 103mr817480uae.124.1624392915986; 
 Tue, 22 Jun 2021 13:15:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNvvhxtixhiMWQm3Ma9j3PxsFpVs9589OSas6oLWj2Nxs0+AKYmoUXSld8Byu4zBCubrxzLl/N7ADNv39sgzw=
X-Received: by 2002:a9f:2370:: with SMTP id 103mr817463uae.124.1624392915827; 
 Tue, 22 Jun 2021 13:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210430133414.39905-1-wainersm@redhat.com>
 <20210430133414.39905-7-wainersm@redhat.com>
In-Reply-To: <20210430133414.39905-7-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 22 Jun 2021 17:14:49 -0300
Message-ID: <CAKJDGDZtGFCc8HKsZMpVme1rN+VRzFdc9Y+95uxmoWXeepDkdQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] tests/acceptance: Add set_vm_arg() to the Test
 class
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Philippe Mathieu Daude <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 30, 2021 at 10:35 AM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> The set_vm_arg method is added to avocado_qemu.Test class on this
> change. Use that method to set (or replace) an argument to the list of
> arguments given to the QEMU binary.
>
> Suggested-by: Cleber Rosa <crosa@redhat.com>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 7f8e703757..14c6ae70c8 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -240,6 +240,27 @@ def get_vm(self, *args, name=None):
>                  self._vms[name].set_machine(self.machine)
>          return self._vms[name]
>
> +    def set_vm_arg(self, arg, value):
> +        """
> +        Set an argument to list of extra arguments to be given to the QEMU
> +        binary. If the argument already exists then its value is replaced.
> +
> +        :param arg: the QEMU argument, such as "-cpu" in "-cpu host"
> +        :type arg: str
> +        :param value: the argument value, such as "host" in "-cpu host"
> +        :type value: str
> +        """
> +        if not arg or not value:
> +            return
> +        if arg not in self.vm.args:
> +            self.vm.args.extend([arg, value])
> +        else:
> +            idx = self.vm.args.index(arg) + 1
> +            if idx < len(self.vm.args):
> +                self.vm.args[idx] = value
> +            else:
> +                self.vm.args.append(value)
> +

Considering all args in self.vm.args are composed of [arg,value]:

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

>      def tearDown(self):
>          for vm in self._vms.values():
>              vm.shutdown()
> --
> 2.29.2
>


