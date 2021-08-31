Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F793FCA9C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 17:15:30 +0200 (CEST)
Received: from localhost ([::1]:38002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL5U0-0002I7-WF
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 11:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mL5Ra-0000l8-Eq; Tue, 31 Aug 2021 11:12:58 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mL5RW-0002ua-91; Tue, 31 Aug 2021 11:12:58 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17VF3aCm034145; Tue, 31 Aug 2021 11:12:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=6d8HHUE2C3VxRsbNxC1cJYfB1xX7tRtFjub9DmDcLI4=;
 b=jKHwK0RtnvgHKYsUaJXy0e9UyiwOpTQrPn49S3EJh+NBstxK7HrLoF6zoJbL/og8EVMc
 DEfDObQuaPtvNaWBG3zbYNj/v4N/cDs4FT/qjWk2cCtHod6nXnvWAAgIXnCvQGfzSD/i
 7jBnzzvwSdukwk8aozB9/dfS87TviuR9IpvK8oEio8FhX1mMNCIfROSP4Z1dd56CUduz
 tM60F+AWqKa0RNC/WWcdkaedlq4mCyjSyunSGsvjHajpfQuftKRELlkZAqTh3WNZXfFS
 SnRJcjFYdhqvRBku34W4cd+rYxrVJPYA7iccCFb9TEDq04jxl2uq8+pxGd/kL/OeeTkV mw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3asndxkjat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Aug 2021 11:12:38 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17VF7cw0027070;
 Tue, 31 Aug 2021 15:12:37 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 3aqcsby9ty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Aug 2021 15:12:37 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17VFCZp739322064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Aug 2021 15:12:35 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D14BC11206F;
 Tue, 31 Aug 2021 15:12:35 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A41A2112066;
 Tue, 31 Aug 2021 15:12:34 +0000 (GMT)
Received: from localhost (unknown [9.163.21.109])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 31 Aug 2021 15:12:34 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>, BALATON Zoltan
 <balaton@eik.bme.hu>
Subject: Re: QEMU-KVM offers OPAL firmware interface? OpenBSD guest support?
In-Reply-To: <YS13btS1TgRWIGkI@yekko>
References: <HgtFZEnabNjIrsVI3x8MYs2QYSCG4IFStP0MR3qwPWBmXW9kDmQmIwQEWHMVdJbUCu-XvHdMpZGe3pr-B91s1D7y6cn9SVzhxEYms5c3p0o=@protonmail.com>
 <20210827180259.3720d58d@bahia.lan>
 <56141ff67838992a@bloch.sibelius.xs4all.nl>
 <20210827190053.6c68def5@bahia.lan>
 <25bfa81c-9498-4e82-a848-1fbb1c188ff1@kaod.org>
 <561422a20e4f9ae2@bloch.sibelius.xs4all.nl>
 <51bff28d-4779-b023-fee6-b3e9196b7ec5@kaod.org>
 <3QoYEEZauH3xXwC2NcJFnrHe4IaWwu2fqEvtR6tR3RHsY_b0bsyz0oQdcI0b1zdwnXbXhl6bCtaUiyWQjbYgnx5U-Ov_Lm3tMGdMkTwZC88=@protonmail.com>
 <YSyBUSxBiH+UYE/Y@yekko> <341991bb-5cb4-646d-6df-10f61bb8f27b@eik.bme.hu>
 <YS13btS1TgRWIGkI@yekko>
Date: Tue, 31 Aug 2021 12:12:31 -0300
Message-ID: <87o89dveao.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eUPNgtYhVFHMeeFwt1tReZNUNXtfuZC5
X-Proofpoint-GUID: eUPNgtYhVFHMeeFwt1tReZNUNXtfuZC5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-31_07:2021-08-31,
 2021-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1011 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=975 adultscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108310080
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> writes:

>> > * KVM PR doesn't currently work properly on POWER9, and getting it
>> >   working would be a significant amount of work
>> > * The way KVM PR works means it's very fiddly to get right, so it's
>> >   unlikely to ever be suitable for production work
>> > * Depending on host and guest cpu models there might be a few corner
>> >   cases it can never get exactly right
>> 
>> Out of curiosity what are the problems with KVM-PR on POWER9 currently and
>
> I don't know entirely.  My point is that I've never had the time
> and/or interest to investigate (and to my knowledge no-one else has
> either).  The biggest is likely to be that PR also needs to emulate to
> some extent the guest CPU's MMU.  That means adding support for the
> POWER9 radix-MMU, which would be avery large job.  There are probably
> other problems as well: I vaguely recall that if you attempt to boot a
> kernel, the first problem you hit is a new-in-POWER9 privileged SPR
> which PR doesn't emulate.

Just as a data point, I recently ran KVM-PR in POWER9/HPT. Works both in
bare-metal and nested. For a very simple guest, at least.

qemu-system-ppc64 -accel kvm -display none -vga none -machine \
pseries,cap-ccf-assist=off,cap-large-decr=off,cap-fwnmi=off,kvm-type=PR,kernel-irqchip=off \
-serial mon:stdio -smp 2 -m 1024 -kernel ~/vmlinux-guest -initrd \
~/initramfs.img -append "console=hvc0 debug mitigations=off"

I needed kernel-irqchip=off to avoid an issue with XICS and
mitigations=off because it seems we don't emulate the mtspr TRIG2
instruction which is used for L1 cache flush in some mitigations.

About running PR in radix, the code has this comment:

static int kvmppc_core_check_processor_compat_pr(void)
{
	/*
	 * PR KVM can work on POWER9 inside a guest partition
	 * running in HPT mode.  It can't work if we are using
	 * radix translation (because radix provides no way for
	 * a process to have unique translations in quadrant 3).
	 */
	if (cpu_has_feature(CPU_FTR_ARCH_300) && radix_enabled())
		return -EIO;
	return 0;
}

which might indicate it would not be at all possible to support PR in
Radix? I don't know enough about PR to understand why.

>> what are the corner cases that it can never get right?
>
> Well, I'm not certain they exist (at least in a way that can't be
> worked around) - but I'm not certain they don't either.  In particular
> behavioural differences in userspace (i.e. MSR[PR] == 1) between host
> and guest CPUs couldn't be handled by PR (since it wouldn't get the
> necessary trap to emulate).  Those are rare, of course, since the
> architecture is pretty strict about user mode behaviour, but I can't
> swear that none exist.  There are certainly new non-privileged
> instructions that have been added, but it might be possible to work
> around those (trap the illegal instruction and emulate if guest has it
> and host doesn't, hope the guest doesn't rely on the 0x700 trap if
> host has it and guest doesn't).
>
> Or of course you could have a big matrix of host/guest CPU userspace
> compatibility, but that in itself is not a trivial job.
>
>> This info may be
>> useful for those interested in fixing and using it and having it listed here
>> may save time debugging some known problems.
>> 
>> Regards,
>> BALATON Zoltan

