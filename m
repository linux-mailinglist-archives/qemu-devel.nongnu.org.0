Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4B42D973A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 12:17:10 +0100 (CET)
Received: from localhost ([::1]:54944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kolqn-0004lT-Lc
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 06:17:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1kolpE-0004HA-Vw
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:15:33 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:48974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1kolpB-0008CD-7b
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:15:31 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BEBDnji186239;
 Mon, 14 Dec 2020 11:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=a4ZfLBNrCAXAR0mj3pjI7v7biXs2wzXkONLxove+nBg=;
 b=ndXt0HR5Cbu624Oi1ClkppX4CCyxuc7gkDf/PGZ0UhiPE66rJCePAIwCW0CN9lkAJeGC
 ALmn1vPtbnba4BmFJg1DK9w8VyhMgMT59PNjUf1iXKW8alokzgbunqhUA8iJvEefEQFz
 fcRFZNxFhkP88iuYXmP6d7V9uq090ZTP4Ff7gLwRoJTU7caAGBjNAg18SxzXJ/w2fNGv
 3ePdGDwVeoAv23ADwtNQeiqSkcsPwLnP7Cl3P9PIZlqPY/oLgR1ISRMfSA8eJG2HYDl3
 kN0izpQsKDmC/h+rg+pxXFSFSeM2Kpg7amul9lMV6NE06MF6i5cJvqNuHn30SHzLshex TA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 35ckcb4spp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Dec 2020 11:15:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BEBBH7N082216;
 Mon, 14 Dec 2020 11:15:23 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 35e6jp8xqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Dec 2020 11:15:23 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BEBFM2m011631;
 Mon, 14 Dec 2020 11:15:22 GMT
Received: from [10.175.19.81] (/10.175.19.81)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 14 Dec 2020 03:15:22 -0800
Subject: Re: [PATCH] Add support for pvpanic pci device
To: Peter Maydell <peter.maydell@linaro.org>
References: <1603891979-11961-1-git-send-email-mihai.carabas@oracle.com>
 <CAFEAcA8dNrYt8vw5y6V08kqOmGj4=XvgGexU3VPh01sUHZLDrQ@mail.gmail.com>
From: Mihai Carabas <mihai.carabas@oracle.com>
Message-ID: <d0423102-432d-8a74-182d-2b81db33d416@oracle.com>
Date: Mon, 14 Dec 2020 13:15:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8dNrYt8vw5y6V08kqOmGj4=XvgGexU3VPh01sUHZLDrQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: ro
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012140079
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012140079
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=mihai.carabas@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

La 14.12.2020 13:03, Peter Maydell a scris:
> On Wed, 28 Oct 2020 at 14:17, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>>
>> This patchset adds support for pvpanic pci device. The patchset was assembled
>> from chuncks from some old patches [1] from 2018 which were left unmerged and
>> some additions from me.
>>
>> How to test this:
>> /usr/bin/qemu-system-aarch64 \
>>          -machine virt,gic-version=3 -device pvpanic-pci
>>
>> After that you need to run a Linux kernel as guest, but you have to also apply
>> the patches I will send for adding pci support for the pvpanic driver.
> 
> Hi; I've reviewed most of the patches. I'm in principle in favour
> of this, but the structuring of how the ISA and PCI versions of
> the device are configured and built needs a little work. You
> also need to sort out allocation of a PCI ID for it.

Thank you for your feedback. I will apply it in the next days and send a 
new revision.

Thank you,
Mihai

> 
> thanks
> -- PMM
> 


