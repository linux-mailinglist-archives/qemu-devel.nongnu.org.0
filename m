Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A70B607A59
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 17:19:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oltnN-0004jj-DH
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 11:18:51 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oltnJ-0006rJ-0H
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 11:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oltmR-000282-GV
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:17:55 -0400
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oltmL-0001Ts-B1
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:17:50 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MxVbb-1p1Ton3ThJ-00xwVh; Fri, 21 Oct 2022 17:17:36 +0200
Message-ID: <824c7ed0-9adb-a87e-5087-19aaff517d75@vivier.eu>
Date: Fri, 21 Oct 2022 17:17:35 +0200
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
X-Provags-ID: V03:K1:uidjuVlMOD6DBAi/dhAh81llxCQ2z6HDpcFH5zL8RX/RjB6FYuV
 JxqFQCEmGLaYR9pDJKr07FV4KCnw0kvGvj7Yzvw0u4rQvTxvOityYKlbaTp+O78+e8eP+7m
 RGIPm/V9ZV7rp4Vx61nRLxeQ/aZfCnvr79dhxmLPTd1gd1aesRKD/DLLZZCj5j53Uf4T/x3
 bn+yqGsORKJtKH3zTydqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OUZWAQAeU/w=:zi31Cxu0nrKSTjn383HhIx
 SGmFGNqZ/OI1JnQf0rgavlYBWabE6WFaZTlgJRnClBuKlocVagrv0gmIJ1zxsWgsQXClM/YKx
 mkDdQPonE3qlt14Kjgtpajo1Egw40GuJWTawR++Ab8N/LO8jhGHqcHz1Yd1GXIzIQffvdliW4
 AZbGIqcvtxvxd2ixM8+XQOn9kOEpWKux9H5BgfWdm8QaXeSFcqs0uIUvZ1MbKFBc2uDzQlMoj
 7PFR/m4+QEOmhhFsmLbL5EHrz9vK6wxA26uJ4549EkdR7Rgz6LXND+oZfkdbWgaTlNZRA0Zot
 s3+5XN0DYlRS2bllqP3CYh8urEzmChxBOoj/sXCTj8M+hkxEKRksA5Fwi1k7u+EelZBM7P0Md
 OQ5IBzKdwNj/Y/qgiZu+dn0bTF6P3ARPrQJQNkj9JoSppciIevvndE1mZuopnLvWsRhC7RYMq
 kGdIE+SlakgKsWOuT2ggiTyU3QnDO/QMtfjGoMKZvmqZYQvLNDJVvui6tJDlnUMsaTBR9088u
 n5wSX7/uezGkuMrEHRFChPGmGozWOh8Om1HD4ydNPCgQvo7s0DdSnD3bjgOMOtu0UEuYAI6eP
 wYAkGQK8y0RO+luE755+Irn1Ww2F5tqgKdEQsEZd+xHuwX44IvVcjEwuCDwvTGDhegbgVnza6
 AOmJDxhFWAXiF6gQNWNv5+4A1qXPZXe+Jc7vunEFxSWLKZcMe00mQNLos4E2OTum8CovPCbQ4
 MmnBPjKzk40u8cjDiRnOa8VKRIekbyTqmSwX8nQG1+2HewhewIXV+0MgjKzS6lcWrEPXCvGbB
 RO6LUmL
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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


Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent


