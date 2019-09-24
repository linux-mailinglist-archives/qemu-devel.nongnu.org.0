Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51943BC370
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 09:54:19 +0200 (CEST)
Received: from localhost ([::1]:42140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCfeM-0001XO-Bb
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 03:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42657)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <darren.kenny@oracle.com>) id 1iCfaD-0006ch-Vx
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 03:50:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <darren.kenny@oracle.com>) id 1iCfaC-0008Il-3F
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 03:50:01 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:50402)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <darren.kenny@oracle.com>)
 id 1iCfaB-0008I5-I9
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 03:50:00 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8O7n55P109681;
 Tue, 24 Sep 2019 07:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=ZMb4S8XFObjCjVPE8VGQmRrkSMq1KXQsRQ82nY5qXC8=;
 b=iGC1mFEOGpPoYmxFO1xFlYMBJ5Kv244h2TvUN+Y2H5A/jY9Ue5Bl6whC/azCCL8+yioO
 RNJoG/JDtTRedm7hnD8H+sT8bQ6a/LtfIeLTVcs8gKRuyRdIgxzLRcDkUMZ2JO80sT7s
 Wil5Z335FIEh4rZjzMUdLqXxuW3yfwtdCvYzxM/WXV/5iAOuGMAhY8qkeX6/I2Hc7Xlz
 oFpfld5/sb9QE8j/T0vk5yqd6QOUG4tqxDDTUwILNVkerhWhCjhUEZWLesOc5ysdfbJA
 ouqRQMRWMa9XIAfYQT1lz63w8ob3r3QDiEN+PaZff//1ILm6/1lhh/Wl0BY3uxstd8zR RQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2v5btpv6s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Sep 2019 07:49:55 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8O7n009067153;
 Tue, 24 Sep 2019 07:49:55 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2v6yvr4xqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Sep 2019 07:49:55 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8O7nrjN007370;
 Tue, 24 Sep 2019 07:49:53 GMT
Received: from starbug-lenovo.ie.oracle.com (/10.169.104.251)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 24 Sep 2019 00:49:53 -0700
Date: Tue, 24 Sep 2019 08:49:51 +0100
From: Darren Kenny <darren.kenny@oracle.com>
To: "Oleinik, Alexander" <alxndr@bu.edu>
Subject: Re: [Qemu-devel] [PATCH v3 18/22] fuzz: expose fuzz target name
Message-ID: <20190924074951.t57gryclg3hb43q2@starbug-lenovo.ie.oracle.com>
Mail-Followup-To: "Oleinik, Alexander" <alxndr@bu.edu>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "bsd@redhat.com" <bsd@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
References: <20190918231846.22538-1-alxndr@bu.edu>
 <20190918231846.22538-19-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20190918231846.22538-19-alxndr@bu.edu>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9389
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909240079
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9389
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909240079
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "bsd@redhat.com" <bsd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 18, 2019 at 11:19:45PM +0000, Oleinik, Alexander wrote:
>This is needed for the qos-assisted fuzzers which walk the qos tree and
>need a way to check if the current path matches the name of the fuzz
>target.
>
>Signed-off-by: Alexander Oleinik <alxndr@bu.edu>
>---
> tests/fuzz/fuzz.c | 3 +++
> tests/fuzz/fuzz.h | 1 +
> 2 files changed, 4 insertions(+)
>
>diff --git a/tests/fuzz/fuzz.c b/tests/fuzz/fuzz.c
>index 833f436731..d44dab7360 100644
>--- a/tests/fuzz/fuzz.c
>+++ b/tests/fuzz/fuzz.c
>@@ -33,6 +33,9 @@ void set_fuzz_target_args(int argc, char **argv)
>         fuzz_target->main_argv = argv;
>     }
> }
>+char *get_fuzz_target_name(void){

To avoid inadvertent changes you might want to make this 'const
char*' as the return type.

Thanks,

Darren.

>+    return fuzz_target->name->str;
>+}
>
> void reboot(QTestState *s)
> {
>diff --git a/tests/fuzz/fuzz.h b/tests/fuzz/fuzz.h
>index 73af029c82..d9d0bf11a8 100644
>--- a/tests/fuzz/fuzz.h
>+++ b/tests/fuzz/fuzz.h
>@@ -19,6 +19,7 @@ typedef struct FuzzTarget {
> } FuzzTarget;
>
> void set_fuzz_target_args(int argc, char **argv);
>+char *get_fuzz_target_name(void);
> void reboot(QTestState *);
> void fuzz_add_target(const char *name, const char *description, FuzzTarget
>         *target);
>-- 
>2.23.0
>
>

