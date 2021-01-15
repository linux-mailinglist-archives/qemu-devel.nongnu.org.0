Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1706A2F76C5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 11:35:47 +0100 (CET)
Received: from localhost ([::1]:33794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0MSI-0007SJ-4N
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 05:35:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1l0MRB-0006EO-ED
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:34:37 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:35944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1l0MR7-0003lH-Re
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:34:36 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10FAY07X102306;
 Fri, 15 Jan 2021 10:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=bH8krPDQpvZ8uhal4dD6hrOQS2VRbKQAWKBkSTC5SMY=;
 b=WHNdNpvTM4lGfzGq/cK3/7Mt1IzIX/GhWGm33yx9HlEdC4doPkVayjdC5u5vTnHDUT06
 nZ8LMSfDUaD3WTJ1aUr83suTbi8IQAjcS0XV53RZTXwwfb+6pooqDjZOy/o+r+gu8hkD
 m/UVHq2nLX+wK1ut1hQ1XAARt8NH05krmccD/Vt0lWGEzX+iGkjUgpd0IPGzUII0x4La
 NRAQdakpQoVFsW2STLNlmdIomqgP8N6RJvXDeLW7jFuWqMR8EFFjatNAIMIy5GcJ0Ow4
 pxZJESmy0ZFmd3YY4RQo8CV2+n4rhzR0P9VjYQcpGN9mPmGPG4hNI1eeb9q3qebgKqFq 7A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 360kg24d0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 10:34:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10FATlkj172052;
 Fri, 15 Jan 2021 10:34:00 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 360keb172r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 10:33:59 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10FAXvgd017182;
 Fri, 15 Jan 2021 10:33:57 GMT
Received: from starbug-mbp.localdomain (/79.97.215.145)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 15 Jan 2021 02:33:57 -0800
Received: by starbug-mbp.localdomain (Postfix, from userid 501)
 id 401EF2DEBC10; Fri, 15 Jan 2021 10:33:58 +0000 (GMT)
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH] fuzz: Add virtio-9p configurations for fuzzing
In-Reply-To: <20210114221748.503565-1-alxndr@bu.edu>
References: <20210114221748.503565-1-alxndr@bu.edu>
Date: Fri, 15 Jan 2021 10:33:58 +0000
Message-ID: <m2sg72fq09.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150063
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 clxscore=1011 impostorscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150063
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=darren.kenny@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On Thursday, 2021-01-14 at 17:17:48 -05, Alexander Bulekov wrote:
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

In general this look good, so:

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

but I do have a question below...

> ---
>  tests/qtest/fuzz/generic_fuzz_configs.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
> index 7fed035345..ffdb590c58 100644
> --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> @@ -59,6 +59,18 @@ const generic_fuzz_config predefined_configs[] = {
>          .name = "virtio-mouse",
>          .args = "-machine q35 -nodefaults -device virtio-mouse",
>          .objects = "virtio*",
> +    },{
> +        .name = "virtio-9p",
> +        .args = "-machine q35 -nodefaults "
> +        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
> +        "-fsdev local,id=hshare,path=/tmp/,security_model=none",
> +        .objects = "virtio*",

I wonder about the use of "/tmp" rather than maybe some generated name
using mkdtemp() - I also realise that the ability to generate this and
plug it in here probably doesn't exist either, hence not holding you to
it for this patch. Also the fact that in OSS-Fuzz this is run in limited
containers.

Have you observed any changes to "/tmp" while this is running? My
concerns may be unfounded since I don't really know what state things
are in while this is executed with no running OS.

Thanks,

Darren.


