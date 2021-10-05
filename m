Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7018D42209B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 10:22:36 +0200 (CEST)
Received: from localhost ([::1]:43772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXfid-0007BM-HD
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 04:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXfat-0004c1-3A
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:14:35 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:54343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXfap-0000p7-2x
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:14:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.6])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0D5EE2079A;
 Tue,  5 Oct 2021 08:14:26 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 5 Oct
 2021 10:14:25 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0017c5d72a0-ccc7-4a87-a8fa-4f25dcbbbea2,
 C56B09F7ACDDDC2AE9D52F72C0F42EB3CB79DF66) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5e4f78ce-1508-5689-ec29-79edad0c824e@kaod.org>
Date: Tue, 5 Oct 2021 10:14:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, David Gibson <david@gibson.dropbear.id.au>,
 Thomas Huth <thuth@redhat.com>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a6ed2a5e-8138-42e8-a47f-873f2c4a30c6
X-Ovh-Tracer-Id: 676102897621568327
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudelgedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekkeefheefvdefhefgjeelveekheeileehudevkeefvdfhleetiedvffdtudeknecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, dbarboza@redhat.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@csgraf.de>,
 qemu-ppc <qemu-ppc@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/5/21 08:18, Alexey Kardashevskiy wrote:
> 
> 
> On 05/10/2021 15:44, Christophe Leroy wrote:
>>
>>
>> Le 05/10/2021 à 02:48, David Gibson a écrit :
>>> On Fri, Oct 01, 2021 at 04:18:49PM +0200, Thomas Huth wrote:
>>>> On 01/10/2021 15.04, Christophe Leroy wrote:
>>>>>
>>>>>
>>>>> Le 01/10/2021 à 14:04, Thomas Huth a écrit :
>>>>>> On 01/10/2021 13.12, Peter Maydell wrote:
>>>>>>> On Fri, 1 Oct 2021 at 10:43, Thomas Huth <thuth@redhat.com> wrote:
>>>>>>>> Nevertheless, as long as nobody has a hint where to find that
>>>>>>>> ppc405_rom.bin, I think both boards are pretty useless in QEMU (as far as I
>>>>>>>> can see, they do not work without the bios at all, so it's
>>>>>>>> also not possible
>>>>>>>> to use a Linux image with the "-kernel" CLI option directly).
>>>>>>>
>>>>>>> It is at least in theory possible to run bare-metal code on
>>>>>>> either board, by passing either a pflash or a bios argument.
>>>>>>
>>>>>> True. I did some more research, and seems like there was once
>>>>>> support for those boards in u-boot, but it got removed there a
>>>>>> couple of years ago already:
>>>>>>
>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdf
>>>>>>
>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/b147ff2f37d5b
>>>>>>
>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/7514037bcdc37
>>>>>>
>>>>>>> But I agree that there seem to be no signs of anybody actually
>>>>>>> successfully using these boards for anything, so we should
>>>>>>> deprecate-and-delete them.
>>>>>>
>>>>>> Yes, let's mark them as deprecated now ... if someone still uses
>>>>>> them and speaks up, we can still revert the deprecation again.
>>>>>
>>>>> I really would like to be able to use them to validate Linux Kernel
>>>>> changes, hence looking for that missing BIOS.
>>>>>
>>>>> If we remove ppc405 from QEMU, we won't be able to do any regression
>>>>> tests of Linux Kernel on those processors.
>>>>
>>>> If you/someone managed to compile an old version of u-boot for one of these
>>>> two boards, so that we would finally have something for regression testing,
>>>> we can of course also keep the boards in QEMU...
>>>
>>> I can see that it would be usefor for some cases, but unless someone
>>> volunteers to track down the necessary firmware and look after it, I
>>> think we do need to deprecate it - I certainly don't have the capacity
>>> to look into this.
>>>
>>
>> I will look at it, please allow me a few weeks though.
> 
> Well, building it was not hard but now I'd like to know what board QEMU actually emulates, there are way too many codenames and PVRs.

yes. We should try to reduce the list below. Deprecating embedded machines
is one way.

C.


$ ./install/bin/qemu-system-ppc -cpu ?
PowerPC 601_v0           PVR 00010001
PowerPC 601_v1           PVR 00010001
PowerPC 601_v2           PVR 00010002
PowerPC 601              (alias for 601_v2)
PowerPC 601v             (alias for 601_v2)
PowerPC 603              PVR 00030100
PowerPC mpc8240          (alias for 603)
PowerPC vanilla          (alias for 603)
PowerPC 604              PVR 00040103
PowerPC ppc32            (alias for 604)
PowerPC ppc              (alias for 604)
PowerPC default          (alias for 604)
PowerPC 602              PVR 00050100
PowerPC 603e_v1.1        PVR 00060101
PowerPC 603e_v1.2        PVR 00060102
PowerPC 603e_v1.3        PVR 00060103
PowerPC 603e_v1.4        PVR 00060104
PowerPC 603e_v2.2        PVR 00060202
PowerPC 603e_v3          PVR 00060300
PowerPC 603e_v4          PVR 00060400
PowerPC 603e_v4.1        PVR 00060401
PowerPC 603e             (alias for 603e_v4.1)
PowerPC stretch          (alias for 603e_v4.1)
PowerPC 603p             PVR 00070000
PowerPC 603e7v           PVR 00070100
PowerPC vaillant         (alias for 603e7v)
PowerPC 603e7v1          PVR 00070101
PowerPC 603e7            PVR 00070200
PowerPC 603e7v2          PVR 00070201
PowerPC 603e7t           PVR 00071201
PowerPC 603r             (alias for 603e7t)
PowerPC goldeneye        (alias for 603e7t)
PowerPC 740_v1.0         PVR 00080100
PowerPC 740e             PVR 00080100
PowerPC 750_v1.0         PVR 00080100
PowerPC 750_v2.0         PVR 00080200
PowerPC 740_v2.0         PVR 00080200
PowerPC 750e             PVR 00080200
PowerPC 750_v2.1         PVR 00080201
PowerPC 740_v2.1         PVR 00080201
PowerPC 750_v2.2         PVR 00080202
PowerPC 740_v2.2         PVR 00080202
PowerPC 750_v3.0         PVR 00080300
PowerPC 740_v3.0         PVR 00080300
PowerPC 750_v3.1         PVR 00080301
PowerPC 750              (alias for 750_v3.1)
PowerPC typhoon          (alias for 750_v3.1)
PowerPC g3               (alias for 750_v3.1)
PowerPC 740_v3.1         PVR 00080301
PowerPC 740              (alias for 740_v3.1)
PowerPC arthur           (alias for 740_v3.1)
PowerPC 750cx_v1.0       PVR 00082100
PowerPC 750cx_v2.0       PVR 00082200
PowerPC 750cx_v2.1       PVR 00082201
PowerPC 750cx_v2.2       PVR 00082202
PowerPC 750cx            (alias for 750cx_v2.2)
PowerPC 750cxe_v2.1      PVR 00082211
PowerPC 750cxe_v2.2      PVR 00082212
PowerPC 750cxe_v2.3      PVR 00082213
PowerPC 750cxe_v2.4      PVR 00082214
PowerPC 750cxe_v3.0      PVR 00082310
PowerPC 750cxe_v3.1      PVR 00082311
PowerPC 745_v1.0         PVR 00083100
PowerPC 755_v1.0         PVR 00083100
PowerPC 755_v1.1         PVR 00083101
PowerPC 745_v1.1         PVR 00083101
PowerPC 755_v2.0         PVR 00083200
PowerPC 745_v2.0         PVR 00083200
PowerPC 755_v2.1         PVR 00083201
PowerPC 745_v2.1         PVR 00083201
PowerPC 755_v2.2         PVR 00083202
PowerPC 745_v2.2         PVR 00083202
PowerPC 755_v2.3         PVR 00083203
PowerPC 745_v2.3         PVR 00083203
PowerPC 755_v2.4         PVR 00083204
PowerPC 745_v2.4         PVR 00083204
PowerPC 755_v2.5         PVR 00083205
PowerPC 745_v2.5         PVR 00083205
PowerPC 755_v2.6         PVR 00083206
PowerPC 745_v2.6         PVR 00083206
PowerPC 755_v2.7         PVR 00083207
PowerPC 745_v2.7         PVR 00083207
PowerPC 745_v2.8         PVR 00083208
PowerPC 745              (alias for 745_v2.8)
PowerPC 755_v2.8         PVR 00083208
PowerPC 755              (alias for 755_v2.8)
PowerPC goldfinger       (alias for 755_v2.8)
PowerPC 750cxe_v2.4b     PVR 00083214
PowerPC 750cxe_v3.1b     PVR 00083311
PowerPC 750cxe           (alias for 750cxe_v3.1b)
PowerPC 750cxr           PVR 00083410
PowerPC 750cl_v1.0       PVR 00087200
PowerPC 750cl_v2.0       PVR 00087210
PowerPC 750cl            (alias for 750cl_v2.0)
PowerPC 750l_v2.0        PVR 00088200
PowerPC 750l_v2.1        PVR 00088201
PowerPC 750l_v2.2        PVR 00088202
PowerPC 750l_v3.0        PVR 00088300
PowerPC 750l_v3.2        PVR 00088302
PowerPC 750l             (alias for 750l_v3.2)
PowerPC lonestar         (alias for 750l_v3.2)
PowerPC 604e_v1.0        PVR 00090100
PowerPC 604e_v2.2        PVR 00090202
PowerPC 604e_v2.4        PVR 00090204
PowerPC 604e             (alias for 604e_v2.4)
PowerPC sirocco          (alias for 604e_v2.4)
PowerPC 604r             PVR 000a0101
PowerPC mach5            (alias for 604r)
PowerPC 7400_v1.0        PVR 000c0100
PowerPC 7400_v1.1        PVR 000c0101
PowerPC 7400_v2.0        PVR 000c0200
PowerPC 7400_v2.1        PVR 000c0201
PowerPC 7400_v2.2        PVR 000c0202
PowerPC 7400_v2.6        PVR 000c0206
PowerPC 7400_v2.7        PVR 000c0207
PowerPC 7400_v2.8        PVR 000c0208
PowerPC 7400_v2.9        PVR 000c0209
PowerPC 7400             (alias for 7400_v2.9)
PowerPC max              (alias for 7400_v2.9)
PowerPC g4               (alias for 7400_v2.9)
PowerPC 403ga            PVR 00200011
PowerPC 403gb            PVR 00200100
PowerPC 403gc            PVR 00200200
PowerPC 403              (alias for 403gc)
PowerPC 403gcx           PVR 00201400
PowerPC 401a1            PVR 00210000
PowerPC 401b2            PVR 00220000
PowerPC iop480           PVR 00220000
PowerPC 401c2            PVR 00230000
PowerPC 401d2            PVR 00240000
PowerPC 401e2            PVR 00250000
PowerPC 401f2            PVR 00260000
PowerPC 401g2            PVR 00270000
PowerPC 401              PVR 00270000
PowerPC g2               PVR 00810011
PowerPC mpc603           PVR 00810100
PowerPC g2hip3           PVR 00810101
PowerPC mpc8250_hip3     (alias for g2hip3)
PowerPC mpc8255_hip3     (alias for g2hip3)
PowerPC mpc8260_hip3     (alias for g2hip3)
PowerPC mpc8264_hip3     (alias for g2hip3)
PowerPC mpc8265_hip3     (alias for g2hip3)
PowerPC mpc8266_hip3     (alias for g2hip3)
PowerPC mpc8343          PVR 00830010
PowerPC mpc8349a         PVR 00830010
PowerPC mpc8347at        PVR 00830010
PowerPC mpc8347a         (alias for mpc8347at)
PowerPC e300c1           PVR 00830010
PowerPC mpc8343ea        PVR 00830010
PowerPC mpc8349e         PVR 00830010
PowerPC mpc8347ep        PVR 00830010
PowerPC mpc8347p         PVR 00830010
PowerPC mpc8347eap       PVR 00830010
PowerPC mpc8349          PVR 00830010
PowerPC mpc8347et        PVR 00830010
PowerPC mpc8347e         (alias for mpc8347et)
PowerPC mpc8347t         PVR 00830010
PowerPC mpc8347          (alias for mpc8347t)
PowerPC mpc8343a         PVR 00830010
PowerPC mpc8347eat       PVR 00830010
PowerPC mpc8347ea        (alias for mpc8347eat)
PowerPC mpc8347ap        PVR 00830010
PowerPC mpc8349ea        PVR 00830010
PowerPC mpc8343e         PVR 00830010
PowerPC e300c2           PVR 00840010
PowerPC e300c3           PVR 00850010
PowerPC e300             (alias for e300c3)
PowerPC mpc8379e         PVR 00860010
PowerPC e300c4           PVR 00860010
PowerPC mpc8377e         PVR 00860010
PowerPC mpc8377          PVR 00860010
PowerPC mpc8378          PVR 00860010
PowerPC mpc8379          PVR 00860010
PowerPC mpc8378e         PVR 00860010
PowerPC 740p             PVR 10080000
PowerPC 750p             PVR 10080000
PowerPC conan/doyle      (alias for 750p)
PowerPC cobra            PVR 10100000
PowerPC 460exb           PVR 130218a4
PowerPC 460ex            (alias for 460exb)
PowerPC 440epx           PVR 200008d0
PowerPC 405d2            PVR 20010000
PowerPC x2vp4            PVR 20010820
PowerPC x2vp7            (alias for x2vp4)
PowerPC x2vp20           PVR 20010860
PowerPC x2vp50           (alias for x2vp20)
PowerPC 405gpa           PVR 40110000
PowerPC 405gpb           PVR 40110040
PowerPC 405cra           PVR 40110041
PowerPC 405gpc           PVR 40110082
PowerPC 405gpd           PVR 401100c4
PowerPC 405gp            (alias for 405gpd)
PowerPC 405crb           PVR 401100c5
PowerPC 405crc           PVR 40110145
PowerPC 405cr            (alias for 405crc)
PowerPC 405gpe           (alias for 405crc)
PowerPC stb03            PVR 40310000
PowerPC npe4gs3          PVR 40b10000
PowerPC npe405h          PVR 414100c0
PowerPC npe405h2         PVR 41410140
PowerPC 405ez            PVR 41511460
PowerPC npe405l          PVR 416100c0
PowerPC stb04            PVR 41810000
PowerPC 405d4            PVR 41810000
PowerPC 405              (alias for 405d4)
PowerPC 405lp            PVR 41f10000
PowerPC 440epa           PVR 42221850
PowerPC 440epb           PVR 422218d3
PowerPC 440ep            (alias for 440epb)
PowerPC 405gpr           PVR 50910951
PowerPC 405ep            PVR 51210950
PowerPC stb25            PVR 51510950
PowerPC 750fx_v1.0       PVR 70000100
PowerPC 750fx_v2.0       PVR 70000200
PowerPC 750fx_v2.1       PVR 70000201
PowerPC 750fx_v2.2       PVR 70000202
PowerPC 750fx_v2.3       PVR 70000203
PowerPC 750fx            (alias for 750fx_v2.3)
PowerPC 750fl            PVR 70000203
PowerPC 750gx_v1.0       PVR 70020100
PowerPC 750gx_v1.1       PVR 70020101
PowerPC 750gl            PVR 70020102
PowerPC 750gx_v1.2       PVR 70020102
PowerPC 750gx            (alias for 750gx_v1.2)
PowerPC 440-xilinx-w-dfpu PVR 7ff21910
PowerPC 440-xilinx       PVR 7ff21910
PowerPC 7450_v1.0        PVR 80000100
PowerPC 7450_v1.1        PVR 80000101
PowerPC 7450_v1.2        PVR 80000102
PowerPC 7450_v2.0        PVR 80000200
PowerPC 7441_v2.1        PVR 80000201
PowerPC 7450_v2.1        PVR 80000201
PowerPC 7450             (alias for 7450_v2.1)
PowerPC vger             (alias for 7450_v2.1)
PowerPC 7451_v2.3        PVR 80000203
PowerPC 7451             (alias for 7451_v2.3)
PowerPC 7441_v2.3        PVR 80000203
PowerPC 7441             (alias for 7441_v2.3)
PowerPC 7451_v2.10       PVR 80000210
PowerPC 7441_v2.10       PVR 80000210
PowerPC 7455_v1.0        PVR 80010100
PowerPC 7445_v1.0        PVR 80010100
PowerPC 7445_v2.1        PVR 80010201
PowerPC 7455_v2.1        PVR 80010201
PowerPC 7455_v3.2        PVR 80010302
PowerPC 7455             (alias for 7455_v3.2)
PowerPC apollo6          (alias for 7455_v3.2)
PowerPC 7445_v3.2        PVR 80010302
PowerPC 7445             (alias for 7445_v3.2)
PowerPC 7455_v3.3        PVR 80010303
PowerPC 7445_v3.3        PVR 80010303
PowerPC 7455_v3.4        PVR 80010304
PowerPC 7445_v3.4        PVR 80010304
PowerPC 7447_v1.0        PVR 80020100
PowerPC 7457_v1.0        PVR 80020100
PowerPC 7447_v1.1        PVR 80020101
PowerPC 7447             (alias for 7447_v1.1)
PowerPC 7457_v1.1        PVR 80020101
PowerPC 7457_v1.2        PVR 80020102
PowerPC 7457             (alias for 7457_v1.2)
PowerPC apollo7          (alias for 7457_v1.2)
PowerPC 7457a_v1.0       PVR 80030100
PowerPC apollo7pm        (alias for 7457a_v1.0)
PowerPC 7447a_v1.0       PVR 80030100
PowerPC 7457a_v1.1       PVR 80030101
PowerPC 7447a_v1.1       PVR 80030101
PowerPC 7457a_v1.2       PVR 80030102
PowerPC 7457a            (alias for 7457a_v1.2)
PowerPC 7447a_v1.2       PVR 80030102
PowerPC 7447a            (alias for 7447a_v1.2)
PowerPC mpc8641d         PVR 80040010
PowerPC mpc8610          PVR 80040010
PowerPC e600             PVR 80040010
PowerPC mpc8641          PVR 80040010
PowerPC 7448_v1.0        PVR 80040100
PowerPC 7448_v1.1        PVR 80040101
PowerPC 7448_v2.0        PVR 80040200
PowerPC 7448_v2.1        PVR 80040201
PowerPC 7448             (alias for 7448_v2.1)
PowerPC 7410_v1.0        PVR 800c1100
PowerPC 7410_v1.1        PVR 800c1101
PowerPC 7410_v1.2        PVR 800c1102
PowerPC 7410_v1.3        PVR 800c1103
PowerPC 7410_v1.4        PVR 800c1104
PowerPC 7410             (alias for 7410_v1.4)
PowerPC nitro            (alias for 7410_v1.4)
PowerPC mpc8540_v10      PVR 80200010
PowerPC e500_v10         PVR 80200010
PowerPC mpc8541_v10      PVR 80200020
PowerPC mpc8541_v11      PVR 80200020
PowerPC mpc8541          (alias for mpc8541_v11)
PowerPC mpc8541e_v10     PVR 80200020
PowerPC mpc8540_v20      PVR 80200020
PowerPC mpc8541e_v11     PVR 80200020
PowerPC mpc8541e         (alias for mpc8541e_v11)
PowerPC mpc8540_v21      PVR 80200020
PowerPC mpc8540          (alias for mpc8540_v21)
PowerPC e500_v20         PVR 80200020
PowerPC e500v1           (alias for e500_v20)
PowerPC mpc8543e_v10     PVR 80210010
PowerPC mpc8543_v10      PVR 80210010
PowerPC mpc8548e_v10     PVR 80210010
PowerPC mpc8555_v10      PVR 80210010
PowerPC mpc8555e_v10     PVR 80210010
PowerPC e500v2_v10       PVR 80210010
PowerPC mpc8560_v10      PVR 80210010
PowerPC mpc8548_v10      PVR 80210010
PowerPC mpc8543e_v11     PVR 80210011
PowerPC mpc8548e_v11     PVR 80210011
PowerPC mpc8543_v11      PVR 80210011
PowerPC mpc8555_v11      PVR 80210011
PowerPC mpc8555          (alias for mpc8555_v11)
PowerPC mpc8555e_v11     PVR 80210011
PowerPC mpc8555e         (alias for mpc8555e_v11)
PowerPC mpc8548_v11      PVR 80210011
PowerPC mpc8560_v20      PVR 80210020
PowerPC mpc8548_v20      PVR 80210020
PowerPC mpc8547e_v20     PVR 80210020
PowerPC mpc8545_v20      PVR 80210020
PowerPC mpc8543e_v20     PVR 80210020
PowerPC mpc8548e_v20     PVR 80210020
PowerPC mpc8543_v20      PVR 80210020
PowerPC mpc8545e_v20     PVR 80210020
PowerPC e500v2_v20       PVR 80210020
PowerPC mpc8545e_v21     PVR 80210021
PowerPC mpc8545e         (alias for mpc8545e_v21)
PowerPC mpc8544_v10      PVR 80210021
PowerPC mpc8560_v21      PVR 80210021
PowerPC mpc8560          (alias for mpc8560_v21)
PowerPC mpc8533e_v10     PVR 80210021
PowerPC mpc8544e_v10     PVR 80210021
PowerPC mpc8547e_v21     PVR 80210021
PowerPC mpc8547e         (alias for mpc8547e_v21)
PowerPC mpc8548_v21      PVR 80210021
PowerPC mpc8548          (alias for mpc8548_v21)
PowerPC mpc8545_v21      PVR 80210021
PowerPC mpc8545          (alias for mpc8545_v21)
PowerPC mpc8543e_v21     PVR 80210021
PowerPC mpc8543e         (alias for mpc8543e_v21)
PowerPC mpc8543_v21      PVR 80210021
PowerPC mpc8543          (alias for mpc8543_v21)
PowerPC mpc8548e_v21     PVR 80210021
PowerPC mpc8548e         (alias for mpc8548e_v21)
PowerPC e500v2_v21       PVR 80210021
PowerPC mpc8533_v10      PVR 80210021
PowerPC mpc8544_v11      PVR 80210022
PowerPC mpc8544          (alias for mpc8544_v11)
PowerPC mpc8568e         PVR 80210022
PowerPC mpc8533e_v11     PVR 80210022
PowerPC mpc8533e         (alias for mpc8533e_v11)
PowerPC mpc8544e_v11     PVR 80210022
PowerPC mpc8544e         (alias for mpc8544e_v11)
PowerPC mpc8567          PVR 80210022
PowerPC mpc8568          PVR 80210022
PowerPC mpc8567e         PVR 80210022
PowerPC e500v2_v22       PVR 80210022
PowerPC e500             (alias for e500v2_v22)
PowerPC e500v2           (alias for e500v2_v22)
PowerPC mpc8533_v11      PVR 80210022
PowerPC mpc8533          (alias for mpc8533_v11)
PowerPC mpc8572e         PVR 80210030
PowerPC e500v2_v30       PVR 80210030
PowerPC mpc8572          PVR 80210030
PowerPC e500mc           PVR 80230020
PowerPC g2h4             PVR 80811010
PowerPC g2hip4           PVR 80811014
PowerPC mpc8241          (alias for g2hip4)
PowerPC mpc8245          (alias for g2hip4)
PowerPC mpc8250          (alias for g2hip4)
PowerPC mpc8250_hip4     (alias for g2hip4)
PowerPC mpc8255          (alias for g2hip4)
PowerPC mpc8255_hip4     (alias for g2hip4)
PowerPC mpc8260          (alias for g2hip4)
PowerPC mpc8260_hip4     (alias for g2hip4)
PowerPC mpc8264          (alias for g2hip4)
PowerPC mpc8264_hip4     (alias for g2hip4)
PowerPC mpc8265          (alias for g2hip4)
PowerPC mpc8265_hip4     (alias for g2hip4)
PowerPC mpc8266          (alias for g2hip4)
PowerPC mpc8266_hip4     (alias for g2hip4)
PowerPC g2le             PVR 80820010
PowerPC g2gp             PVR 80821010
PowerPC g2legp           PVR 80822010
PowerPC mpc5200b_v20     PVR 80822011
PowerPC mpc5200_v10      PVR 80822011
PowerPC mpc5200b_v21     PVR 80822011
PowerPC mpc5200b         (alias for mpc5200b_v21)
PowerPC mpc5200_v11      PVR 80822011
PowerPC mpc5200_v12      PVR 80822011
PowerPC mpc52xx          (alias for mpc5200_v12)
PowerPC mpc5200          (alias for mpc5200_v12)
PowerPC g2legp1          PVR 80822011
PowerPC g2legp3          PVR 80822013
PowerPC mpc82xx          (alias for g2legp3)
PowerPC powerquicc-ii    (alias for g2legp3)
PowerPC mpc8247          (alias for g2legp3)
PowerPC mpc8248          (alias for g2legp3)
PowerPC mpc8270          (alias for g2legp3)
PowerPC mpc8271          (alias for g2legp3)
PowerPC mpc8272          (alias for g2legp3)
PowerPC mpc8275          (alias for g2legp3)
PowerPC mpc8280          (alias for g2legp3)
PowerPC e200z5           PVR 81000000
PowerPC e200z6           PVR 81120000
PowerPC e200             (alias for e200z6)
PowerPC g2ls             PVR 90810010
PowerPC g2lels           PVR a0822010


