Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FCC5BBAAF
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 23:34:22 +0200 (CEST)
Received: from localhost ([::1]:41222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZfS9-0007F5-Ky
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 17:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfQA-0004vO-4L; Sat, 17 Sep 2022 17:32:18 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfQ8-0007F4-FS; Sat, 17 Sep 2022 17:32:17 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 i203-20020a1c3bd4000000b003b3df9a5ecbso2064823wma.1; 
 Sat, 17 Sep 2022 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=ZDz5x6v86/IT1mhHgdi2sdOREQHVdgYRmQScrEAWs64=;
 b=OXkttZVAJl47cqTc2JbZOV7/pilkFPKiF9vUAGwiUcrF5gg/XeTUk+ynT4po0s+uLV
 iMt9QuWhYNkI9kTyru0yyJF+Aa24uQINRur2N/ziiwMZwEsYocxzgCTP4Y7HCtGreIV1
 xzoxvDdAvEwHt2n4fg3EjTdUgCKR+iupqvgqYlbc0dC+whGBJ1Yc8Te6QWgBXD7tybpg
 bKk6Jpm11j9kUJF29WtMCjuIRQNQ8u9/WZK8+wn7SNiMpbW0gUwQy9LpviSgxT8lscp3
 lQwTIodZBCdGthiy8dxxh6BMXDLweEcs9LXN20xXL5d/jm+fWOiJTrgJ/KZfdZAnQCUN
 6olQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=ZDz5x6v86/IT1mhHgdi2sdOREQHVdgYRmQScrEAWs64=;
 b=plHMaG0iCiawdhhQwu85pD/9l0doBnlnb2fhcjOn656oLY+X33SA0GloYo2yzOttgo
 C1SkxI2jg5C+7sY9ioGpH/GMbnMPnKYpcKouO9ESQsRm3uo3DTzsIsxraAoQKzZ8gQli
 F23Q3FO7IL5UbfS31eVulsd+dNiyh0MNioCsLXsJAcB/Hx4M7+fbx5nHzXjRSE/A/nlx
 QV+wjK5OKtaTqU1GkJcrk+7CmGXw9tMZIH6pTUouotNT1ZWOESsXdNAIsyZYJL0tDw4A
 fAF4FXzjBiF+eEtNo7M5jSRDZA3Xu86uwpvwUc3JFAxkjITrkQc9Ib8dSOE1mGTUYwwL
 3uWw==
X-Gm-Message-State: ACrzQf2D+KBhldlFevwmV4aT1UnDKHAOsWquuMWLHtgCep7AskyhkcTi
 Y50feSDfLI0QjlSJBSK7BmE=
X-Google-Smtp-Source: AMsMyM6JApsCnTs8SZKdMtaxJv9i1sGj1MqxoIgmxvBXkwIBH0Ubp37C2CP/JMJw0bxXKTAmzIFhpA==
X-Received: by 2002:a05:600c:5486:b0:3b4:7e47:e19 with SMTP id
 iv6-20020a05600c548600b003b47e470e19mr7589621wmb.12.1663450334675; 
 Sat, 17 Sep 2022 14:32:14 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a05600c128c00b003b4931eb435sm6923983wmd.26.2022.09.17.14.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 14:32:14 -0700 (PDT)
Message-ID: <f3447651-dadb-c0ed-f1f8-4ad80b551acf@amsat.org>
Date: Sat, 17 Sep 2022 23:32:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 5/7] block/nfs: Fix 32-bit Windows build
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Lieven <pl@kamp.de>,
 qemu-block@nongnu.org
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-6-bmeng.cn@gmail.com>
In-Reply-To: <20220908132817.1831008-6-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/9/22 15:28, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> libnfs.h declares nfs_fstat() as the following for win32:
> 
>    int nfs_fstat(struct nfs_context *nfs, struct nfsfh *nfsfh,
>                  struct __stat64 *st);
> 
> The 'st' parameter should be of type 'struct __stat64'. The
> codes happen to build successfully for 64-bit Windows, but it
> does not build for 32-bit Windows.
> 
> Fixes: 6542aa9c75bc ("block: add native support for NFS")
> Fixes: 18a8056e0bc7 ("block/nfs: cache allocated filesize for read-only files")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   block/nfs.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/block/nfs.c b/block/nfs.c
> index 444c40b458..d5d67937dd 100644
> --- a/block/nfs.c
> +++ b/block/nfs.c
> @@ -418,7 +418,11 @@ static int64_t nfs_client_open(NFSClient *client, BlockdevOptionsNfs *opts,
>                                  int flags, int open_flags, Error **errp)
>   {
>       int64_t ret = -EINVAL;
> +#ifdef _WIN32
> +    struct __stat64 st;
> +#else
>       struct stat st;
> +#endif
>       char *file = NULL, *strp = NULL;
>   
>       qemu_mutex_init(&client->mutex);
> @@ -781,7 +785,11 @@ static int nfs_reopen_prepare(BDRVReopenState *state,
>                                 BlockReopenQueue *queue, Error **errp)
>   {
>       NFSClient *client = state->bs->opaque;
> +#ifdef _WIN32
> +    struct __stat64 st;
> +#else
>       struct stat st;
> +#endif
>       int ret = 0;
>   
>       if (state->flags & BDRV_O_RDWR && bdrv_is_read_only(state->bs)) {

What about the field in struct NFSRPC?

