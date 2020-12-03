Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 147FD2CDA54
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 16:48:29 +0100 (CET)
Received: from localhost ([::1]:50888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkqqJ-0006x7-My
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 10:48:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1kkqni-0006BR-SV
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 10:45:46 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:46730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1kkqng-0000Sy-78
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 10:45:46 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B3FT2gZ150184;
 Thu, 3 Dec 2020 15:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=bvl/QD1qsnIQkCvv0a4+nh2yvumA/mn9LSyo8Rrs2QA=;
 b=a2+saG2fPlIGRj53LOPq8SfuQxQ7i270uAMMILNntP99NNORUqAJIUIV2NbMFU6l6kjk
 Up6/6GN0gydWiGI3aSicNwi13gtX4T3IGDAwiVbhJFfFfrQPiwiDK/6GMvyN2FbNV1UV
 7jh2jUWEIYNWKyk/z6EBy8VJXrrOfUr/cKA/EHeXxwK9MofxsOaORJvbZynG/eZf8mUA
 tSYN+3sJJBRgiTrwYY0K36fqJMNUSzT9wxbcPNHxMs1lotIjg868mpe6szvUzJyQfDCt
 I5FELAb75X4GHWzrM5DJamERM1IrJnnNubpUYlFFtESDIdHGvTkeYIpCzBDPtmAu1BdN IA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 353egkxm05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 03 Dec 2020 15:45:14 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B3FQNXn159968;
 Thu, 3 Dec 2020 15:43:13 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 3540awc499-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Dec 2020 15:43:13 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B3Fh7lD007172;
 Thu, 3 Dec 2020 15:43:07 GMT
Received: from starbug-mbp.localdomain (/79.97.215.145)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 03 Dec 2020 07:43:07 -0800
Received: by starbug-mbp.localdomain (Postfix, from userid 501)
 id A138225213C4; Thu,  3 Dec 2020 15:43:02 +0000 (GMT)
From: Darren Kenny <darren.kenny@oracle.com>
To: P J P <ppandit@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH v2 1/1] security-process: update process information
In-Reply-To: <20201203142902.474883-2-ppandit@redhat.com>
References: <20201203142902.474883-1-ppandit@redhat.com>
 <20201203142902.474883-2-ppandit@redhat.com>
Date: Thu, 03 Dec 2020 15:43:02 +0000
Message-ID: <m2eek66gl5.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=1
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 suspectscore=1
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012030094
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=darren.kenny@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Petr Matousek <pmatouse@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thursday, 2020-12-03 at 19:59:02 +0530, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> We are about to introduce a qemu-security mailing list to report
> and triage QEMU security issues.
>
> Update the security process web page with new mailing list address
> and triage details.
>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren

