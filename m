Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8285E2F9A9D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 08:35:44 +0100 (CET)
Received: from localhost ([::1]:54746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1P4h-0000sd-Bo
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 02:35:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1P2l-0000Ie-RI; Mon, 18 Jan 2021 02:33:43 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:37749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1P2j-0005Zy-VM; Mon, 18 Jan 2021 02:33:43 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M26n9-1l3Jmc1BBx-002TXw; Mon, 18 Jan 2021 08:33:23 +0100
Subject: Re: [PATCH 00/18] hw: Mark the device with no migratable fields
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20200703201911.26573-1-f4bug@amsat.org>
 <CAFEAcA8Cu2N5qX55rUk_yd4R6PdJX+X5KPQmMiQPFakP3ShZ-A@mail.gmail.com>
 <17a5ddc4-c7d9-08f3-5260-f17e1bd48dac@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d0eb49ce-b94a-7b5f-c616-eb461e2f73b7@vivier.eu>
Date: Mon, 18 Jan 2021 08:33:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <17a5ddc4-c7d9-08f3-5260-f17e1bd48dac@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+rZug63ri5WgwqYSq/LsOnwykK/CVUE7Hioh0xluSxDPE1rIqRx
 uu3Z7GUCCt6aPsWSp2BVbJS/N9HQRs+dx7ZY4npajdCBlSZ/QT/GuxUCsjduMMkjcYahCx6
 6Td8XyOsn4Ifn6xHyLT3DRZtkzLFwV2H1vuvcrQ1m7gKKVbTAKrMA8/W3Bah6r+1DpVPKrs
 6GccAfHttiZzQzt83KU1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:efXCHmsUCME=:u0Lt6ROW8eFB5ESjXxD83V
 Wri+LsZ5MA5+lL5YNDxoQFF/dARCfF9k7VL0t+9JX4KTcWUEoAJ7xzIBzH4liKxUS7Q/gsVl1
 MhkNQ2wcO8f3yIZ2GbWX0728sOHZiplRhT+f5HLWwaUmmEPdkqmRhrdvIpvsthGk6WTpbw2Y8
 E+dBAnxwFAdysdlKicP7zaWljytDgb+dOD1lxxXqDLr+SDt3O/9GrFOAilGTbfBphFN0+thfw
 XMbYyU1m4aOabVSS01bLTFv+0DkkFTm/oeuXoBLsZb057kXHN78fHZBuhjiUFbKN0rYHZdqSq
 W5DPTgto+3Jiw0lawn/keed+JVzSwJvM98xAWaNISKsjm86lMtH5lOcDps2Jz4aTKj0fA/iha
 lpEjNd0S+Mw0Y2u7Q9h/EBiXsbL5UYhg1e3CuidZ4ZOUB+Ey71cFajuDeoW+p
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.252,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/01/2021 à 16:49, Philippe Mathieu-Daudé a écrit :
> On 7/9/20 9:19 PM, Peter Maydell wrote:
>> On Fri, 3 Jul 2020 at 21:19, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>> This is a proof-of-concept after chatting with Peter Maydell
>>> on IRC earlier.
>>>
>>> Introduce the vmstate_no_state_to_migrate structure, and
>>> a reference to it: vmstate_qdev_no_state_to_migrate.
>>> Use this reference in devices with no fields to migrate.
>>>
>>> This is useful to catch devices missing vmstate, such:
>>> - ads7846
>>> - mcf-uart
>>> - mcf-fec
>>> - versatile_i2c
>>> - ...
>>>
>>> I am not sure about:
>>> - gpex-pcihost
>>
>> I think it's correct that this has no internal state:
>> the only interesting state is in the GPEXRootState, which
>> is a TYPE_GPEX_ROOT_DEVICE which migrates itself.
>>
>> I made some comments on the "meaty" bits of the patchset,
>> and reviewed one or two of the "mark this device as
>> having no migration state" patches, but it doesn't seem
>> worth reviewing all of them until the migration submaintainers
>> have a chance to weigh in on whether they like the concept
>> (I expect they're busy right now with freeze-related stuff :-))
> 
> Now that we are far from freeze-date is a good time to ping
> again on this concept :)
> 
> Most of the devices are ARM except:
> - cpu-cluster (Eduardo/Marcel)
> - hcd-ohci (Gerd)
> - mac-nubus-bridge (Laurent)
> - generic QOM (Daniel, Paolo)
> 
> Is someone against this proposal?

I'm not against the proposal, but I don't understand why we need this.

Thanks,
Laurent

