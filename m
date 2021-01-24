Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C8A301A89
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 09:25:22 +0100 (CET)
Received: from localhost ([::1]:33452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3ai1-0000lT-B0
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 03:25:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1l3ah1-0000KM-C8
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 03:24:19 -0500
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32]:44466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1l3agw-0004eH-E2
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 03:24:16 -0500
Received: by mail-oo1-xc32.google.com with SMTP id n19so1154804ooj.11
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 00:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HYuN1n1oWusChIb1Bzqk7XlI68C3RfWtdO1aOdC61EM=;
 b=wYQQIrgA6qTw7rjNBHMm3HVvEtrV4+VKkNzjWMipJC7wYxun4jZeHSkd3h2WaGWTxo
 jKk07/7WtMf+U+3tS3FfFfkpduJx5Xziz8mkTqm2R3yq1Hz+bflKFzIJDczNXlJrGcr/
 CycTpb1yTf786DiEXx1jWb99uDCsgqxht+SJkPnhc8pMXMv1dBtMNZ3mW0Z7IPpjt1Lr
 kHY+hSE/phGk5UyINpw76v83iSw4d4sIqqmHcfoC39+uigl3D2SDxxOfl3+DEx2MqJRO
 3eiwc84MHhDLOULXcalITz/1ry4QJMt2kLCbThr1V3GXE3cZdMW0S+tieticfNZhzgd4
 R/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HYuN1n1oWusChIb1Bzqk7XlI68C3RfWtdO1aOdC61EM=;
 b=jn21evJIbWLSMN1/Hyfv20CSWmsx+Fh67H3mmeyF3vbaA+hv8FdITxYeLxHFNlAaRl
 iVadmUFRGvzXDHZ1Daet5naODvxP4GWEWL/JaWzbEb5PKHTlN7meeFgN5VtfUFWUIJTB
 j1tVcwXchcQU2YeNVNWnvKVmK5BpTaiocnVKCNja8l7itnOEYj88Qkq3YIYlXAoalGlv
 GmyRLJpvBfaxbXC+Iqrxpo9J+piOZTLCBMsCNKAX/wLGMvAvsptUDpr23HFryCzB+ph5
 aRlbdWU0wrRkj9u3OHAUonIA2rp71VHEPlhUMZ1/4sjDkxrZIZpMwu8hrcEWmp1bGBd6
 u/vg==
X-Gm-Message-State: AOAM531ztA6mm+1EH8Kexf6dVU0LBdiLtS3KD4oW5ULc5S2PugcAsRbr
 /zd2rf+yFJS+R5Mifiqa12gN+cnpyVGd9IEg56fT2g==
X-Google-Smtp-Source: ABdhPJxy1WhHVCPVFCNIY2J6297Zlh08M05+e1vapgnAiMlO69vcCeGYA0leNMlyCNIuz664lNa4fI3Tf0ZUl14Y04M=
X-Received: by 2002:a4a:7353:: with SMTP id e19mr8932719oof.55.1611476652341; 
 Sun, 24 Jan 2021 00:24:12 -0800 (PST)
MIME-Version: 1.0
References: <20210114211612.387052-1-andrew@daynix.com>
 <20210114211612.387052-6-andrew@daynix.com>
 <266f9040-542e-199e-1903-fb871ae3ad81@redhat.com>
 <CAOEp5Oe0ZDRxSVaO4Q=YiJ3LTmXzcoUot1y1WhD97SsN=-oTgg@mail.gmail.com>
 <21d802e9-b8d9-61b0-b966-0843df2364e1@redhat.com>
In-Reply-To: <21d802e9-b8d9-61b0-b966-0843df2364e1@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Sun, 24 Jan 2021 10:24:00 +0200
Message-ID: <CAOEp5Oc265Z7+yipfuGSFcVY_tt5oqyf4pkk1jjyxyVTNoCkmQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/6] virtio-net: Added eBPF RSS to virtio-net.
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::c32;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oo1-xc32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Yan Vugenfirer <yan@daynix.com>, Andrew Melnychenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

I've prepared a POC of graceful switch to 'vhost off' if respective
features are acked by the guest.
Such a way we do not need to silently clear RSS and hash report
features in case of 'vhost on'.
Can you please review it and provide your feedback?

I think the only open question is what to do with cases of vhost-user
and vhost-vdpa.

https://github.com/qemu/qemu/pull/105
This pull request is for reviews only.

Thanks in advance






On Mon, Jan 18, 2021 at 5:16 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/1/17 =E4=B8=8B=E5=8D=885:04, Yuri Benditovich wrote:
> > On Fri, Jan 15, 2021 at 9:20 AM Jason Wang<jasowang@redhat.com>  wrote:
> >> On 2021/1/15 =E4=B8=8A=E5=8D=885:16, Andrew Melnychenko wrote:
> >>> From: Andrew<andrew@daynix.com>
> >>>
> >>> When RSS is enabled the device tries to load the eBPF program
> >>> to select RX virtqueue in the TUN. If eBPF can be loaded
> >>> the RSS will function also with vhost (works with kernel 5.8 and late=
r).
> >>> Software RSS is used as a fallback with vhost=3Doff when eBPF can't b=
e loaded
> >>> or when hash population requested by the guest.
> >>>
> >>> Signed-off-by: Yuri Benditovich<yuri.benditovich@daynix.com>
> >>> Signed-off-by: Andrew Melnychenko<andrew@daynix.com>
> >>> ---
> >>>    hw/net/vhost_net.c             |   2 +
> >>>    hw/net/virtio-net.c            | 125 +++++++++++++++++++++++++++++=
++--
> >>>    include/hw/virtio/virtio-net.h |   4 ++
> >>>    net/vhost-vdpa.c               |   2 +
> >>>    4 files changed, 129 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> >>> index 24d555e764..16124f99c3 100644
> >>> --- a/hw/net/vhost_net.c
> >>> +++ b/hw/net/vhost_net.c
> >>> @@ -71,6 +71,8 @@ static const int user_feature_bits[] =3D {
> >>>        VIRTIO_NET_F_MTU,
> >>>        VIRTIO_F_IOMMU_PLATFORM,
> >>>        VIRTIO_F_RING_PACKED,
> >>> +    VIRTIO_NET_F_RSS,
> >>> +    VIRTIO_NET_F_HASH_REPORT,
> >>>
> >>>        /* This bit implies RARP isn't sent by QEMU out of band */
> >>>        VIRTIO_NET_F_GUEST_ANNOUNCE,
> >>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> >>> index 09ceb02c9d..37016fc73a 100644
> >>> --- a/hw/net/virtio-net.c
> >>> +++ b/hw/net/virtio-net.c
> >>> @@ -691,6 +691,19 @@ static void virtio_net_set_queues(VirtIONet *n)
> >>>
> >>>    static void virtio_net_set_multiqueue(VirtIONet *n, int multiqueue=
);
> >>>
> >>> +static uint64_t fix_ebpf_vhost_features(uint64_t features)
> >>> +{
> >>> +    /* If vhost=3Don & CONFIG_EBPF doesn't set - disable RSS feature=
 */
> >> I still think we should not clear feature silently. This may break
> >> migraiton if the feature is cleared on destination.
> > Do I understand it correctly that if we do not clear features silently
> > and implement a graceful drop to vhost=3Doff when we can't do what we
> > need with vhost - then we do not need to add any migration blocker?
>
>
> Yes. I think we won't go with migration blocker since we need support
> migration in the end.
>
> Thanks
>
>
> >
>

