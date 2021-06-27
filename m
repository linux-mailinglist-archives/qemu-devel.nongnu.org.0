Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0F13B5300
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 13:26:49 +0200 (CEST)
Received: from localhost ([::1]:38622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxSw4-0007kP-PF
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 07:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lxSuU-0006rc-22; Sun, 27 Jun 2021 07:25:10 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:38697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lxSuS-0004WX-Eq; Sun, 27 Jun 2021 07:25:09 -0400
Received: by mail-il1-x12b.google.com with SMTP id v5so14583308ilo.5;
 Sun, 27 Jun 2021 04:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RHiAINPRNYPG3H5svX6HB/7L/NHzrcL2apfnzlW1BdY=;
 b=gtFEfw6OXRaBLyk1iCBCmFerQ9KRYRYOmbhtVvsbng8oh1cTuozk2EXvw0A9afk52N
 5pAM4hhZxp3sWw+H1GTRMg9A29xygrfZO8xBd93U9OuHeXstaJGipYXlM0UbZxDx9KUK
 TSnW38YIfUM4GXdx2N2qYnpAiMV0qlrSABSmsJMNBWJH1uttCwxxNl0vAHH3VwWj90qU
 x5Js0BKhNv6KU75kyPYJzFidLVmGUWDsYoPzxPgKqBjtCMxi4g1uAfRAhUtqUPOMZuUs
 jOCFtXM0hUZy9vbXmUZ7Rv5Wn7rZfKRNLTw1S6fA7skXG+yoM7tJzoR4d2cJnexwCrzP
 CYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RHiAINPRNYPG3H5svX6HB/7L/NHzrcL2apfnzlW1BdY=;
 b=FYnW+AkuGZZtuMv26/nh2HTedwaitZtVnf4oKGMor+NpCtO/N6/hVT5WNUYzeHvn2V
 n6RWr3cy1d8haxWozixhvD7ZhEddAxzyJ0LDVScoSlz8rTf4rO5EJVpzu9Twh9IsbT7R
 3K16aguiZcSrdxne77VwPzy4qWiR9yZ4iwwmQYD/M4O18YL6m7DJMfRG8+FAM6vvTDGW
 WWfrFUZk7wnBA6gDmfAuNjn1mVMf/cI/T8gW6EAUnlYYm24Mhs1IT6cNu7hPU0sLi6ED
 4GVkwRi9Fwsgu3ovviYR/mSOxb4NB7Xx9Z/vKcb2k3+w3UhPDFU9tEbsSAPNwK+5E8Gn
 9GjQ==
X-Gm-Message-State: AOAM533JFylTvg3oa9WzTacREo6pIPxq6QSRtsijUO3u5SAKC6w50LAk
 aYLLHEOAznDQPXeyUbKqk1ipzCncUuuyPaZkd1c=
X-Google-Smtp-Source: ABdhPJxY7pJaBZ3nXKVmmF5nTgP75mfK9RiX5Hm5FoCk4uYCPzT/nyjq1p3khmLsROlBw8hrkLzIuxTk2DGJfsB4ld4=
X-Received: by 2002:a05:6e02:1906:: with SMTP id
 w6mr14321933ilu.281.1624793107050; 
 Sun, 27 Jun 2021 04:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210627083054.3920288-1-oro@il.ibm.com>
 <OFDCE9D738.9662FBDF-ON00258701.002FE1AF-00258701.00300179@ibm.com>
 <CAOi1vP-pZrqFyjh4cDoNy5pC=4ooQPp=9yXcZxzoDNj8W4=YGA@mail.gmail.com>
 <OFD9731CF1.77FDF819-ON00258701.003D4F3D-00258701.003D4F41@ibm.com>
In-Reply-To: <OFD9731CF1.77FDF819-ON00258701.003D4F3D-00258701.003D4F41@ibm.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Sun, 27 Jun 2021 13:24:50 +0200
Message-ID: <CAOi1vP91r_T6anfN4w1-L8_y=rntLVuE-enpdbnVv55PaFzDHQ@mail.gmail.com>
Subject: Re: [PATCH] block/rbd: Add support for rbd image encryption
To: Or Ozeri <ORO@il.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=idryomov@gmail.com; helo=mail-il1-x12b.google.com
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
Cc: kwolf@redhat.com,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Mykola Golub <to.my.trociny@gmail.com>, Danny Harnik <DANNYH@il.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jun 27, 2021 at 1:09 PM Or Ozeri <ORO@il.ibm.com> wrote:
>
> Should I still leave the encryption format part of the state, and just not report it? or should I also remove it from the state?

I'd remove it, reverting to the previous version of the patch
except instead of fetching the size with rbd_get_size() and storing
it in a local variable keep using s->image_size.

Thanks,

                Ilya

