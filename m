Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E69DA6B100
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 23:21:41 +0200 (CEST)
Received: from localhost ([::1]:52400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnUtJ-00011o-6K
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 17:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54624)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mark.kanda@oracle.com>) id 1hnUt6-0000b5-GG
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 17:21:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.kanda@oracle.com>) id 1hnUt5-0006Cq-IT
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 17:21:28 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:43636)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.kanda@oracle.com>)
 id 1hnUt5-000693-5u
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 17:21:27 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6GL97mZ057848;
 Tue, 16 Jul 2019 21:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=l2O6mAqVKVTjuQkQpk9ZgHJN0WFiy+lqD9X+XM975z4=;
 b=LrqVZ3ogFP0ndUvopoDrBhJq0deajNUr32y6Ew+MMtekBWHQIiKj7Ya0qYx/uHTl828m
 BUJ5Cx8FPFtX7oFxuyHNOP6sp7q0dheCGbqPf/elbESgRDHYpQoyylx7IIKgA71UCRPi
 1hB2aKX5u6OZHGeGcpfNQWVmG+JZE6I4J1ETmtb8y4Du7wB7LfS1lMvtiIMP8dfPmO+2
 v3Iv+XdPbrFHLeyu6uornZM8kJoB6KfUVV6L7bC5vht3rCHBv9rC5+6XqzojUv60dt/6
 6tCllTBkxjTwRpkQq5OI+lvq4PRn60fMJuzTV1VcLQKngDFfW/fUFvJ0bSv8TtiqU6nW 8A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2tq6qtq2uv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 21:21:22 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6GL8M7m188881;
 Tue, 16 Jul 2019 21:21:22 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2tsctwgews-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 21:21:21 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6GLLLMO024088;
 Tue, 16 Jul 2019 21:21:21 GMT
Received: from [10.154.167.137] (/10.154.167.137)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 16 Jul 2019 21:21:20 +0000
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 kvm-devel <kvm@vger.kernel.org>, qemu-devel <qemu-devel@nongnu.org>
References: <20190603230408.GA7938@amt.cnet>
 <1afdac17-3f86-5e5b-aebc-5311576ddefb@redhat.com>
 <0c40f676-a2f4-bb45-658e-9758fd02ce36@oracle.com>
 <86e64a5c-bb2b-00c8-56c3-722c9b8f9db6@redhat.com>
 <48263030-768a-e8ee-302d-6d69c40b219c@redhat.com>
From: Mark Kanda <mark.kanda@oracle.com>
Organization: Oracle Corporation
Message-ID: <0d51bbbf-91cd-6e87-67ad-15a918dd9ab1@oracle.com>
Date: Tue, 16 Jul 2019 16:21:19 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <48263030-768a-e8ee-302d-6d69c40b219c@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9320
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907160259
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9320
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907160259
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.86
Subject: Re: [Qemu-devel] [patch QEMU] kvm: i386: halt poll control MSR
 support
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
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/16/2019 4:15 PM, Paolo Bonzini wrote:
> On 16/07/19 23:09, Paolo Bonzini wrote:
>>> As such, I think we should only enable halt polling if it is supported
>>> on the host - see the attached patch.
>>>
>>> ...thoughts?
>> No, it should not be enabled by default at all, at least not until we
>> can require kernel 5.2.  My mistake, sorry.  Can you post a patch?
> 
> Doh, nevermind.  This is not included in 4.1 so there's time to fix it.
>   Pfew. :)
> 

:)

I'll post a patch regardless.

Thanks/regards,
-Mark

