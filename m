Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C73A182192
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 20:09:57 +0100 (CET)
Received: from localhost ([::1]:57264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC6js-0002kj-7I
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 15:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54908)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liran.alon@oracle.com>) id 1jC6j5-0002Kv-Gm
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 15:09:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liran.alon@oracle.com>) id 1jC6j3-0001C3-N2
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 15:09:07 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:42638)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <liran.alon@oracle.com>)
 id 1jC6j3-0001B8-FE
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 15:09:05 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02BImqg3024087;
 Wed, 11 Mar 2020 19:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=ZnQDS03fmNEOUSFclKMBapvCwZ4vlsDztqUMsJCDwRg=;
 b=fpjyqfTNWo1pUDB2Cu83Gxv07i0c1QlBtXwpvSxlOuh6DRCboK+SowmHrS+8gjF83ybF
 mGEfKWnhU1wy+INQ7mPDhTKx3CYwSU+iHOAe2gKmM9NK4m7yJ4ucZxyD/jD0P/5QvXDq
 bmknmgqECffMDMN/acOwHzk+3KaYCyLPGmoSL9uCJNUjZFBPSb+HMkrkCj4x56wU3IGu
 kQJY86tHOfKnARfvnQNXopsxxvlUkqBdUaqCt+vHxW3KEA9hhEhTB/hdDX46mmy9Ip2I
 G0Wyql9oocqfYys/yObPXuVx+D5IfZgJR6qjX29WQPek+tVnPobEeIAgYJZ9D5yxAea7 DA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2yp9v68q5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 19:09:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02BIoN5c030958;
 Wed, 11 Mar 2020 19:09:03 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2yp8q16kkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 19:09:03 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02BJ8xeY005020;
 Wed, 11 Mar 2020 19:08:59 GMT
Received: from [192.168.14.112] (/79.181.212.171)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 11 Mar 2020 12:08:59 -0700
Subject: Re: [PATCH] acpi: Add Windows ACPI Emulated Device Table (WAET)
To: qemu-devel@nongnu.org
References: <158395315920.8804.12475968769225149761@39012742ff91>
From: Liran Alon <liran.alon@oracle.com>
Message-ID: <ebb59967-ebd3-374a-a2a6-1f374e4768ad@oracle.com>
Date: Wed, 11 Mar 2020 21:08:56 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158395315920.8804.12475968769225149761@39012742ff91>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9557
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003110106
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9557
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003110106
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 141.146.126.78
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
Cc: ehabkost@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 elad.gabay@oracle.com, imammedo@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/03/2020 20:59, no-reply@patchew.org wrote:
> Patchew URL: https://urldefense.com/v3/__https://patchew.org/QEMU/20200311170826.79419-1-liran.alon@oracle.com/__;!!GqivPVa7Brio!L4XXKjkDknE86ihbnytm45vsQI41J-QWVCZRoXEXtPKIAsMmknrGJWVPZpKgLyM$
>
> Hi,
>
> This series failed the docker-quick@centos7 build test. Please find the testing commands and
> their output below. If you have Docker installed, you can probably reproduce it
> locally.
>
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> make docker-image-centos7 V=1 NETWORK=1
> time make docker-test-quick@centos7 SHOW_ENV=1 J=14 NETWORK=1
> === TEST SCRIPT END ===
>
> Using expected file 'tests/data/acpi/pc/HPET'
> Looking for expected file 'tests/data/acpi/pc/WAET'
> **
> ERROR:/tmp/qemu-test/src/tests/qtest/bios-tables-test.c:367:load_expected_aml: assertion failed: (exp_sdt.aml_file)
> ERROR - Bail out! ERROR:/tmp/qemu-test/src/tests/qtest/bios-tables-test.c:367:load_expected_aml: assertion failed: (exp_sdt.aml_file)

My bad. Didn't notice there are tests which verifies ACPI haven't 
changed and requires update for such patch.
Will submit a patch for this test in v2.

-Liran



