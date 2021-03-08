Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655C53312D8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 17:07:36 +0100 (CET)
Received: from localhost ([::1]:39624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJIPu-00050Y-RW
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 11:07:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=69416c753=graf@amazon.de>)
 id 1lJIN4-0003e0-5X
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:04:39 -0500
Received: from smtp-fw-2101.amazon.com ([72.21.196.25]:51917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=69416c753=graf@amazon.de>)
 id 1lJIMz-0001w5-SJ
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:04:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1615219474; x=1646755474;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=+AelMi3v18s6+/y1BQYDbI2IpSHlRy2T4ik8Uc3Ym70=;
 b=PzWYlCYMAk7sFRi8vIXVWrgrJIhD2AvCkvvh5+kldUVQUEB34AP7YXny
 C+YxxnykXgPRCnTBofG1NjX4XVIgQO+RMGc/X6qOty2jLwxOd2e0clFLO
 kF2NcUbDfRWHw3cOPpSWXFoc9tIpuHH7IevKnxGZv2U8S+Pu5VZT88JzM A=;
X-IronPort-AV: E=Sophos;i="5.81,232,1610409600"; d="scan'208";a="92508455"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-807d4a99.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 08 Mar 2021 16:04:19 +0000
Received: from EX13MTAUWC002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1a-807d4a99.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9E5F4A1F36; Mon,  8 Mar 2021 16:04:08 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC002.ant.amazon.com (10.43.162.240) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 8 Mar 2021 16:04:08 +0000
Received: from Alexanders-MacBook-Air.local (10.43.162.131) by
 EX13D20UWC001.ant.amazon.com (10.43.162.244) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 8 Mar 2021 16:04:00 +0000
Subject: Re: [PATCH v8] drivers/misc: sysgenid: add system generation id driver
To: Greg KH <gregkh@linuxfoundation.org>, Adrian Catangiu <acatan@amazon.com>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>, <linux-s390@vger.kernel.org>, 
 <rdunlap@infradead.org>, <arnd@arndb.de>, <ebiederm@xmission.com>,
 <rppt@kernel.org>, <0x7f454c46@gmail.com>, <borntraeger@de.ibm.com>,
 <Jason@zx2c4.com>, <jannh@google.com>, <w@1wt.eu>, <colmmacc@amazon.com>,
 <luto@kernel.org>, <tytso@mit.edu>, <ebiggers@kernel.org>,
 <dwmw@amazon.co.uk>, <bonzini@gnu.org>, <sblbir@amazon.com>,
 <raduweis@amazon.com>, <corbet@lwn.net>, <mst@redhat.com>,
 <mhocko@kernel.org>, <rafael@kernel.org>, <pavel@ucw.cz>,
 <mpe@ellerman.id.au>, <areber@redhat.com>, <ovzxemul@gmail.com>,
 <avagin@gmail.com>, <ptikhomirov@virtuozzo.com>, <gil@azul.com>,
 <asmehra@redhat.com>, <dgunigun@redhat.com>, <vijaysun@ca.ibm.com>,
 <oridgar@gmail.com>, <ghammer@redhat.com>
References: <1615213083-29869-1-git-send-email-acatan@amazon.com>
 <YEY2b1QU5RxozL0r@kroah.com>
Message-ID: <a61c976f-b362-bb60-50a5-04073360e702@amazon.com>
Date: Mon, 8 Mar 2021 17:03:58 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEY2b1QU5RxozL0r@kroah.com>
Content-Language: en-US
X-Originating-IP: [10.43.162.131]
X-ClientProxiedBy: EX13D19UWA003.ant.amazon.com (10.43.160.170) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
Content-Type: text/plain; charset="windows-1252"; format="flowed"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=72.21.196.25;
 envelope-from=prvs=69416c753=graf@amazon.de; helo=smtp-fw-2101.amazon.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alexander Graf <graf@amazon.com>
From:  Alexander Graf via <qemu-devel@nongnu.org>



On 08.03.21 15:36, Greg KH wrote:
> =

> On Mon, Mar 08, 2021 at 04:18:03PM +0200, Adrian Catangiu wrote:
>> +static struct miscdevice sysgenid_misc =3D {
>> +     .minor =3D MISC_DYNAMIC_MINOR,
>> +     .name =3D "sysgenid",
>> +     .fops =3D &fops,
>> +};
> =

> Much cleaner, but:
> =

>> +static int __init sysgenid_init(void)
>> +{
>> +     int ret;
>> +
>> +     sysgenid_data.map_buf =3D get_zeroed_page(GFP_KERNEL);
>> +     if (!sysgenid_data.map_buf)
>> +             return -ENOMEM;
>> +
>> +     atomic_set(&sysgenid_data.generation_counter, 0);
>> +     atomic_set(&sysgenid_data.outdated_watchers, 0);
>> +     init_waitqueue_head(&sysgenid_data.read_waitq);
>> +     init_waitqueue_head(&sysgenid_data.outdated_waitq);
>> +     spin_lock_init(&sysgenid_data.lock);
>> +
>> +     ret =3D misc_register(&sysgenid_misc);
>> +     if (ret < 0) {
>> +             pr_err("misc_register() failed for sysgenid\n");
>> +             goto err;
>> +     }
>> +
>> +     return 0;
>> +
>> +err:
>> +     free_pages(sysgenid_data.map_buf, 0);
>> +     sysgenid_data.map_buf =3D 0;
>> +
>> +     return ret;
>> +}
>> +
>> +static void __exit sysgenid_exit(void)
>> +{
>> +     misc_deregister(&sysgenid_misc);
>> +     free_pages(sysgenid_data.map_buf, 0);
>> +     sysgenid_data.map_buf =3D 0;
>> +}
>> +
>> +module_init(sysgenid_init);
>> +module_exit(sysgenid_exit);
> =

> So you do this for any bit of hardware that happens to be out there?
> Will that really work?  You do not have any hwid to trigger off of to
> know that this is a valid device you can handle?

The interface is already useful in a pure container context where the =

generation change request is triggered by software.

And yes, there are hardware triggers, but Michael was quite unhappy =

about potential races between VMGenID change and SysGenID change and =

thus wanted to ideally separate the interfaces. So we went ahead and =

isolated the SysGenID one, as it's already useful as is.

Hardware drivers to inject change events into SysGenID can then follow =

later, for all different hardware platforms. But SysGenID as in this =

patch is a completely hardware agnostic concept.


Alex



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




