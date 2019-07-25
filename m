Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2258B74482
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 06:46:43 +0200 (CEST)
Received: from localhost ([::1]:55758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqVeM-0001lJ-7d
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 00:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52905)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pagupta@redhat.com>) id 1hqVe7-0001Mt-TA
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 00:46:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pagupta@redhat.com>) id 1hqVe3-0000fb-Mf
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 00:46:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48096)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pagupta@redhat.com>) id 1hqVe3-0000fU-G1
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 00:46:23 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AEA5B30821A0;
 Thu, 25 Jul 2019 04:46:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A380D600C4;
 Thu, 25 Jul 2019 04:46:22 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
 (zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92A971800205;
 Thu, 25 Jul 2019 04:46:22 +0000 (UTC)
Date: Thu, 25 Jul 2019 00:46:22 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <303147818.4367734.1564029982548.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190724070307.12568-1-richardw.yang@linux.intel.com>
References: <20190724070307.12568-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.65.16.59, 10.4.195.5]
Thread-Topic: docs/nvdimm: add example on persistent backend setup
Thread-Index: icLzunAsY7rOsrAdNdbgKGfeH+gbdQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 25 Jul 2019 04:46:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] docs/nvdimm: add example on persistent
 backend setup
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
Cc: ross zwisler <ross.zwisler@linux.intel.com>, mst@redhat.com,
 qemu-devel@nongnu.org, xiaoguangrong eric <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> 
> Persistent backend setup requires some knowledge about nvdimm and ndctl
> tool. Some users report they may struggle to gather these knowledge and
> have difficulty to setup it properly.
> 
> Here we provide two examples for persistent backend and gives the link
> to ndctl. By doing so, user could try it directly and do more
> investigation on persistent backend setup with ndctl.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> ---
>  docs/nvdimm.txt | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
> index b531cacd35..baba7a940d 100644
> --- a/docs/nvdimm.txt
> +++ b/docs/nvdimm.txt
> @@ -171,6 +171,32 @@ guest software that this vNVDIMM device contains a
> region that cannot
>  accept persistent writes. In result, for example, the guest Linux
>  NVDIMM driver, marks such vNVDIMM device as read-only.
>  
> +Backend File Setup Example
> +..........................
> +
> +Here is two examples for how to setup these persistent backend on
> +linux, which leverages the tool ndctl [3].
> +
> +It is easy to setup DAX device backend file.
> +
> +A. DAX device
> +
> +    ndctl create-namespace -f -e namespace0.0 -m devdax
> +
> +The /dev/dax0.0 could be used directly in "mem-path" option.
> +
> +For DAX file, it is more than creating the proper namespace. The
> +block device should be partitioned and mounted (with dax option).
> +
> +B. DAX file
> +
> +    ndctl create-namespace -f -e namespace0.0 -m fsdax
> +    (partition /dev/pmem0 with name pmem0p1)
> +    mount -o dax /dev/pmem0p1 /mnt
> +    (dd a file with proper size in /mnt)
> +
> +Then the new file in /mnt could be used in "mem-path" option.
> +
>  NVDIMM Persistence
>  ------------------
>  
> @@ -212,3 +238,5 @@ References
>      https://www.snia.org/sites/default/files/technical_work/final/NVMProgrammingModel_v1.2.pdf
>  [2] Persistent Memory Development Kit (PMDK), formerly known as NVML
>  project, home page:
>      http://pmem.io/pmdk/
> +[3] ndctl-create-namespace - provision or reconfigure a namespace
> +    http://pmem.io/ndctl/ndctl-create-namespace.html
> --

Reviewed-by: Pankaj Gupta <pagupta@redhat.com>

> 2.17.1
> 
> 
> 

