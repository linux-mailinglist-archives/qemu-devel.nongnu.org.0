Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BDD36480B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:17:07 +0200 (CEST)
Received: from localhost ([::1]:56862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYWaA-0005o8-Nh
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lYWSP-0006L5-0m
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:09:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lYWSI-0002VC-IM
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:09:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618848536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H3eskn7JQ+FsohO1nvgp6mW26aciSVRrodZSB3/BNyE=;
 b=bVrDZaDIPhCoSY0EtQ9w/3qKr6NrVV9n+GFHxpTIiEL6w0S1Rd7yF+THcam0UllsutrAXU
 V/hShUAPGnSU1wu9PVM1hnUTyxtdXRSDVe12QiXjsctvwqhq0ZoMQI0yZYQue6GmtYlVdR
 qeOGYnlCx9IFVI6JM9QeKz6G8Gr1L7w=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-yraFNn-DPaCsyKqdAI6V5w-1; Mon, 19 Apr 2021 12:08:53 -0400
X-MC-Unique: yraFNn-DPaCsyKqdAI6V5w-1
Received: by mail-vk1-f199.google.com with SMTP id
 h6-20020a0561220b66b02901e488cc9b21so1451242vkf.10
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 09:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H3eskn7JQ+FsohO1nvgp6mW26aciSVRrodZSB3/BNyE=;
 b=mJ5bL5qZ/kVGVrIdb6eYa+80eHXWun3r19zWxCG07YuvDIhyCk4mg9HUatDOeu/0KH
 NEaeckAueL0ecjYOYQo1/IOcbVas68CKKKZ/0dVC5np9SfjjKzqRLOmROe+lCkH+i9SK
 KbCPImSX47ms6EKEQlkfnP2jsOLTzSRdjcmuwtKdfdVJ0Vt5yfs6vFH3bOoUQUI7vrnm
 1kxErAXi4DD3k+h3UCiEV4BYIWUyIt6H233VzRIhnYB6hnMj6zUp2K66LWaEcKJQoMpJ
 zgDhCKy9uiM0TCnuW2C+p3l2eJGxFTbDi9MbBycq99mtdFKEPfpce8aFbIb3B/8zXGEo
 E+Tw==
X-Gm-Message-State: AOAM532Yc4VdK2Agdd/VhbQ9Z4H9PMw4VP5B3InhC0Z3s9eLbp/l9o4G
 YjfK/B6hxFAWPSva93sPtztA5aN2RrIFNc53qVEYkQOhEtslw2sam/CfX8cxCfZJy76xuuKWsVP
 GZG0VXpuqfCWDqCWraG3XgA2DCqt1OtA=
X-Received: by 2002:a67:27c2:: with SMTP id n185mr15403219vsn.39.1618848532947; 
 Mon, 19 Apr 2021 09:08:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfvphI9c/e9JgBsldtEdDRJ0XkuCF5JwdoGoe12tP4M+9mO+MWM7yAomcGi/yAkFjaybgPzBR088kAqXP/dWg=
X-Received: by 2002:a67:27c2:: with SMTP id n185mr15403190vsn.39.1618848532735; 
 Mon, 19 Apr 2021 09:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210414161144.1598980-1-crosa@redhat.com>
 <20210414161144.1598980-2-crosa@redhat.com>
In-Reply-To: <20210414161144.1598980-2-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 19 Apr 2021 13:08:26 -0300
Message-ID: <CAKJDGDZZn_3SDV46X7otRiZTa5Xakati1sO23cVaejVE0YcmZw@mail.gmail.com>
Subject: Re: [PATCH 1/1] Acceptance Tests: bump Avocado version requirement to
 87.0
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 14, 2021 at 1:12 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> This version (and 86.0) contain improvements that address specific
> QEMU use cases, including:
>
> * Fix to the error message given when downloading assets
>
> * Asset listing/purging capabilities
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/requirements.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

The release is at the door so, soon it will be good to do this change:

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

> diff --git a/tests/requirements.txt b/tests/requirements.txt
> index 91f3a343b9..f57e895c4a 100644
> --- a/tests/requirements.txt
> +++ b/tests/requirements.txt
> @@ -1,5 +1,5 @@
>  # Add Python module requirements, one per line, to be installed
>  # in the tests/venv Python virtual environment. For more info,
>  # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
> -avocado-framework==85.0
> +avocado-framework==87.0
>  pycdlib==1.11.0
> --
> 2.25.4
>


