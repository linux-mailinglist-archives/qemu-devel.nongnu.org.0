Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A185E8CFD
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 15:14:37 +0200 (CEST)
Received: from localhost ([::1]:57522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc4zM-0000cA-Gf
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 09:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oc4Hu-0004Eh-Ez; Sat, 24 Sep 2022 08:29:42 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oc4Hs-0001Zi-H1; Sat, 24 Sep 2022 08:29:42 -0400
Received: by mail-wr1-x431.google.com with SMTP id g3so3645145wrq.13;
 Sat, 24 Sep 2022 05:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=AotM7VlwE4alZDWFMWbbG92QGuMJxTP2c/lAwdF8glI=;
 b=ig7IIcPY51T2k/MQEliyVXw7r+WkQDeskq8chvWBPTg5//o6rkiXhA9VOHTOXBVDUk
 XwkhGyXDGkWT4sV6D04f7KaX8Y8bA5FQEui4AdZ/ajsHpbxkCvqToP4x1kTHajTtUin6
 Xk8c6KBP1+V0FyG/reVl4H85urIfpIjCrDJCzpL+arYUj5Zski2bj2nCNvPpk8C99KqP
 iFqi/qCjCm5Ga87Q+LjBqczrZAiXEiiV0ytgcl7ycatvcKzKbxlYhEmPVCobBkRxFp55
 a3MAbZP+cZuwazWRAv5TaU9Q6F/aOwdvUURDzTKYKt14fpPnjnp7evTF81ruI/PMSqQF
 fZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=AotM7VlwE4alZDWFMWbbG92QGuMJxTP2c/lAwdF8glI=;
 b=ufuIo9JGqmxLCI+rp8qnXUdnyzqrdy1rDgsY+z7MUzG/u2meF36Oa8OyhHLtYHJ9Xd
 MNr0KNhBuJ1GqeS4CVxtMG2Qmq8oRXLzOaC3R1+pUt7zYEEPKILAznzoBMRiWzoeQQw9
 E66LUlGMFJrzX/vVLebfNqMoyecAzjIHftwoHlTFPIX6nKxJ+lwO/LDBaVV7ghYTIqVs
 6pJh/CFsE8G/No41C+Aqc1KrMtrjJU4H0Owl278Bfkdxkjy9JckVxC73y8dmphrcmZk4
 UtU+QzNZWZzhjENxEokCdvMLpbTNFgpMhve8lNi4NW7Cv+v8WTBaort78iQuEq9vbHIZ
 p+cg==
X-Gm-Message-State: ACrzQf3CMTrvwLA3wnd4tCCY614eETxAwo0bzced+lit8628K/IUmOSV
 uF+O8l1xo0/OZDbHYcNHlj8=
X-Google-Smtp-Source: AMsMyM59f1WNm113O90415KsjVuv2nyten3ZBvAjeyzkHemAXKbyE9PEtsUJAog/aSAbIHEjAuXnjA==
X-Received: by 2002:adf:e60d:0:b0:22b:3a47:8dfa with SMTP id
 p13-20020adfe60d000000b0022b3a478dfamr7005500wrm.638.1664022577951; 
 Sat, 24 Sep 2022 05:29:37 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c204b00b003b4f86b31dfsm5092665wmg.33.2022.09.24.05.29.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 05:29:36 -0700 (PDT)
Message-ID: <2b96e14e-d5f9-fff1-fd77-376b9424c75b@amsat.org>
Date: Sat, 24 Sep 2022 14:29:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2] block: Refactor get_tmp_filename()
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20220924114544.1906498-1-bmeng.cn@gmail.com>
In-Reply-To: <20220924114544.1906498-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.118,
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

On 24/9/22 13:45, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present there are two callers of get_tmp_filename() and they are
> inconsistent.
> 
> One does:
> 
>      /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
>      char *tmp_filename = g_malloc0(PATH_MAX + 1);
>      ...
>      ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);
> 
> while the other does:
> 
>      s->qcow_filename = g_malloc(PATH_MAX);
>      ret = get_tmp_filename(s->qcow_filename, PATH_MAX);
> 
> As we can see different 'size' arguments are passed. There are also
> platform specific implementations inside the function, and this use
> of snprintf is really undesirable.
> 
> Refactor this routine by changing its signature to:
> 
>      char *get_tmp_filename(void)
> 
> and use g_file_open_tmp() for a consistent implementation.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> Changes in v2:
> - Use g_autofree and g_steal_pointer
> 
>   include/block/block_int-common.h |  2 +-
>   block.c                          | 42 ++++++++++----------------------
>   block/vvfat.c                    |  8 +++---
>   3 files changed, 18 insertions(+), 34 deletions(-)
> 
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index 8947abab76..ea69a9349c 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -1230,7 +1230,7 @@ static inline BlockDriverState *child_bs(BdrvChild *child)
>   }
>   
>   int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp);
> -int get_tmp_filename(char *filename, int size);
> +char *get_tmp_filename(void);
>   void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
>                                         QDict *options);
>   
> diff --git a/block.c b/block.c
> index bc85f46eed..4e7a795566 100644
> --- a/block.c
> +++ b/block.c
> @@ -860,38 +860,23 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
>   
>   /*
>    * Create a uniquely-named empty temporary file.
> - * Return 0 upon success, otherwise a negative errno value.
> + * Return the actual name used upon success, otherwise NULL.
> + * The called function is responsible for freeing it.

s/called/caller/.

>    */
> -int get_tmp_filename(char *filename, int size)
> +char *get_tmp_filename(void)
>   {
> -#ifdef _WIN32
> -    char temp_dir[MAX_PATH];
> -    /* GetTempFileName requires that its output buffer (4th param)
> -       have length MAX_PATH or greater.  */
> -    assert(size >= MAX_PATH);
> -    return (GetTempPath(MAX_PATH, temp_dir)
> -            && GetTempFileName(temp_dir, "qem", 0, filename)
> -            ? 0 : -GetLastError());
> -#else
> +    g_autofree char *filename = NULL;
>       int fd;
> -    const char *tmpdir;
> -    tmpdir = getenv("TMPDIR");
> -    if (!tmpdir) {
> -        tmpdir = "/var/tmp";
> -    }
> -    if (snprintf(filename, size, "%s/vl.XXXXXX", tmpdir) >= size) {
> -        return -EOVERFLOW;
> -    }
> -    fd = mkstemp(filename);
> +
> +    fd = g_file_open_tmp("vl.XXXXXX", &filename, NULL);
>       if (fd < 0) {
> -        return -errno;
> +        return NULL;
>       }
>       if (close(fd) != 0) {
>           unlink(filename);
> -        return -errno;
> +        return NULL;
>       }
> -    return 0;
> -#endif
> +    return g_steal_pointer(&filename);
>   }

> diff --git a/block/vvfat.c b/block/vvfat.c
> index d6dd919683..135fafb166 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -3146,10 +3146,10 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
>   
>       array_init(&(s->commits), sizeof(commit_t));
>   
> -    s->qcow_filename = g_malloc(PATH_MAX);
> -    ret = get_tmp_filename(s->qcow_filename, PATH_MAX);
> -    if (ret < 0) {
> -        error_setg_errno(errp, -ret, "can't create temporary file");
> +    s->qcow_filename = get_tmp_filename();
> +    if (!s->qcow_filename) {
> +        error_setg_errno(errp, errno, "can't create temporary file");
> +        ret = -errno;

I don't think we can reuse errno here. Wouldn't it be better to pass a 
Error* to get_tmp_filename, and use the error parameter to 
g_file_open_tmp()? That would match our Error* style use.

>           goto err;
>       }
>   


