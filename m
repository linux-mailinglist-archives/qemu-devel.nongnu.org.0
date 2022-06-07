Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 448715400D1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 16:11:31 +0200 (CEST)
Received: from localhost ([::1]:34464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyZve-0002SZ-C1
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 10:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nyZso-000073-AA
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 10:08:34 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:32795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nyZsj-0007vi-8B
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 10:08:34 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-e656032735so23343835fac.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 07:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=moaYlNQasBh1GKoo2CWbjTbE/4FE4XKn+rUyoVcj728=;
 b=X/KPnKQJaNBmmk4NB+zRl/elG70ffbZEUBBkRfkqFPNDiIUulVhu3z8E6s/SgawEqr
 9jU4An5o1zknYVZ0bdZqRKCdC7M+7PchBxMKesJ45IzJBhJKhBNgwh1NahYbkzfcsmdx
 K5OpLdkN67SkyJxk3dCnEzzM+b4Kb/tFCPEWQS4J7Rop2m/shBN38ohZ5zwFnmHD21Ad
 JKNM0PKRcVwj95c0cwkXRtD8LvKRXkc3p6VKAomnK4gK+XnhUkqR4cB5c6DzlJC9AwXc
 2n7jfNs+FsF4+gi4Uq4Lmo9wJ9QPXP5Kp0SfgJSry956Ea2SYjHl6EZBM4oXv1zfRgDz
 n8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=moaYlNQasBh1GKoo2CWbjTbE/4FE4XKn+rUyoVcj728=;
 b=sI0k/IevE8DtI5LmZzZmX9LyyhJes8ucB9Uc8w5WNUYAm8NuNxDcQNarwZ9FVsfA3j
 +Nesd5kMC7nHkAj7XIKT+4xjO9SDCYKeHHICrhmrVpsvvYCbWlNRE/KdtIBgtHKIzE0Z
 Jnd/JXem10gidikbyFn9XQU+I6X9uMwhGpp8tC3Dygd31nH6zyehqmpWgX1nZHTwAhTh
 EeFyDWrSlGedp9dJwodvuvYExOgRs8hdqze5Hd7dL5Xw1bcjndT90qKBXhPY8oOs6Ro2
 QER086ExDfubRySt2RzAGDOrNTF8FJJZg+AP7rNIqz/2bGd8ufjxeA8171/MSi1QFbwo
 sqqg==
X-Gm-Message-State: AOAM533ApLVbXLgDjke0rZiaLPCanW6PUcqh+xX6Hjv49ZoCyFfko0K0
 c0f7jVPHVOTTemmitQyutCOH8AV5yHsudS85Cb8=
X-Google-Smtp-Source: ABdhPJxZabN7AQlVFnyaPhTkuofk5LL56OfplxYUR4YEmaUsk4u2/0bgD7xTIBE4AjmV/IS3KQehRShqjpb1XiNiVgc=
X-Received: by 2002:a05:6870:a792:b0:f3:1eca:5ba6 with SMTP id
 x18-20020a056870a79200b000f31eca5ba6mr15652140oao.212.1654610907520; Tue, 07
 Jun 2022 07:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <Yp4V61lfTTN3QsT4@stefanha-x1.localdomain>
 <20220607132625.GA181696@heatpiped>
In-Reply-To: <20220607132625.GA181696@heatpiped>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 7 Jun 2022 15:08:15 +0100
Message-ID: <CAJSP0QWeiudRsLNDsTX3z6Mvua_kEov2sfTfDUvhauknZCvL_w@mail.gmail.com>
Subject: Re: ioregionfd with io_uring IORING_OP_URING_CMD
To: Elena <elena.ufimtseva@oracle.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Jag Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, john.levon@nutanix.com, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 kvm <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=stefanha@gmail.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Jun 2022 at 14:32, Elena <elena.ufimtseva@oracle.com> wrote:
> On Mon, Jun 06, 2022 at 03:57:47PM +0100, Stefan Hajnoczi wrote:
> > The downside is it requires more code than general purpose I/O. In
> > addition to ->uring_cmd(), it's also worth implementing struct
> > file_operations read/write/poll so traditional file I/O syscalls work
> > for simple applications that don't want to use io_uring.
> >
> > It's possible to add ->uring_cmd() later but as a userspace developer I
> > would prefer the ->uring_cmd() approach, so I'm not sure it's worth
> > committing to the existing userspace-provided file approach?
>
> Makes total sense. I am going to start working on this and will
> come back with more questions.

Good to hear!

Userspace needs a way to create these fds. I think a new
ioctl(KVM_CREATE_IOREGIONFD) is needed. Then the fd can be passed back
to KVM_SET_IOREGION.

Stefan

