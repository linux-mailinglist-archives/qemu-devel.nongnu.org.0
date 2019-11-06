Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71B8F16E4
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 14:21:24 +0100 (CET)
Received: from localhost ([::1]:58024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSLFT-00073O-Oe
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 08:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39647)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <darren.kenny@oracle.com>) id 1iSLBt-0003dp-LG
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 08:17:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <darren.kenny@oracle.com>) id 1iSLBs-0004IC-8s
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 08:17:41 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:58318)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <darren.kenny@oracle.com>)
 id 1iSLBq-0004Gb-Cw
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 08:17:40 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA6D92YK100499;
 Wed, 6 Nov 2019 13:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=xFQhJhHW1u+i10pBwVfYTh20v02HRhjAF92zcheUlG4=;
 b=aftR30xHsLmFcWOo9g6p+dBS8Ja8ahHSVeLaWRvVMVc2LGWaPVq0unoc6asmqd6Lb1Dm
 PHdoc/6kKKPNCtc9iKqj99YqkhCBl93VrG1X4Uh9lVzwNfjTV8XVd7mj9x7XC0x17B4I
 imwyMUvTqR2a38rUu9k/3O7eC5WSeatVKP6taTNW6VJ+1+RJQZy8FinylwQOzTQuYDaG
 4Al419C/1gnUsKSC3tZcJDgmq/5aBFTncnWeIKkghD8n4Yo1K5vQMEfzV+zLOMZavZw7
 zGRaEQqv3+rGGenL02XJylJkU4lIONEotlZnfmNBS/yWA7QU0fqHWRh7+Zx5+3XltHiC Bg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2w12erdywm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Nov 2019 13:17:35 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA6DEdO4107327;
 Wed, 6 Nov 2019 13:17:34 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2w35pqy7eg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Nov 2019 13:17:34 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xA6DHYXl005342;
 Wed, 6 Nov 2019 13:17:34 GMT
Received: from starbug-mbp.localdomain (/10.175.184.49)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 Nov 2019 05:17:33 -0800
Received: from starbug-mbp (localhost [127.0.0.1])
 by starbug-mbp.localdomain (Postfix) with SMTP id E17C54AC78BC;
 Wed,  6 Nov 2019 13:17:31 +0000 (GMT)
Date: Wed, 6 Nov 2019 13:17:31 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: "Oleinik, Alexander" <alxndr@bu.edu>
Subject: Re: [PATCH v4 03/20] fuzz: Add FUZZ_TARGET module type
Message-ID: <20191106131731.ishadb4tlbscysab@starbug-mbp>
Mail-Followup-To: "Oleinik, Alexander" <alxndr@bu.edu>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20191030144926.11873-1-alxndr@bu.edu>
 <20191030144926.11873-4-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20191030144926.11873-4-alxndr@bu.edu>
User-Agent: NeoMutt/20180716
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9432
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1911060131
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9432
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1911060130
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.85
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 30, 2019 at 02:49:50PM +0000, Oleinik, Alexander wrote:
>From: Alexander Oleinik <alxndr@bu.edu>
>
>Signed-off-by: Alexander Oleinik <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

>---
> include/qemu/module.h | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/include/qemu/module.h b/include/qemu/module.h
>index 65ba596e46..684753d808 100644
>--- a/include/qemu/module.h
>+++ b/include/qemu/module.h
>@@ -46,6 +46,7 @@ typedef enum {
>     MODULE_INIT_TRACE,
>     MODULE_INIT_XEN_BACKEND,
>     MODULE_INIT_LIBQOS,
>+    MODULE_INIT_FUZZ_TARGET,
>     MODULE_INIT_MAX
> } module_init_type;
>
>@@ -56,7 +57,8 @@ typedef enum {
> #define xen_backend_init(function) module_init(function, \
>                                                MODULE_INIT_XEN_BACKEND)
> #define libqos_init(function) module_init(function, MODULE_INIT_LIBQOS)
>-
>+#define fuzz_target_init(function) module_init(function, \
>+                                               MODULE_INIT_FUZZ_TARGET)
> #define block_module_load_one(lib) module_load_one("block-", lib)
> #define ui_module_load_one(lib) module_load_one("ui-", lib)
> #define audio_module_load_one(lib) module_load_one("audio-", lib)
>-- 
>2.23.0
>
>

