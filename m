Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC0C67B41D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 15:20:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKgbz-0008Ia-AS; Wed, 25 Jan 2023 09:18:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pKgbw-0008I6-Eg
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 09:18:48 -0500
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pKgbu-0005Lw-Ni
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 09:18:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1674656324; bh=qX8FjLFKAUgmo/FarYJ05TaPbgXVLXHcOnc4fsbO+qY=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=DwxRqDQjcohXSLQG33vk09g3qnzPs8OWlUQ5khYnWBopNOcJmn6QOEc8yrDZIcTj7
 qCPnTRLjA+GsP4rhCoq/T9Bl/dKBiYd9HS9plbqdRC9EGTME5ejnVyB2eDMg99hHp1
 McLdG1rY4MAbAKS7ZzgveFP2kvlixo0za9dc3ZU6Sn70U3zdTOJfosSLK3tkwdKDbG
 7Xjj5yszz886Tnb9XEfH4n1hGtOUQU3Ih9FJ5ZcJsRMMGrIlr+AB66U/9qnodlf3PN
 yc6Rb1PFIz2dttppG0IZE9Sdrty60l+Jjn3IG5hrCL0UqfPFEW7+qiArmu77jTqRHB
 Ug6DjwJN+6GSA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.173.109]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsHnm-1oWpqg2IZO-00tjKl; Wed, 25
 Jan 2023 15:18:44 +0100
Message-ID: <7b2ca9ba-8866-b2a5-e71a-f66143f9daa3@gmx.de>
Date: Wed, 25 Jan 2023 15:18:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] linux-user: Show SIGCHLD in clone() strace output
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20230125135749.4594-1-deller@gmx.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230125135749.4594-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VZvWhM+FQdt20yrMQp50FPk5j6liaEqcY69NIomgHhZ0wg/NicE
 N+Kd87h2uFWXRmltrnZKnfIrryTx2bS9z0Poa7nEPQbPn4jhyFVpIB4HvZmylU0nlgHLvqC
 7sLabRIWZ5GUqZ6apGW99yJT7aDAcxR+0NICnGIEXVdV3XUbGRzbM3jts6YZnPDNnLWPN7w
 nEQRmDs+hQrZkb5B4HQXA==
UI-OutboundReport: notjunk:1;M01:P0:Nwue8GAP9Fw=;rZkn9uGKvb3zDmJ7stysZN5dc35
 u6Q3xQmXEWFuRamaF3ANPJM6QBo5BvqyphQZwTynnvhh1FraIAnNHOvJSQWwYFZwYYy3fJgOq
 K5Xtoq3bwKBGuIo8tZrW3cVwkRFERM700BCvDv2/C9zy6nKAbRr14Zr+31topsoG0WFV32DDb
 uvEvG0LfdBbjqpjkmL1lT5hCdbEZfYdZIwX7rCxvl6qlD0j2q0/aqxojTHzEzGTXdykUMwfef
 BRVqV+DAnNx2D4VplnlQBipa/wZOr4KDbTh7z1dp5iwgsy1fOAbt9tbewqgqucHaIkZcFs7aO
 Zk+Nu5TGV6H9OBHHhGecEUPiGLCW4yKboAskxZWRXv6yNvlir2YYvhts/U7T/cdhxuj4jioC5
 IYHJoW3crPHpRPrIhomKu4EidFjefF0z1f0GQgRO++dlsL2XnZ7UY+l4+02fW20fFCUwMO/O2
 nnh2AEAXLuO5BHEUzYcqkGG9beLpbkarNkYtZH26XszXXcDfieqMvIdiVs9BzlVVP/d9Uf/N5
 b9FyUL9GWAn0lhjSkXmbx2owYzo1Q4He/xGySRiaNREX1EeikjpUywHhnJ/vU5F0GwY90pQA/
 9RkItF5N7glsPXoMpXooclmxxymMf8SSB3FX1kftoK2C9V9sM+Q3lpU9Rz413B5ApRqVxSSbq
 Wx7s8Eu2UtyjxHtq910oUxB0Kyq6mUyhCOeqkcZyr53Ar+Z+T3gfqez7qvW7FZ3Ckw0ttjce9
 g5ONWQu21/CmNbHg8aI4VFmdBtMCDzC75weU4fyTZW42P4CbZ/opmkqxF2fkGcsmhRtxwHPMU
 CJzD+T0ebzL5z6LL/wY4CzYacKMLOwEWYQvAYV41HRl+dpdEShEFcOm53vyEHGNfOftWVoa4u
 keZ8GjuhSdKRwJBsrOngccIz5PuHI2gVpD0HdP3OR03kuBi+atBkzr1oBPcvLyxbGDCQ8oTVx
 XWXFI6Zb5dZK2EMQ2EpFWB5T8r4=
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/25/23 14:57, Helge Deller wrote:
> When stracing a program, show up the SIGCHLD value the same
> way as it's done when running strace natively, e.g.:
> clone(child_stack=3D0xf7af0040, flags=3DCLONE_VM|CLONE_VFORK|SIGCHLD, ..=
.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 82dc1a1e20..3157e4b420 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -1136,6 +1136,7 @@ UNUSED static struct flags clone_flags[] =3D {
>   #if defined(CLONE_IO)
>       FLAG_GENERIC(CLONE_IO),
>   #endif
> +    FLAG_TARGET(SIGCHLD),

It's actually not 100% correct, as this would trigger for other SIGxxx val=
ues too,
which have the same bits set as TARGET_SIGCHLD. Given the fact that we onl=
y support
TARGET_SIGCHLD in clone(), it would nevertheless in most cases show the co=
rrect output.

So, probably it's best to not apply this patch it as-is.

Helge

