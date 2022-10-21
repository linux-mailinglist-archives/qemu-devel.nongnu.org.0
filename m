Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA290607965
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 16:21:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olsuE-0002Vs-UA
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:21:51 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olsuD-0003Xi-Uk
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1olsu4-0002TF-KL
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 10:21:40 -0400
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1olsty-0003UH-5F
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 10:21:38 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MEmEf-1osBM946sl-00GFIC; Fri, 21 Oct 2022 16:21:23 +0200
Message-ID: <729166fc-cd4c-ba47-94bd-43fa6c615bb7@vivier.eu>
Date: Fri, 21 Oct 2022 16:21:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/4] linux-user: add more compat ioctl definitions
Content-Language: fr
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221004093206.652431-1-berrange@redhat.com>
 <20221004093206.652431-2-berrange@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221004093206.652431-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bi/RRFR33UG3vha+DQZbnYzt5qkLa+zcF18hRFKYfDD96E45ZpR
 tBDC+MCGNN7CcYFJ4pJdMPglyu2rU9Thhi0mSS+2Ovp8l1LUHFxgj13e2JicVNxAchx7vmd
 FxIrGLQy9dnRKCJhlEqlWAau3dQoHH34VqPzctOTl8Tcnu7CXgnvO1OGwp2rhbpBnHoCzOw
 YBHqAPD6SResy5ejenRYQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6Hca3VxFp2E=:7HZ3887bMK8ovW00xoAD4n
 Z2f2Hb0iW/TwoNUy/p06gXyQGOrVVsVqF2Q4YBy25EX4oxL+3QbvcQJueqhu3OPRE2T2377Rd
 w1gUjvhqaJdOIE6poOozjPc19cqfc3hlOKaeQRBvnl9vF6JuyRBnFvZVLfRUScfWXBjepDjsU
 PNrgSSRVIes3sEqWzAT4A0WPGROQgrjVLRZAJGOkZvSzYZ+S8H91F8kX0FvT7qN98OUHtROaM
 D3m2ZtIr44SMpkaRCwORwg3kzE2N5PPhlpsxietetN5JQgp9fgAeFkpkI/W4vZgDpUEgwc0hm
 0S9O//I83FibFlf+AC+P3uM0mbeqg4jxWfEncD9iRBcomeAzEXkpHtc67+qAzU1oQyzsFlGYm
 vaqNi3V6+p1FRUF7sVa2PmKymllMBfZDG9Va+iojv0RZ01dJPT0Z6E7cSHCywGLDKo017z3Xj
 gDvZLSfMYRXeLl0OxKkfPtjs0CPrERqxf7CCQMeiogrk9JcWzUApxJlVztjEm62Hr5FJ7NFUX
 VJQ6CbXAmpYQf1FXFmn9LhbYL+vH9OB48Z7Mxi4x2zNyJc1H85JZgc6GS3YNBGMeFF3J3zakP
 R7SMSnUplFcW89QQDty/g8VUhcXBXQc9zyX0GuyaqwsWdV242aeF+ZHRb/G45SmLRN+hoAO5z
 w51KvSCaqRM/VA26mFlodYy8cehfuDmkmPZClazdVSYfTfqEs/Og5eHWWLRc/E/V81KCdHBzn
 l+6XdVWJQmk6ToR0rRNprdnFX/hV6yIDvr3b3VS7FLAzcZYFp7MScfV2a2Qtqe4EtahNteooY
 znry6VE
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/10/2022 à 11:32, Daniel P. Berrangé a écrit :
> GLibc changes prevent us from including linux/fs.h anymore,
> and we previously adjusted to this in
> 
>    commit 3cd3df2a9584e6f753bb62a0028bd67124ab5532
>    Author: Daniel P. Berrangé <berrange@redhat.com>
>    Date:   Tue Aug 2 12:41:34 2022 -0400
> 
>      linux-user: fix compat with glibc >= 2.36 sys/mount.h
> 
> That change required adding compat ioctl definitions on the
> QEMU side for any ioctls that we would otherwise obtain
> from linux/fs.h.  This commit adds more that were initially
> missed, due to their usage being conditionalized in QEMU.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   linux-user/syscall.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 2e954d8dbd..f6a15df69d 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -111,6 +111,31 @@
>   #define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
>   #define FS_IOC32_GETVERSION            _IOR('v', 1, int)
>   #define FS_IOC32_SETVERSION            _IOW('v', 2, int)
> +
> +#define BLKGETSIZE64 _IOR(0x12,114,size_t)
> +#define BLKDISCARD _IO(0x12,119)
> +#define BLKIOMIN _IO(0x12,120)
> +#define BLKIOOPT _IO(0x12,121)
> +#define BLKALIGNOFF _IO(0x12,122)
> +#define BLKPBSZGET _IO(0x12,123)
> +#define BLKDISCARDZEROES _IO(0x12,124)
> +#define BLKSECDISCARD _IO(0x12,125)
> +#define BLKROTATIONAL _IO(0x12,126)
> +#define BLKZEROOUT _IO(0x12,127)
> +
> +#define FIBMAP     _IO(0x00,1)
> +#define FIGETBSZ   _IO(0x00,2)
> +
> +struct file_clone_range {
> +        __s64 src_fd;
> +        __u64 src_offset;
> +        __u64 src_length;
> +        __u64 dest_offset;
> +};
> +
> +#define FICLONE         _IOW(0x94, 9, int)
> +#define FICLONERANGE    _IOW(0x94, 13, struct file_clone_range)
> +
>   #else
>   #include <linux/fs.h>
>   #endif

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

