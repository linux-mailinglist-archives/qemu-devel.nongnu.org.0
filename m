Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EB26B1BE8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 08:03:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paAIL-0008R3-Il; Thu, 09 Mar 2023 02:02:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1paAIK-0008Ql-4u
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 02:02:32 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1paAII-0002HS-3l
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 02:02:31 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.56])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2BBF5208EC;
 Thu,  9 Mar 2023 07:02:20 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 9 Mar
 2023 08:02:19 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0028253eb65-5852-4702-a7ad-1d21d2294fef,
 84FD3CBE3932495D325F994F326E5295DCA257A6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a19618ae-199d-7536-aae2-aa4a07e6285b@kaod.org>
Date: Thu, 9 Mar 2023 08:02:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [qemu-web PATCH] Add a blog post about the upcoming KVM Forum 2023
To: Thomas Huth <thuth@redhat.com>, <qemu-devel@nongnu.org>
CC: Paolo Bonzini <pbonzini@redhat.com>
References: <20230308141204.718786-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230308141204.718786-1-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: d7ea8c2d-f740-494f-bd29-7e892afaa7cb
X-Ovh-Tracer-Id: 9546505313632422877
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdduhedgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgfefggfdvffdtgfejveegiedtffelgedugffhtdejteduudekfedtfefhtdevgfenucffohhmrghinhepqhgvmhhurdhorhhgpdguvghvtghonhhfrdhinhhfohenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehthhhuthhhsehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello Thomas,

one typo below,


On 3/8/23 15:12, Thomas Huth wrote:
> Based on the announcement e-mail that Paolo sent to the qemu-devel
> mailing list two days ago - let's spread the word via the blog, too!
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   _posts/2023-03-08-kvm-forum-cfp.md | 62 ++++++++++++++++++++++++++++++
>   1 file changed, 62 insertions(+)
>   create mode 100644 _posts/2023-03-08-kvm-forum-cfp.md
> 
> diff --git a/_posts/2023-03-08-kvm-forum-cfp.md b/_posts/2023-03-08-kvm-forum-cfp.md
> new file mode 100644
> index 0000000..8daf934
> --- /dev/null
> +++ b/_posts/2023-03-08-kvm-forum-cfp.md
> @@ -0,0 +1,62 @@
> +---
> +layout: post
> +title:  "KVM Forum 2023: Call for presentations"
> +date:   2023-03-08 13:45:00 +0100
> +categories: [presentations, conferences]
> +---
> +
> +[KVM Forum](https://kvm-forum.qemu.org/2023/) is an annual event that presents
> +a rare opportunity for KVM and QEMU developers and users to discuss the state
> +of Linux irtualization technology and plan for the challenges ahead. Sessions

irtualization -> virtualization

Thanks,

C.

> +include updates on the state of the KVM virtualization stack, planning for the
> +future, and many opportunities for attendees to collaborate.
> +
> +This year's event will be held in Brno, Czech Republic on June 14-15, 2023.
> +It will be in-person only and will be held right before the
> +[DevConf.CZ](https://www.devconf.info/cz/) open source community conference.
> +
> +June 14 will be at least partly dedicated to a hackathon or "day of BoFs".
> +This will provide time for people to get together and discuss strategic
> +decisions, as well as other topics that are best solved within smaller groups.
> +
> +## Call for presentations
> +
> +We encourage you to submit presentations via the
> +[KVM Forum CfP page](https://kvm-forum.qemu.org/2023/cfp).
> + Suggested topics include:
> +
> +* Scalability and Optimization
> +* Hardening and security
> +* Confidential computing
> +* Testing
> +* KVM and the Linux Kernel:
> +  * New Features and Ports
> +  * Device Passthrough: VFIO, mdev, vDPA
> +  * Network Virtualization
> +  * Virtio and vhost
> +* Virtual Machine Monitors and Management:
> +  * VMM Implementation: APIs, Live Migration, Performance Tuning, etc.
> +  * Multi-process VMMs: vhost-user, vfio-user, QEMU Storage Daemon
> +  * QEMU without KVM: Hypervisor.framework and other hypervisors
> +  * Managing KVM: Libvirt, KubeVirt, Kata Containers
> +* Emulation:
> +  * New Devices, Boards and Architectures
> +  * CPU Emulation and Binary Translation
> +
> +The deadline for submitting presentations is April 2, 2023 - 11:59 PM PDT.
> +Accepted speakers will be notified on April 17, 2023.
> +
> +## Attending KVM Forum
> +
> +Admission to KVM Forum and DevConf.CZ is free. However,
> +[registration](https://kvm-forum.qemu.org/2023/register/) is required and the
> +number of attendees is limited by the space available at the venue.
> +
> +The DevConf.CZ program will feature technical talks on a variety of topics,
> +including cloud and virtualization infrastructure—so make sure to register
> +for DevConf.CZ as well if you would like to attend.
> +
> +Both conferences are committed to fostering an open and welcoming environment
> +for everybody. Participants are expected to abide by the
> +[Devconf.cz code of conduct](https://www.devconf.info/coc/)
> +and [media policy](https://www.devconf.info/media-policy/).


