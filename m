Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0BF6D58E4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 08:47:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjaRf-0003cn-Jm; Tue, 04 Apr 2023 02:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1pjaRU-0003at-Da
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 02:46:57 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1pjaQj-0001mI-G6
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 02:46:56 -0400
Received: by mail-ed1-x530.google.com with SMTP id ek18so126397714edb.6
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 23:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ionos.com; s=google; t=1680590765;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jdc4Rz1hjMlcCsqLlhgN/a8EwNe86NqDV2Io/T3fQGI=;
 b=LKybr3Did2+HGMt8uqmOwIh0QURTwA40bZByerWS0K76DA1Q3rXIMkRN4X67oYLInU
 bpChSVufVozYBiImvVdFBVQIqVYjmBiAysuHEBy8O2uX9GhabKLPOipTT6bXD1Z92jjr
 A5EZg8V9WTnbPiq3WY9OFny818GZewk3fPGyXtb8OpsKkUr0p5L5H+PsF1Rs1d2l8Hwf
 0oeaSFGhH9a7PTkwQEV2D+MABMHMlnXErkoynyI3IjyVCspI3MEXSbntsPSzadYcPN6t
 KifmOtZME8mSBRKAdPNaIBjQwC5iGsIA2ht8L/pAkB8j1/qL8Q8UxZBa8MIxHVuxVlSa
 j4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680590765;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jdc4Rz1hjMlcCsqLlhgN/a8EwNe86NqDV2Io/T3fQGI=;
 b=rc6yHMWKBOZmCKThyVlOxE+ZsNiQX3GOHsjX7K4u6ospGeTfNivQkXZyeXf8YhzAzb
 lVd22gQIaxdi746WbeOy04uI3vWp3SE5RazedEAn5aIdvPs41rNeqdWYH4/w0lKE3HZ4
 N/4AaxOZjIVIampwMKbcQO8fsRwrlKllKFM0R58vzLL2tHxkzb9+a8XiFm+GxdZidSU+
 O0pKeHXnZGavDZzn58iffI+/zIsx5ExlS+p4SbUyGFF2nl+FEEOGOVk/96Rn6KZnLRBN
 KOcvq8PSIaYoR1HQJB4EOVTtvjnGa4KdlrqtssM5XNEqHHV7NjOXtVmFJKiQXhVJdRsC
 sj0Q==
X-Gm-Message-State: AAQBX9foKU1ZoI/w578F2KV8bdCyWNQ2so1SHSaDIbnwidfr31wRfm8/
 lv5V16Rbk86iZqmztZykQQfYvrESOszZ5Ex+hyzreA==
X-Google-Smtp-Source: AKy350YYlORy/EVTGO2hr8z5hNScvP+/KbOcC/u78BiN7i63WVj5qYPQu2iAC2LCYh4juDwJkZB1Htcv59tw+DQw8eA=
X-Received: by 2002:a17:907:a687:b0:8b2:8876:cdd4 with SMTP id
 vv7-20020a170907a68700b008b28876cdd4mr656518ejc.7.1680590765019; Mon, 03 Apr
 2023 23:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAHEcVy5SV34jaubY5F-q=H+smvMVOzKbb=rTaNJDNXyGdFaLZg@mail.gmail.com>
 <94e21f89-0a3e-701b-7171-7398dff9ce46@redhat.com>
 <CAHEcVy5TiQwYofhCe3RpdFopYzYWbGnL7EO5nE_HQTAVEeaqAg@mail.gmail.com>
In-Reply-To: <CAHEcVy5TiQwYofhCe3RpdFopYzYWbGnL7EO5nE_HQTAVEeaqAg@mail.gmail.com>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Tue, 4 Apr 2023 08:45:54 +0200
Message-ID: <CAMGffE=cxQzMrT+wbPazApmsGfgAx6z8O0DzEJfWyMQaGFs80w@mail.gmail.com>
Subject: Re: an issue for device hot-unplug
To: Yu Zhang <yu.zhang@ionos.com>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Elmar Gerdes <elmar.gerdes@ionos.com>, imammedo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: permerror client-ip=2a00:1450:4864:20::530;
 envelope-from=jinpu.wang@ionos.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

Hi Yu,

On Mon, Apr 3, 2023 at 6:59=E2=80=AFPM Yu Zhang <yu.zhang@ionos.com> wrote:
>
> Dear Laurent,
>
> Thank you for your quick reply. We used qemu-7.1, but it is reproducible =
with qemu from v6.2 to the recent v8.0 release candidates.
> I found that it's introduced by the commit  9323f892b39 (between v6.2.0-r=
c2 and v6.2.0-rc3).
>
> If it doesn't break anything else, it suffices to remove the line below f=
rom acpi_pcihp_device_unplug_request_cb():
>
>     pdev->qdev.pending_deleted_event =3D true;
>
> but you may have a reason to keep it. First of all, I'll open a bug in th=
e bug tracker and let you know.
>
> Best regards,
> Yu Zhang
This patch from Igor Mammedov seems relevant,
https://lore.kernel.org/qemu-devel/20230403131833-mutt-send-email-mst@kerne=
l.org/T/#t
Can you try it out?

Regards!
Jinpu
>
> On Mon, Apr 3, 2023 at 6:32=E2=80=AFPM Laurent Vivier <lvivier@redhat.com=
> wrote:
>>
>> Hi Yu,
>>
>> please open a bug in the bug tracker:
>>
>> https://gitlab.com/qemu/qemu/-/issues
>>
>> It's easier to track the problem.
>>
>> What is the version of QEMU you are using?
>> Could you provide QEMU command line?
>>
>> Thanks,
>> Laurent
>>
>>
>> On 4/3/23 15:24, Yu Zhang wrote:
>> > Dear Laurent,
>> >
>> > recently we run into an issue with the following error:
>> >
>> > command '{ "execute": "device_del", "arguments": { "id": "virtio-diskX=
" } }' for VM "id"
>> > failed ({ "return": {"class": "GenericError", "desc": "Device virtio-d=
iskX is already in
>> > the process of unplug"} }).
>> >
>> > The issue is reproducible. With a few seconds delay before hot-unplug,=
 hot-unplug just
>> > works fine.
>> >
>> > After a few digging, we found that the commit 9323f892b39 may incur th=
e issue.
>> > ------------------
>> >      failover: fix unplug pending detection
>> >
>> >      Failover needs to detect the end of the PCI unplug to start migra=
tion
>> >      after the VFIO card has been unplugged.
>> >
>> >      To do that, a flag is set in pcie_cap_slot_unplug_request_cb() an=
d reset in
>> >      pcie_unplug_device().
>> >
>> >      But since
>> >          17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default=
 on Q35")
>> >      we have switched to ACPI unplug and these functions are not calle=
d anymore
>> >      and the flag not set. So failover migration is not able to detect=
 if card
>> >      is really unplugged and acts as it's done as soon as it's started=
. So it
>> >      doesn't wait the end of the unplug to start the migration. We don=
't see any
>> >      problem when we test that because ACPI unplug is faster than PCIe=
 native
>> >      hotplug and when the migration really starts the unplug operation=
 is
>> >      already done.
>> >
>> >      See c000a9bd06ea ("pci: mark device having guest unplug request p=
ending")
>> >          a99c4da9fc2a ("pci: mark devices partially unplugged")
>> >
>> >      Signed-off-by: Laurent Vivier <lvivier@redhat.com <mailto:lvivier=
@redhat.com>>
>> >      Reviewed-by: Ani Sinha <ani@anisinha.ca <mailto:ani@anisinha.ca>>
>> >      Message-Id: <20211118133225.324937-4-lvivier@redhat.com
>> > <mailto:20211118133225.324937-4-lvivier@redhat.com>>
>> >      Reviewed-by: Michael S. Tsirkin <mst@redhat.com <mailto:mst@redha=
t.com>>
>> >      Signed-off-by: Michael S. Tsirkin <mst@redhat.com <mailto:mst@red=
hat.com>>
>> > ------------------
>> > The purpose is for detecting the end of the PCI device hot-unplug. How=
ever, we feel the
>> > error confusing. How is it possible that a disk "is already in the pro=
cess of unplug"
>> > during the first hot-unplug attempt? So far as I know, the issue was a=
lso encountered by
>> > libvirt, but they simply ignored it:
>> >
>> > https://bugzilla.redhat.com/show_bug.cgi?id=3D1878659
>> > <https://bugzilla.redhat.com/show_bug.cgi?id=3D1878659>
>> >
>> > Hence, a question is: should we have the line below in  acpi_pcihp_dev=
ice_unplug_request_cb()?
>> >
>> >     pdev->qdev.pending_deleted_event =3D true;
>> >
>> > It would be great if you as the author could give us a few hints.
>> >
>> > Thank you very much for your reply!
>> >
>> > Sincerely,
>> >
>> > Yu Zhang @ Compute Platform IONOS
>> > 03.04.2013
>>

