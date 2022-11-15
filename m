Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27641629F90
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 17:50:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouz89-0000XZ-2j; Tue, 15 Nov 2022 11:49:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouz80-0000XG-SN
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:49:41 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouz7y-0004E5-AP
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:49:40 -0500
Received: by mail-pf1-x42d.google.com with SMTP id 130so14616844pfu.8
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 08:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3YM+cvWionICL7TafDGs8wNfL2OhUBnS6JnGQtiyMNQ=;
 b=PGbX1iQ5qKSfjxzIGmhVGfcfjKK8/GtAbz9jkKzoR9BLT4GLmQ7j1ZUPz7NnFMyZcL
 GcVGBRoX/b1ozTH8kPtZLwQzK1BOypUcGvHVHnyqYV+8irW2YvdafI00MzvRhNVcbVBm
 M5Hhu/EvQ+nanV6Y0ER635JKePus3k3bAcJ3M6LwlYt0qqwrEnUa/o3cHNH9bGJqvU05
 YInM2mEW8AcWPRmJC7B8NDAbD9HH7UXNbaoRhCucP+9XH+Ofag5ytzHom6P7YtAReOL1
 VonchkCw1bzj76CoZAu9huP+kMGtNqPYjrak6/nQmo9YLwWvVxceim5sWLYY3pDUOJLM
 Ad+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3YM+cvWionICL7TafDGs8wNfL2OhUBnS6JnGQtiyMNQ=;
 b=eOINLtoKKIg3f4WePqBpvKSEmRHCXUa9GB/pBXmC15yYE0Pqkb4XKbM5y8xI53lBW1
 3pUiHcuINbyVcJ/MaMtpgNbO3X5JB2dLAOnyPRVzsrS8YMrvk4YStJqORwyi5iM3lylU
 /sd55EhBFHdzzlP0XLwbvMWvaxz9DvajJLkvpZdYm6TXWKIupQzDUaPKikMX574ZZvXP
 F7UTto+Stl+ne8lA7C+VxheAvPVY4xmA/dmETqnKIUpO6mDIpxIo6Xc9iTdjfPriEBCy
 9V821stryz9mqhe6b6sZwJLGOUqhDpvC+iSrFoMkn4rnlpfhq32ZznuWrxOqoGTlzEnd
 f8rQ==
X-Gm-Message-State: ANoB5pm1Tbs5qhiLn/EtLxAsfYbQjHhsa/fUf+NNYtev82LsOvBqt+x/
 sw5pA+ZabbMJudpAKRrZ9PwPH7cTgdIjz1nkL8fYIg==
X-Google-Smtp-Source: AA0mqf7Xfqw9VgYp7G+DA4pdfzg4S1swKBdi6ugTWqQZ28g1jgnSErbgor09m0g6RZgfnyvOZAZowbjYINWyCG1izy4=
X-Received: by 2002:a62:6046:0:b0:572:698b:5f6d with SMTP id
 u67-20020a626046000000b00572698b5f6dmr4540044pfb.51.1668530976455; Tue, 15
 Nov 2022 08:49:36 -0800 (PST)
MIME-Version: 1.0
References: <20221028191648.964076-1-alxndr@bu.edu>
 <20221028191648.964076-2-alxndr@bu.edu> <Y3O8GAw9kRfNBmFV@x1n>
In-Reply-To: <Y3O8GAw9kRfNBmFV@x1n>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Nov 2022 16:49:24 +0000
Message-ID: <CAFEAcA8E4nDoAWcj-v-dED-0hDtXGjJNSp3A=kdGF8UOCw0DrQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] memory: associate DMA accesses with the initiator
 Device
To: Peter Xu <peterx@redhat.com>
Cc: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Mauro Matteo Cascella <mcascell@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 15 Nov 2022 at 16:20, Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Oct 28, 2022 at 03:16:42PM -0400, Alexander Bulekov wrote:
> > +    /* Do not allow more than one simultanous access to a device's IO Regions */
> > +    if (mr->owner &&
> > +            !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
> > +        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
> > +        if (dev->mem_reentrancy_guard.engaged_in_io) {
>
> Do we need to check dev being non-NULL?  Fundamentally it's about whether
> the owner can be not a DeviceState, I believe it's normally true but I
> can't tell; at least from memory region API it can be any Object*.

There is at least one MemoryRegion in the tree whose owner is not
a DeviceState: hw/arm/virt.c does:

        memory_region_init(secure_sysmem, OBJECT(machine), "secure-memory",
                           UINT64_MAX);

and MachineState inherits directly from Object, not via DeviceState.

More generally, when doing a QOM cast, either:
 (1) you know that the object must be of the right type, in which
     case you should use the cast macro (which will assert for you), or
 (2) the object may not be of the right type, in which case you
     use object_dynamic_cast() and check whether it returned NULL

The combination of object_dynamic_cast() and no NULL check is I
think usually a bug.

-- PMM

