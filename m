Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37EA257914
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 14:16:51 +0200 (CEST)
Received: from localhost ([::1]:56348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCijz-0008Dz-2j
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 08:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kCij3-0007Mt-8b
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 08:15:53 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:41593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kCij0-0001BB-N7
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 08:15:52 -0400
Received: by mail-pg1-x543.google.com with SMTP id w186so490851pgb.8
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 05:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=/lbPX+VTYkrTPW0BhUh8B/5Fsm+CZq7hUNV9YHvvhho=;
 b=kG3O8zXtDdg42VNocZFN8okWFH95+XtRoDaklYXS2eMN/4LlAb4F2BmKdh8pDUckBG
 KFF0Wu2B7hyjX6DswhLuw4mndiEgWY92A/OUMN8F+lcqzQL2693xgz38fGQkZGDyeda7
 gaPd7irZhc7+H7WnPGOxW0t9FezN0I1BHtF6/Ppm54kfIGunavED6DLF1fovCpgPDqh5
 Kti0CEXmQZniZuMBpUGnVX68o+ORzeuxUakkPaCXyBVBdwMLLXPhYMk8zxaqv1yFdnMW
 1WqzdfJNwCrgUxt7Tf4f9Hiw7t4gVZE8JFSc3gjqLpMzmBVOAh9pxY91NY9UKttFktpy
 tu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=/lbPX+VTYkrTPW0BhUh8B/5Fsm+CZq7hUNV9YHvvhho=;
 b=L2s1eTho4y8KOa6OKzpe9DgFZHTqE8uXU4hk85favTsyCJVJxEBSnO7jzEr26B5WSh
 PFgByjCmETz/efja7yYL1OldZDp7oGO5Gj6kB/OJF4a9hwdaTng/wZL315xwuXDNiuFj
 zRuWvXNazH7pMcgl0F/xz01e5zUuUrkLkyEbZTxwmty4JnUnxQtWXndVlfQUkv3RvQpl
 PS4Q/6cq2VRdvJY3YOzdl5AMkIIe1Jr4CywdprZ+6CcjSRumy/MxdAeLt6VwcC/2OU0v
 p3XD/XVAzFvgS92o5tIvfgOqt7bEeQ2hDJTpgkCa7zu57/WEbv00gOj97q2ovOdJ9FKr
 VCdA==
X-Gm-Message-State: AOAM531lCz2tI5h3nHZOwgoVcJnoGACCr3AA6dkcCKyBfaM0zi2mGd+f
 6Oo6vb3TzBZjT2jXTgBVWcnCbwGSZk5Q0Q==
X-Google-Smtp-Source: ABdhPJxs5CPPReERU2Ze/fQd6jMqO8jNWmyb5K9QjcoKj7ad3IjXlJXVdr8I7An2MiL5U6Uoz9DO2Q==
X-Received: by 2002:aa7:943a:: with SMTP id y26mr1054989pfo.244.1598876147703; 
 Mon, 31 Aug 2020 05:15:47 -0700 (PDT)
Received: from [192.168.1.3] ([115.96.145.90])
 by smtp.gmail.com with ESMTPSA id y13sm8022857pfr.142.2020.08.31.05.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2020 05:15:46 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Ani Sinha <ani@anisinha.ca>
Mime-Version: 1.0 (1.0)
Subject: Re: [PULL 06/13] Introduce a new flag for i440fx to disable PCI
 hotplug on the root bus
Date: Mon, 31 Aug 2020 17:45:43 +0530
Message-Id: <F82E811E-1DBB-4332-9051-5D5993B5FA87@anisinha.ca>
References: <20200830055642-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200830055642-mutt-send-email-mst@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Mailer: iPad Mail (17G80)
Received-SPF: none client-ip=2607:f8b0:4864:20::543;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Aug 31, 2020, at 2:27 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
>=20
> =EF=BB=BFOn Thu, Aug 27, 2020 at 11:29:34PM +0530, Ani Sinha wrote:
>>> On Thu, Aug 27, 2020 at 11:11 PM Igor Mammedov <imammedo@redhat.com> wro=
te:
>>>=20
>>> On Thu, 27 Aug 2020 09:40:34 -0400
>>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>>=20
>>>> From: Ani Sinha <ani@anisinha.ca>
>>>>=20
>>>> We introduce a new global flag 'acpi-root-pci-hotplug' for i440fx with w=
hich
>>>> we can turn on or off PCI device hotplug on the root bus. This flag can=
 be
>>>> used to prevent all PCI devices from getting hotplugged or unplugged fr=
om the
>>>> root PCI bus.
>>>> This feature is targetted mostly towards Windows VMs. It is useful in c=
ases
>>>> where some hypervisor admins want to deploy guest VMs in a way so that t=
he
>>>> users of the guest OSes are not able to hot-eject certain PCI devices f=
rom
>>>> the Windows system tray. Laine has explained the use case here in detai=
l:
>>>> https://www.redhat.com/archives/libvir-list/2020-February/msg00110.html=

>>>>=20
>>>> Julia has resolved this issue for PCIE buses with the following commit:=

>>>> 530a0963184e57e71a5b538 ("pcie_root_port: Add hotplug disabling option"=
)
>>>>=20
>>>> This commit attempts to introduce similar behavior for PCI root buses u=
sed in
>>>> i440fx machine types (although in this case, we do not have a per-slot
>>>> capability to turn hotplug on or off).
>>>>=20
>>>> Usage:
>>>>   -global PIIX4_PM.acpi-root-pci-hotplug=3Doff
>>>>=20
>>>> By default, this option is enabled which means that hotplug is turned o=
n for
>>>> the PCI root bus.
>>>>=20
>>>> The previously existing flag 'acpi-pci-hotplug-with-bridge-support' for=
 PCI-PCI
>>>> bridges remain as is and can be used along with this new flag to contro=
l PCI
>>>> hotplug on PCI bridges.
>>>>=20
>>>> This change has been tested using a Windows 2012R2 server guest image a=
nd also
>>>> with a Windows 2019 server guest image on a Ubuntu 18.04 host using the=
 latest
>>>> master qemu from upstream.
>>>>=20
>>>> Signed-off-by: Ani Sinha <ani@anisinha.ca>
>>>> Message-Id: <20200821165403.26589-1-ani@anisinha.ca>
>>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>=20
>>>=20
>>>> Tested-by: Igor Mammedov <imammedo@redhat.com>
>>>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>>> A glitch in scripts?
>>> I didn't review nor tested this (v8) version
>>=20
>> oops! I am so eager to get this done and dusted :)
>=20
>=20
> One thing I would like to see is that all of these flags
> should also disable the relevant functionality.

The flag that I introduced would with this patch along with the other patch I=
 sent to address Julia's concern over ejecting root bus when bsel is absent.=


>=20
>=20
>=20
>>>=20
>>>> ---
>>>> include/hw/acpi/pcihp.h |  2 +-
>>>> hw/acpi/pcihp.c         | 23 ++++++++++++++++++++++-
>>>> hw/acpi/piix4.c         |  5 ++++-
>>>> 3 files changed, 27 insertions(+), 3 deletions(-)
>>>>=20
>>>> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
>>>> index 8bc4a4c01d..02f4665767 100644
>>>> --- a/include/hw/acpi/pcihp.h
>>>> +++ b/include/hw/acpi/pcihp.h
>>>> @@ -67,7 +67,7 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandl=
er *hotplug_dev,
>>>>                                          Error **errp);
>>>>=20
>>>> /* Called on reset */
>>>> -void acpi_pcihp_reset(AcpiPciHpState *s);
>>>> +void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off);
>>>>=20
>>>> extern const VMStateDescription vmstate_acpi_pcihp_pci_status;
>>>>=20
>>>> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
>>>> index 9e31ab2da4..39b1f74442 100644
>>>> --- a/hw/acpi/pcihp.c
>>>> +++ b/hw/acpi/pcihp.c
>>>> @@ -104,6 +104,24 @@ static void acpi_set_pci_info(void)
>>>>     }
>>>> }
>>>>=20
>>>> +static void acpi_pcihp_disable_root_bus(void)
>>>> +{
>>>> +    static bool root_hp_disabled;
>>>> +    PCIBus *bus;
>>>> +
>>>> +    if (root_hp_disabled) {
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    bus =3D find_i440fx();
>>>> +    if (bus) {
>>>> +        /* setting the hotplug handler to NULL makes the bus non-hotpl=
uggable */
>>>> +        qbus_set_hotplug_handler(BUS(bus), NULL);
>>>> +    }
>>>> +    root_hp_disabled =3D true;
>>>> +    return;
>>>> +}
>>>> +
>>>> static void acpi_pcihp_test_hotplug_bus(PCIBus *bus, void *opaque)
>>>> {
>>>>     AcpiPciHpFind *find =3D opaque;
>>>> @@ -209,8 +227,11 @@ static void acpi_pcihp_update(AcpiPciHpState *s)
>>>>     }
>>>> }
>>>>=20
>>>> -void acpi_pcihp_reset(AcpiPciHpState *s)
>>>> +void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
>>>> {
>>>> +    if (acpihp_root_off) {
>>>> +        acpi_pcihp_disable_root_bus();
>>>> +    }
>>>>     acpi_set_pci_info();
>>>>     acpi_pcihp_update(s);
>>>> }
>>>> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
>>>> index 26bac4f16c..e6163bb6ce 100644
>>>> --- a/hw/acpi/piix4.c
>>>> +++ b/hw/acpi/piix4.c
>>>> @@ -78,6 +78,7 @@ typedef struct PIIX4PMState {
>>>>=20
>>>>     AcpiPciHpState acpi_pci_hotplug;
>>>>     bool use_acpi_hotplug_bridge;
>>>> +    bool use_acpi_root_pci_hotplug;
>>>>=20
>>>>     uint8_t disable_s3;
>>>>     uint8_t disable_s4;
>>>> @@ -324,7 +325,7 @@ static void piix4_pm_reset(DeviceState *dev)
>>>>         pci_conf[0x5B] =3D 0x02;
>>>>     }
>>>>     pm_io_space_update(s);
>>>> -    acpi_pcihp_reset(&s->acpi_pci_hotplug);
>>>> +    acpi_pcihp_reset(&s->acpi_pci_hotplug, !s->use_acpi_root_pci_hotpl=
ug);
>>>> }
>>>>=20
>>>> static void piix4_pm_powerdown_req(Notifier *n, void *opaque)
>>>> @@ -635,6 +636,8 @@ static Property piix4_pm_properties[] =3D {
>>>>     DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_VAL, PIIX4PMState, s4_val, 2),
>>>>     DEFINE_PROP_BOOL("acpi-pci-hotplug-with-bridge-support", PIIX4PMSta=
te,
>>>>                      use_acpi_hotplug_bridge, true),
>>>> +    DEFINE_PROP_BOOL("acpi-root-pci-hotplug", PIIX4PMState,
>>>> +                     use_acpi_root_pci_hotplug, true),
>>>>     DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
>>>>                      acpi_memory_hotplug.is_enabled, true),
>>>>     DEFINE_PROP_END_OF_LIST(),
>>>=20
>=20

