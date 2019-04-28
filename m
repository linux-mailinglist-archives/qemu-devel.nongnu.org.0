Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E19B608
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Apr 2019 16:16:01 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44648 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hKkb2-0007VT-Ay
	for lists+qemu-devel@lfdr.de; Sun, 28 Apr 2019 10:16:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.ibm.com>) id 1hKkZn-000776-Gk
	for qemu-devel@nongnu.org; Sun, 28 Apr 2019 10:14:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.ibm.com>) id 1hKkZl-00085i-N5
	for qemu-devel@nongnu.org; Sun, 28 Apr 2019 10:14:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39464)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanb@linux.ibm.com>)
	id 1hKkZj-00084X-JG
	for qemu-devel@nongnu.org; Sun, 28 Apr 2019 10:14:41 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x3SE3nw1124981
	for <qemu-devel@nongnu.org>; Sun, 28 Apr 2019 10:14:36 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2s5421dbcb-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Sun, 28 Apr 2019 10:14:36 -0400
Received: from localhost
	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <stefanb@linux.ibm.com>;
	Sun, 28 Apr 2019 15:14:35 +0100
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
	by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Sun, 28 Apr 2019 15:14:33 +0100
Received: from b03ledav002.gho.boulder.ibm.com
	(b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x3SEEWbC8585544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sun, 28 Apr 2019 14:14:32 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5211F136051;
	Sun, 28 Apr 2019 14:14:32 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E6FE613604F;
	Sun, 28 Apr 2019 14:14:31 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
	Sun, 28 Apr 2019 14:14:31 +0000 (GMT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20190424094557.28404-1-thuth@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Date: Sun, 28 Apr 2019 10:14:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190424094557.28404-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-MW
X-TM-AS-GCONF: 00
x-cbid: 19042814-0004-0000-0000-00001504F691
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011011; HX=3.00000242; KW=3.00000007;
	PH=3.00000004; SC=3.00000285; SDB=6.01195625; UDB=6.00626952;
	IPR=6.00976468; 
	MB=3.00026632; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-28 14:14:34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042814-0005-0000-0000-00008B6F88D3
Message-Id: <1cc6c6b6-df8f-3278-8996-ee67d2f620b9@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-04-28_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1904280104
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-devel] [PATCH] tests/tpm-tests: Use g_test_skip() to mark
 skipped tests
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/19 5:45 AM, Thomas Huth wrote:
> Since we do not use gtester anymore (which had a bug here),
> we can now use g_test_skip() to mark skipped tests.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>   tests/tpm-tests.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/tpm-tests.c b/tests/tpm-tests.c
> index 582ec0cfd4..e640777aa9 100644
> --- a/tests/tpm-tests.c
> +++ b/tests/tpm-tests.c
> @@ -22,7 +22,7 @@ static bool
>   tpm_test_swtpm_skip(void)
>   {
>       if (!tpm_util_swtpm_has_tpm2()) {
> -        g_test_message("swtpm not in PATH or missing --tpm2 support");
> +        g_test_skip("swtpm not in PATH or missing --tpm2 support");
>           return true;
>       }
>   



