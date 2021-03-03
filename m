Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CEF32BA0D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:56:07 +0100 (CET)
Received: from localhost ([::1]:47200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWfG-00021n-Go
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1lHWWy-0005bi-9d
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:47:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1lHWWo-00082a-6Q
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:47:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614797241;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qm0DuSrEX1GllOA+xXOWYlV1evaoBNDo1QE7lYwTpcs=;
 b=EeKqHCicpl/WKvSDPwUf1Xn+DuH1om7xtJKOzWyGwLjiKNuxv5pwXNd6TJKLYBdtaCaHJZ
 u4W78b76+bI1i7ILbKqW2mxC1GZJfWhQKfeivGLWDeSkysbrp8BUtCxVxpFSoMQdid/Msb
 vBPuelD1SxqNlk+pNYF3TSiBRRa+lrQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-zY7M2CF-M4GU79Qx9EMu5Q-1; Wed, 03 Mar 2021 13:47:19 -0500
X-MC-Unique: zY7M2CF-M4GU79Qx9EMu5Q-1
Received: by mail-wr1-f70.google.com with SMTP id e29so13165390wra.12
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:47:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=qm0DuSrEX1GllOA+xXOWYlV1evaoBNDo1QE7lYwTpcs=;
 b=Q8sKukERzkuSfnrz+NxJOtcZieVAqqPaaNI2wB0hbN5BPYrwO8riLjnosidiG+6zhm
 JOKL9oC5cn8dZ6ZAPqx1u3KpyJ9RKAH6vpNT9HlUR2z9OEtVneAD7YTvKGVpt8oDk/WE
 t5UNnGs5W/KbZeKzSkQArqCkuKFYoKrRJbrqha6uUc8uV3keugdorduSD/fsReOAbmN1
 lJwpn6OtTioq6ei0LtBPMd9sZawU7+siNKJhD3FUL5+p+D12EeNRCsLHSyActcx0JTUk
 Gy1HltB+m8/mH8s0YVQX/gv1jWbgmZcWUghmx9LCWiNvDBvx9dp0fmZyQbS2xXbW5jX+
 eukg==
X-Gm-Message-State: AOAM5310NZX0IEgBmaouNaWtdeaE0gp2D4bPKZZlJcrv8n5NmBNI2kgd
 peP5OZA1lTCh8TNWwEm+Z1RyqUl5mBQud7Ee8RjK0796cIH5+LnRQDkh4+RH2HOV5Rnodks5g+x
 Mj8IMvMsqYidZIMrRUODxct59d1BDBmU=
X-Received: by 2002:a5d:6807:: with SMTP id w7mr12093wru.103.1614797238191;
 Wed, 03 Mar 2021 10:47:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz06TNgdfMQbu9irKKkwWmda0Yjl9xp7RS4k7tiFIVbX19U2vkPXTe3DOYO506CqDUWdYi5t7PGguBIs8Ist+c=
X-Received: by 2002:a5d:6807:: with SMTP id w7mr12079wru.103.1614797238007;
 Wed, 03 Mar 2021 10:47:18 -0800 (PST)
MIME-Version: 1.0
References: <20210303174058.sdy5ygdfu75xy4rr@steredhat>
In-Reply-To: <20210303174058.sdy5ygdfu75xy4rr@steredhat>
From: Jason Dillaman <jdillama@redhat.com>
Date: Wed, 3 Mar 2021 13:47:06 -0500
Message-ID: <CA+aFP1CXWaZ4a7pB2EGhyf1CWt5k884qwgvwKxSRrZKTn=f3wg@mail.gmail.com>
Subject: Re: QEMU RBD is slow with QCOW2 images
To: Stefano Garzarella <sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jdillama@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jdillama@redhat.com;
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
Reply-To: dillaman@redhat.com
Cc: Peter Lieven <pl@kamp.de>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 3, 2021 at 12:41 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> Hi Jason,
> as reported in this BZ [1], when qemu-img creates a QCOW2 image on RBD
> writing data is very slow compared to a raw file.
>
> Comparing raw vs QCOW2 image creation with RBD I found that we use a
> different object size, for the raw file I see '4 MiB objects', for QCOW2
> I see '64 KiB objects' as reported on comment 14 [2].
> This should be the main issue of slowness, indeed forcing in the code 4
> MiB object size also for QCOW2 increased the speed a lot.
>
> Looking better I discovered that for raw files, we call rbd_create()
> with obj_order = 0 (if 'cluster_size' options is not defined), so the
> default object size is used.
> Instead for QCOW2, we use obj_order = 16, since the default
> 'cluster_size' defined for QCOW2, is 64 KiB.
>
> Using '-o cluster_size=2M' with qemu-img changed only the qcow2 cluster
> size, since in qcow2_co_create_opts() we remove the 'cluster_size' from
> QemuOpts calling qemu_opts_to_qdict_filtered().
> For some reason that I have yet to understand, after this deletion,
> however remains in QemuOpts the default value of 'cluster_size' for
> qcow2 (64 KiB), that it's used in qemu_rbd_co_create_opts()
>
> At this point my doubts are:
> Does it make sense to use the same cluster_size as qcow2 as object_size
> in RBD?

No, not really. But it also doesn't really make any sense to put a
QCOW2 image within an RBD image. To clarify from the BZ, OpenStack
does not put QCOW2 images on RBD, it converts QCOW2 images into raw
images to store in RBD.

> If we want to keep the 2 options separated, how can it be done? Should
> we rename the option in block/rbd.c?

You can already pass overrides to the RBD block driver by just
appending them after the
"rbd:<filename>[:option1=value1[:option2=value2]]" portion, perhaps
that could be re-used.

> Thanks,
> Stefano
>
> [1] https://bugzilla.redhat.com/show_bug.cgi?id=1744525
> [2] https://bugzilla.redhat.com/show_bug.cgi?id=1744525#c14
>


-- 
Jason


