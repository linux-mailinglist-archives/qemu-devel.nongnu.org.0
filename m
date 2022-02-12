Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6294B35BC
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 15:56:53 +0100 (CET)
Received: from localhost ([::1]:58286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nItpU-0003z4-8d
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 09:56:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfb1998@web.de>) id 1nIt01-0000FS-SA
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 09:03:42 -0500
Received: from mout.web.de ([212.227.15.14]:57901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfb1998@web.de>) id 1nIt00-0000fF-5N
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 09:03:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1644674530;
 bh=3ukiLpHigg0O1F5pYnnsNgjKBMGsFb5rfF3y1lLfIjo=;
 h=X-UI-Sender-Class:Date:From:To:CC:Subject:In-Reply-To:References;
 b=EAi32Dfde3e2sPBW4xO+SOQyTiDxPPJ3zRz2juRGJp+eW7hoaTeeRwaOKkYArnHe7
 i+z10fUhPZoSXMWXzBnIrvnbwaTp9SonHPr12ZmR6XvXwI8Quke1QMu8WBRFqtgcfW
 L/JE6ENailuveo6rHuCwOOtxlVOgquhULKDj09Vw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [127.0.0.1] ([87.123.193.69]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MjPQ6-1o2M000JxK-00lGHP; Sat, 12
 Feb 2022 15:02:10 +0100
Date: Sat, 12 Feb 2022 15:02:07 +0100
From: BB <dfb1998@web.de>
To: BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH v2 5/5] isa/piix4: Resolve redundant i8259[] attribute
User-Agent: K-9 Mail for Android
In-Reply-To: <9a3e73e-ac7-f79-c84-ca9a8523d0d1@eik.bme.hu>
References: <20220212113519.69527-1-shentey@gmail.com>
 <20220212113519.69527-6-shentey@gmail.com>
 <9a3e73e-ac7-f79-c84-ca9a8523d0d1@eik.bme.hu>
Message-ID: <5CE499F3-7EC8-46A1-A61B-5D9507A1F5D2@web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hZfe1UqtQyWy9nEsrg8JqNwtfLYdliGnQgZZGDB3R7+Kcs+vL91
 GEAvwuKAVI/WJI8iCwqXIb2wOxZzYHR5XlxNiSDKYbFYYZNMu+gQNlFAD7l3TNzS47h3z+U
 YAZQxkKlt4eCO/7o8bghBlO6mECH/s/78Yzd8tPZ0r7C/y0ZvDGEr1A4k+9R7W7R47V4B+r
 /T7Dm5+QUb58j7Tj+jANQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bnJrseslNQg=:S4FLUWa7kwXvkVQMDHwgGX
 rZtrB1fh/DcvWP3v+UYr9T4NcXHeurZU0DUo0blbdk12Owers77F8PRi2KXwjDrkCj7y7E/2V
 xglRbrJc2phL6rWCKvMgfHTPYvBzNL5b50zxtZDnGFX2dBEl6SyFN6T+oY3PsipRtEG9uY5Ay
 POql4KeLpg9XMaN087sp6uUJtsuZWkwkDd3W5mLyEy1ruKvOQADUboUvpqAHSfxC1cZOgHA8+
 XzjrIv2bpAIj+1fQdTIVz3XHrVlS3s+rcrtjxCwC247Oc/C0eNHQIBeiSqLCZ99UgHsdbRuXF
 p02okn2+vPseBhihwlKCfnCnsUlAMYV0Ltee1VvXkB1tCfq86Bqh9epf5qPskx8xXetTQxR2T
 qCZTo3h9N7S0fo8oEFmeFMCeR9h5ndPqcMJ1iYQIU05TqdvO21KkMaN5bGF9OvQzGSZFhp/tc
 A8zIRkBFpVxlBc5CJzrqcz2a/kQKjQglervXoTXo39GdKSDG3FUBu1bu9yH9LUZ27XMkQi1SV
 9XHpX5CQm1z0FCx9sBDGPADGNYN8ee05eN3RSrMUvzlxyqYioHo/7AExwL9NYYsIAd9W1bN/M
 wymxxeenPxa0xnLBM56RnKSD0eBste6Dh5ykQIQHhB35OddDESnv0R75HmwnvNLAfNWqQSLXA
 S69l4O1jKN3lRjBELxOrPXmGOx5bn9JPHfCfPxqn4R+mY3iRe1ZPYjAPq/p5FiVB69EQc67ZW
 eQbXGETc5n/ctrViUumQaUs3gIQ+4V8myz1DX7MsPMsaSP2gqIZETHVE9DKhde840gNUqhSVo
 cqtG96M7tKBFiysNGKgQbv4I+nf6IlOffnAlprH4pT23/KqINFKotj+5NNdxpal0ubAaYeqkB
 S9SD23X1fyg0L9Ig95zZpvJGwp0Rw8FBQNPLOqYdZWyeUzFj1uX9hnzKgoMuL3JFFXCyF1na7
 xBWPsTTnxmnHzTgmwC9UHn2cmDwyfadB6eCUZtxRdag6zPmALcrcXdu/NN+7MlyyBcS/zh5Wd
 6jZ1tVxjGXLNGASg8b3LKtzfExHZ1PW94ApQPe/SBzOERZpBIkdf1XLWbC4Ddwmlx1tvkY57/
 H9opoqTIdHV3B4=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=dfb1998@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 12 Feb 2022 09:49:47 -0500
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
Cc: =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 12=2E Februar 2022 14:19:51 MEZ schrieb BALATON Zoltan <balaton@eik=2Eb=
me=2Ehu>:
>On Sat, 12 Feb 2022, Bernhard Beschow wrote:
>> This is a follow-up on patch "malta: Move PCI interrupt handling from
>> gt64xxx to piix4" where i8259[] was moved from MaltaState to PIIX4State
>> to make the code movement more obvious=2E However, i8259[] seems redund=
ant
>> to *isa, so remove it=2E
>
>Should this be squashed in patch 1 or at least come after it? Or are ther=
e=20
>some other changes needed before this patch?

I didn't want to change the patch order since they've been reviewed alread=
y=2E But yeah, you're right: It makes sense to get this out of the way earl=
y in the patch series=2E I will do a v3=2E

Regards,
Bernhard

>
>Regards,
>BALATON Zoltan
>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>> hw/isa/piix4=2Ec | 7 +------
>> 1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/hw/isa/piix4=2Ec b/hw/isa/piix4=2Ec
>> index a9322851db=2E=2E692fa8d1f9 100644
>> --- a/hw/isa/piix4=2Ec
>> +++ b/hw/isa/piix4=2Ec
>> @@ -43,7 +43,6 @@ struct PIIX4State {
>>     PCIDevice dev;
>>     qemu_irq cpu_intr;
>>     qemu_irq *isa;
>> -    qemu_irq i8259[ISA_NUM_IRQS];
>>
>>     int32_t pci_irq_levels[PIIX_NUM_PIRQS];
>>
>> @@ -73,7 +72,7 @@ static void piix4_set_irq(void *opaque, int irq_num, =
int level)
>>                 pic_level |=3D s->pci_irq_levels[i];
>>             }
>>         }
>> -        qemu_set_irq(s->i8259[pic_irq], pic_level);
>> +        qemu_set_irq(s->isa[pic_irq], pic_level);
>>     }
>> }
>>
>> @@ -323,9 +322,5 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus *=
*isa_bus, I2CBus **smbus)
>>
>>     pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM=
_PIRQS);
>>
>> -    for (int i =3D 0; i < ISA_NUM_IRQS; i++) {
>> -        s->i8259[i] =3D qdev_get_gpio_in_named(dev, "isa", i);
>> -    }
>> -
>>     return dev;
>> }
>>

