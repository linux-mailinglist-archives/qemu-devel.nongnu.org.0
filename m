Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E7453C061
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 23:32:46 +0200 (CEST)
Received: from localhost ([::1]:59964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwsQu-0003cw-AU
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 17:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nwsP3-0002TB-9N; Thu, 02 Jun 2022 17:30:49 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:33551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nwsP1-0001ai-Jq; Thu, 02 Jun 2022 17:30:49 -0400
Received: by mail-qk1-x72e.google.com with SMTP id br33so2916288qkb.0;
 Thu, 02 Jun 2022 14:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=B/1eqqbHZnQqzfEJFI/2PMisMT8zWNIw4xhukZQmi8Q=;
 b=lCFMpTN4exoAZQ9n/fx4VXIwJwyfRwqE2Ui1VGvznjFtxo36qExWwecmrmeIgu1rWI
 wasYI8C7LdH7k2CbE5KZcax5XZ2KdWW1DhVtZuzYr6oF1bxYxV2q1xZqN4h6oupP/xhL
 /twg9f9HSpWVKu3wwePcw469DdYLgyoezQhu6WLRPAGCktT2J1gjYxr/HHVaL97zCpEu
 Utn+OIrLmERFLHOdnrIP/l9xkj2edr3Aeb7C4N948mC9oDCNlaS6jpTcazDuPFiCYRYr
 ofvBGZA+pG5+BUJebadb52KJsh26TZ2g1U+oJwvebpXd2JFfBYrjyiGKVg4Wbw/OVtJN
 UJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=B/1eqqbHZnQqzfEJFI/2PMisMT8zWNIw4xhukZQmi8Q=;
 b=MQNFvUNUjRkF5+Oj/k8aQM2nSeT5D+pYyK//gH1gCh56Bf5v4JTyrLjC4U0+JA577Y
 xKRSTQsWs7v5SPvGTGKi6r46prTAvMelusRUtylRoXGlvG4ck1qrEpeJ2IPslVh/6HVn
 8FB8EJHR0bODNejSMHGZVvE7LgeuxLe/h9TAXUcphpMBfM3Jh/m3mqtQS0W+dQT/uKFU
 jew2P+jum5Xgn/8y8tPtBwNyHRWsbImtq+7Bli4Yn8+A6bs5sQXanPfYXDOUi4djDKCF
 mRiElk16ci0lyGQXC9PGc12RMk0w9ixZxAWhmDdlRuS8/MdTd83HkaSbdRa/Tpd+E/lS
 x7gw==
X-Gm-Message-State: AOAM531aCF/cczbFYexYt7Ne+QQt+8+Krhr1dyCct8c94G79OAT3gAQl
 uJBp1MGo62gLxIN+H7vvFqX8fhe8njxovHYQfFSbOwWno9E=
X-Google-Smtp-Source: ABdhPJwKW4JeFyoI54chyz2cWk2dZWekJhToO/7Dlpc/klI1T3tB3WkKbgxiJUpS1AAmIe1zrgsVE0eNKAnElADl81c=
X-Received: by 2002:a37:917:0:b0:6a6:9a14:b542 with SMTP id
 23-20020a370917000000b006a69a14b542mr458042qkj.562.1654205445841; Thu, 02 Jun
 2022 14:30:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:7f14:0:0:0:0:0 with HTTP;
 Thu, 2 Jun 2022 14:30:45 -0700 (PDT)
In-Reply-To: <43BCAA1E-7499-4584-AB60-C5004AA0643B@gmail.com>
References: <20220513180957.90514-1-shentey@gmail.com>
 <43BCAA1E-7499-4584-AB60-C5004AA0643B@gmail.com>
From: Bernhard Beschow <shentey@gmail.com>
Date: Thu, 2 Jun 2022 23:30:45 +0200
Message-ID: <CAG4p6K6kZHfC6KLoioozmGWomUoUZwceUQcU+Y9qDo9FraXfyQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] PIIX3-IDE XEN cleanup
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: qemu-trivial@nongnu.org, sstabellini@kernel.org, anthony.perard@citrix.com,
 paul@xen.org, xen-devel@lists.xenproject.org, 
 Bernhard Beschow <shentey@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000fc28c705e07db752"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=shentey@gmail.com; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000fc28c705e07db752
Content-Type: text/plain; charset="UTF-8"

On Saturday, May 28, 2022, Bernhard Beschow <shentey@gmail.com> wrote:
> Am 13. Mai 2022 18:09:54 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>v2:
>>* Have pci_xen_ide_unplug() return void (Paul Durrant)
>>* CC Xen maintainers (Michael S. Tsirkin)
>>
>>v1:
>>This patch series first removes the redundant "piix3-ide-xen" device
class and
>>then moves a XEN-specific helper function from PIIX3 code to XEN code.
The idea
>>is to decouple PIIX3-IDE and XEN and to compile XEN-specific bits only if
XEN
>>support is enabled.
>>
>>Testing done:
>>'qemu-system-x86_64 -M pc -m 1G -cdrom archlinux-2022.05.01-x86_64.iso"
boots
>>successfully and a 'poweroff' inside the VM also shuts it down correctly.
>>
>>XEN mode wasn't tested for the time being since its setup procedure seems
quite
>>sophisticated. Please let me know in case this is an obstacle.
>>
>>Bernhard Beschow (3):
>>  hw/ide/piix: Remove redundant "piix3-ide-xen" device class
>>  hw/ide/piix: Add some documentation to pci_piix3_xen_ide_unplug()
>>  include/hw/ide: Unexport pci_piix3_xen_ide_unplug()
>>
>> hw/i386/pc_piix.c          |  3 +--
>> hw/i386/xen/xen_platform.c | 48 +++++++++++++++++++++++++++++++++++++-
>> hw/ide/piix.c              | 42 ---------------------------------
>> include/hw/ide.h           |  3 ---
>> 4 files changed, 48 insertions(+), 48 deletions(-)
>>
>
> Ping
>
> Whole series is reviewed/acked.

Ping 2

--000000000000fc28c705e07db752
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Saturday, May 28, 2022, Bernhard Beschow &lt;<a href=3D"mailto:shentey@g=
mail.com">shentey@gmail.com</a>&gt; wrote:<br>&gt; Am 13. Mai 2022 18:09:54=
 UTC schrieb Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.com">shen=
tey@gmail.com</a>&gt;:<br>&gt;&gt;v2:<br>&gt;&gt;* Have pci_xen_ide_unplug(=
) return void (Paul Durrant)<br>&gt;&gt;* CC Xen maintainers (Michael S. Ts=
irkin)<br>&gt;&gt;<br>&gt;&gt;v1:<br>&gt;&gt;This patch series first remove=
s the redundant &quot;piix3-ide-xen&quot; device class and<br>&gt;&gt;then =
moves a XEN-specific helper function from PIIX3 code to XEN code. The idea<=
br>&gt;&gt;is to decouple PIIX3-IDE and XEN and to compile XEN-specific bit=
s only if XEN<br>&gt;&gt;support is enabled.<br>&gt;&gt;<br>&gt;&gt;Testing=
 done:<br>&gt;&gt;&#39;qemu-system-x86_64 -M pc -m 1G -cdrom archlinux-2022=
.05.01-x86_64.iso&quot; boots<br>&gt;&gt;successfully and a &#39;poweroff&#=
39; inside the VM also shuts it down correctly.<br>&gt;&gt;<br>&gt;&gt;XEN =
mode wasn&#39;t tested for the time being since its setup procedure seems q=
uite<br>&gt;&gt;sophisticated. Please let me know in case this is an obstac=
le.<br>&gt;&gt;<br>&gt;&gt;Bernhard Beschow (3):<br>&gt;&gt;=C2=A0 hw/ide/p=
iix: Remove redundant &quot;piix3-ide-xen&quot; device class<br>&gt;&gt;=C2=
=A0 hw/ide/piix: Add some documentation to pci_piix3_xen_ide_unplug()<br>&g=
t;&gt;=C2=A0 include/hw/ide: Unexport pci_piix3_xen_ide_unplug()<br>&gt;&gt=
;<br>&gt;&gt; hw/i386/pc_piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3=
 +--<br>&gt;&gt; hw/i386/xen/xen_platform.c | 48 ++++++++++++++++++++++++++=
+++++++++++-<br>&gt;&gt; hw/ide/piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 42 ---------------------------------<br>&gt;&gt; include/hw=
/ide.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ---<br>&gt;&gt; 4 =
files changed, 48 insertions(+), 48 deletions(-)<br>&gt;&gt;<br>&gt;<br>&gt=
; Ping<br>&gt;<br>&gt; Whole series is reviewed/acked.<br><br>Ping 2

--000000000000fc28c705e07db752--

