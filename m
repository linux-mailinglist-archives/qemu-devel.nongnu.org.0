Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E87E226CF6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 19:12:54 +0200 (CEST)
Received: from localhost ([::1]:47572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxZLR-0001mo-Hw
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 13:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1jxZKj-0001MH-7U
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 13:12:09 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:55495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1jxZKg-0002Fu-MQ
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 13:12:08 -0400
Received: by mail-pj1-x1041.google.com with SMTP id k1so114311pjt.5
 for <qemu-devel@nongnu.org>; Mon, 20 Jul 2020 10:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h9NtaO/dHZN+veRlqrp09RfatabewzBYbBRadCS8hT8=;
 b=SHQxkrQ/7aFL+rUTetoqRdouvD8Tuj57jBwL2pjQf9JXaQX9bMh9cx1s7q96QOp703
 FY1DnWEzMdEUZfvv/QCi1Q9pZsDTsC3OCRb4epofwkRlF9Yfi0BJIFN7DdtFWyEZhGrZ
 /GpkRLpgJAp/HLN/a3L7k+6fBJ24TeU7OK1J8IaPvzoG7cCmMxGzQCHhJ6yg1OwJ6MhS
 +yOaHvCbwNNDsBk9d0iefc6a3X78Yy8X3cj/YRtZX2O9SmwOiuHqHkNegDLgZgZE3szE
 dTZ9DMuBQklHyKIadB6vMbIiFuzoqt9/QXIPor0e4GdGt5yDAoJCUXIqzvVvsYY1HDLn
 zvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h9NtaO/dHZN+veRlqrp09RfatabewzBYbBRadCS8hT8=;
 b=SS+R8HxuXZii77PVPSjG4HlhwmturFYoNwwO9hO4Lp7wrtMZrVy6taSqlg7Ahy0tUU
 D7BapFXMEbIMRg3fin3EdeP6jjEvKPzsPTnINxSHELKVqYz8Jj6bAg8+SDH3L24Bqlyg
 FrjLShQpvu4A3H9H/VHt9SwYSvOnTrbiv9xytojTiEMLZ8whleHX3FO3yxic4o6LDuYg
 2wLE1wGnrTkTtgkW/Z8fxmE66GRiYxIUXjoSCnd2vWTHzAoDUniJOoBqt+GsaV1gGYQ/
 hCOTJ0GL7ZysEgQV7yS6A00LNcWvKJsBRDHBtnMpkmtgu7P+CE5q2lX5f8uE2hZcRGTM
 b0bQ==
X-Gm-Message-State: AOAM533aEiTKRhXHYiLW1+2tmNNiYtcc6J6HisbPHTeWqehmsd/fvjHl
 ejV1vnivf3NlB7wGWj8oCPxLMNbjmsVw/ChtHUE=
X-Google-Smtp-Source: ABdhPJzxrLgGlCYLg80UlkG2fYoZCS/8ojPQP0S/YJX7K6Xr/jpwuSVgkza3xGs1oBKuqH7crPIgSAFbuaUbrz1me1Y=
X-Received: by 2002:a17:902:6bca:: with SMTP id
 m10mr19014520plt.210.1595265124545; 
 Mon, 20 Jul 2020 10:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <86d42090-f042-06a1-efba-d46d449df280@arrikto.com>
 <20200715112342.GD18817@stefanha-x1.localdomain>
In-Reply-To: <20200715112342.GD18817@stefanha-x1.localdomain>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 20 Jul 2020 18:11:53 +0100
Message-ID: <CAJSP0QU78mAK-DiOYXvTOEa3=CAEy1rQtyTBe5rrKDs=yfptAg@mail.gmail.com>
Subject: Re: Inter-VM device emulation (call on Mon 20th July 2020)
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=stefanha@gmail.com; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "John G. Johnson" <john.g.johnson@oracle.com>,
 Jag Raman <jag.raman@oracle.com>, Andra-Irina Paraschiv <andraprs@amazon.com>,
 kvm <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>, Alexander Graf <graf@amazon.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Nikos Dragazis <ndragazis@arrikto.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you everyone who joined!

I didn't take notes but two things stood out:

1. The ivshmem v2 and virtio-vhost-user use cases are quite different
so combining them does not seem realistic. ivshmem v2 needs to be as
simple for the hypervisor to implement as possible even if this
involves some sacrifices (e.g. not transparent to the Driver VM that
is accessing the device, performance). virtio-vhost-user is more aimed
at general-purpose device emulation although support for arbitrary
devices (e.g. PCI) would be important to serve all use cases.

2. Alexander Graf's idea for a new Linux driver that provides an
enforcing software IOMMU. This would be a character device driver that
is mmapped by the device emulation process (either vhost-user-style on
the host or another VMM for inter-VM device emulation). The Driver VMM
can program mappings into the device and the page tables in the device
emulation process will be updated. This way the Driver VMM can share
memory specific regions of guest RAM with the device emulation process
and revoke those mappings later.

Stefan

