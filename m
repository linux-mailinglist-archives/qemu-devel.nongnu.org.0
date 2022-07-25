Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146D457FF7E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 15:05:48 +0200 (CEST)
Received: from localhost ([::1]:32776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFxmM-00077P-DT
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 09:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lists@colorremedies.com>)
 id 1oFxZ8-000249-Qv
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:52:07 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:39689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lists@colorremedies.com>)
 id 1oFxZ6-0003TW-RO
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:52:06 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id E93335800E2
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 08:52:02 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
 by compute3.internal (MEProxy); Mon, 25 Jul 2022 08:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 colorremedies.com; h=cc:content-transfer-encoding:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1658753522; x=1658757122; bh=BXzME7qpM3th0P++sWfnv6jS6
 tarAhrZbaf8U33q5Uk=; b=OkmeehZjZmD7G5M18aXZcRgC4E2D36x6tITyzxEFH
 bnrLvqOU7Prhgc4ASZKnVlvQC9NJzLRkAVSN+ADUNGxtA/cJ8TtmXaDcOFPWMHpj
 OsqrXe6VT4vzKndE7FYS8bNJhX6ln6PIKRR6blqZ8NGmZOVCSOTjo0r8/aWMxg8V
 Exv7CL2a1tmaUxLhzxSo9FipH8lw8f2K8X+Honfx7XEzFvTsW7aIu91g0SPjIY1A
 K9izMXu/znPxVNkS4EJGv4Cwm+fKT7Ap2vv2iIAe697o4ldpinOZvwRtbKfMaw+3
 qWii3bYdQAR8d/Y5LKB6H5/09ceiqQ7BqvIGP+PEMqQlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:date:feedback-id:feedback-id:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=i06494636.fm3; t=1658753522; x=
 1658757122; bh=BXzME7qpM3th0P++sWfnv6jS6tarAhrZbaf8U33q5Uk=; b=m
 aNj6IB5tBW8z/bBQ8inr0oegZd6hl2Eb4VmL9ekEZyc0hHROc+/ivuoercNRHJ7A
 1Xb78n4hJp83Bl/yyZDCX1AuY2cJs2pmXrUHHyjpPZ3fzdfToJbKAp+cHGOEEx0J
 BeNtR5eK4B1kRYrUqrOnoO3H0UQjeE/LPhVdksk3kdfJIHymEUcvb9T2QMqiMyrX
 7/lrkWGxNAzUlW0WccfSA/pLh/NHPjv5QCT9olfkZgq5N3W1p3vENMUaHtAmgalO
 356iGw/WxrFVDgeyuRL3s+uGiz1xGySEofkb0KxdRN4z88EgLA33CEwpj07G6zTZ
 eoWkM+/Z1cgwyDUbogWrQ==
X-ME-Sender: <xms:8pHeYnsfNG1bbCGzgwP-CtxFfV1iJmiYzu7Cb7z--He8V4YBZNlkxg>
 <xme:8pHeYocF1EqTu-U_cxv0FhHqh8Jk7ZlvF1BtJUvG9WoHK3sKpepqwhXkN90UDzwGZ
 Gx1ywRRKJl3v2lsYVs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtkedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtgfesth
 hqredtreerjeenucfhrhhomhepfdevhhhrihhsucfouhhrphhhhidfuceolhhishhtshes
 tgholhhorhhrvghmvgguihgvshdrtghomheqnecuggftrfgrthhtvghrnheptdejvdfgtd
 duhefhtdetffduvdeghfeludeufeetteeivdehleetfeffffdtgedunecuffhomhgrihhn
 pehfvgguohhrrghprhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomheplhhishhtshestgholhhorhhrvghmvgguihgvshdr
 tghomh
X-ME-Proxy: <xmx:8pHeYqz8EXv2VD4IwzBVjZSd8SqWIRJzWwRnpgj4C88gMXIzjK0puA>
 <xmx:8pHeYmOJHut-usay7KEB0PB4HJW314HUKryRT2XmEr-t4NWH4BbXOg>
 <xmx:8pHeYn8190h2Yd2hVZJxSmqwT7rmyQo7EsKvSREThb-otRKb-KdVCQ>
 <xmx:8pHeYqLeXPEzjvOtMDx4DI2L6Ofq2uWaFUUYbcKBG7XwCkDsV2_Ia2DAVDg>
Feedback-ID: i06494636:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8FB60170007E; Mon, 25 Jul 2022 08:52:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-757-gc3ad9c75d3-fm-20220722.001-gc3ad9c75
Mime-Version: 1.0
Message-Id: <79ec108b-60bf-4c18-8917-9d7c8fd74b89@www.fastmail.com>
In-Reply-To: <Yt5etOfFUQb12ljA@redhat.com>
References: <4f9c91b1-719c-443e-a757-042e772d6019@www.fastmail.com>
 <Yt5etOfFUQb12ljA@redhat.com>
Date: Mon, 25 Jul 2022 08:51:42 -0400
From: "Chris Murphy" <lists@colorremedies.com>
To: qemu-devel@nongnu.org
Subject: Re: driver type raw-xz supports discard=unmap?
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.230;
 envelope-from=lists@colorremedies.com; helo=new4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, Jul 25, 2022, at 5:13 AM, Daniel P. Berrang=C3=A9 wrote:
> On Fri, Jul 22, 2022 at 04:03:52PM -0400, Chris Murphy wrote:
>> Is this valid?
>>=20
>> `<disk device=3D"disk" type=3D"file">
>> <target dev=3D"vda" bus=3D"virtio"/>
>> <source file=3D"Fedora-Workstation-Rawhide-20220721.n.0.aarch64.raw-x=
z"/>
>> <driver name=3D"qemu" type=3D"raw-xz" discard=3D"unmap"/>`
>> `/>
>> </disk>`
>>=20
>> I know type=3D"raw" works fine, I'm wondering if there'd be any probl=
em
>> with type "raw-xz" combined with discards?
>
> This is libvirt configuration, so libvirt-users@redhat.com is the bett=
er
> list in general. That said, what is this 'raw-xz' type you refer to ?
>
> AFAIK, that is not a disk driver type that exists in either libvirt or
> QEMU releases.

Huh, interesting. I have no idea then. I just happened to notice it in t=
he (libvirt) XML config that's used by oz.
https://kojipkgs.fedoraproject.org//packages/Fedora-Workstation/Rawhide/=
20220721.n.0/images/libvirt-raw-xz-aarch64.xml

When manually modifying a virt-manager created config, to change "raw" t=
o "raw-xz" I get an error:

# virsh edit uefivm
error: XML document failed to validate against schema: Unable to validat=
e doc against /usr/share/libvirt/schemas/domain.rng
Extra element devices in interleave
Element domain failed to validate content

Failed. Try again? [y,n,i,f,?]:=20

I've got no idea what happens if an invalid type is specified in the con=
fig. The VM's are definitely running despite this. I'll ask oz devs.

