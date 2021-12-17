Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177FD47890C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 11:37:04 +0100 (CET)
Received: from localhost ([::1]:56608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myAbn-0005PV-6w
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 05:37:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myAaP-0003vV-0l; Fri, 17 Dec 2021 05:35:38 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:33283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myAaM-0003wb-8I; Fri, 17 Dec 2021 05:35:36 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M734j-1mrJUm20wZ-008bX7; Fri, 17 Dec 2021 11:35:19 +0100
Message-ID: <ab7fe58c-eeb6-d0fd-12fa-e91d84da09d2@vivier.eu>
Date: Fri, 17 Dec 2021 11:35:17 +0100
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
X-Provags-ID: V03:K1:DIHbins1fQ3cy+VvQ5++OUbh3FbFHqCduuoooN+szbZq9Futy+P
 NLnc9Njym/JmZ1jXSobuS36MYLb/nn1X96daeSIXWTRmk9fhI8zuzabONsGWPtNKqEMs31C
 eoMMaoExzbac3Cr3Li59FXeggbRH0Ste+jiaH6+a2bvZK8elhpCMJsYnRul7IdnuxmbCUh6
 tgneY48EoRZbPhAbxlUbQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:olIidJHom4Q=:JEFiWQuHfR2vjlONxnqkyC
 FULdUxqAABe+mHV+MIwYn3TkR93dlaL807IE8+NwlQ/5RJqbWdcpwXO8G00y/29E7kA4iTKtZ
 uHOAplUMAVJUf87MuTxXBqz4HQSS3JD18FNKntuX1dZMdeJBa3qC5ClS/vsb4E7JFNsUKL2b+
 CNFxJlML+1I9OSbNAxUYQ5Wis7aqcBjBc61pbHfGh6Uz1m9EdBOsf52VunrvRNSG6ry7GusLR
 VUJONHyKkiZCRZhOCqEbXp35106Rm0kOR4pmKvYTaQHtRtaV9nzATnmYVyf4jjARRrlejCzay
 snSQEV5d/OkDTB4aGGiTyiAQqHM24cyHrz/e9wC+t64KtyM2Mr1dHsx+vi5vGF9tnx4yxKFRC
 9fpe6mMww6+9Ljk0Hub8mWAvoEzr4/vfsZorQp//Bt0QBxhu2WjNjC6rSxsYGrDuYPasxhRkf
 hFknQ2Mt5yWVQwphOrowul5cobePE7Eb7tUkbmYpf2WAX5sGidBx2FOEgUBS0JXLQ9iIjNpCk
 s9tl0GRqQ+Y4WcLPM1SmL/WFURB0aP7jLu8bWjZUWy4/cFA00xuAzYwaIcnjvb3mp0bds9neG
 ZDblD+ITJ3km8sYk/ux13cj+4txey/0uhtC3pZaKSZ0/+VmZx1rQKinIRMJEw1mMMw1nV4WNz
 O3IDoSQFbk1jbm34Nzr/k2SVtkDbj7pGt8gqVMjQy+4bYzWmBe1B1jFEQ6FHLoo0sHo8=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Applied to my trivial-patches branch.

Thanks,
Laurent

