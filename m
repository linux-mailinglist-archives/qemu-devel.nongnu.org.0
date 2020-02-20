Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291F216597C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 09:45:38 +0100 (CET)
Received: from localhost ([::1]:38012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4hSi-00006j-M9
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 03:45:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46640)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j4hRV-0007iw-Mj
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 03:44:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j4hRU-0004gq-13
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 03:44:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45768
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j4hRT-0004gY-OI
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 03:44:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582188259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=agSV552nc7WygAfa300a7cVpsdk9o68Pw5hOINQPnC4=;
 b=CiKPWe63hbZHw0jp1LowDz+QR0utkEkFL0lMbkDkU9+0qCznrMCaKVdrCe/xKtSBrab1Yu
 gpJgNv1cTt9Pa9g8ab0l/w4BILfCyCvZyu9iAZPBSoiNC1qjXWOUSgWu1+hVmKvdkLH5gl
 4UdSlEpUUDSJckOb5WIDKtVwljyJT7M=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-3Cvcb5acNb-zraKi9SwGXQ-1; Thu, 20 Feb 2020 03:44:17 -0500
X-MC-Unique: 3Cvcb5acNb-zraKi9SwGXQ-1
Received: by mail-ed1-f72.google.com with SMTP id n12so2127900edq.13
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 00:44:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sy/uPZmHVXPB4073R6tTh0v+5NiftQaJhKJgQ27FAak=;
 b=nUh6v7W/W2gXGXUs90ykc3VU9A7V3rqXqRBx9ok8ft6cdY0rcjqXxTxN0YgrMNEtX6
 7mNyxJE6r3Z5SAIqCcFaj8cAzQEclbjykU9zVPCzfUREeje2dFzpl1dmGIWyt4bXBnQt
 yoQj0qlsIi6EA0O2cWI2sBARYNiL2J5YqCSJL5fJ4xPN1ji2ZPlgKVVcvZ0GP8FWckF/
 kr0Qn7kA/vFMTwVGcDWEcyv5WZwNUwnwNHenucQznz9ltAqEsEs4Krd1pCXdAiHNJEGd
 2qnfvwMUBfsnkpFeLN2Ttw3lap1mG3BelIl8y86M5jAI6qPqnFbbAEHs6BVbNB/lQL9C
 JGdQ==
X-Gm-Message-State: APjAAAXGUzbdPppM3DBFczlR5xqoBlM4ezWmxirhq9diec1Mz0zNtaRw
 AttCLw6167+sBAHKX+0bgWmWzBbCZ69Pphz9k+qEYc45xOSac1El+EMYerivq2VcN1tmlC5bC1i
 PFUPjuE0IupQ7FBA=
X-Received: by 2002:a17:906:e299:: with SMTP id
 gg25mr27639773ejb.333.1582188255770; 
 Thu, 20 Feb 2020 00:44:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqy/b8a+gNAqDLVSrj8ChCPmdCLOis8E9BKe1oqkhqCzcheBlut+Au6wOVDeZyDXjRMdhdVDhA==
X-Received: by 2002:a17:906:e299:: with SMTP id
 gg25mr27639742ejb.333.1582188255378; 
 Thu, 20 Feb 2020 00:44:15 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id d23sm80155ejt.53.2020.02.20.00.44.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 00:44:14 -0800 (PST)
Subject: Re: Program counter stuck at 0xFFFFFFFC when emulating e5500
 processor on T4240-RDB board
To: Wayne Li <waynli329@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, qemu-ppc <qemu-ppc@nongnu.org>
References: <CAM2K0npCdHfCeMCKO9TX_ifQGDZFFNyMEKH2qByYL9SnXnaPmw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <838be9cf-2d3c-f807-7f1d-6a50f95a5228@redhat.com>
Date: Thu, 20 Feb 2020 09:44:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAM2K0npCdHfCeMCKO9TX_ifQGDZFFNyMEKH2qByYL9SnXnaPmw@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On 2/20/20 6:40 AM, Wayne Li wrote:
> Dear QEMU list members,

No subject: it is unlikely your question get noticed...

Also you didn't Cc'ed the people who might help you (doing that for you):

./scripts/get_maintainer.pl -f target/ppc/cpu-models.c
David Gibson <david@gibson.dropbear.id.au> (maintainer:PowerPC TCG CPUs)
qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs)
qemu-devel@nongnu.org (open list:All patches CC here)

> This will kind of be a repost but I'd like to post my question again=20
> because I've gained some more knowledge that makes me feel that my=20
> question would be easier to answer.=C2=A0 So we developed a custom-made Q=
EMU=20
> VM that emulates a custom machine that has an e5500 processor.=C2=A0 I'm=
=20
> running this VM on a T4240-RDB board which has an e6500 processor and=20
> I'm trying to get the VM running with KVM enabled.=C2=A0 The problem I'm=
=20
> having is the program counter refuses to increment at all.=C2=A0 It just=
=20
> stays at the address 0xFFFFFFFC.=C2=A0 On a run without KVM enabled, the =
VM=20
> will also start executing at this same address but the program counter=20
> beings to increment immediately.=C2=A0 I know this is a custom QEMU VM an=
d=20
> maybe some of the startup stuff we do could be causing problems, but=20
> what could possibly stop the program counter from incrementing altogether=
?
>=20
> Also, I do have another side question.=C2=A0 When running with KVM enable=
d, I=20
> see the kernel-level ioctl call KVM_RUN running and then returning over=
=20
> and over again (by the way before the VM kinda grinds to a halt I only=20
> see QEMU make the KVM_RUN call twice, but the kernel-level ioctl=20
> function is being called over and over again for some reason).=C2=A0 And =
each=20
> time the KVM_RUN call returns, the return-from-interrupt takes the VM to=
=20
> the address 0xFFFFFFFC.=C2=A0 What is the KVM_RUN ioctl call used for?=C2=
=A0 Why=20
> is it being called over and over again?=C2=A0 Maybe if I understood this=
=20
> better I'd be able to figure out what's stopping my program counter from=
=20
> incrementing.
>=20
> -Thanks, Wayne Li


