Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D99507E8A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 04:05:41 +0200 (CEST)
Received: from localhost ([::1]:44000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngzit-0001gz-WA
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 22:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ngzhI-0000Uf-GW; Tue, 19 Apr 2022 22:04:00 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:46906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ngzhG-0005dC-SY; Tue, 19 Apr 2022 22:04:00 -0400
Received: by mail-pg1-x530.google.com with SMTP id q12so185686pgj.13;
 Tue, 19 Apr 2022 19:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=T/N/EFMqFwqtaWLHjSErnttQwCollGLdCRIVXk0mTR0=;
 b=kUbD9ElVqcADAYM25/IL5FhIHTthxXgLtvW3k43OIAxe26G9hHPRUOhxFdfczO0nOm
 /FoBLAIvDnv+8MfpcHDPlxU9o10yz6KhirSxBa28mglGF8x0QwgAJ7qY0YcVCVuE8jDY
 juAkDycz6yD82ovL/w/7DWGIGCRM2mZmdf1PxvOg2ESqk0j+h2TwtIqm64pkkIG3/HQF
 zo/v+37KdpZSdmaZaJFFnt/P9BaPs0lEvCMPcqX9FjvjXhT37Q8dxKg2Mu43EjQ7MLGS
 2nBUQs6H8Q+U+CC3QOi4tRTtXzNmFo7+PcylZkHREOEcR8FqZJO9gW0orc1YZsc/JrrJ
 Luog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T/N/EFMqFwqtaWLHjSErnttQwCollGLdCRIVXk0mTR0=;
 b=4l6ic03coJmLMwQDHBIyyLmuiTYdlFNKh+h8sKYLlkE5gL3Ik/BUgNs5omVu0BnREg
 qzah0b6Aw8i/ZcZ9ymX7KLla8Ste80X8DbArP6Uj9tSiR1qvHzf/iEXeCanMPFWrKeFh
 1UGK60ibBIzAxqbyYIUWUaJ0xWEltnW/vtqSCkOxUoUv6xbRUim6Hf2MXQrrp+CNeTak
 OzIGq4a7YyGBV8UMVcZEIxUFvaSE96qATE54sbRcwQiRnKYseBjszy2b99XhbHpp23yo
 N1GucjOglqYYKw1Wt+2SXFU6NIkhn0K9Ip6H1xpWpxzGKkMXXNK5n/aKge95e6JJkBrv
 cBEA==
X-Gm-Message-State: AOAM533lseAEuJ5eup6RDn3TdK0lS3okWv1wrk8MFTP/kq7bQrSYvOxa
 O7jHb6QxdTQje844Zlx9xPc=
X-Google-Smtp-Source: ABdhPJws9KjuDnG0CAukCn8JULu4UqV3c6i65tuzhHSXmpdExpEHcodZ3v3xHJ1rvBNs1PC0t9q8UQ==
X-Received: by 2002:a62:685:0:b0:50a:5870:10b1 with SMTP id
 127-20020a620685000000b0050a587010b1mr18300960pfg.61.1650420236604; 
 Tue, 19 Apr 2022 19:03:56 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a63380e000000b0038253c4d5casm17454286pga.36.2022.04.19.19.03.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 19:03:55 -0700 (PDT)
Message-ID: <280dfc7a-7985-3c01-c1ac-5fe15825c95a@gmail.com>
Date: Wed, 20 Apr 2022 11:03:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/5] 9pfs: fix qemu_mknodat(S_IFREG) on macOS
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <cover.1650370026.git.qemu_oss@crudebyte.com>
 <2a515431fdc02b0b2d3613f5d569305a32cfba30.1650370026.git.qemu_oss@crudebyte.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <2a515431fdc02b0b2d3613f5d569305a32cfba30.1650370026.git.qemu_oss@crudebyte.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x530.google.com
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

On 2022/04/19 20:40, Christian Schoenebeck wrote:
> mknod() on macOS does not support creating regular files, so
> divert to openat_file() if S_IFREG is passed with mode argument.
> 
> Furthermore, 'man 2 mknodat' on Linux says: "Zero file type is
> equivalent to type S_IFREG".
> 
> Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>   hw/9pfs/9p-util-darwin.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> index bec0253474..53e0625501 100644
> --- a/hw/9pfs/9p-util-darwin.c
> +++ b/hw/9pfs/9p-util-darwin.c
> @@ -77,6 +77,10 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
>   int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
>   {
>       int preserved_errno, err;
> +
> +    if (S_ISREG(mode) || !(mode & S_IFMT)) {
> +        return openat_file(dirfd, filename, O_CREAT, mode);
> +    }
>       if (!pthread_fchdir_np) {
>           error_report_once("pthread_fchdir_np() not available on this version of macOS");
>           return -ENOTSUP;

openat_file returns a file descriptor on success while mknodat returns 0 
on success. The inconsistency should be handled.

Regards,
Akihiko Odaki

