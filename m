Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC6350ADF5
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 04:45:03 +0200 (CEST)
Received: from localhost ([::1]:51266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhjI6-0005CV-A5
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 22:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nhjH9-0004MC-Ud; Thu, 21 Apr 2022 22:44:04 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:44983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nhjH4-0005V6-7W; Thu, 21 Apr 2022 22:44:00 -0400
Received: by mail-pg1-x52e.google.com with SMTP id i63so6216268pge.11;
 Thu, 21 Apr 2022 19:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vL/kdqOMfiEr6tlFxw5oyhSj4Vl7fRfT/SVoO+XfdCY=;
 b=eQhDu398WI4CZimhvs1mqlmjIqTGPhEj6NhFTFi61x6o+0TvhGoldgjrDw4AGOKc6I
 Vf64MiAR2UmOrwEd2+l5MslabtYF+vG1isULdtoBtQnrtWOjl9Tf887U5uwjghM0PLM/
 JCtOBnNJPPr63vxxJMPHqoLr07NYm9If4u933gBmUqYzB2NLJEe2GWfsl4YvuPPOagay
 L2+gP/u6W5IV/KiclNOJhdy0OkpFlvy1cxU1LiHDjBxJ98lYgfolYsbVK5liEs3ZC+q8
 Q/Yp9V1HyvpD355VDqBNMPRApbIxQ8jMqnmM+yBwaRy3HRfAd8OP1Ywq880y3CZPb/tx
 jMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vL/kdqOMfiEr6tlFxw5oyhSj4Vl7fRfT/SVoO+XfdCY=;
 b=Z+veanQ+ZIEIwa3hakVCh5weCEjpXPzkIjg9DkRrkU+Cka6+hTGxbq0nG6YkfXS+Z+
 ydakkalsONNoHTF60t5pL+8MQzC3imPwDOEHyqTxAu6/0EeZSWFLyT+cz47ray8v0DF8
 Nw5eo5ftmH4eV7gQXsOGUn/hS4PA3UKaafVFHbZ3u9qe8goTt8YOocQW/tu8iyUYO7dq
 XMmR+RjvzwwC8xEAX/Y2soQ7lC7sg7b14D62UMKeFNHEk51MYTSGvyXTnQpBCd1igGRB
 7I6J0HS0FaV6nORkpn/hYhhh7cb1hMEYxxqNkh9EaH1498au8ULC64d6RSMnCdM+bDIj
 T+iA==
X-Gm-Message-State: AOAM530btbZYJ1CqF7noOw38yKZKaNSEY8CeTlULpO/lsO8q83KTlHip
 gR1Ckmz1Qc8h6HFMRDbRcEk=
X-Google-Smtp-Source: ABdhPJyJeaWRFPCOA2oHLjE7Tmf6m5Gxcf2Mew/PzqOyxoaAxKqaPKNgE4rnRRrin2auPxJ0k37YNg==
X-Received: by 2002:a63:fc17:0:b0:3aa:1113:3c99 with SMTP id
 j23-20020a63fc17000000b003aa11133c99mr2115500pgi.204.1650595424911; 
 Thu, 21 Apr 2022 19:43:44 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a17090b051300b001cd4989fedesm4107085pjz.42.2022.04.21.19.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 19:43:44 -0700 (PDT)
Message-ID: <73163b9a-bd8a-8cf1-42a1-0e4c88edfa0e@gmail.com>
Date: Fri, 22 Apr 2022 11:43:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
 <f6d632fc82d4750b73c83a2f1d1b9972cf3e26bb.1650553693.git.qemu_oss@crudebyte.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <f6d632fc82d4750b73c83a2f1d1b9972cf3e26bb.1650553693.git.qemu_oss@crudebyte.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>, Will Cohen <wwcohen@gmail.com>,
 Greg Kurz <groug@kaod.org>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/04/22 0:07, Christian Schoenebeck wrote:
> mknod() on macOS does not support creating sockets, so divert to
> call sequence socket(), bind() and chmod() respectively if S_IFSOCK
> was passed with mode argument.
> 
> Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Reviewed-by: Will Cohen <wwcohen@gmail.com>
> ---
>   hw/9pfs/9p-util-darwin.c | 27 ++++++++++++++++++++++++++-
>   1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> index e24d09763a..39308f2a45 100644
> --- a/hw/9pfs/9p-util-darwin.c
> +++ b/hw/9pfs/9p-util-darwin.c
> @@ -74,6 +74,27 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
>    */
>   #if defined CONFIG_PTHREAD_FCHDIR_NP
>   
> +static int create_socket_file_at_cwd(const char *filename, mode_t mode) {
> +    int fd, err;
> +    struct sockaddr_un addr = {
> +        .sun_family = AF_UNIX
> +    };
> +
> +    fd = socket(PF_UNIX, SOCK_DGRAM, 0);
> +    if (fd == -1) {
> +        return fd;
> +    }
> +    snprintf(addr.sun_path, sizeof(addr.sun_path), "./%s", filename);

It would result in an incorrect path if the path does not fit in 
addr.sun_path. It should report an explicit error instead.

> +    err = bind(fd, (struct sockaddr *) &addr, sizeof(addr));
> +    if (err == -1) {
> +        goto out;

You may close(fd) as soon as bind() returns (before checking the 
returned value) and eliminate goto.

> +    }
> +    err = chmod(addr.sun_path, mode);

I'm not sure if it is fine to have a time window between bind() and 
chmod(). Do you have some rationale?

Regards,
Akihiko Odaki

> +out:
> +    close(fd);
> +    return err;
> +}
> +
>   int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
>   {
>       int preserved_errno, err;
> @@ -93,7 +114,11 @@ int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
>       if (pthread_fchdir_np(dirfd) < 0) {
>           return -1;
>       }
> -    err = mknod(filename, mode, dev);
> +    if (S_ISSOCK(mode)) {
> +        err = create_socket_file_at_cwd(filename, mode);
> +    } else {
> +        err = mknod(filename, mode, dev);
> +    }
>       preserved_errno = errno;
>       /* Stop using the thread-local cwd */
>       pthread_fchdir_np(-1);


