Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0056F5BFBB7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 11:53:26 +0200 (CEST)
Received: from localhost ([::1]:52354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oawQ0-0005l6-Hw
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 05:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oawL2-0000yi-BK
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 05:48:19 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:37481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oawKz-0003SH-Ok
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 05:48:15 -0400
Received: by mail-ej1-x631.google.com with SMTP id a26so12360004ejc.4
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 02:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=zW5HyKzeuivew/B/xuG63OBJVZKZHySm5uewagUHgYw=;
 b=W0gXS6y2bMRF3jyfGKbHAJ3obFmZsrPdd8F24LXKd+lkBoXU71tcZ/8Rd6CBiOG5Gt
 /llLewMKLhpE1fQNCYWyNUKAbaSFN2uQB2l18sr/X93nrdV3mtGgAIGRp/6TgVSMzN2Y
 /w1fEeXGFjYnXxT23gFPn8XnRZH5aeFDoxQz9+VomJlB3nS5DQBO+52ijYrE6giLDSG/
 2KCpT4rp+gLvUOj6dxkghXRdjweFaTc4KxK/v/ZnZUMuCbBq69W0kFT14iOV1Wlsqup3
 dNnSUoA2MHtiNM8+w3c7h0S8ulkEzZsQykPZzRe2GSS6+09iGKn6Gbsk3SsmOBhLic69
 qeyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zW5HyKzeuivew/B/xuG63OBJVZKZHySm5uewagUHgYw=;
 b=Kh3xsOjMMhRsf9cWXfRXSLOLKLotMYq0caeiqSm8hDkjYht8Wd7ahJDORBxPwqPHBz
 NQ4K1IuHJwJ+PmjbQ5jObE8o0tS2eehJhtqJMPlE846Yp7tj0aXM8yoZ+RAQJKwunM9m
 X/eFu3RkhzW1vPI1Y9lBa4h61i2rJHPJ1uaJ0vkgojV5ZIvF7prpRc9dxRRSmxVETG7y
 i60uQKA9hzwqVjY8rPStrsiDpuIoftaVSmmpb7BLI6+IN7K07j29YW9pSLKgDO3YFPEO
 5VaKDBKS3K8EZR14pWCc8xAYxoN6zm/OSmjSK5xsvoLrjVfxbd/hGIgvTi1NiTKI0T+U
 tP1g==
X-Gm-Message-State: ACrzQf0Pu2WecPIU+b4g5LvTiqOlKVcLCN2w2hNXaLklTGks/GGRVhtb
 Uh2yDLC0C3itTJxbAdzd1qhPSRvZ4KFTGsPdupXo9g==
X-Google-Smtp-Source: AMsMyM7XaE+m0i9UnpDDtPcon9xvHdJdJV7wVRhpBOJ+d6OIshyTTEiMluysyBi3pDZh60CQuxd4pQfbk7wQRmhLbco=
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr19468493ejc.504.1663753689736; Wed, 21
 Sep 2022 02:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220919231720.163121-1-shentey@gmail.com>
 <CAFEAcA8GjXFO4WK=KybgSc8rMfqecwD9EXS0kZMKtqogNf1Tsg@mail.gmail.com>
 <AD2F1750-F579-4F3B-A9FD-F2ADDF29D9E8@gmail.com>
In-Reply-To: <AD2F1750-F579-4F3B-A9FD-F2ADDF29D9E8@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Sep 2022 10:47:58 +0100
Message-ID: <CAFEAcA9wHy8GNH_yWkZycdZZ4KxzDdTA=YP6zmHGsRC1gk=CUw@mail.gmail.com>
Subject: Re: [PATCH 0/9] Deprecate sysbus_get_default() and
 get_system_memory() et. al
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Magnus Damm <magnus.damm@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Bandan Das <bsd@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, Sergio Lopez <slp@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Cameron Esfahani <dirty@apple.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, 
 Jagannathan Raman <jag.raman@oracle.com>, Greg Kurz <groug@kaod.org>, 
 Kamil Rytarowski <kamil@netbsd.org>, Peter Xu <peterx@redhat.com>,
 Joel Stanley <joel@jms.id.au>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com, 
 Roman Bolshakov <r.bolshakov@yadro.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Helge Deller <deller@gmx.de>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-riscv@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Paul Durrant <paul@xen.org>, Havard Skinnemoen <hskinnemoen@google.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>, 
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-s390x@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, 
 Reinoud Zandijk <reinoud@netbsd.org>, Alexander Bulekov <alxndr@bu.edu>,
 Yanan Wang <wangyanan55@huawei.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Tyrone Ting <kfting@nuvoton.com>, xen-devel@lists.xenproject.org, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, 
 kvm@vger.kernel.org, Qiuhao Li <Qiuhao.Li@outlook.com>, 
 John G Johnson <john.g.johnson@oracle.com>, Bin Meng <bin.meng@windriver.com>, 
 Sunil Muthuswamy <sunilmut@microsoft.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, 
 Andrew Jeffery <andrew@aj.id.au>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>, 
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Jason Wang <jasowang@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 Alistair Francis <alistair@alistair23.me>, Jason Herne <jjherne@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Sept 2022 at 23:50, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Am 20. September 2022 09:55:37 UTC schrieb Peter Maydell <peter.maydell@l=
inaro.org>:
> >On Tue, 20 Sept 2022 at 00:18, Bernhard Beschow <shentey@gmail.com> wrot=
e:
> >>
> >> In address-spaces.h it can be read that get_system_memory() and
> >> get_system_io() are temporary interfaces which "should only be used te=
mporarily
> >> until a proper bus interface is available". This statement certainly e=
xtends to
> >> the address_space_memory and address_space_io singletons.
> >
> >This is a long standing "we never really completed a cleanup"...
> >
> >> This series attempts
> >> to stop further proliferation of their use by turning TYPE_SYSTEM_BUS =
into an
> >> object-oriented, "proper bus interface" inspired by PCIBus.
> >>
> >> While at it, also the main_system_bus singleton is turned into an attr=
ibute of
> >> MachineState. Together, this resolves five singletons in total, making=
 the
> >> ownership relations much more obvious which helps comprehension.
> >
> >...but I don't think this is the direction we want to go.
> >Overall the reason that the "system memory" and "system IO"
> >singletons are weird is that in theory they should not be necessary
> >at all -- board code should create devices and map them into an
> >entirely arbitrary MemoryRegion or set of MemoryRegions corresponding
> >to address space(s) for the CPU and for DMA-capable devices.
>
> My intention was to allow exactly that: By turning sytem memory and syste=
m IO into non-singletons, one could have many of them, thus allowing boards=
 to create arbitrary mappings of memory and IO. Since QEMU currently assume=
s one set (memory and IO) of addresses, I for now instantiated the SysBus o=
nce in the machine class to preserve behavior.

You can already create arbitrary mappings of memory and IO
(look at the virt board for an example). The existence of the
legacy singleton system-memory and system-io doesn't prevent that,
and stuffing the singletons into the MachineState doesn't do
anything to change the code that is relying on the singletons.

> >Retaining the whole-system singleton but shoving it into MachineState
> >doesn't really change much, IMHO.
> >
> >More generally, sysbus is rather weird because it isn't really a
> >bus. Every device in the system of TYPE_SYS_BUS_DEVICE is "on"
> >the unique TYPE_SYSTEM_BUS bus, but that doesn't mean they're
> >all in the same address space or that in real hardware they'd
> >all be on the same bus.
>
> Again, having multiple SysBuses may solve that issue.

We definitely don't want multiple sysbuses.

thanks
-- PMM

