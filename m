Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ACF17DF36
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 12:59:41 +0100 (CET)
Received: from localhost ([::1]:41562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBH4O-0000fT-Fn
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 07:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53547)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBH3O-00087I-ER
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 07:58:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBH3N-0004IW-6a
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 07:58:38 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:40077)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBH3F-0004Bj-PN; Mon, 09 Mar 2020 07:58:30 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MkYkC-1jcJJt0bwE-00m51N; Mon, 09 Mar 2020 12:57:39 +0100
Subject: Re: [PATCH 00/20] hw: Clean up hw/i386 headers (and few alpha/hppa)
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20191014142246.4538-1-philmd@redhat.com>
 <dacba192-0a1e-9801-3e6f-02583bd8b994@redhat.com>
 <fe8ef9e8-d8d2-e92c-cde3-13a11fa1a5bf@vivier.eu>
 <18164a90-1ad2-28d1-f6e2-cc7741532f72@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <03b48649-0a19-80fd-88d2-6241e284f7af@vivier.eu>
Date: Mon, 9 Mar 2020 12:57:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <18164a90-1ad2-28d1-f6e2-cc7741532f72@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hw0IUu3amw8TetNO1ivmES2MS1pUP6jUBz/1S57ei78TgyBpZu5
 BybeLBWx2rLDxktiNDNlAbNbCFCWWHORTuzm08z9R1s4GvklfvRu/KnIAOSxRHc/WNH6xRV
 SGQUfob/nimb+IvN6H9VJ+dWYp42uKtz+5+G+pNyHnYOtDs0THWLmHlx2g/rSbbjmvwK2RZ
 dpXdH7XKDoySSv7ikwQhw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QBn88ySfXdg=:+TDsBMIs+q38J4/rwQ+WFk
 Jq7YhVun69Y0ym2zCri/WxN0LmtO+0HXgwrEz3CbFub/lP2vdxzYCMEl+prybIxUvFbc77lX5
 08LSScHDyBvDmiYm8t+y6B8gsm1WRKEQaU0gPdv2L+g4UZfizxhmxxN0o1aOpLHw45n2IILid
 FvLZkFtYDx3z6RqXH1g5ATvKKsTtqBs9ZbTUAYoKaNC63ibDF5Cxv/7ndG+E1VZWmiHhECNb4
 ZOtVwLCHHXrSUZSi/UA+FdUz70BX0CF5sHuvph/iWM1AGME+QBaXCca4eYyWCgUvvWFnQW3Q8
 6/L0JuWrsxigbG9bypnfKrl8UrLTMKEYLbl8+2zUDySKYA2FpeZCFfafRnLYcW1wFSu0vgQst
 LOeB9dgJfitEa9r/WwZczgEAki+ldc2KfWvNidBg0+HyEZLWYZ8KTu0ARTKbXOLyD/rfSZONE
 46UKdV7ondDpYnAUQBj33k0cZFnpPFBq+pUPCUvqdgLPLKaIVbA9iHcFdd0uJyYnHXvS1wVNY
 zro0Zex1Gipl9km4IDZ0lm1SffzDW1rDGydTG1j3rAl8e57kegIvo9lLwaeIQ7+/H70MQFeN7
 YW8FGOzMjNr/1czdYsyMjf+6OwtvRG+CNsIDMAZ2E5tcrIET5LoYtNj6V6lNTaKpWpnfAduQA
 OqNl5bzPuworqIhuphLaO99ephIbU0g9TG9hOES9DZ7LjD4J3p1UQ/LMkqf9Tu/uDwBsmURUY
 LGDmlIaENf3Ub+y9mwwAafGvNLNy4aUpXjVkKGz1F6SvXQs8u6azx/ZqeAPkcH2NYI05aRIE3
 aSzZppTSC0VQZbgW5DdgxS5hlIKiObonK09rcKS8ZhTFwjI/o+3hT7VnoM3YWgxxGpLKRmE
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Helge Deller <deller@gmx.de>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/02/2020 à 14:28, Paolo Bonzini a écrit :
> On 26/10/19 15:32, Laurent Vivier wrote:
>> Le 26/10/2019 à 14:20, Philippe Mathieu-Daudé a écrit :
>>> Hi,
>>>
>>> On 10/14/19 4:22 PM, Philippe Mathieu-Daudé wrote:
>>>> This is a follow-up of Markus's cleanup series:
>>>> Tame a few "touch this, recompile the world"
>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg635748.html
>>>>
>>>> This part is mostly restricted to X86, but since some file from the
>>>> Alpha/PA-RISC machines include "hw/i386/pc.h" I had to fix them
>>>> too.
>>>>
>>>> Eventually I'll succeed at removing hw/i386/ dependency on non-X86
>>>> platforms (Quest I started 2 years ago...).
>>>>
>>>> Regards,
>>>>
>>>> Phil.
>>>>
>>>> Philippe Mathieu-Daudé (20):
>>>>    vl: Add missing "hw/boards.h" include
>>>>    hw/southbridge/ich9: Removed unused headers
>>>>    hw/input/pckbd: Remove unused "hw/i386/pc.h" header
>>>>    hw/i386/ioapic_internal: Remove unused "hw/i386/ioapic.h" header
>>>>    hw/timer: Remove unused "ui/console.h" header
>>>>    hw/usb/dev-storage: Remove unused "ui/console.h" header
>>>>    hw/i386/intel_iommu: Remove unused includes
>>>>    hw/xen/xen_pt_load_rom: Remove unused includes
>>>>    hw/alpha/alpha_sys: Remove unused "hw/ide.h" header
>>>>    hw/alpha/dp264: Include "net/net.h"
>>>>    hw/hppa/machine: Include "net/net.h"
>>>>    hw/acpi/cpu_hotplug: Include "hw/pci/pci.h"
>>>>    hw/timer/hpet: Include "exec/address-spaces.h"
>>>>    hw/pci-host/q35: Include "qemu/range.h"
>>>>    hw/i2c/smbus_ich9: Include "qemu/range.h"
>>>>    hw/pci-host/piix: Include "qemu/range.h"
>>>>    hw/acpi: Include "hw/mem/nvdimm.h"
>>>>    hw/i386: Include "hw/mem/nvdimm.h"
>>>>    hw/pci-host/q35: Remove unused includes
>>>>    hw/i386/pc: Clean up includes
>>> Laurent, since this series is fully reviewed, can it go via
>>> your qemu-trivial tree?
>>
>> I'll try but I'm not sure to have the time to do that before the softfreeze.
> 
> Ping :)

Applied v2 to my trivial-patches branch.

Thanks,
Laurent


