Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07923F750F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 14:27:49 +0200 (CEST)
Received: from localhost ([::1]:38228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIs0S-0003GS-Qp
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 08:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pc@us.ibm.com>)
 id 1mIryQ-0001g4-UI; Wed, 25 Aug 2021 08:25:42 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48264
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pc@us.ibm.com>)
 id 1mIryO-00056D-PG; Wed, 25 Aug 2021 08:25:42 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17PC3uYX025137; Wed, 25 Aug 2021 08:25:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 message-id : references : mime-version : content-type : in-reply-to :
 subject; s=pp1; bh=0y9Aio61Sz6K0PMoRRvG912JprjfF7o3r4kvxJbw7I4=;
 b=VmslQyb6MmOrx5N4a7lxMXna2ptGwd4UGI5sFyQynTSv8JWAIfMAU0M+VZTRsFQuWUNb
 DnjbDMyXoC36lvFLzVk1nRMqGfQyplNkeSQsXZilx/XooaN98BOp0PnNvqPF1UNRIT+g
 bSl0UhMcChGgQNUGzNLjT58B5BTOl+5Kic10jilwXRX8DrtKR7UbCQoRtmE0bo4jwix5
 1HzJeCN7zlsBVeT0WqXh/oOFDfuap6gqzA18vfKGdLYdfT82Qpx95O65b8n43yW6Yl98
 TcmYYdoLly6sWBLpcxE5e5iofcMfuac5GQw9w7YToNb16Vn5KLgv4yhim2e/4nDsACYS QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ank95d915-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 08:25:29 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17PC4Hpj030754;
 Wed, 25 Aug 2021 08:25:23 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ank95d90n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 08:25:23 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17PCH96k020136;
 Wed, 25 Aug 2021 12:25:22 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 3ajs4d09tq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 12:25:22 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17PCPJbn24838612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Aug 2021 12:25:19 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 745C06E058;
 Wed, 25 Aug 2021 12:25:19 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE8C76E056;
 Wed, 25 Aug 2021 12:25:17 +0000 (GMT)
Received: from li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com (unknown
 [9.160.174.60])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 25 Aug 2021 12:25:17 +0000 (GMT)
Date: Wed, 25 Aug 2021 07:25:10 -0500
From: "Paul A. Clarke" <pc@us.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20210825122510.GB1113121@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
References: <20210824163032.394099-1-danielhb413@gmail.com>
 <20210824163032.394099-3-danielhb413@gmail.com>
 <YSXHU2NJbJpI6spA@yekko>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSXHU2NJbJpI6spA@yekko>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5_zh0Ze2MzdnlXS50Sdi2g1P2cIlL2tf
X-Proofpoint-GUID: KA3yBMtn_3lSdFOSCNU82pefdgu8LTE7
Subject: RE: [PATCH v2 02/16] target/ppc: add user read functions for MMCR0 and
 MMCR2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-25_05:2021-08-25,
 2021-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=777 clxscore=1011
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108250072
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pc@us.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 25, 2021 at 02:30:11PM +1000, David Gibson wrote:
> On Tue, Aug 24, 2021 at 01:30:18PM -0300, Daniel Henrique Barboza wrote:
> > From: Gustavo Romero <gromero@linux.ibm.com>
> > 
> > This patch adds handling of UMMCR0 and UMMCR2 user read which,
> > according to PowerISA 3.1, has some bits ommited to the
> 
> Nit: One 'm' in "omited".

Let's trade that extra 'm' for a 't', FTW:  "omitted".  :-)

PC

