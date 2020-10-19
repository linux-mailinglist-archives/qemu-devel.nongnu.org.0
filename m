Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179BE29306A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 23:23:21 +0200 (CEST)
Received: from localhost ([::1]:49328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUcci-0004qg-5F
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 17:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobin@linux.ibm.com>)
 id 1kUcas-0004Ha-TA
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 17:21:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobin@linux.ibm.com>)
 id 1kUcan-0001ln-6l
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 17:21:26 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09JL1a5O106236; Mon, 19 Oct 2020 17:21:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-type : content-transfer-encoding : date : from : to : cc : subject
 : in-reply-to : references : message-id; s=pp1;
 bh=ccI9sn8O5eBIbOkDCZB4m5Ap015ezIiSoeCXEvoiKvU=;
 b=B030NoB3DVmaybOPdPuWP+zSMriOezyqZ5Cb40tQJpIciYxhHFAJ3g3ta++K5heEkq5J
 SdrVJwdX+07mYE2RR3UAwj0qYlOiqE6JcK/J8OVtw6HxjbiKCcwIySLZI+s/MU1x8oHP
 QWzXQe84qOcV+M7EdV4wP/UQ75GpL1DEPUAFSEXt1yMcKWZLI6CMgJ7GP5s+HBVT6IeQ
 yaURA4CAD7L4yoHuTNhsdxmQ3vcx6sfGiO1khuqktGaGP91RKkrrBceixyHJk2DWl2HR
 I+RfoKQTu9N5tQgY9nEjXXUbJKagzXCHiT8NcKd3dda80tuxJzzh0AJB4we1XLz+wMxp fA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 349hffj1b5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 17:21:15 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09JLCpAp139283;
 Mon, 19 Oct 2020 17:21:15 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 349hffj1at-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 17:21:15 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09JLI7jt008177;
 Mon, 19 Oct 2020 21:21:14 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 347r88ypn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 21:21:14 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09JLL8lU61407516
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Oct 2020 21:21:08 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 082E1136055;
 Mon, 19 Oct 2020 21:21:13 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EF6D13604F;
 Mon, 19 Oct 2020 21:21:12 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 19 Oct 2020 21:21:12 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 19 Oct 2020 17:21:12 -0400
From: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v5] sev: add sev-inject-launch-secret
In-Reply-To: <20201019164730.GN5733@habkost.net>
References: <20201015143713.14682-1-tobin@linux.ibm.com>
 <20201019164604.GM5733@habkost.net> <20201019164730.GN5733@habkost.net>
Message-ID: <336a84f50acf3f8661afd89946da3f50@linux.vnet.ibm.com>
X-Sender: tobin@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-19_10:2020-10-16,
 2020-10-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010190139
Received-SPF: pass client-ip=148.163.158.5; envelope-from=tobin@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 17:21:17
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thomas.lendacky@amd.com, brijesh.singh@amd.com, jejb@linux.ibm.com,
 tobin@ibm.com, qemu-devel@nongnu.org, dgilbert@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020-10-19 12:47, Eduardo Habkost wrote:
> On Mon, Oct 19, 2020 at 12:46:08PM -0400, Eduardo Habkost wrote:
>> On Thu, Oct 15, 2020 at 10:37:13AM -0400, tobin@linux.ibm.com wrote:
>> [...]
>> > diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
>> > index 88e3f39a1e..2d2ee54cc6 100644
>> > --- a/target/i386/sev-stub.c
>> > +++ b/target/i386/sev-stub.c
>> > @@ -49,3 +49,8 @@ SevCapability *sev_get_capabilities(Error **errp)
>> >      error_setg(errp, "SEV is not available in this QEMU");
>> >      return NULL;
>> >  }
>> > +int sev_inject_launch_secret(const char *hdr, const char *secret,
>> > +                             uint64_t gpa)
>> > +{
>> > +    return 1;
>> > +}
>> 
>> This doesn't match the actual function prototype.  I had to apply the 
>> following
>> fixup:
>> 
>> ---
>> diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
>> index 2d2ee54cc6..62a2587e7b 100644
>> --- a/target/i386/sev-stub.c
>> +++ b/target/i386/sev-stub.c
>> @@ -49,8 +49,10 @@ SevCapability *sev_get_capabilities(Error **errp)
>>      error_setg(errp, "SEV is not available in this QEMU");
>>      return NULL;
>>  }
>> +
>>  int sev_inject_launch_secret(const char *hdr, const char *secret,
>> -                             uint64_t gpa)
>> +                             uint64_t gpa, Error *errp)
> 
> Oops. Fixing up the fixup:

Thanks Eduardo.

-Tobin
> 
> ---
> diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
> index 62a2587e7b..e4e60d9a7d 100644
> --- a/target/i386/sev-stub.c
> +++ b/target/i386/sev-stub.c
> @@ -51,7 +51,7 @@ SevCapability *sev_get_capabilities(Error **errp)
>  }
> 
>  int sev_inject_launch_secret(const char *hdr, const char *secret,
> -                             uint64_t gpa, Error *errp)
> +                             uint64_t gpa, Error **errp)
>  {
>      error_setg(errp, "SEV is not available in this QEMU");
>      return 1;

