Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 996326D67D1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:47:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjirt-0005QL-Kj; Tue, 04 Apr 2023 11:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pjirs-0005QA-3b; Tue, 04 Apr 2023 11:46:44 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pjirq-0003rB-62; Tue, 04 Apr 2023 11:46:43 -0400
Received: by mail-ed1-x52d.google.com with SMTP id r11so132476665edd.5;
 Tue, 04 Apr 2023 08:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680623200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HXW7PcHR8jY5rjao2CXqqhAggW80wQf9CATLv2awgpo=;
 b=V5dNrM8dHK3wPLgQ/hko/4XDDZxu6Rmght8bAA/yfiA1aCFjPFZdg4FnIZcejQ5Wvh
 QIfeXkqr0p09Mj1i60uOuMHGPRjzkMiLajoS/956pSJcRN8kHXW3vscrhk6e67sWkTZX
 SXY+WM88N3laXzuyso4ZPwOFuUVrs9PFtKE0/NLbSDdM6P8fLskq43jb9pIZUGaLHFlt
 muu1VhoRZ7myTAEI+tbMMBBtIGj4QxsLoiR6h1h05VhzRdAMbOV1eWYbqpMTdEgQz8WK
 MbZl37LH8w1dfidTYfeXbEQcdT8Ros+pZM+YSBbUaGiVZHHixmRjZYZ8nV9wZh2FmDG+
 Onbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680623200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HXW7PcHR8jY5rjao2CXqqhAggW80wQf9CATLv2awgpo=;
 b=rM8AlsLKVYIapUN37oJWmZvyYfkqLAj2/aRQOeEWpQ1IsTCttaDU/CaAWCl9J2SFl4
 gFEJeXCIWnV/TvC8CDLZqwdjs6B/DPXLNUZ7AlfamtfecQNejQjpcoby9oGqtntDexXl
 19JKveksf2r+hHQLyYGrXRcgWSZcfVY16iSYPCk2rFPVQXjfMRQ5fkt6Bh2mn/w36wZP
 kjX2PpoP8aUgfl+6ZwGPeckXyYhgxRx4KYUvc113eotk+mcuPw1kgq7FDUrA4jOmBCjw
 EsBofsucfzn/KIoAb+9ArFeqNQofCeZAu5wRHi199nJfq1mqSvRGfdULmgPU/yxUheuP
 mqfQ==
X-Gm-Message-State: AAQBX9ebK48d2c9j5DWL34ILKIwpjWFo0XryHnyYa1YP5YVcZCjnfkWC
 Ug5EeX0eiYJag6+Ie5g0ee8QT+qE24z/wnPs8ps=
X-Google-Smtp-Source: AKy350bgFXwfBN/tb0T+h0XQFwa57ZRcGIFEiJh0i4TiJV2bhRqO8lgSh4ru8ADFtK2rF+lmArBusdGs/lP8H7aIZbE=
X-Received: by 2002:a50:a6d1:0:b0:4fb:4a9f:eb95 with SMTP id
 f17-20020a50a6d1000000b004fb4a9feb95mr1724260edc.2.1680623199972; Tue, 04 Apr
 2023 08:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230327144553.4315-1-faithilikerun@gmail.com>
 <20230329005755-mutt-send-email-mst@kernel.org>
 <CAJSP0QW1FFYYMbwSdG94SvotMe_ER_4Dxe5e+2FAcQMWaJ3ucA@mail.gmail.com>
In-Reply-To: <CAJSP0QW1FFYYMbwSdG94SvotMe_ER_4Dxe5e+2FAcQMWaJ3ucA@mail.gmail.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 4 Apr 2023 23:46:13 +0800
Message-ID: <CAAAx-8J72fiVpOqeK71t8uNiyJLR2DowzGouk_H3oFRF_czc+w@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] Add zoned storage emulation to virtio-blk driver
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, dmitry.fomichev@wdc.com, kvm@vger.kernel.org,
 damien.lemoal@opensource.wdc.com, hare@suse.de, Kevin Wolf <kwolf@redhat.com>, 
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=faithilikerun@gmail.com; helo=mail-ed1-x52d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2023=E5=B9=B44=E6=9C=883=E6=
=97=A5=E5=91=A8=E4=B8=80 20:18=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 29 Mar 2023 at 01:01, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Mar 27, 2023 at 10:45:48PM +0800, Sam Li wrote:
> >
> > virtio bits look ok.
> >
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >
> > merge through block layer tree I'm guessing?
>
> Sounds good. Thank you!

Hi Stefan,

I've sent the v8 zone append write to the list where I move the wps
field to BlockDriverState. It will make a small change the emulation
code, which is in hw/block/virtio-blk.c of [2/5] virtio-blk: add zoned
storage emulation for zoned devices:
- if (BDRV_ZT_IS_CONV(bs->bl.wps->wp[index])) {
+ if (BDRV_ZT_IS_CONV(bs->wps->wp[index])) {

Please let me know if you prefer a new version or not.

Thanks,
Sam

