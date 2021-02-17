Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F5D31D6C3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 09:54:51 +0100 (CET)
Received: from localhost ([::1]:43998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCIbh-0000Sy-UJ
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 03:54:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miklos@szeredi.hu>) id 1lCIaH-0008NI-9d
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 03:53:21 -0500
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32]:33588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <miklos@szeredi.hu>) id 1lCIaE-0006ze-E7
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 03:53:20 -0500
Received: by mail-vk1-xa32.google.com with SMTP id w140so2734179vkw.0
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 00:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iGNOIOy2GJaYx3HOn2Z3RLtBKccx+R0p/5yVtYw9ok4=;
 b=D+1vgZDiWyROF/evG30igtWDyAjFPZhBACNTdWWzns/kgwnqMe8veh/jWWTSPEgYmZ
 i7iOuksrQPAxFuL4GNGZ/8AbPp/UR+DOW/rQGbFlErYXPIfNx33rIbGpZL+HeEK0I8/s
 obSSxS0jSqziioYDb/YwT/E17z+jgxNrAzOnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iGNOIOy2GJaYx3HOn2Z3RLtBKccx+R0p/5yVtYw9ok4=;
 b=DSrk9xMZsEV9a3ECXrrDj2jl5XYPPM+hAjOMHEEZepw5Qa5ciIHaAMvw6mawMrmtIR
 BTSelJuUrbasmbQ5YVn4xjgr8FbllSZM/hjQk4JXvJclVrATewkK/WM2zPij3SLx2b2l
 zrg6psAcMmutTHvdmbTZIvXSLBPz4X6Br0kEtk1OokQKWXTi+BhYThPnaHW5xEAOiG0B
 Xi+RphKMkgrcynscfkB3XXUfmJxSpcD9/QD6MwvM8GKSQHXiWRJ6xN4M7FbVoZRfW8TH
 JvqrmfmOKEF9a8DPYJA9rG4Y7Hygi5K4nVC2UO9bJB2+No5Qp2sPQXfRz7E5RaT//tNZ
 jIXQ==
X-Gm-Message-State: AOAM5328ntZ0tXq+6s92anLj+Wkk9uG76skgSjwe7p16iWSQWm0dFei7
 6LLlW63zRTL6hrLK6Q3zin8XM0oYdR0k5q5DPgPm8Q==
X-Google-Smtp-Source: ABdhPJzZ44tJOMldGJaZBWeq3+YNS1iFuZmQx3ZM80ZtEgmAZXQCAhmNqTxYuL49zyFvC5d4eKWDJPOdf6m/eWmOGS8=
X-Received: by 2002:a1f:250e:: with SMTP id l14mr552000vkl.23.1613551995995;
 Wed, 17 Feb 2021 00:53:15 -0800 (PST)
MIME-Version: 1.0
References: <20210216233611.33400-1-vgoyal@redhat.com>
 <20210216233611.33400-2-vgoyal@redhat.com>
In-Reply-To: <20210216233611.33400-2-vgoyal@redhat.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 17 Feb 2021 09:53:04 +0100
Message-ID: <CAJfpegspJGL_W+8zaXyHfuAhtB_Q7V0YyOZJEhpCd=KaL_W71A@mail.gmail.com>
Subject: Re: [PATCH 1/3] virtiofsd: Add an option to enable/disable posix acls
To: Vivek Goyal <vgoyal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=miklos@szeredi.hu; helo=mail-vk1-xa32.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, Luis Henriques <lhenriques@suse.de>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 17, 2021 at 12:36 AM Vivek Goyal <vgoyal@redhat.com> wrote:
>
> fuse has an option FUSE_POSIX_ACL which needs to be opted in by fuse
> server to enable posix acls.
>
> Add virtiofsd option "-o posix_acl/no_posix_acl" to let users enable/disable
> posix acl support. By default it is disabled as of now.

If I read the code correctly, then no_posix_acl will still result in
system.posix_acl_* xattr ops being passed through to virtiofsd, which
will forward them to the underlying fs, resulting in posix acls
appearing to work, but doing so incorrectly (i.e. no change from
previous behavior).   Possibly better would be to have three different
modes of operation:

1) no option: default fall back to broken acl support for backward
compat (this could be removed in the future)
2) no_posix_acl: really disable acl support
3) posix_acl: enable proper acl support

Thanks,
Miklos

