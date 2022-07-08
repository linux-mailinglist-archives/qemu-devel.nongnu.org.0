Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3331856B635
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 12:03:46 +0200 (CEST)
Received: from localhost ([::1]:42362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9kpt-0007D3-62
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 06:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9km3-0003JM-Pp
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 05:59:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9km1-0003ii-To
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 05:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657274385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vsb6/dV2cDGvancAJufmbmLknxQ64K96HWHnFIfeh9g=;
 b=Lmzt/ZHygEAqqhLQS4CKzc0K+wi6YtXWn1kecKS8O4WwQmC4GjyLWiexh526HSVu1FNmrN
 wzrzJ2GKBdNmoNwsM3BJhhrlj4qqOkKt2qckCdtmsRMyEnIpi0FJ4lWjO6dPQnChe8r8Uf
 E67tz26nXoXyRxjW7InYg3A76dEqyzU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-jEHb4TvZOK6MnpMmFImHZw-1; Fri, 08 Jul 2022 05:59:38 -0400
X-MC-Unique: jEHb4TvZOK6MnpMmFImHZw-1
Received: by mail-qk1-f200.google.com with SMTP id
 a7-20020a37b107000000b006af3bc02282so20771722qkf.21
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 02:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Vsb6/dV2cDGvancAJufmbmLknxQ64K96HWHnFIfeh9g=;
 b=PZp2J8/g7xm01ffNMP9CmO5jobVyhB3kpx8wtbW57ckoPIMSU1CaAknU50gDdIiZea
 lLD/gHncliDLFmudnHF0oBdLx5R6ZHvk/M9CQ3HkSfhyLt/LBWu+M2D+xQGmjiDLBFg3
 40ZQFaLU6cVdIXYSke27nB5kHrltrnCKCVVnGbSanEi6ruNicwEtawGyR8yEJaL7k5aA
 fuiQrlm+BA1bc/2Pl5kseTADxG6Wkb8xf7oOEmqjaUAdjBj6jGR6Z7T3s0VQmsYRYbQl
 VqZnfV5pSQgP0mag+EEf+0/TxW5W8mpYAhlVh500Ac7Zl5vV944DbVGTO2cpUFYOHOiu
 XMjg==
X-Gm-Message-State: AJIora/5ps7HMDWdk/cBPUuMjDrVR+dHjA9jgMortCfnOhT6vZ6DW/0a
 dJIEWVbI1B2y5fMUKeQN3HU8n6e4CnhBmypmWkyjkWHKASxoEqdtkMORz7KwfSV5bqBCL6rxPtG
 W0dgLPj5aNmB4GtUfTESszDsRVZFsB9I=
X-Received: by 2002:a05:620a:2005:b0:6b5:6531:ec5e with SMTP id
 c5-20020a05620a200500b006b56531ec5emr910907qka.255.1657274377731; 
 Fri, 08 Jul 2022 02:59:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tTPOLljOteTfLQGwGMxOlCZT2NTJG6WovYAGgkoKzuTsZkD3lIQXFsuiRcAMYFphfwFd0vlv1l3t7RCVu6aH8=
X-Received: by 2002:a05:620a:2005:b0:6b5:6531:ec5e with SMTP id
 c5-20020a05620a200500b006b56531ec5emr910888qka.255.1657274377527; Fri, 08 Jul
 2022 02:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-4-eperezma@redhat.com>
 <CACGkMEv361=0fJY-x2=xARkDKYWgZcAUrQD=jds=m30GvPzR_g@mail.gmail.com>
In-Reply-To: <CACGkMEv361=0fJY-x2=xARkDKYWgZcAUrQD=jds=m30GvPzR_g@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 8 Jul 2022 11:59:01 +0200
Message-ID: <CAJaqyWd6X5889LJSXmHrutudX6nOwDWWO_aSKSWMBnLf05WYGw@mail.gmail.com>
Subject: Re: [RFC PATCH v9 03/23] vdpa: delay set_vring_ready after DRIVER_OK
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eric Blake <eblake@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, Jul 8, 2022 at 11:06 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Thu, Jul 7, 2022 at 2:40 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
> >
> > To restore the device in the destination of a live migration we send th=
e
> > commands through control virtqueue. For a device to read CVQ it must
> > have received DRIVER_OK status bit.
> >
> > However this open a window where the device could start receiving
> > packets in rx queue 0 before it receive the RSS configuration. To avoid
> > that, we will not send vring_enable until all configuration is used by
> > the device.
> >
> > As a first step, reverse the DRIVER_OK and SET_VRING_ENABLE steps.
>
> I wonder if it's better to delay this to the series that implements
> migration since the shadow cvq doesn't depends on this?
>

(Forgot to add) this series is already capable of doing migration with
CVQ. It's just that it must use SVQ from the moment the source VM
boots up, which is far from ideal.

Thanks!


