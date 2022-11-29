Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DCE63B9D9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 07:37:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozuDP-0005C0-SR; Tue, 29 Nov 2022 01:35:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ozuDL-0005Bh-41
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 01:35:31 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ozuDI-00089k-7n
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 01:35:30 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.159])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 124BB25008;
 Tue, 29 Nov 2022 06:35:23 +0000 (UTC)
Received: from kaod.org (37.59.142.108) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 29 Nov
 2022 07:35:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002c26d5708-0179-4bb3-9858-2f0f39b229b5,
 939389A6F412F7DFB11D2BF2246AAA0AA76266E7) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 29 Nov 2022 07:35:21 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
CC: <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Add 9p test client to section "virtio-9p"
Message-ID: <20221129073521.6446d4c4@bahia>
In-Reply-To: <E1ozhlV-0007BU-0g@lizzy.crudebyte.com>
References: <E1ozhlV-0007BU-0g@lizzy.crudebyte.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: af873870-902c-40f6-a022-a2ab7d85d807
X-Ovh-Tracer-Id: 12117497751612201379
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrjeefgdelkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhffeuvdegkedugeehvedtkeehheevfeefteeuveehfeetgeevtddtgefhfefhffenucffohhmrghinhepghhithhlrggsrdgtohhmpdhgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhhouhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhupghoshhssegtrhhuuggvsgihthgvrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhthhhuthhhsehrvgguhhgrthdrtghomhdplhhvihhvihgvrhesrhgvughhrghtrdgtohhmpdhpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.42.229; envelope-from=groug@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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

On Mon, 28 Nov 2022 18:12:04 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> The 9p test cases use a dedicated, lite-weight 9p client implementation
> (using virtio transport) under tests/qtest/libqos/ to communicate with
> QEMU's 9p server.
> 
> It's already there for a long time. Let's officially assign it to 9p
> maintainers.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cf24910249..4f156a99f1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2036,6 +2036,7 @@ X: hw/9pfs/xen-9p*
>  F: fsdev/
>  F: docs/tools/virtfs-proxy-helper.rst
>  F: tests/qtest/virtio-9p-test.c
> +F: tests/qtest/libqos/virtio-9p*
>  T: git https://gitlab.com/gkurz/qemu.git 9p-next
>  T: git https://github.com/cschoenebeck/qemu.git 9p.next
>  


