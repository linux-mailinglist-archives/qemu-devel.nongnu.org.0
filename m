Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647CE461A37
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:46:24 +0100 (CET)
Received: from localhost ([::1]:38594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhvD-0000Lx-HT
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:46:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mrhtk-0007f6-T7
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:44:52 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:33999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mrhtj-0004Jw-2b
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:44:52 -0500
Received: from [192.168.100.1] ([82.142.5.50]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M26n9-1muBnh40TZ-002Tq1; Mon, 29 Nov 2021 15:44:45 +0100
Message-ID: <58385b85-5c3f-bc73-2aea-ae1e4a166b94@vivier.eu>
Date: Mon, 29 Nov 2021 15:44:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: mwilck@suse.com, Laurent Vivier <lvivier@redhat.com>
References: <20211129135100.3934-1-mwilck@suse.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH resend v2] qemu-binfmt-conf.sh: fix -F option
In-Reply-To: <20211129135100.3934-1-mwilck@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QRX+PziJW796Ipk2B2vQcQW0OvgWFg0W9TdpUWtSU34ytoDy+OD
 xliOLr0BGLVa4m/phwDPbhSnFwXNprjcMEiURNImTT09jP9XuLdlTZEgmxTn91sRcAL6ZuO
 gXMX42u+P8xuUd2kayDXeuS+eCLHcpM/fp9Oom06fVqjIurAhVgPqcQ5w1Mkgf5Mnfrkl8R
 PymoJ3OT+nv3EF22ARbRA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6mJBhUUqTWQ=:8TBwXuTKwYqPDStJI7HT8x
 tNq8k4Eoj/o3p/tb8XUmykrUL1l/yyd7/1ZJFDVZpAbdfFVvZEwq3w2msOfWoL9OQ+uj488zW
 SNwshaP0M0c+pXMP/bRPTZ+SxVRohTRqE+EUJVHHbYKriwC6vP5RU7OBhgYR4RPydg9kCn7p6
 dlsS06Yd4K/LLQSLBn4lmLezkFCEVlqmgtVFrz3hQcJkdApUMeJHW287mn1iGKNV0enKWyuDX
 clyl/OELQbHGvp2Orc7DR1KQxXM5lQqhyB+5cu8OugkSXMfpXWEaJOfvOF4QVbfXjodjYFwfI
 dyTcTyvK3y6JjfmcQmvOoJ3A4qA4Sd+ZKUA7T6avkY5eLmUF/lfx5oW8LJ0b9jKkDTMAkylY0
 0KzhFSSqyfbxXSRSW7HYWxPyg2YrOBD/ttYltIk4qVKlPNgtTgWvDxvL/sQfXZ651OCAZzdis
 fKWzzBq4T52EyXwJUgzydMsM8B8vIucCQaZ16QNVa/+YpC3WWuhFHiHpvr6Zy4V+U5lUbd3QJ
 nCunRIFrQARuQFChOUcOckaUMMQP5OtQbUyeuV9UG9+qomsySR7/iqerIKf33Uz9tunbbq7fX
 MOeud8E1bwjnwfCQxnsXg8+X3EugkXT2wIC7exxrEN3hnw4zVWkSB3NypAr/0Mvku6+AI/ZBU
 ZUG/hYKrkriD8O0n9pgUJWZRuM5zf1H/zwS0raipNs5ByxBpBFuAKOXuz+CiHQH/eHHA=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.317,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Claudio Fontana <claudio.fontana@suse.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Jos=c3=a9_Ricardo_Ziviani?= <jose.ziviani@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/11/2021 à 14:51, mwilck@suse.com a écrit :
> From: Martin Wilck <mwilck@suse.com>
> 
> qemu-binfmt-conf.sh should use "-F" as short option for "--qemu-suffix".
> Fix the getopt call to make this work.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
> previous: https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg03132.html

Sorry for the delay, didn't see the email.

To put "linux-user" in the email subject helps to pass through all my email filters...

> ref: https://bugzilla.opensuse.org/show_bug.cgi?id=1186256

I think you don't need the suffix anymore with the new "--preserve-argv0" parameter.

See

     6e1c0d7b951e ("linux-user: manage binfmt-misc preserve-arg[0] flag")

but you need v5.12 kernel.

     2347961b11d4 ("binfmt_misc: pass binfmt_misc flags to the interpreter")

Moreover it seems it will be possible (soon?) to use a binfmt_misc configuration per container;

   [1/2] binfmt_misc: cleanup on filesystem umount
 
https://lore.kernel.org/lkml/20211105043000.GA25244@mail.hallyn.com/T/#m4a99a73c4e2c261a800dc6765fcbea8087635cfc 

   [2/2/] binfmt_misc: enable sandboxed mounts
 
https://lore.kernel.org/lkml/20211105043000.GA25244@mail.hallyn.com/T/#m8d991c47721f34e37d8253cb54ddf7b56a048f3e

> ---
>   scripts/qemu-binfmt-conf.sh | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
> index 7de996d536..e9bfeb94d3 100755
> --- a/scripts/qemu-binfmt-conf.sh
> +++ b/scripts/qemu-binfmt-conf.sh
> @@ -340,7 +340,9 @@ PERSISTENT=no
>   PRESERVE_ARG0=no
>   QEMU_SUFFIX=""
>   
> -options=$(getopt -o ds:Q:S:e:hc:p:g: -l debian,systemd:,qemu-path:,qemu-suffix:,exportdir:,help,credential:,persistent:,preserve-argv0: -- "$@")
> +_longopts="debian,systemd:,qemu-path:,qemu-suffix:,exportdir:,help,credential:,\
> +persistent:,preserve-argv0:"
> +options=$(getopt -o ds:Q:S:e:hc:p:g:F: -l ${_longopts} -- "$@")
>   eval set -- "$options"
>   
>   while true ; do
> 

Fixes: 7155be7cda5c ("qemu-binfmt-conf.sh: allow to provide a suffix to the interpreter name")

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

