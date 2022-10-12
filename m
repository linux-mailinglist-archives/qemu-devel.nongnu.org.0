Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85BE5FC723
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 16:20:06 +0200 (CEST)
Received: from localhost ([::1]:44994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oicab-0002bu-GC
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 10:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oicWN-0007js-Cz
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:15:43 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:33540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oicWL-00038b-QX
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:15:43 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-354c7abf786so157148467b3.0
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 07:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=x5q5UaeIrzODWUHdSNbpGgDcgQ6EbQBZ+oosfLDb2YI=;
 b=m+2+i6+ySOcQ9xYX0M8qcI3zldLPcVnGR/MREtYGOuwWUR8klZ7DxqMRxCQG1uvI6T
 o4EaPCUuvRKHTjmCuCDazJc7eS2AOG2HADNfAH3b8zA9AyRuYn8I7cytI/+EfoAHfnPJ
 CO49E/nWCh8FWwSUSfO7j2yUY3sRIypwg+z6C6CCgQaGd6s0Qp82KXM4cMzLADYnOAy+
 Ne3OjEhvU0r/w6HKrdK+96gU3Ne3zWGXdhUaS7lXFr54viXrwB0lHGeRmMjANhL6+MHt
 VtqC46mrB7u4rntkAdUjf8yj/wxPqvadrP/EdSJURKYiGpPA6njKUdlSc2Eo8JNkqRk2
 Ayxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x5q5UaeIrzODWUHdSNbpGgDcgQ6EbQBZ+oosfLDb2YI=;
 b=mXezjWnQIBDiofD6ePAdcmtQ+8rUz8F9ZCRsHWbWDffbhq+n6pPX799sfUIz9Lr5ke
 AdkXNt9O1IlAjcNgWe74Ys30l2oyU1JgxxeFGVDTO/L8AvUbCRUTV4VIR8n6DEd2+8Ch
 XnKwAD5iXmondbUFi53R0ZwHFOhk/h7NZ43wPkjub7ReyrQ8bCumxsbwZb+LcnUD2fdz
 CBeeS3YIfWaKTncyKMyQ47Lcrug96kY/jDdwr8y/wDedNL2aW/xkG+/Jh1sVNqTA0vM1
 qnc8cZl2GOle+gmgpqJMuUwDccRDGqoJ+TBixfoHchp/Fm13QeyyPsiCFrKdbBOwqSNL
 +8Qg==
X-Gm-Message-State: ACrzQf1RmlDW+u7+yx1ri8ZYSw3EBzN0y0Feyf2JaQiiwQPnSG6/9Kra
 WZT4mjnh05Osydip6nbhR3m7LZKpzqf4kZgYvyM=
X-Google-Smtp-Source: AMsMyM78XpQ2emyq3cEKwe6c/B+RtPQuw0V4XAcVx9GYt9ubZEDpXJ+zfRaTOZj2b/YhUXRskbRctqj6quzdULOPTkI=
X-Received: by 2002:a0d:d78c:0:b0:360:bbf0:ef88 with SMTP id
 z134-20020a0dd78c000000b00360bbf0ef88mr15764109ywd.206.1665584140677; Wed, 12
 Oct 2022 07:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <Yza1u1KfKa7ycQm0@T590> <Yzs9xQlVuW41TuNC@fedora>
 <YzwARuAZdaoGTUfP@T590>
 <CAJSP0QXVK=wUy_JgJ9NmNMtKTRoRX0MwOZUuFWU-1mVWWKij8A@mail.gmail.com>
 <20221006101400.GC7636@redhat.com>
In-Reply-To: <20221006101400.GC7636@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 12 Oct 2022 10:15:28 -0400
Message-ID: <CAJSP0QXbnhkVgfgMfC=MAyvF63Oof_ZGDvNFhniDCvVY-f6Hmw@mail.gmail.com>
Subject: Re: ublk-qcow2: ublk-qcow2 is available
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Ming Lei <tom.leiming@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 io-uring@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kirill Tkhai <kirill.tkhai@openvz.org>,
 Manuel Bentele <development@manuel-bentele.de>, 
 qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
 Xie Yongji <xieyongji@bytedance.com>, "Denis V. Lunev" <den@openvz.org>, 
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 Oct 2022 at 06:14, Richard W.M. Jones <rjones@redhat.com> wrote:
>
> On Tue, Oct 04, 2022 at 09:53:32AM -0400, Stefan Hajnoczi wrote:
> > qemu-nbd doesn't use io_uring to handle the backend IO,
>
> Would this be fixed by your (not yet upstream) libblkio driver for
> qemu?

I was wrong, qemu-nbd has syntax to use io_uring:

  $ qemu-nbd ... --image-opts driver=file,filename=test.img,aio=io_uring

The new libblkio driver will also support io_uring, but QEMU's
built-in io_uring support is already available and can be used as
shown above.

Stefan

