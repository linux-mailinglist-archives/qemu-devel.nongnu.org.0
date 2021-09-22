Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B44414D49
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 17:43:56 +0200 (CEST)
Received: from localhost ([::1]:57266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT4Pb-0004hP-0Y
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 11:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mT4O0-0003rP-46
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:42:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mT4Nx-0002je-T2
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:42:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632325332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P+xunLiUc/8Gk/apiUeq//IOdfSSS3ppgTvgo1YpH7U=;
 b=LUt/UhuNyfEqrcwCBhDWXpMzy5icorpJ9cBro5unYGQqtDzTN6fCS1oN3NPy4BDAhrOBiL
 uZGDdNv9qQFFeFMgNJfdLLBHczH92Eyw8ynRNdErzbD3fy+slgbF8GFK4z7cQbxrqpMs2K
 TieFNbcFs5gTut+SnRgCKPolIjp12hQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-LA8jXukENHG6jAOeoXoSGQ-1; Wed, 22 Sep 2021 11:42:11 -0400
X-MC-Unique: LA8jXukENHG6jAOeoXoSGQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 v15-20020adff68f000000b0015df51efa18so2527789wrp.16
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 08:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P+xunLiUc/8Gk/apiUeq//IOdfSSS3ppgTvgo1YpH7U=;
 b=IV3lrs1kxOe3k8mxgss4EV3xyp5yTUrZXVhjjnQw4AvzBf2iyPECyyw1U3NzS51rVn
 bXMeVRuuKXQ0NVTRuC5dG1i50/U6sOJMKTLts6PGmbyMaPAkNriJIrJhY4nCDfea4GnB
 hj08WnHK0kkpkJmDK7fBt3VJS2BrOQQ35jNCoD1oP7EAmfrkGe4JEHON9Hz2JNBELT7Z
 wl45PlfKjn1zpCr+sHvw/pzaj6xvute/OO22tZlbXan4g+91+EgjW1K+yP+B+mD8SxPP
 o1+pknuvzaEL5pj+EwZpCuMxWeQ+cgQhC2F/JEclLB4iVkZ3aOmnUinJ5ECnm6/sAo7u
 YdeA==
X-Gm-Message-State: AOAM531H0u/HiPzfBWHmpMBer4/r+BWoZZN2rny1SBzaRQ3Dz5A/JXQR
 Tu4fXtfAapW5s/R5QigUxPvrj0Q+2+1iatUPz6vxTqdxWIRLkx+mUeRN9nnBqDULRrhSAW1a640
 spsq8spnIaK3ii1c=
X-Received: by 2002:adf:e102:: with SMTP id t2mr270827wrz.430.1632325329940;
 Wed, 22 Sep 2021 08:42:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrM10TajMRopZ0PU/UH1kU0IYt2xJW4F88mTCDxLuWCZ0yyfTlSs6q1TESxf8AMuHQ0cKksA==
X-Received: by 2002:adf:e102:: with SMTP id t2mr270809wrz.430.1632325329755;
 Wed, 22 Sep 2021 08:42:09 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c17sm3073250wrn.54.2021.09.22.08.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 08:42:09 -0700 (PDT)
Message-ID: <a78b8af7-a61a-c9dc-181c-cccc307482eb@redhat.com>
Date: Wed, 22 Sep 2021 17:42:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] 9pfs: fix wrong I/O block size in Rgetattr
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <E1mT2Js-0000DW-OH@lizzy.crudebyte.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <E1mT2Js-0000DW-OH@lizzy.crudebyte.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 15:13, Christian Schoenebeck wrote:
> When client sent a 9p Tgetattr request then the wrong I/O block
> size value was returned by 9p server; instead of host file
> system's I/O block size it should rather return an I/O block
> size according to 9p session's 'msize' value, because the value
> returned to client should be an "optimum" block size for I/O
> (i.e. to maximize performance), it should not reflect the actual
> physical block size of the underlying storage media.
> 
> The I/O block size of a host filesystem is typically 4k, so the
> value returned was far too low for good 9p I/O performance.
> 
> This patch adds stat_to_iounit() with a similar approach as the
> existing get_iounit() function.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>   hw/9pfs/9p.c | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index c857b31321..708b030474 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -1262,6 +1262,25 @@ static int coroutine_fn stat_to_v9stat(V9fsPDU *pdu, V9fsPath *path,
>   #define P9_STATS_ALL           0x00003fffULL /* Mask for All fields above */
>   
>   
> +static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat *stbuf)
> +{
> +    int32_t iounit = 0;
> +    V9fsState *s = pdu->s;
> +
> +    /*
> +     * iounit should be multiples of st_blksize (host filesystem block size)
> +     * as well as less than (client msize - P9_IOHDRSZ)
> +     */
> +    if (stbuf->st_blksize) {
> +        iounit = stbuf->st_blksize;
> +        iounit *= (s->msize - P9_IOHDRSZ) / stbuf->st_blksize;

Is that:

   iounit = QEMU_ALIGN_DOWN(s->msize - P9_IOHDRSZ, stbuf->st_blksize);

?

> +    }
> +    if (!iounit) {
> +        iounit = s->msize - P9_IOHDRSZ;
> +    }
> +    return iounit;
> +}
> +
>   static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
>                                   V9fsStatDotl *v9lstat)
>   {
> @@ -1273,7 +1292,7 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
>       v9lstat->st_gid = stbuf->st_gid;
>       v9lstat->st_rdev = stbuf->st_rdev;
>       v9lstat->st_size = stbuf->st_size;
> -    v9lstat->st_blksize = stbuf->st_blksize;
> +    v9lstat->st_blksize = stat_to_iounit(pdu, stbuf);
>       v9lstat->st_blocks = stbuf->st_blocks;
>       v9lstat->st_atime_sec = stbuf->st_atime;
>       v9lstat->st_atime_nsec = stbuf->st_atim.tv_nsec;
> 


