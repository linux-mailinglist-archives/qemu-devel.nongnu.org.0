Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E11352E9B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 19:43:15 +0200 (CEST)
Received: from localhost ([::1]:35214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSNpC-00043Z-Uy
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 13:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1lSNmJ-0003VZ-NM
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:40:16 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:53627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1lSNmF-0002Ph-FW
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:40:15 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 6B5345C00DA;
 Fri,  2 Apr 2021 13:40:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 02 Apr 2021 13:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernat.ch; h=
 from:to:cc:subject:references:date:in-reply-to:message-id
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 /DHbe4/1klKzERjCXDRPCjmafpsIdyuj+9SeNOc6NVg=; b=DZa1kTVWR1hNewFx
 k4n0KZmLgXwcnqR8wHj3OEn7Sw+zNs53dgiL8sGZTR2aRVpHmmtHda1Uw54mo8VZ
 gV8zjHnNRO6ZiWP+pi9HGHepd3SJi6S/NTSIIKREv0CaexxxEpEeXS+05VnF+r1l
 SFCDOhZ6rjpaBIoYWost7lB/29i8HSYMOnCyhD2IgkYy8KJRtv5PHwl4c7qOO1MJ
 pacxt57RVeWOvTw9d0YNxb0JDcOTNJH6UzCc3imU+v8fElhSHSWfJeQzsmXvqgdW
 ehJaF6n1eIQkbax6hg8z1kunxz2vnmLDje2HivKNT+ZhDD9F4gSemPluP38M1+Kb
 ieBo2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=/DHbe4/1klKzERjCXDRPCjmafpsIdyuj+9SeNOc6N
 Vg=; b=ayi4wZHaBfNoaus/larBspdugu07qkT3+1kCQ38QUkZNDvMnZf+4+EjQk
 BLKk5uH5HtrKQNOaQlyBCRENMsYuJCxPIJjS6MGGWhHkGW9w3jvLupK+F3g3XRKH
 IqIetGE2oM3jk/k/oR//ETXmUG/lhsVmE0rU0jkaxGh5ezWEIe0k7BRm3CcUa208
 tklanHJFny17G5O68xeaPuprd6tgzcSLyPvAvJnhYzJ6uYSeRXrg98Dx3ZWmd5/6
 RBrKqkzl1VO4p3rlFrJoF10oSCCGdPjgYDb2TYw5s7UWxaCVZmky5XSXDxXQnZ7f
 nQzbs9RdBd8oitb1s8gNWt12COwyg==
X-ME-Sender: <xms:9VZnYEzM7WSM7BBb5W88ydLccTINmecIifM6dyqGvmI6-7JV90NuWg>
 <xme:9VZnYIRg0iSHhQtRMwQLwdKGKGKmQ4AOAgJPptTJMx8z1ihHTs0si7h8VtBRIRIgE
 xt7Dk0sguPU2cFsC50>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeiiedguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufhffjgfkfgggtgfgsehtkeertddtreejnecuhfhrohhmpeggihhn
 tggvnhhtuceuvghrnhgrthcuoehvihhntggvnhhtsegsvghrnhgrthdrtghhqeenucggtf
 frrghtthgvrhhnpeelgeefhfdukeehfeeigfehvdffieehvdelveethedvffeuleegteei
 ffduiefgteenucffohhmrghinhepmhgrihhlqdgrrhgthhhivhgvrdgtohhmnecukfhppe
 eltddrledtrdeltddrfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepvhhinhgtvghnthessggvrhhnrghtrdgthh
X-ME-Proxy: <xmx:9VZnYGUIWhlj3gS-qV6Cqe2Ia02Y9Q-lKkv7PtEZ4mpFOqSgRPwVcA>
 <xmx:9VZnYCi930Ypnwh8TN8FnLgNLHSlL_LTJLs10endK-uaNUdRT9Skqg>
 <xmx:9VZnYGA-WX78igpIRnNsbTE_i4qrvfgkh_16BLqFUbRNmc5E-51F2w>
 <xmx:9lZnYH5FcmO9IaewUPgCVh7TKHiXZ-zmx_nWGV4NakHHeepkV7G8vg>
Received: from neo.luffy.cx (lfbn-idf1-1-1655-35.w90-90.abo.wanadoo.fr
 [90.90.90.35])
 by mail.messagingengine.com (Postfix) with ESMTPA id C1AE524005C;
 Fri,  2 Apr 2021 13:40:05 -0400 (EDT)
Received: by neo.luffy.cx (Postfix, from userid 500)
 id 8F7DEADB; Fri,  2 Apr 2021 19:40:03 +0200 (CEST)
From: Vincent Bernat <vincent@bernat.ch>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3] hw/smbios: support for type 41 (onboard devices
 extended information)
References: <20210401122658.37842-1-vincent@bernat.ch>
 <20210401225846.411ebd76@redhat.com> <m37dllk939.fsf@bernat.ch>
Date: Fri, 02 Apr 2021 19:40:03 +0200
In-Reply-To: <m37dllk939.fsf@bernat.ch> (Vincent Bernat's message of "Thu, 01
 Apr 2021 23:07:06 +0200")
Message-ID: <m3wntkio0c.fsf@bernat.ch>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=vincent@bernat.ch;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: "Daniel P . =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 ❦  1 avril 2021 23:07 +02, Vincent Bernat:

>>> This can be invoked with:
>>> 
>>>     $QEMU -netdev user,id=internet
>>>           -device virtio-net-pci,mac=50:54:00:00:00:42,netdev=internet,id=internet-dev \
>>>           -smbios type=41,designation='Onboard LAN',instance=1,kind=ethernet,pcidev=internet-dev
>>
>> an ACPI alternative was merged recently (current master).
>> assigning 'designation=' wasn't implemented there, but important part
>> of giving users control over PCI devices 'eno' index is implemented.
>>
>> When I looked into the issue, smbios way was a bit over-kill for the task
>> and didn't really work if hotplug were used.
>>
>> See, for example how to use new feature:
>>  https://www.mail-archive.com/qemu-devel@nongnu.org/msg794164.html
>
> It seems simpler this way. I don't think my patch is needed then.

Well, after thinking a bit, if the patch is good enough, maybe it can
still be merged. It is fairly generic and it adds the ability to set the
name of the card. It's not as convenient as using acpi-index, but I
could add a note about acpi-index in the documentation to let people
know they may prefer the simpler acpi-index?
-- 
Avoid temporary variables.
            - The Elements of Programming Style (Kernighan & Plauger)

