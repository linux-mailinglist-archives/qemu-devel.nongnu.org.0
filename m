Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EB04466B3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:07:57 +0100 (CET)
Received: from localhost ([::1]:42374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj1ky-0008Vj-T0
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mj1b5-0006HG-11
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:57:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mj1b2-0006zr-ME
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636127859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8lbw4urAsY28vIOFJXljLaDDWbNRUmdHZJKje1qEhY4=;
 b=iJET4uUGITuRHmJ8P03HYIb3Q9cMlN+VcMEcODmLH2BQxZh77SfdH0v/SptemdhLYrkVp0
 /c8BIofUJ9JOVEVjZDLVTAEMCbWzFbGEpBDSHMdO+NxUQogtslqMXWkoR8w0TUCI9Ge4id
 4OdHiRL1fsBzzz+CiPNuCKGKMx1O6gg=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-s2dIP_y5PIyZf93VT7gjPw-1; Fri, 05 Nov 2021 11:57:37 -0400
X-MC-Unique: s2dIP_y5PIyZf93VT7gjPw-1
Received: by mail-pl1-f199.google.com with SMTP id
 w4-20020a1709029a8400b00138e222b06aso5252873plp.12
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 08:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8lbw4urAsY28vIOFJXljLaDDWbNRUmdHZJKje1qEhY4=;
 b=jPKn6OLYtF2me9jc6ALvA+y+UuyYenrN3PAS2Q160W96a9UIAEJUju7MH86PokuOAI
 QqCoYdXIW4YZCimG6QNWdKEMgt02a1ODfGXeB+edQGM90JW/D1NVMGyDUNcD4AUOx1Si
 Y/P0oiZrhofmwgewC/MxN6j+A3pn/J0qK65PvH1eokGuHyAaB5Wm1U8JS93h1zKAgD6J
 q1zdgcQBqahcqve13hrj7UG2MaMKDZocMYj6CJVsRQj/zhxh4e3TQIjwhP/s8olrYTeP
 qpKHXhQAZqcwTWRX7GQ6E29B7Gi7XTIpcmJ7XLqaocIkGAoTp8wRkeqae1aFkkb2wKfN
 310A==
X-Gm-Message-State: AOAM532apMGdWfppC0dMX+54l9X66oiLj6J5Zu87bpJm0VyioCE7NA6V
 9zzKOEysGzEZZdhuj1RrNkE/2J+ISsPnztch5yV67/2MjPR7alwVkGmLoIIPKpLjX4/b0yrhG4I
 MS4kXRQYV11MyLyF3k9Z4i2OhPqJALHM=
X-Received: by 2002:a63:f316:: with SMTP id l22mr43615145pgh.439.1636127856714; 
 Fri, 05 Nov 2021 08:57:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJys2rARk8S7Ssc/G/TwW46I3lJEGCYcAWAHjRwFq5ZXoiXOjMlJSDpbVfY9/3PyTi1CDoOZQzPN4VO/7MGXmH8=
X-Received: by 2002:a63:f316:: with SMTP id l22mr43615118pgh.439.1636127856393; 
 Fri, 05 Nov 2021 08:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211105142656.145791-1-philmd@redhat.com>
In-Reply-To: <20211105142656.145791-1-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 5 Nov 2021 12:57:10 -0300
Message-ID: <CAKJDGDYYizAtxCVeJJH0VfDpmOjXwbbJULnxYv7g2nMo5bfUgg@mail.gmail.com>
Subject: Re: [PATCH] docs/about/deprecated: Remove empty 'related binaries'
 section
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com, qemu-trivial@nongnu.org,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 5, 2021 at 11:31 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Commit 497a30dbb06 ("qemu-img: Require -F with -b backing image")
> removed the content of the "Related binaries" section but forgot
> to remove the section title. Since it is now empty, remove it too.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  docs/about/deprecated.rst | 3 ---
>  1 file changed, 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


