Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ED62EBE20
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 14:00:47 +0100 (CET)
Received: from localhost ([::1]:42548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx8Qg-0005Mm-TH
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 08:00:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kx8PI-0004th-0l
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:59:20 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:34281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kx8PG-0001bZ-5D
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:59:19 -0500
Received: from [192.168.100.1] ([82.252.137.42]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N7AEs-1ju7ig0VES-017WJy; Wed, 06 Jan 2021 13:59:14 +0100
Subject: Re: [PATCH] linux-user: Add ETHTOOL ioctl
To: Matevz Langus <matevz.langus@borea.si>
References: <9272ff58-82a7-d687-8a33-05796c643b5b@borea.si>
 <ee004b9f-5c7a-41d0-5a81-252ca3d4270c@vivier.eu>
 <b548119a-5fcf-6a78-edbb-44cde1a4769a@borea.si>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <874452cd-77c0-d907-1545-080c6f148f3a@vivier.eu>
Date: Wed, 6 Jan 2021 13:59:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <b548119a-5fcf-6a78-edbb-44cde1a4769a@borea.si>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mGxzU5HP77msqWPbxPpcCGl46CqGK2Bfz/FrSTB/NvIsdXI2Ibk
 0lglaQx5ZouRchM49S8zuPhcuFJv7P/e8Qe8DNxK1Klyjzz9XTKLqDLHHQcWaj+PKm9CNAr
 /H3ZFEfYBeP7s00LvmLQsWDxX870TR7fqTcMVxLs6+PdMEiIBFBKTwR/6Xdzrrw9BZvcIsv
 CrjBcmxRPO7FI9mJYMIwA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BwlfX/x6UBI=:NEbN+81BnMl0qwIoVxz7fV
 e7l31QC/SmNDUv8cu2kIPiM82a15jH9mR9GVZYp79oNr41ZlPUmpIjSNx065XvfFzfvWeyF0E
 tysMvDeZKy4zuFHQxvBopVhjUjFlY3lJ5YpT0KKtEhOdxrQzOh8bI2+kGXI78ovxtVatMEQB0
 +Q6FiClL4BYJUxyexcCaCnrdmoq4MdaddymP4gUqWjmw+S8CwaLQv2Kr0/VH434SWw5UU99/6
 6QcJg325ZLW4ksyTZNJxUSgQX3eBRQ9dY0yKQiQracsa4mpMb13tFq/tXs4kvxxpKGWMQxehL
 20CjiItQRa92kGGxj5lMOYUUjKRMkCadY/4uVbKyFl9iLAOebSmuNrZLXxPiJrkiFYTytiDJ6
 ZrrFm/keBVY++s/ZFshzcEL7/im3p8FkPUW1BbOBauwDewxDa0DstmKeXFhIL
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.249,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/01/2021 à 21:07, Matevz Langus a écrit :
> Hi Laurent,

Hi Matevz,

> I know it must be more complex, but it worked for our case so I wanted to share it anyway as we did
> not find support for this in latest git, but forgot to check mailing list.

This kind of patch only works if endianness and word size are the same between the host and the guest.

> With this small patch + some others in Linux kernel we were able to execute Intel XL710 network
> adapter NVM Update utility (nvmupdate64e) which is x86_64 only binary on aarch64 Linux platform and
> upgrade NIC firmware.

Thank you to have shared your work and this information with the community :)

This kind of work is very useful.

> At least we can try if this works OK with Shu-Chun's patch as well.

Yes, please, do.

Thanks,
Laurent

