Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1196A618FA8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 05:56:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqokD-0006pU-Bj; Fri, 04 Nov 2022 00:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oqlHU-0006Tr-7w; Thu, 03 Nov 2022 21:14:00 -0400
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oqlHS-0003MT-E3; Thu, 03 Nov 2022 21:13:59 -0400
Received: by mail-vk1-xa29.google.com with SMTP id g26so1634045vkm.12;
 Thu, 03 Nov 2022 18:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QqUJoZPrdgcA+NUPRY0GB7EgJwr5BeJBXwVYxpr3uDY=;
 b=Oy0I9ETfaAd7vUUbc5mOYlu4cyAcqTgfLF+mNgOME2n9Glh+PdNnyzl9P34P2njPX2
 UXP3ucKWp7bbNynQYpXj79rTfaUV8M/xzR4J7DPiaqo5Z5wMlXbJs4TLv2uqj7edJO2H
 QG9uC10xUv47EZcZ+pm7Z4ZcfOgFF22D2VVMOeGTO+8EHU1I2roxjIUpgyAR2rFM05E7
 R/nSFFbRtw2Z7GctPFBk5JoaVL8CAOPs+SzXBZmc9FOPwRUp5z676rPcT8TtQg4VfUY8
 clE+1o+cSVZiWm362aKIuniop8ZQ+9+w6AAffTuT857w4WSYVO2kSGirUErvUVsLXGTb
 Ep+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QqUJoZPrdgcA+NUPRY0GB7EgJwr5BeJBXwVYxpr3uDY=;
 b=oZY1kGQpkfGM5J8jpRCbuA812E24bIy+bT/FvKC+ELaNuVTZxRrn4b56Vc32sbunc9
 ujOyMMXWl3We6QtM7BzxyJRUhAQfItUtVwAR7d9iioHXZLD0nbOnEixvRPzok/LSYpiV
 aG0Tmy53ZWgdEqaZHL6zAgmE14BzrHpKn49J+QBJPpqk3d1HLqxjKa5mLGM0pY2Eme5F
 8CQwhGm5iwOYnhBsAkBmIXTppyvmXzQYl9dK0x+W+Ns6X+UzMh5CdKBYtAvxKkB7HF6w
 iNS1/AUKFIx2SZPLhNVOP/2VjU5daTjueTAv3kUm+h5yntpEFxyryjsV6SvtBmbvFlrB
 NVeA==
X-Gm-Message-State: ACrzQf2I4mWhX3NkAebb9nmTMybWjRjpPOijaizJVS+Bz3JJzj4KmX3z
 soS/Umq4Sbc99ysfXhedCOOk2sdvoe8u6F075nM=
X-Google-Smtp-Source: AMsMyM5C7xHK0Q0MRCXvPCjuXqc37zkGpsTaRWC23SBoARv9fdTpmA2iyZzEjNM9WdDXb8KVb9t4OF0lu0XVDO2z0fI=
X-Received: by 2002:a1f:5e4f:0:b0:3b7:8000:da6 with SMTP id
 s76-20020a1f5e4f000000b003b780000da6mr18757910vkb.15.1667524436328; Thu, 03
 Nov 2022 18:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221030093242.208839-1-faithilikerun@gmail.com>
 <20221030093242.208839-4-faithilikerun@gmail.com>
 <ef061624-f599-3020-50aa-57b8e049daa9@linaro.org>
In-Reply-To: <ef061624-f599-3020-50aa-57b8e049daa9@linaro.org>
From: Sam Li <faithilikerun@gmail.com>
Date: Fri, 4 Nov 2022 09:14:03 +0800
Message-ID: <CAAAx-8JEHsDBOtGU6hKwJAgBHHPFD4ASgz7kpRC604FFLoZ4Zg@mail.gmail.com>
Subject: Re: [RFC v4 3/3] virtio-blk: add some trace events for zoned emulation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 stefanha@redhat.com, 
 damien.lemoal@opensource.wdc.com, "Michael S. Tsirkin" <mst@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, hare@suse.de, Hanna Reitz <hreitz@redhat.com>, 
 qemu-block@nongnu.org, dmitry.fomichev@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=faithilikerun@gmail.com; helo=mail-vk1-xa29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 04 Nov 2022 00:55:52 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> =E4=BA=8E2022=E5=B9=B411=E6=
=9C=883=E6=97=A5=E5=91=A8=E5=9B=9B 05:21=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On 30/10/22 10:32, Sam Li wrote:
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > ---
> >   hw/block/trace-events |  7 +++++++
> >   hw/block/virtio-blk.c | 12 ++++++++++++
> >   2 files changed, 19 insertions(+)
> >
> > diff --git a/hw/block/trace-events b/hw/block/trace-events
> > index 2c45a62bd5..f47da6fcd4 100644
> > --- a/hw/block/trace-events
> > +++ b/hw/block/trace-events
> > @@ -44,9 +44,16 @@ pflash_write_unknown(const char *name, uint8_t cmd) =
"%s: unknown command 0x%02x"
> >   # virtio-blk.c
> >   virtio_blk_req_complete(void *vdev, void *req, int status) "vdev %p r=
eq %p status %d"
> >   virtio_blk_rw_complete(void *vdev, void *req, int ret) "vdev %p req %=
p ret %d"
> > +virtio_blk_zone_report_complete(void *vdev, void *req, unsigned int nr=
_zones, int ret) "vdev %p req %p nr_zones %d ret %d"
>
> " ... nr_zones %u ..."
>
> > +virtio_blk_zone_mgmt_complete(void *vdev, void *req, int ret) "vdev %p=
 req %p ret %d"
> > +virtio_blk_zone_append_complete(void *vdev, void *req, int64_t sector,=
 int ret) "vdev %p req %p, append sector 0x%" PRIx64 " ret %d"
> >   virtio_blk_handle_write(void *vdev, void *req, uint64_t sector, size_=
t nsectors) "vdev %p req %p sector %"PRIu64" nsectors %zu"
> >   virtio_blk_handle_read(void *vdev, void *req, uint64_t sector, size_t=
 nsectors) "vdev %p req %p sector %"PRIu64" nsectors %zu"
> >   virtio_blk_submit_multireq(void *vdev, void *mrb, int start, int num_=
reqs, uint64_t offset, size_t size, bool is_write) "vdev %p mrb %p start %d=
 num_reqs %d offset %"PRIu64" size %zu is_write %d"
>
> " ... is_write %u"
>
> > +virtio_blk_handle_zone_report(void *vdev, void *req, int64_t sector, u=
nsigned int nr_zones) "vdev %p req %p sector 0x%" PRIx64 " nr_zones %d"
>
> " ... nr_zones %u"

Thanks!

>
> > +virtio_blk_handle_zone_mgmt(void *vdev, void *req, uint8_t op, int64_t=
 sector, int64_t len) "vdev %p req %p op 0x%x sector 0x%" PRIx64 " len 0x%"=
 PRIx64 ""
> > +virtio_blk_handle_zone_reset_all(void *vdev, void *req, int64_t sector=
, int64_t len) "vdev %p req %p sector 0x%" PRIx64 " cap 0x%" PRIx64 ""
> > +virtio_blk_handle_zone_append(void *vdev, void *req, int64_t sector) "=
vdev %p req %p, append sector 0x%" PRIx64 ""
>
> You can probably drop the trailing "".

It is necessary for formatted output as %" PRIx64 ".

Sam

