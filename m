Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E4335214B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 23:08:13 +0200 (CEST)
Received: from localhost ([::1]:43836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS4Y0-0002IS-7S
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 17:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1lS4X3-0001sJ-UW
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 17:07:13 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:38291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1lS4X2-0005X2-5T
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 17:07:13 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 0C7CE5C00AC;
 Thu,  1 Apr 2021 17:07:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 01 Apr 2021 17:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernat.ch; h=
 from:to:cc:subject:references:date:in-reply-to:message-id
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 D72+uOFjabw8LQYPR+Z/WXaWQCV+KO7I2cZg58da9ew=; b=WYjnmKbv7Rg7CUlV
 Ajk37/4cjXbPTtXODmvabk65RYdC69CDqHO9ZRI08DDP5N2tdydkIJ6pw03WtTYN
 +99Xc7bW+cZHqw/GBuxGjoGMDQAadcqGOqt/2ynCQZ9fwBjLOQ5wk+Xs6dEzrhAQ
 4xZx0O2uYFR7aMleuiMjAvuM5FyVVPbRG7hlBFVQZYWbaMCkuim1Aw0sXTYM057E
 Yk6Mi8x7c6FroNtL+kRp8ks3rw/D2yQTHoFNG1gVEnZ5m9JYCcCxsGjLkrRK8OAP
 DD8I3IX3yjkkZAexS12z4Qh+z7MnhlmFztyWMT3opAdQ4lnT9xwV5Fy55uzo6RfS
 cUgh2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=D72+uOFjabw8LQYPR+Z/WXaWQCV+KO7I2cZg58da9
 ew=; b=FaP5Hw/YA4Rrehj+7odW1pEu+Y8m4I6fEiun2EAoQO0xFnsLC9lfUNWnZ
 FIOjIbugMYQgNUqj/MD71xvRbyA0DDAkFLY3nkPa15dqzX/l961IavsE3l50UfFC
 NucAga5+frrmDL6gJNvvuq4XxpiEX9vdrhiP1jVLjYBYLmkTgcFwH6sGmYFKy603
 LUhGxcTmgndugqxc3zRFo5HczelcV89aQOfIjDSHLCzEIv2kz8/5/kHfVrjLxZCs
 1zuFeFczjPNa+mgweMNmYojQJaIxGIxBorQg+WLaDQpjJq8D2J45VFqMYHHNdVhq
 8PNJ2c5dAyrFS7xrdbvGce7oaLHYA==
X-ME-Sender: <xms:_jVmYGMQIkDI88vQP6IfBidOG_UtD0xU-bSvZLGCUOLhIrgb5G14gQ>
 <xme:_jVmYE8IdCbMMhhoEvZYAq_XaFcTds4jzjLkWtApw-le2ygmA6liS1M2L3jYyzzMq
 bDXZc3Gp2YHUVLmQSU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeigedgudegkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufhffjgfkfgggtgfgsehtkeertddtreejnecuhfhrohhmpeggihhn
 tggvnhhtuceuvghrnhgrthcuoehvihhntggvnhhtsegsvghrnhgrthdrtghhqeenucggtf
 frrghtthgvrhhnpeelgeefhfdukeehfeeigfehvdffieehvdelveethedvffeuleegteei
 ffduiefgteenucffohhmrghinhepmhgrihhlqdgrrhgthhhivhgvrdgtohhmnecukfhppe
 eltddrledtrdeltddrfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepvhhinhgtvghnthessggvrhhnrghtrdgthh
X-ME-Proxy: <xmx:_jVmYNTbEsEujT476sWF-ewXE06PzAaTxJw1NmP-po8R2rFCkDqh_w>
 <xmx:_jVmYGt92-qP8tu-QpVDfW33Dlce9UYsCKZGBs-AJCjObYYm4-81og>
 <xmx:_jVmYOdMCtfOjBbtEL7xI95Iusc9H9dD-B_AIOzF7iFgStezEJxHXg>
 <xmx:_zVmYCGr_kmKBLnLdvhziGBDqLEqL458uYXKqljyqd_Olr4rv_DG3A>
Received: from neo.luffy.cx (lfbn-idf1-1-1655-35.w90-90.abo.wanadoo.fr
 [90.90.90.35])
 by mail.messagingengine.com (Postfix) with ESMTPA id 18E601080054;
 Thu,  1 Apr 2021 17:07:10 -0400 (EDT)
Received: by neo.luffy.cx (Postfix, from userid 500)
 id 0C6E5A28; Thu,  1 Apr 2021 23:07:06 +0200 (CEST)
From: Vincent Bernat <vincent@bernat.ch>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3] hw/smbios: support for type 41 (onboard devices
 extended information)
References: <20210401122658.37842-1-vincent@bernat.ch>
 <20210401225846.411ebd76@redhat.com>
Date: Thu, 01 Apr 2021 23:07:06 +0200
In-Reply-To: <20210401225846.411ebd76@redhat.com> (Igor Mammedov's message of
 "Thu, 1 Apr 2021 22:58:46 +0200")
Message-ID: <m37dllk939.fsf@bernat.ch>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=vincent@bernat.ch;
 helo=out2-smtp.messagingengine.com
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
Cc: =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 ❦  1 avril 2021 22:58 +02, Igor Mammedov:

>> This can be invoked with:
>> 
>>     $QEMU -netdev user,id=internet
>>           -device virtio-net-pci,mac=50:54:00:00:00:42,netdev=internet,id=internet-dev \
>>           -smbios type=41,designation='Onboard LAN',instance=1,kind=ethernet,pcidev=internet-dev
>
> an ACPI alternative was merged recently (current master).
> assigning 'designation=' wasn't implemented there, but important part
> of giving users control over PCI devices 'eno' index is implemented.
>
> When I looked into the issue, smbios way was a bit over-kill for the task
> and didn't really work if hotplug were used.
>
> See, for example how to use new feature:
>  https://www.mail-archive.com/qemu-devel@nongnu.org/msg794164.html

It seems simpler this way. I don't think my patch is needed then.
-- 
Let the data structure the program.
            - The Elements of Programming Style (Kernighan & Plauger)

