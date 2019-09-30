Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74A8C222E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 15:36:33 +0200 (CEST)
Received: from localhost ([::1]:52546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEvqq-0004oK-L1
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 09:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38859)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mihajlov@linux.ibm.com>) id 1iEvCu-0000nX-TS
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 08:55:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mihajlov@linux.ibm.com>) id 1iEvCt-0005Yk-P7
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 08:55:16 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45976)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mihajlov@linux.ibm.com>)
 id 1iEvCt-0005Ww-Ga
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 08:55:15 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8UCkog7088801
 for <qemu-devel@nongnu.org>; Mon, 30 Sep 2019 08:55:11 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2va35s4em2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 30 Sep 2019 08:55:09 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <mihajlov@linux.ibm.com>;
 Mon, 30 Sep 2019 13:54:56 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 30 Sep 2019 13:54:53 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8UCsqKo50462818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Sep 2019 12:54:52 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE09952057;
 Mon, 30 Sep 2019 12:54:51 +0000 (GMT)
Received: from oc6604088431.ibm.com (unknown [9.152.222.35])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A547A52051;
 Mon, 30 Sep 2019 12:54:51 +0000 (GMT)
Subject: Re: Arch info lost in "info cpus"
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Sergio Lopez <slp@redhat.com>
References: <87blv2i5ha.fsf@redhat.com> <20190930084551.GB2759@work-vm>
From: Viktor Mihajlovski <mihajlov@linux.ibm.com>
Date: Mon, 30 Sep 2019 14:54:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930084551.GB2759@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19093012-0016-0000-0000-000002B21114
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19093012-0017-0000-0000-00003312EC32
Message-Id: <ff9deaa5-8bb6-cd58-6921-31729288e448@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-30_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909300133
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
X-Mailman-Approved-At: Mon, 30 Sep 2019 09:34:24 -0400
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
Cc: imammedo@redhat.com, tao3.xu@intel.com, mihajlov@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 9/30/19 10:45 AM, Dr. David Alan Gilbert wrote:
> * Sergio Lopez (slp@redhat.com) wrote:
>> Hi,
>>
>> Commit 137b5cb6ab565cb3781d5337591e155932b4230e (hmp: change
>> hmp_info_cpus to use query-cpus-fast) updated the "info cpus" commit to
>> make it more lightweight, but also removed the ability to get the
>> architecture specific status of each vCPU.
>>
>> This information was really useful to diagnose certain Guest issues,
>> without the need of using GDB, which is more intrusive and requires
>> enabling it in advance.
>>
>> Is there an alternative way of getting something equivalent to what
>> "info cpus" provided previously (in 2.10)?
> Even the qemp equivalent, query-cpus is deprecated.
> (Although we do call the underlying query-cpus in 'info numa' as well)
This obviously went by unnoticed back then. Query-cpus-fast should serve
the same purpose as query-cpus there, being less intrusive on the VM and
allow to complete the deprecation process, if this is still wanted. If
not, adding an option that lets hmp 'info cpus' call the old API doesn't
seem unreasonable.

>
> Dave
>
>> Thanks,
>> Sergio.
>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>
-- 
Kind Regards,
   Viktor


