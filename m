Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBC95A587F
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 02:42:16 +0200 (CEST)
Received: from localhost ([::1]:46674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSpKZ-00009u-Cp
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 20:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oSpG9-00060H-EH; Mon, 29 Aug 2022 20:37:41 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:35835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oSpG7-00035E-Kz; Mon, 29 Aug 2022 20:37:40 -0400
Received: by mail-vs1-xe36.google.com with SMTP id 67so9998639vsv.2;
 Mon, 29 Aug 2022 17:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=2VJ+crMNWXeBYx+K++9KvdhJn18QmuRSk1nhg177Q3M=;
 b=F+DYTGa5pY4KmhX9YDaevVQiBlsLpMSqs6Xvq90+fPjP5oWQ3zjvCNbbpBZmmJmgRt
 lm2ZuOKJQqivJS17sool3/xYPB+xLTiex2baRx7NT5UbS1pXEaF1SP8uQ7UNA4yi/uvR
 1D3QsbmX844jll4LOMAeFPxkMP0g1YvMym8Qzwl+DmU0bDfreVCJ1LYZrk4ikMlS/5xA
 aWjaVV7IT2Vseglg5quPYhFhTtbpjEBfj8aG0HjZ9uIRfpmmpBwTvd4ZyleqfScrlUuD
 NSQb2Yy/t0gCSp6PuGEpUXpnL9Ufmykp6eTl0VE50HyQc/3ziR/gssuMBGaj1kYMDRC1
 SFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=2VJ+crMNWXeBYx+K++9KvdhJn18QmuRSk1nhg177Q3M=;
 b=kN/+28wWywDpMHcODzjvAl9ODu2EyVVFohxK2LWaJn9c071F84XsjbCHkRQtYpWkfa
 5jIfE7y0rQQpjj4aep7ePxW927Fppxei5M1nWPfEhGDdQoVgE8j59h2AvQnqkuaB9AhP
 DQzGq8ry29jcOpw2w15bMHIBZP7rOO6kjHKslCPgX4hI9uAJVnFgPb6FjM4CED3LQom2
 ayJqfJyCWSKgNfuP+DkJ+KGGE/NLKK6v2EveZgr8y7iJEgPj6fOd4Bt1vFVWW3HkOMFj
 OKCYe0UBEtdpc1EvD16WRhcgwprCjUsPNQda/y8jk4MRszVB7AQQWfYSBQeN+/3Aofk+
 7haw==
X-Gm-Message-State: ACgBeo3KtzH8E8wWAk7w6zPGy+0WT2MiiHA7lJNZ+Dla37GjiG3/TPFu
 C3IP1MqCKd6ZBfsbA1uOwaZ1YIGge1ebmmPLqik=
X-Google-Smtp-Source: AA6agR4qsx7XbC3JnSbjqnR0r6il9Omn/o5DSofExg4PUpltkYsrWhCQwcfDNuftpcdYzOR9UD4NoPSQu8DlWB/AMpQ=
X-Received: by 2002:a67:ec47:0:b0:388:8294:10b4 with SMTP id
 z7-20020a67ec47000000b00388829410b4mr4520457vso.54.1661819857406; Mon, 29 Aug
 2022 17:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220826151529.6601-1-faithilikerun@gmail.com>
 <Yw0W/VdybcXXhPn0@fedora>
In-Reply-To: <Yw0W/VdybcXXhPn0@fedora>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 30 Aug 2022 08:37:49 +0800
Message-ID: <CAAAx-8+ASi-Fp9UCNzmnuJXzSwsZCTv6wNYyFwVuAoWt3C2shA@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] Add support for zoned device
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, 
 Hannes Reinecke <hare@suse.de>, qemu block <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, 
 Kevin Wolf <kwolf@redhat.com>, Damien Le Moal <damien.lemoal@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=faithilikerun@gmail.com; helo=mail-vs1-xe36.google.com
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

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=8830=E6=
=97=A5=E5=91=A8=E4=BA=8C 03:44=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Aug 26, 2022 at 11:15:29PM +0800, Sam Li wrote:
> > Zoned Block Devices (ZBDs) devide the LBA space to block regions called=
 zones
> > that are larger than the LBA size. It can only allow sequential writes,=
 which
> > reduces write amplification in SSD, leading to higher throughput and in=
creased
> > capacity. More details about ZBDs can be found at:
> >
> > https://zonedstorage.io/docs/introduction/zoned-storage
> >
> > The zoned device support aims to let guests (virtual machines) access z=
oned
> > storage devices on the host (hypervisor) through a virtio-blk device. T=
his
> > involves extending QEMU's block layer and virtio-blk emulation code.  I=
n its
> > current status, the virtio-blk device is not aware of ZBDs but the gues=
t sees
> > host-managed drives as regular drive that will runs correctly under the=
 most
> > common write workloads.
> >
> > This patch series extend the block layer APIs with the minimum set of z=
oned
> > commands that are necessary to support zoned devices. The commands are =
- Report
> > Zones, four zone operations and Zone Append (developing).
> >
> > It can be tested on a null_blk device using qemu-io or qemu-iotests. Fo=
r
> > example, the command line for zone report using qemu-io is:
> > $ path/to/qemu-io --image-opts -n driver=3Dzoned_host_device,filename=
=3D/dev/nullb0
> > -c "zrp offset nr_zones"
> >
> > v8:
> > - address review comments
> >   * solve patch conflicts and merge sysfs helper funcations into one pa=
tch
> >   * add cache.direct=3Don check in config
>
> Hi Sam,
> I have left a few comments.

That's great! Thanks for reviewing. I'll send a revision soon.

Sam

