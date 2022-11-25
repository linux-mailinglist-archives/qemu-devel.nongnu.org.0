Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA4E638F82
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 19:08:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyd6V-0002G9-VE; Fri, 25 Nov 2022 13:07:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oyd6T-0002Fl-Bs
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 13:07:09 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oyd6R-0005vA-4p
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 13:07:09 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8EA793200961;
 Fri, 25 Nov 2022 13:07:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 25 Nov 2022 13:07:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669399623; x=
 1669486023; bh=JL+7FSKHlsIDyUDyDfwbw2WUdRPV7O11Qf60abH8ydQ=; b=i
 PAYLR1ODA7T+40W8eG0gW3bdZRipV76DBk5T1RhGtK8V+h5e6jw7EmfsY+9cG2tO
 /LK8JGClWQjoi/MIu7qKm3n5W8kt76chayE13k+LKQp9/hqfiXhVQwn/2CqCAtA5
 YVPfdUeSsSvIlAymmRURcf2O4lUxBs4Zxig9UXA+L4yXJjm+ifG1kgiYAlHLagqx
 onctfM5JbfBGHFG3t5L9krLoZ2KllvmKSvv2QiUemrplU4HtbqZLl0ei4AWTzl1u
 chwIk4nkmhkX+Q9kOPkxzjdX6iDisXKAqaWJ1HcjkrmtKGkRWGULwR4KLH+5IaA4
 CAegk/J1Sg8OIVcrvJmdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669399623; x=
 1669486023; bh=JL+7FSKHlsIDyUDyDfwbw2WUdRPV7O11Qf60abH8ydQ=; b=n
 fvv09bU923aqX1Z24iT4to03N+twaWEmmjEqk1GTwany2yUBec86P6SJBu20SUHC
 7nXBDIi7VhJPQ0iAHyIg0zzkjptYzsoC29+yPSN05168ktcfXRav6HuuNa9YQ1se
 VmS9ZVkTdKYZepySKVbATcc9vZiO6qHk0IzH0Lbo4eXTucC7Wo8FPw1P/t3jbobc
 57/2qs80ng5+u3WbRUfbCBe61/KG3CYBQHTnvRHInqrgA4cFRgwqSOG71oTFnVuI
 2SVcg1DkKujqlLZ62XHgiA+DtjrdKsI8YecCC/BPd1V0poEQjJGn+nuaDl+/ENFn
 usn4bN7FkGDruAKETY3vA==
X-ME-Sender: <xms:RgSBY_UyuLrpN3SP2hZ66XUt7uG1px47213v0l1295pboqlOOf-Avg>
 <xme:RgSBY3nsB7b1r9NGPWjQgbYRzstWZKiyvbjZ_XalDbs4LQBm9WpSIBklFRPGjirM0
 Xl0wmNni0olRANqr3E>
X-ME-Received: <xmr:RgSBY7a9wISX8KkMWyNbrSbgq-nAFKAPEDI7OTpbDi9z5Dc7FRN8Bo7vSIWeS0UMtApS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieehgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepkeevieelveeiueekveejgeekfffhffekkeeikeejffdvkedt
 geevfeejuefggeegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhg
 sehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:RgSBY6W2La2JnMKmzp4ElptHFJRbBIe1qrz-cX5AbB4WxetCJIPajQ>
 <xmx:RgSBY5nG7oDKFxH7QtcmhT6hiNWj5gQ8NZINQkOkJRl3W-NCkl0xnA>
 <xmx:RgSBY3ehCrBdFVOwk6WAkW28BxvjFVbI1GGmi55qcgH2fICfA3IhnQ>
 <xmx:RwSBY5sRhbMNp5VUkKt9sjZDtgzQbnN9JXZOKymoxlBz4grscPkgnw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Nov 2022 13:07:02 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [RFC PATCH 3/3] hw/mips: Add MIPS VirtIO board
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <f1270702-699b-a8c9-95fd-8bf668d6f7e5@linaro.org>
Date: Fri, 25 Nov 2022 18:06:42 +0000
Cc: BALATON Zoltan via <qemu-devel@nongnu.org>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E9983F77-999E-4CAE-B1E1-78D8B892D87D@flygoat.com>
References: <20221124212916.723490-1-jiaxun.yang@flygoat.com>
 <20221124212916.723490-4-jiaxun.yang@flygoat.com>
 <f1270702-699b-a8c9-95fd-8bf668d6f7e5@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
Received-SPF: pass client-ip=64.147.123.24;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> 2022=E5=B9=B411=E6=9C=8825=E6=97=A5 13:25=EF=BC=8CPhilippe =
Mathieu-Daud=C3=A9 <philmd@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On 24/11/22 22:29, Jiaxun Yang wrote:
>> MIPS VirtIO board is design to utilize existing VirtIO infrastures
>> but also comptitable with MIPS's existing internal simulation tools.
>> It includes virtio-mmio, pcie gpex, flash rom, fw_cfg, goldfish-rtc,
>> and optional goldfish_pic in case MIPS GIC is not present.
>> It should be able to cooperate with any MIPS CPU cores.
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  configs/devices/mips-softmmu/common.mak |    1 +
>>  hw/mips/Kconfig                         |   18 +
>>  hw/mips/meson.build                     |    1 +
>>  hw/mips/virt.c                          | 1039 =
+++++++++++++++++++++++
>>  4 files changed, 1059 insertions(+)
>>  create mode 100644 hw/mips/virt.c
>> diff --git a/configs/devices/mips-softmmu/common.mak =
b/configs/devices/mips-softmmu/common.mak
>> index 416161f833..534b7843eb 100644
>> --- a/configs/devices/mips-softmmu/common.mak
>> +++ b/configs/devices/mips-softmmu/common.mak
>> @@ -29,6 +29,7 @@ CONFIG_MC146818RTC=3Dy
>>  CONFIG_EMPTY_SLOT=3Dy
>>  CONFIG_MIPS_CPS=3Dy
>>  CONFIG_MIPS_ITU=3Dy
>> +CONFIG_MIPS_VIRT=3Dy
>=20
> Is there any value adding the 32-bit machine, or can we just add it as =
64-bit?

Well because it can boot with generic kernel so people can still test it =
again various
32bit cores like old 4K / 24K / and newer P5600 / Ingenic XBurst / =
I7200.

There will be some new 32-bit nanoMIPS products,  though they will run =
highly customised
software instead of Linux stuff :-(

>=20
>> +struct MIPSVirtState {
>> +    MachineState parent;
>> +
>> +    Notifier machine_done;
>> +    Clock *cpuclk;
>> +    DeviceState *platform_bus_dev;
>> +    MIPSCPSState *cps;
>> +    DeviceState *pic;
>> +    PFlashCFI01 *flash[2];
>=20
> We should be fine with 1 ROM for CODE and 1 flash for VARS,
> see my previous comments on the LoongArch virt machine:
>=20
> =
https://lore.kernel.org/qemu-devel/2f381d06-842f-ac8b-085c-0419675a4872@li=
naro.org/
> =
https://lore.kernel.org/qemu-devel/b62401b2-3a12-e89d-6953-b40dd170b4ba@li=
naro.org/

Will use use this scheme, thanks.
Any recommendation on size of those two regions?

Thanks
- Jiaxun

>=20
>> +    FWCfgState *fw_cfg;
>> +
>> +    MIPSVirtPlatType plat_type;
>> +    int fdt_size;
>> +};



