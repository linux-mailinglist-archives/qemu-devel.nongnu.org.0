Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2B034E881
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 15:09:58 +0200 (CEST)
Received: from localhost ([::1]:41882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRE85-0007e3-48
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 09:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1lRE6z-0007DD-Ek
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:08:49 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:37281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1lRE6u-0002Pu-W6
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:08:49 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3C6295C015B;
 Tue, 30 Mar 2021 09:08:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 30 Mar 2021 09:08:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernat.ch; h=
 from:to:cc:subject:references:date:in-reply-to:message-id
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 O9v1xpuF7o2BLIxUtNsmyKUTQR6VcD712Zy+H70SuhQ=; b=QD+Xgvv2KT5YU/wN
 o/pzOoXxmKpcIwJXlENodQGieRaTtPv1ENJD+GCJVlwCNgbATCtBYiJ5s8RYQOe/
 bu+xUUShdHYVPGwvmTbvi1/hK2kzSZ/BMWrPCzMXoDhViaRMqb5EvW/9momzrWnY
 XXKP7GCNLe0jCoPVZElSAv5sg+4xqQrEXgcqjHIyWVXmfC7aHQ9Cd3SbJ68733fJ
 ujOUw8QuBNpD6fejpajZkH3PoApQPxkthMNNyG3o/K/fp5koEst7uTXmuUDJvy9U
 9ksau3DqKwdU0OuI+wLPeg50XWh4tBPutzfgZtxSTocLk5rk0bQeaFVpeZdfHVIL
 Ld8ulg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=O9v1xpuF7o2BLIxUtNsmyKUTQR6VcD712Zy+H70Su
 hQ=; b=L80CjGfGUHPScHgGoAeVG8fJigI3eXFx+XIFcAjfJbupA4+Ojxy5FEoWu
 ZZ/PohoBSM+juABiyXLf3ToCJIWkSOaTiQsMWTLcj07EF6eZr0eN8TdKnLQnYE1J
 Tp47ZctU957d7uL+PmJAjHTBPvPyN5XXC1HXc3yQyBmyxxx8Ienbdubm0+6ge94t
 g2ymUzhl4IlnLKhfCAMjdWVh+zIISLYttiEAVVbRMAYkE3gv3dxNEVI4GmgJlk3K
 ILGdXGCillC7OKxd88bqOFei8JfmuFudH222mO+OjEv+RBj/7arxamsV2m12gRty
 +XcCi1I4bNEm8mo0G2pChjQbTbylQ==
X-ME-Sender: <xms:1yJjYCDKZuD-V5kEFG2FHOgr1Ss8TM-EGPBfv89JTtGsXZ-cTLA3oA>
 <xme:1yJjYFITK_Ijo5TzS3Ht-7QskbXPTseUNJsEx27_2zlUjDxYTDCDW9UVe7uDNCSeW
 gstnu0SYNpcIBv3O-0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeitddgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufhfffgjkfgfgggtgfesthekredttderjeenucfhrhhomhepgghinhgt
 vghnthcuuegvrhhnrghtuceovhhinhgtvghnthessggvrhhnrghtrdgthheqnecuggftrf
 grthhtvghrnhepudeuveeggedtveduudejgfeiffeiveduiedvjedvudefleetgfefvdfh
 kedtieejnecukfhppeeltddrledtrdeltddrfeehnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepvhhinhgtvghnthessggvrhhnrghtrdgthh
X-ME-Proxy: <xmx:1yJjYNC4L7IFCfy-AudecuqAYuuzLivW7M_UFM1a9KgO4OOSGD29Zw>
 <xmx:1yJjYKur501OT69xSbR3D-aJyNBCBKAa2xGSIMFeTgFp6MVwjN_suA>
 <xmx:1yJjYLQktZiEmvYKnJQ8e_ZaWw8zIzpRGC0JyvJFC4mJS6Hilj8eZw>
 <xmx:2CJjYNg96rfaBXoQ52iVobAHY7Tp1zFounLa2-199rGFUVIN3JoWzQ>
Received: from neo.luffy.cx (lfbn-idf1-1-1655-35.w90-90.abo.wanadoo.fr
 [90.90.90.35])
 by mail.messagingengine.com (Postfix) with ESMTPA id 97A5224005B;
 Tue, 30 Mar 2021 09:08:39 -0400 (EDT)
Received: by neo.luffy.cx (Postfix, from userid 500)
 id A8E51E83; Tue, 30 Mar 2021 15:08:37 +0200 (CEST)
From: Vincent Bernat <vincent@bernat.ch>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC v1] hw/smbios: support for type 41 (onboard devices
 extended information)
References: <20210328205726.1330291-1-vincent@bernat.ch>
 <YGL++3NLdBeN7j4f@redhat.com>
Date: Tue, 30 Mar 2021 15:08:37 +0200
In-Reply-To: <YGL++3NLdBeN7j4f@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 30 Mar 2021 11:35:39 +0100")
Message-ID: <m3ft0ceqlm.fsf@bernat.ch>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=vincent@bernat.ch;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 ❦ 30 mars 2021 11:35 +01, Daniel P. Berrangé:

>> If network devices are present in this table, by default, udev will
>> name the corresponding interfaces enoX, X being the instance number.
>> Without such information, udev will fallback to using the PCI ID and
>> this usually gives ens3 or ens4. This can be a bit annoying as the
>> name of the network card may depend on the order of options and may
>> change if a new PCI device is added earlier on the commande line.
>> Being able to provide SMBIOS type 41 entry ensure the name of the
>> interface won't change and helps the user guess the right name without
>> booting a first time.
>> 
>> This can be invoked with:
>> 
>>     $QEMU -netdev user,id=internet
>>           -device virtio-net-pci,mac=50:54:00:00:00:42,netdev=internet \
>>           -smbios type=41,designation=Onboard LAN,instance=1,kind=ethernet,pci=0000:00:09.0
>> 
>> Which results in the guest seeing dmidecode data and the interface
>> exposed as "eno1":
>> 
>>     $ dmidecode -t 41
>>     # dmidecode 3.3
>>     Getting SMBIOS data from sysfs.
>>     SMBIOS 2.8 present.Handle 0x2900, DMI type 41, 11 bytes
>>     Onboard Device
>>             Reference Designation: Onboard LAN
>>             Type: Ethernet
>>             Status: Enabled
>>             Type Instance: 1
>>             Bus Address: 0000:00:09.0
>>     $ udevadm info -p /sys/class/net/eno1 | grep ONBOARD
>>     E: ID_NET_NAME_ONBOARD=eno1
>>     E: ID_NET_LABEL_ONBOARD=Onboard LAN
>> 
>> The original plan was to directly provide a device and populate "kind"
>> and "pci" from the device. However, since the SMIBIOS tables are built
>> during argument evaluation, the information is not yet available.
>> I would welcome some guidance on how to implement this.
>
> I'm not sure I see the problem you're describing here, could
> you elaborate ?
>
> I see SMBIOS tables are built by  smbios_get_tables() method.
> This is called from qemu_init(), after all arguents have been
> processed and devices have been created.

OK, I was mistaken. I'll try to retrieve the information here then.

> It seems like this should allow SMBIOS tables to be auto-populated
> from the NICs listed in -device args previously.
>
>
> Note, if we're going to auto-populate the SMBIOS type 41 tabes
> from -device args, then we'll need to make this behaviour
> configurable via a property, so that we can ensure this only
> applies to new machine types.

I didn't plan for something automatic, just being able to specify a PCI
device in the -smbios arguments and have the PCI location automatically
filled from that.
-- 
Keep it simple to make it faster.
            - The Elements of Programming Style (Kernighan & Plauger)

