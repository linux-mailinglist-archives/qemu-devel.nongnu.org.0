Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A027C2C0A90
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 14:47:44 +0100 (CET)
Received: from localhost ([::1]:56612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khCBz-0000k1-Mm
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 08:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1khC9W-0007zo-L9
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 08:45:10 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:49858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1khC9T-0005Jw-LB
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 08:45:10 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ANDcevM118824
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 13:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 references : message-id : date : mime-version : in-reply-to : content-type
 : content-transfer-encoding; s=corp-2020-01-29;
 bh=ZBkIlN0RF6a0tzWNTcjDLgIGdoGduTpjPO7yKnjzj6E=;
 b=feqzVObMIAnoBwhooLrTg16jgsOZQ0UrM+DgpiGm+umY/XANPatvccX9UhyGiZoOmOZe
 c+PJa9GHD8YrMWufBmrK/Yb4tth94qrEZuhNWLlvU0tFOYa1ofrz/pdii6QjpBorBp9E
 if4CE5ZoeymzKPwaVfZxCPmReN5SFWOoWvajpvQ06kIRaXzi42xJUWTrwKB2Q/nZWZ20
 pbzW1YwzSh5vrejko+ac3aqfncOqJU+CGtuH+VpQUOA7BXrQ57Nx2rH+bIXz3D5nF4Wx
 lsyNpxg9+iTAUlUNCZdEoXUp3nA+R+i/JBfIapTlAnq/olfTkzsB2XClnDcR/51iJmd9 jw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 34xrdana08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 13:44:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ANDYqPJ109894
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 13:42:23 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 34yctutm7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 13:42:23 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0ANDgMlT002279
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 13:42:22 GMT
Received: from [10.175.9.21] (/10.175.9.21)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 23 Nov 2020 05:42:22 -0800
Subject: Re: [PATCH] Add support for pvpanic pci device
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
References: <1603891979-11961-1-git-send-email-mihai.carabas@oracle.com>
 <a141323c-ecae-5c39-cf90-aae794e0099f@oracle.com>
Message-ID: <e1d099d5-4cea-4bea-e969-b6ba4b09dba4@oracle.com>
Date: Mon, 23 Nov 2020 15:42:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <a141323c-ecae-5c39-cf90-aae794e0099f@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: ro
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9813
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 malwarescore=0 spamscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011230093
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9813
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 impostorscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011230093
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

La 29.10.2020 14:30, Mihai Carabas a scris:
> La 28.10.2020 15:32, Mihai Carabas a scris:
>> This patchset adds support for pvpanic pci device. The patchset was 
>> assembled
>> from chuncks from some old patches [1] from 2018 which were left 
>> unmerged and
>> some additions from me.
>>
>> How to test this:
>> /usr/bin/qemu-system-aarch64 \
>>          -machine virt,gic-version=3 -device pvpanic-pci
>>
>> After that you need to run a Linux kernel as guest, but you have to 
>> also apply
>> the patches I will send for adding pci support for the pvpanic driver.
> 
> Here are the patches for Linux: https://lkml.org/lkml/2020/10/29/645
>>
>> [1] 
>> http://patchwork.ozlabs.org/project/qemu-devel/cover/1544095560-70807-1-git-send-email-peng.hao2@zte.com.cn/ 


Any feedback on this patchset?

Thank you,
Mihai Carabas

>>
>>
>> Mihai Carabas (1):
>>    pvpanic: break dependency on ISA_BUS adding PCI
>>
>> Peng Hao (3):
>>    hw/misc/pvpanic: Add the PCI interface
>>    hw/arm/virt: Use the pvpanic pci device
>>    pvpanic : update pvpanic document
>>
>> Philippe Mathieu-Daudé (2):
>>    hw/misc/pvpanic: Build the pvpanic device for any machine
>>    hw/misc/pvpanic: Cosmetic renaming
>>
>>   default-configs/devices/arm-softmmu.mak |  1 +
>>   docs/specs/pvpanic.txt                  | 12 ++++-
>>   hw/misc/Kconfig                         |  2 +-
>>   hw/misc/meson.build                     |  2 +-
>>   hw/misc/pvpanic.c                       | 96 
>> +++++++++++++++++++++++++++------
>>   include/hw/misc/pvpanic.h               |  3 +-
>>   include/hw/pci/pci.h                    |  1 +
>>   7 files changed, 97 insertions(+), 20 deletions(-)
>>
> 


