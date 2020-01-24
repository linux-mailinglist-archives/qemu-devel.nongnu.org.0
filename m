Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702F8148E90
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 20:16:04 +0100 (CET)
Received: from localhost ([::1]:46756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iv4R0-0002RC-RU
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 14:16:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57280)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liam.merwick@oracle.com>) id 1iv4Ph-0001yQ-J6
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 14:14:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liam.merwick@oracle.com>) id 1iv4Pg-0001MA-K4
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 14:14:41 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:56902)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <liam.merwick@oracle.com>)
 id 1iv4Pa-0000yD-PU; Fri, 24 Jan 2020 14:14:34 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00OJDITf091426;
 Fri, 24 Jan 2020 19:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=aphHIKS+HxyX89TcvbfoeV/688kxWJiT89qFcIyE/nw=;
 b=izZqo4r93PTQkDv2ZuL+TUkT4sLZhxtvaavGqaOt/gyChpLQTFCesVZl9zah/AMVlNDo
 o9ldNVaFu8z6SxLrNL+YxG1Q2pxSvXZXIQiAusoAyzEybWMeW8hJBQxC9ukjp5v2kWs0
 9LIpJXuVfIohrrQarxP7rba9JxtZaQAMTEJGqjV+mUYYqYrxPRImXZDRv4umeJOyRsY3
 4A836SzKxkd8Pwz132h8MJlQ40ukScuxAAdNAoKAe9zxUx26jrfNw7IEMk0H4wY6oCzL
 EBANz7fBHnLitR/XB5AtK4Y2jacjy87wFMlh0fMHLCbLJFv3Ycsk+0nGYOEmcFdE8aEr JQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2xksyqtvhx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jan 2020 19:14:30 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00OJEFXU175378;
 Fri, 24 Jan 2020 19:14:30 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2xqmufn5jr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jan 2020 19:14:29 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00OJE7GU015287;
 Fri, 24 Jan 2020 19:14:08 GMT
Received: from [10.175.179.249] (/10.175.179.249)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 24 Jan 2020 11:14:07 -0800
Subject: Re: [PATCH] tests/acceptance: Add boot tests for some of the QEMU
 advent calendar images
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20200124170325.30072-1-thuth@redhat.com>
From: Liam Merwick <liam.merwick@oracle.com>
Message-ID: <59b4d74b-c09e-3c8a-e4ab-015ec405f545@oracle.com>
Date: Fri, 24 Jan 2020 19:14:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200124170325.30072-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9510
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001240157
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9510
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001240157
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/01/2020 17:03, Thomas Huth wrote:
> The 2018 edition of the QEMU advent calendar 2018 featured Linux images
> for various non-x86 machines. We can use them for a boot tests in our
> acceptance test suite.
> 
> Let's also make sure that we build the corresponding machines in Travis,
> and while we're there, drop the superfluous --python parameter (python3
> is now the only supported version anyway).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>


Reviewed-by: Liam Merwick <liam.merwick@oracle.com>


> ---
>   .travis.yml                            |  2 +-
>   tests/acceptance/boot_linux_console.py | 96 ++++++++++++++++++++++++++
>   2 files changed, 97 insertions(+), 1 deletion(-)
> 

