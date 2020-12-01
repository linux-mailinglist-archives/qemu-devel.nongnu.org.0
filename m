Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A692CAA8C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 19:13:37 +0100 (CET)
Received: from localhost ([::1]:46626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkA9f-00064K-VR
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 13:13:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiederm@xmission.com>)
 id 1kk9yY-0008CV-24
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 13:02:06 -0500
Received: from out02.mta.xmission.com ([166.70.13.232]:36226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiederm@xmission.com>)
 id 1kk9yS-0000F1-4v; Tue, 01 Dec 2020 13:02:05 -0500
Received: from in01.mta.xmission.com ([166.70.13.51])
 by out02.mta.xmission.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1kk9xz-0034JV-Jl; Tue, 01 Dec 2020 11:01:31 -0700
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=x220.xmission.com) by in01.mta.xmission.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1kk9xy-00081x-2R; Tue, 01 Dec 2020 11:01:31 -0700
From: ebiederm@xmission.com (Eric W. Biederman)
To: "Catangiu\, Adrian Costin" <acatan@amazon.com>
References: <3E05451B-A9CD-4719-99D0-72750A304044@amazon.com>
 <300d4404-3efe-880e-ef30-692eabbff5f7@de.ibm.com>
 <da1a1fa7-a1de-d0e6-755b-dd587687765e@amazon.de>
 <20201119173800.GD8537@kernel.org>
 <1cdb6fac-0d50-3399-74a6-24c119ebbaa5@amazon.de>
 <106f56ca-49bc-7cad-480f-4b26656e90ce@gmail.com>
 <96625ce2-66c6-34b8-ef81-7c17c05b4c7a@amazon.com>
Date: Tue, 01 Dec 2020 12:00:58 -0600
In-Reply-To: <96625ce2-66c6-34b8-ef81-7c17c05b4c7a@amazon.com> (Adrian Costin
 Catangiu's message of "Fri, 27 Nov 2020 20:26:02 +0200")
Message-ID: <87zh2xcso5.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1kk9xy-00081x-2R; ; ; mid=<87zh2xcso5.fsf@x220.int.ebiederm.org>;
 ; ; hst=in01.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
 frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX1/R0Vga3FxvQqhqZmu6jrIe/AwE1gt5KtU=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;"Catangiu\, Adrian Costin" <acatan@amazon.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 986 ms - load_scoreonly_sql: 0.05 (0.0%),
 signal_user_changed: 26 (2.6%), b_tie_ro: 24 (2.5%), parse: 1.66
 (0.2%), extract_message_metadata: 19 (1.9%), get_uri_detail_list: 3.6
 (0.4%), tests_pri_-1000: 24 (2.5%), tests_pri_-950: 3.3 (0.3%),
 tests_pri_-900: 2.1 (0.2%), tests_pri_-90: 417 (42.3%), check_bayes:
 385 (39.1%), b_tokenize: 29 (3.0%), b_tok_get_all: 17 (1.7%),
 b_comp_prob: 6 (0.6%), b_tok_touch_all: 322 (32.7%), b_finish: 1.30
 (0.1%), tests_pri_0: 438 (44.4%), check_dkim_signature: 0.82 (0.1%),
 check_dkim_adsp: 2.9 (0.3%), poll_dns_idle: 1.02 (0.1%), tests_pri_10:
 2.1 (0.2%), tests_pri_500: 48 (4.9%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v3] drivers/virt: vmgenid: add vm generation id driver
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Received-SPF: pass client-ip=166.70.13.232; envelope-from=ebiederm@xmission.com;
 helo=out02.mta.xmission.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 01 Dec 2020 13:12:39 -0500
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
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "dgunigun@redhat.com" <dgunigun@redhat.com>, KVM list <kvm@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "ghammer@redhat.com" <ghammer@redhat.com>,
 "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>,
 Dmitry Safonov <0x7f454c46@gmail.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Michal Hocko <mhocko@kernel.org>, Andrey Vagin <avagin@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
 linux-s390 <linux-s390@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Biggers <ebiggers@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, "Singh,
 Balbir" <sblbir@amazon.com>, "bonzini@gnu.org" <bonzini@gnu.org>,
 Alexander Graf <graf@amazon.de>, Jann Horn <jannh@google.com>, "Weiss,
 Radu" <raduweis@amazon.com>, "oridgar@gmail.com" <oridgar@gmail.com>,
 Andy Lutomirski <luto@kernel.org>, "gil@azul.com" <gil@azul.com>,
 "MacCarthaigh, Colm" <colmmacc@amazon.com>, "Theodore Y.
 Ts'o" <tytso@mit.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "areber@redhat.com" <areber@redhat.com>,
 kernel list <linux-kernel@vger.kernel.org>,
 Pavel Emelyanov <ovzxemul@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Linux API <linux-api@vger.kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Willy Tarreau <w@1wt.eu>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Catangiu, Adrian Costin" <acatan@amazon.com> writes:

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

How does this differ from /proc/sys/kernel/random/boot_id?

> The VM Generation ID is a simple concept meant to alleviate the issue
> by providing a unique ID that changes each time the VM is restored
> from a snapshot. The hw provided UUID value can be used to
> differentiate between VMs or different generations of the same VM.

Does the VM generation ID change in a running that effectively things it
is running?

> - Problem
>
> The VM Generation ID is exposed through an ACPI device by multiple
> hypervisor vendors but neither the vendors or upstream Linux have no
> default driver for it leaving users to fend for themselves.
>
> Furthermore, simply finding out about a VM generation change is only
> the starting point of a process to renew internal states of possibly
> multiple applications across the system. This process could benefit
> from a driver that provides an interface through which orchestration
> can be easily done.
>
> - Solution
>
> This patch is a driver that exposes a monotonic incremental Virtual
> Machine Generation u32 counter via a char-dev FS interface.

Earlier it was a UUID now it is 32bit number?

> The FS
> interface provides sync and async VmGen counter updates notifications.
> It also provides VmGen counter retrieval and confirmation mechanisms.
>
> The generation counter and the interface through which it is exposed
> are available even when there is no acpi device present.
>
> When the device is present, the hw provided UUID is not exposed to
> userspace, it is internally used by the driver to keep accounting for
> the exposed VmGen counter. The counter starts from zero when the
> driver is initialized and monotonically increments every time the hw
> UUID changes (the VM generation changes).
> On each hw UUID change, the new hypervisor-provided UUID is also fed
> to the kernel RNG.

Should this be a hotplug even rather than a new character device?

Without plugging into udev and the rest of the hotplug infrastructure
I suspect things will be missed.

> If there is no acpi vmgenid device present, the generation changes are
> not driven by hw vmgenid events but can be driven by software through
> a dedicated driver ioctl.
>
> This patch builds on top of Or Idgar <oridgar@gmail.com>'s proposal
> https://lkml.org/lkml/2018/3/1/498


Eric

