Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC862F8456
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 19:28:34 +0100 (CET)
Received: from localhost ([::1]:50448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Tpp-0007mW-Lk
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 13:28:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0ToR-0006tS-2A
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 13:27:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0ToP-0008K2-Em
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 13:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610735224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DQN980mLC+bwmDOgJAZPW5SZgCK2odrasH6SYjLVL+4=;
 b=VChVvDNjnipnuOjJeBO8q1kR2jvCl0dFLIs7NILgmF/xNaxZyMjrwwixVSLPd554PA4f+4
 jaqL6DY8Jx/bn51kIF+WW57HzFzOnUhtn0gk5cKh/HYpmZR7kUk/lrM/z5SswTDYgIiGqS
 cCX8Qr/9+sUZTjseFJNEvEMc2AP2cjw=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-4xK_J_HOPgiDncDrKXd6ZQ-1; Fri, 15 Jan 2021 13:27:03 -0500
X-MC-Unique: 4xK_J_HOPgiDncDrKXd6ZQ-1
Received: by mail-vs1-f70.google.com with SMTP id x4so1824308vsq.16
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 10:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DQN980mLC+bwmDOgJAZPW5SZgCK2odrasH6SYjLVL+4=;
 b=Z+icZ8FQS69JfOgIxrisH7FngyaMfXfQ7E+dc5A4NMYx5yMqjX1VCXKYlFISqmgxRE
 +4RlWD/Fro0qeVkBRKLAgT2D3jIchp0crRpAorDiyp0ObocrozZUmgJWYEvepS7t+IU4
 SkWxNXln/81YakAe+rYdD44QrCAtX1hJJZo28v7baYoVpqHXsu4DF/pmTkXTwRD8jZh6
 HCBrIBR2zWGwr9IXeVQLG1FXflGKacvtI/oKNT4b1ybkOvXAQmxSxW58gfdJc3665SQd
 c4nvzxOTqM1/TfpwdswdHlzxAFiMdITGqemcsq8AwYURqXL1Xn5IhjrU4covgGDUhbz9
 CZXA==
X-Gm-Message-State: AOAM533T0knCZxfyN+oyYYvlmuLQrynB/b0pGZ3zl2t3rLS0TaF/z4wt
 fkvl8C+s0MtVMH8D2h6ene4XrupxsV7jUFj3bPJasMlRUuMCGIjFBI5mb5mCfbFKVV7+zJvvZz7
 XRepAg6M8FyzN7UFLS6Ys56ymHYbNTi8=
X-Received: by 2002:a05:6102:5f1:: with SMTP id
 w17mr11795266vsf.45.1610735222846; 
 Fri, 15 Jan 2021 10:27:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuvnH675mnS/A4rdZNsxTHKqIpAFieRXS47gVU3pqbmiqSsvy8xjxRgQM0/M7xQmHe17Bf1wMY2VGmhhsg/FY=
X-Received: by 2002:a05:6102:5f1:: with SMTP id
 w17mr11795250vsf.45.1610735222642; 
 Fri, 15 Jan 2021 10:27:02 -0800 (PST)
MIME-Version: 1.0
References: <20210115174315.30949-1-mreitz@redhat.com>
 <20210115174315.30949-8-mreitz@redhat.com>
In-Reply-To: <20210115174315.30949-8-mreitz@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 15 Jan 2021 15:26:36 -0300
Message-ID: <CAKJDGDb8NHwPH89pmGd-FsHjptCmQZQFOtU+n5gK13kfhiAq7g@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] iotests/129: Actually test a commit job
To: Max Reitz <mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 2:43 PM Max Reitz <mreitz@redhat.com> wrote:
>
> Before this patch, test_block_commit() performs an active commit, which
> under the hood is a mirror job.  If we want to test various different
> block jobs, we should perhaps run an actual commit job instead.
>
> Doing so requires adding an overlay above the source node before the
> commit is done (and then specifying the source node as the top node for
> the commit job).
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/129 | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


