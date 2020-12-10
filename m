Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE162D6A30
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 22:41:58 +0100 (CET)
Received: from localhost ([::1]:45258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knThE-00007s-W7
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 16:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.wilk@oracle.com>)
 id 1knTfU-0007uz-P6
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 16:40:10 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:54464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.wilk@oracle.com>)
 id 1knTfN-0005RB-L6
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 16:40:08 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BALYPWN170110;
 Thu, 10 Dec 2020 21:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=y4kI+L/gfgsW+oU0HsJEJF4gfdyqg6X8lSRToqdekK8=;
 b=ogYkZ8MUbpu2OCynprXicILs8DvvgEB3K5tGVmZvBXoPyD5db2JMPykZZwemxT6l4T7I
 sy9ghbyarImybN4xrTcq5UQLOblZuTDTUiGjZbegVS24KZDRVQcT2LmevDvoP7EtJQYT
 XJp3x/DfroDMGsGHnP/wAntmyfm9Ifxk5n5SqGqh/7wmciFjuzCelJm8pNTJ7in0R7Mg
 i2RJ3kT3RwIvaB1TgpZ5Ix8Kw1wHK0dezZCFmFl1WYg3YI9eJElHj/5eYSIBIDCkjHoz
 MyEG0LHSXiRxaO1wKYd4hLg2S70miXQUA8JML4QnHfb9zZDLboLP/Ges4NT7UnilvN4B Vg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 3581mr7pgu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Dec 2020 21:39:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BALTppG052846;
 Thu, 10 Dec 2020 21:37:28 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 358m52u5a1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 21:37:28 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BALbP5u018953;
 Thu, 10 Dec 2020 21:37:25 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 10 Dec 2020 13:37:25 -0800
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id E0A8D6A0121; Thu, 10 Dec 2020 16:39:27 -0500 (EST)
Date: Thu, 10 Dec 2020 16:39:27 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: P J P <ppandit@redhat.com>
Subject: Re: [PATCH v2 1/1] security-process: update process information
Message-ID: <20201210213927.GB29727@char.us.oracle.com>
References: <20201203142902.474883-1-ppandit@redhat.com>
 <20201203142902.474883-2-ppandit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142902.474883-2-ppandit@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012100137
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100137
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=konrad.wilk@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Petr Matousek <pmatouse@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>, Michael Roth <michael.roth@amd.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 06:29:02AM -0800, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> We are about to introduce a qemu-security mailing list to report
> and triage QEMU security issues.
> 
> Update the security process web page with new mailing list address
> and triage details.
> 
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

Thank you!

