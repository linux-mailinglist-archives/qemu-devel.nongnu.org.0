Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2234788C3
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 11:27:51 +0100 (CET)
Received: from localhost ([::1]:46864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myASs-0006mY-5t
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 05:27:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myAQr-0005s1-S5; Fri, 17 Dec 2021 05:25:46 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:48177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myAQp-00028e-5Q; Fri, 17 Dec 2021 05:25:45 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mbj3Y-1mMMYz0nWA-00dDxb; Fri, 17 Dec 2021 11:25:19 +0100
Message-ID: <86d06356-7ce8-ec33-29bc-df3e10ffc416@vivier.eu>
Date: Fri, 17 Dec 2021 11:25:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] docs/block-replication.txt: Fix replication top-id
 command demo
Content-Language: fr
To: Zhang Chen <chen.zhang@intel.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Wen Congyang <wencongyang2@huawei.com>, qemu-trivial@nongnu.org
References: <20211018085044.2788276-1-chen.zhang@intel.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211018085044.2788276-1-chen.zhang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KgkpI1BpFfipOUtpi8bLvGxPrwib3ckmXJ+4MaeaWHAQeneetRB
 K7rGbcAvuKVQmxCYzNxyR3wb0GQQRwjPsbo/JZZMXqWH7Osxy0gTH8uWH/sH0FflNF+W5LA
 h0EH+Ki1rMKTCFGokhWc6xPuxUo5vKe15r62MY8ZvjTyulBgZsteVpTj19Ue1bgJwDJDFqc
 c/m4UW836JaQKxh5Su9BA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:68LRt2cmTyY=:JVid4p59RxYyShoZvO4Kne
 aQZvQPpmYJ1pn/uC8mkQDpZXbavhBamx7eKYIGpBJKBfe8n8cEMWs6Rmn1hDTovRFLOtoYcVO
 pq7LrbyaTKg8FzIYer1+YVm8A8tUvYHeZlnv/anvVWugVvQKzxqX131pJydmtVOaDt5JlOBNk
 OXbz946pDL1c6gmLf9gEazc1V76lLiRH8EN95BYEZkquHs1fGWFWXWDpXahFuRwoJ+iuBB9Ai
 nLVWtcZMeCcl5dX4YOyNzkrZm4ZuEhpipPUTSy5C3EngmFXpsoZ2iDj4Lnr7MYffdfM9n4EPI
 jeluuTOepN9kJ/23D3XGVXsEZyKnVEfoNOVRhiYNQB9SBqNo1PDte1XowZBanjHcayJSZxoSt
 VRFIPN+uoeXctMAZAc1yG73EJe2t8JoqtVu5+Dxkga6LcA8wuwArWDmFIoqMM+l3e4RxmLbeq
 70tq/Mgf3l7gOwLuPaCS6463LGfpbqBOO0wxC5s7lwIxnw3PXfteZDfr90RJsSNKI6GGGwtmM
 /hpJ80cNztrSbHIjvXIYDXAATuO/UkwNNrS4tO+klKtpTKMaW03hKrENPqVGZ4LYV62U7GyWx
 PG1N8GSxnkxF2kf68WfqQgSmKcsyWgMcABAul3CvvlvVkoQIp76f1adLL+vK5DwONpeu+1SFA
 Bd+b1KbT9xMZ2vlSSfD+BFjmEAXybUkLtXl3KGlM76FG2gWKWQHFPV3/gcOvA+InvG7w=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Lukas Straub <lukasstraub2@web.de>, qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/10/2021 à 10:50, Zhang Chen a écrit :
> This demo not correct, the original childs1 can't pass the
> the bdrv_is_root_node check in replcation_start().
> Keep consistent with docs/COLO-FT.txt
> 
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>   docs/block-replication.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/block-replication.txt b/docs/block-replication.txt
> index 108e9166a8..66ad540676 100644
> --- a/docs/block-replication.txt
> +++ b/docs/block-replication.txt
> @@ -179,7 +179,7 @@ Primary:
>   
>   Secondary:
>     -drive if=none,driver=raw,file.filename=1.raw,id=colo1 \
> -  -drive if=none,id=childs1,driver=replication,mode=secondary,top-id=childs1
> +  -drive if=none,id=childs1,driver=replication,mode=secondary,top-id=top-disk1
>            file.file.filename=active_disk.qcow2,\
>            file.driver=qcow2,\
>            file.backing.file.filename=hidden_disk.qcow2,\
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

