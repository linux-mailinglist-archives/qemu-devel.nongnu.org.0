Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AAB2FCDC4
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 11:18:05 +0100 (CET)
Received: from localhost ([::1]:58084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2AYs-0006tq-Fu
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 05:18:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1l2AVM-0005vi-Dx
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:14:24 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1l2AVK-0004N4-4J
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:14:24 -0500
Received: by mail-wm1-x336.google.com with SMTP id u14so2301310wmq.4
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 02:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version:content-transfer-encoding;
 bh=EaJLcfjZW/JBdPJrNvBrbqfW6V2JteHrYvhf782uaeE=;
 b=CDfz7/N6SvvT5CGRAI/V95TxiysXnlYRzddT0p7iY0v0Vppv+1o9nXbcTknEKh+0uq
 Y4fjr5e5Y81SpdSaxwDi+amuFdRyzwlN2Ws4VDr4o8UIzQ4ycQGflqyv4oYLg35S0WDM
 fsNe5tT9bPZIHK94JMact9mcwZaMbEccq8bft/1L0kjtoATxx7IfPE21/AFmhzoZw8oL
 uR6LwuoR9an1G7C8ea/u6VdI+CT965EGszqFyum7ON1I0ibLZdzTLX7fx37yDDa97JG/
 8ABz2C27nYMtHIL728vzBevQJyOkXN38ZVvi97TIM6XDOhZWJoWjUyJGgfC7usJ5u91v
 lOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version:content-transfer-encoding;
 bh=EaJLcfjZW/JBdPJrNvBrbqfW6V2JteHrYvhf782uaeE=;
 b=pR5CnFMZCq00b5e9khNVKCj0Ae/gJn1vD9Tpv/nH2tnxF4yXIiYPIGEVL9zgKlkrm3
 DRiL7cS2tmrH/B2eCKTA4XlZPycGgylcTklzdJb/OogBJZAxDnuHQVboInxcx/ZD3/mD
 lt/7y4wMct111ARPhXt7AiiS6Hit1qeUSj08MHk02qNI6+yWn/21I7aCd4kEtj0hOhmo
 JqUjxjpDnQJU3oFk5qm6bkgBCJVaoHJymby9XfN1R6niemuVHJi0W32IR1AIAFRsZOmR
 QOW1oiTBuBIoyDb/4vvujJD2X3Rch4r8u4YfZEJPgtVoYePuJwVdXFi8IR+gbEIJ7jPn
 oEiA==
X-Gm-Message-State: AOAM5322fEwa75QPlH7MFsQP6xpB5rIeLeHdqPqAVwRlMx4opV2S+EnE
 wVby9dGHjlBB9F3ZJ4tc5MhgMin7IEZylmVgpmE=
X-Google-Smtp-Source: ABdhPJybH/9vHCM2eINC/tzT0q5JL+gziBTl/uTFBl3O8EiCzGRIOu19UKxe1MMJCXKc+VVG3z5TxA==
X-Received: by 2002:a1c:790f:: with SMTP id l15mr3648357wme.188.1611137659273; 
 Wed, 20 Jan 2021 02:14:19 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id q2sm3061182wma.6.2021.01.20.02.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 02:14:18 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 64febf44;
 Wed, 20 Jan 2021 10:14:18 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-devel@nongnu.org, Haibin Zhang
 <haibinzhang@tencent.com>
Subject: Re: [PATCH] pci: add romsize property
In-Reply-To: <b9b7e55a-0f90-6680-8e15-992997afdd38@redhat.com>
References: <20201218182736.1634344-1-pbonzini@redhat.com>
 <b9b7e55a-0f90-6680-8e15-992997afdd38@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
X-Now-Playing: Four Tet - Sixteen Oceans: Something in the Sadness
Date: Wed, 20 Jan 2021 10:14:18 +0000
Message-ID: <cun1ref9apx.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2a00:1450:4864:20::336;
 envelope-from=dme@dme.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 dgilbert@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2021-01-19 at 17:51:32 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> +pflash
>
> On 12/18/20 7:27 PM, Paolo Bonzini wrote:
>> This property can be useful for distros to set up known-good ROM sizes f=
or
>> migration purposes.  The VM will fail to start if the ROM is too large,
>> and migration compatibility will not be broken if the ROM is too small.
>>=20
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  hw/pci/pci.c             | 19 +++++++++++++++++--
>>  hw/xen/xen_pt_load_rom.c | 14 ++++++++++++--
>>  include/hw/pci/pci.h     |  1 +
>>  3 files changed, 30 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index d4349ea577..fd25253c2a 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -67,6 +67,7 @@ static void pcibus_reset(BusState *qbus);
>>  static Property pci_props[] =3D {
>>      DEFINE_PROP_PCI_DEVFN("addr", PCIDevice, devfn, -1),
>>      DEFINE_PROP_STRING("romfile", PCIDevice, romfile),
>> +    DEFINE_PROP_UINT32("romsize", PCIDevice, romsize, -1),
>>      DEFINE_PROP_UINT32("rombar",  PCIDevice, rom_bar, 1),
>>      DEFINE_PROP_BIT("multifunction", PCIDevice, cap_present,
>>                      QEMU_PCI_CAP_MULTIFUNCTION_BITNR, false),
>> @@ -2106,6 +2107,11 @@ static void pci_qdev_realize(DeviceState *qdev, E=
rror **errp)
>>      bool is_default_rom;
>>      uint16_t class_id;
>>=20=20
>> +    if (pci_dev->romsize !=3D -1 && !is_power_of_2(pci_dev->romsize)) {
>> +        error_setg(errp, "ROM size %d is not a power of two", pci_dev->=
romsize);
>> +        return;
>> +    }
>
> Some cloud providers already complained the pow2 check in the pflash
> device (wasting host storage). Personally I find using pow2 easier
> and safer.
>
> The pow2 check looks like a separate change however, maybe add in a
> separate patch? Or maybe not :)

Even for flash, padding a read-only device seems straightforward.

For a writable device, is it assumed that a write into the padding
should extend the file?

(I realise that this patch is just for the ROM.)

dme.
--=20
You bring light in.

