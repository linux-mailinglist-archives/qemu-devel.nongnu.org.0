Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5102B9237
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 13:14:02 +0100 (CET)
Received: from localhost ([::1]:33552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfip7-0003FW-Pp
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 07:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kfiek-00055F-H8
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 07:03:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kfiea-0005Nb-OD
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 07:03:18 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJC1juS015700; Thu, 19 Nov 2020 07:02:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=LhudYgp7LwyrzB9nzt7AbefNHLUSPXxp2TUOfBUDXPo=;
 b=o7fkJ6FtiGRijn5pIBAGGina1Qkkr4fdwDVKkAbDO/AV01TwrzuCzH5q/J204nfAucNa
 rSDhumvhzocyOnYOe8/BJRE9br990fWreOtVQuqohH0GuHLuJToEqZxt199FTDOtn8l6
 2ZREDQAofFAU97dwCecaexqsUmO3S6UD1BE3RlwFfM3ZiZO48y6jHALi+EGv8/NZMy1b
 dQfs2nYv11E+56oqOxagsGt038uHKmiedaax3ZRJZfKikMWmOKS32MsDizVv5yuRtoG4
 DJ/QUmor6hHENVRhLoGdjSrrBYaA7MwUVpIhV478qlAEHbIyLQlN+oQx9Ao/G8evUIg9 Rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34wg685eje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 07:02:25 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AJC2Mqg018550;
 Thu, 19 Nov 2020 07:02:24 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34wg685edm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 07:02:24 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AJBrJJe029665;
 Thu, 19 Nov 2020 12:02:19 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 34v69usa0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 12:02:19 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AJC2HNP63111558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 12:02:17 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4099352054;
 Thu, 19 Nov 2020 12:02:17 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.22.151])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id AFB9152051;
 Thu, 19 Nov 2020 12:02:15 +0000 (GMT)
Subject: Re: [PATCH v2] drivers/virt: vmgenid: add vm generation id driver
To: "Catangiu, Adrian Costin" <acatan@amazon.com>,
 "Graf (AWS), Alexander" <graf@amazon.de>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Jann Horn <jannh@google.com>
References: <3E05451B-A9CD-4719-99D0-72750A304044@amazon.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <300d4404-3efe-880e-ef30-692eabbff5f7@de.ibm.com>
Date: Thu, 19 Nov 2020 13:02:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <3E05451B-A9CD-4719-99D0-72750A304044@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_08:2020-11-19,
 2020-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190087
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 07:02:56
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "asmehra@redhat.com" <asmehra@redhat.com>,
 "dgunigun@redhat.com" <dgunigun@redhat.com>, KVM list <kvm@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "ghammer@redhat.com" <ghammer@redhat.com>,
 "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>, "Weiss,
 Radu" <raduweis@amazon.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Michal Hocko <mhocko@kernel.org>, Andrey Vagin <avagin@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
 linux-s390 <linux-s390@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Biggers <ebiggers@kernel.org>,
 "Singh, Balbir" <sblbir@amazon.com>, "bonzini@gnu.org" <bonzini@gnu.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, "oridgar@gmail.com" <oridgar@gmail.com>,
 Andy Lutomirski <luto@kernel.org>, "gil@azul.com" <gil@azul.com>,
 "MacCarthaigh, Colm" <colmmacc@amazon.com>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Linux API <linux-api@vger.kernel.org>, "areber@redhat.com" <areber@redhat.com>,
 kernel list <linux-kernel@vger.kernel.org>,
 Pavel Emelyanov <ovzxemul@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Willy Tarreau <w@1wt.eu>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 16.11.20 16:34, Catangiu, Adrian Costin wrote:
> - Background
> 
> The VM Generation ID is a feature defined by Microsoft (paper:
> http://go.microsoft.com/fwlink/?LinkId=260709) and supported by
> multiple hypervisor vendors.
> 
> The feature is required in virtualized environments by apps that work
> with local copies/caches of world-unique data such as random values,
> uuids, monotonically increasing counters, etc.
> Such apps can be negatively affected by VM snapshotting when the VM
> is either cloned or returned to an earlier point in time.
> 
> The VM Generation ID is a simple concept meant to alleviate the issue
> by providing a unique ID that changes each time the VM is restored
> from a snapshot. The hw provided UUID value can be used to
> differentiate between VMs or different generations of the same VM.
> 
> - Problem
> 
> The VM Generation ID is exposed through an ACPI device by multiple
> hypervisor vendors but neither the vendors or upstream Linux have no
> default driver for it leaving users to fend for themselves.

I see that the qemu implementation is still under discussion. What is 
the status of the other existing implementations. Do they already exist?
In other words is ACPI a given?
I think the majority of this driver could be used with just a different
backend for platforms without ACPI so in any case we could factor out
the backend (acpi, virtio, whatever) but if we are open we could maybe
start with something else.

