Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1406D2F6B10
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:36:36 +0100 (CET)
Received: from localhost ([::1]:45628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08Q7-0007p9-4c
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1l08Mw-0006P2-3Y
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:33:18 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1l08Mu-0006He-3d
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:33:17 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10EJVcY9116579
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 14:33:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fKYtjIQlMK24X6N15e1KtLYfvoaraixfilh8bkVLYAQ=;
 b=P1eI6Bk4CYxPpJMeR6QEieml6g+1OHF0NvaCem4T7ZqzIqvYyLP+LEAfCO+xBfdORvrr
 BKCgBZ53eUhdpFlEccGdBm11BeJEPCo85Ujf/MMt+xk5Bjwr7Uw5XTOKGxjAx3vDIkQf
 TlW1hK85gMLmEHofOqjJ9eRz6yWoFMsjIuhc16Hrs/OMW8qgK04mlMdew9giA66KQcO4
 dUoBc5hnikeSVwoEjuQgonXnbijGPrqJnlBWGIqnYJtTjlKmdUoP7ZZZ6m5MS/W2nBYw
 H8wH8bRC2OAGm8jrq31yGE6yqbUaVelhiAhL5WgNIx9QAx+rsHaZJTDiaSQw/xqIEqg0 XA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 362ucvhch6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 14:33:06 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10EJWQuA120342
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 14:33:06 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 362ucvhcgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 14:33:06 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10EJNEXB028426;
 Thu, 14 Jan 2021 19:33:04 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 35y449fg0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 19:33:04 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10EJX49538601108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 19:33:04 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5C946A051;
 Thu, 14 Jan 2021 19:33:03 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 776926A047;
 Thu, 14 Jan 2021 19:33:03 +0000 (GMT)
Received: from [9.160.83.18] (unknown [9.160.83.18])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 14 Jan 2021 19:33:03 +0000 (GMT)
Subject: Re: [PATCH-for-5.2? v3 3/9] hw/usb: reorder fields in UASStatus
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>
References: <20201105221905.1350-1-dbuono@linux.vnet.ibm.com>
 <20201105221905.1350-4-dbuono@linux.vnet.ibm.com>
 <4677dea1-bdd2-0095-e75c-2ca6d9be0cb9@redhat.com>
 <afff8e95-ac1f-552a-c8b3-ff008947bf98@linux.vnet.ibm.com>
 <CAJ+F1CJ+v7v2QKqLfC1ZNL4Q2eTRcOJUy9RAqg4BNq8aFqE22A@mail.gmail.com>
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-ID: <2bdf9fb3-8495-f3ea-39e1-977d065fef89@linux.vnet.ibm.com>
Date: Thu, 14 Jan 2021 14:33:02 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJ+v7v2QKqLfC1ZNL4Q2eTRcOJUy9RAqg4BNq8aFqE22A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_07:2021-01-14,
 2021-01-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 suspectscore=0 bulkscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101140108
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.237,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/2021 3:17 AM, Marc-André Lureau wrote:
> 
> Any update on this patch?
> thanks

Hi,
I had been waiting for a feedback on my previous message.
I don't know the UAS subsystem that well, but can't find where the
variable-sized field that is causing the issue is actually used.

If it helps, I can send an RFC for converting

struct UASStatus {
     uint32_t                  stream;
     uas_iu                    status;
     uint32_t                  length;
     QTAILQ_ENTRY(UASStatus)   next;
};

to

struct UASStatus {
     uint32_t                  stream;
     uas_iu                    *status;
     uint32_t                  length;
     QTAILQ_ENTRY(UASStatus)   next;
};

And discuss it at that point.

Thanks,
Daniele

