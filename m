Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DD3582290
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 10:57:11 +0200 (CEST)
Received: from localhost ([::1]:44032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGcqs-0002nF-FL
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 04:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvugenfi@redhat.com>)
 id 1oGcm7-0007CG-Ve
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:52:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvugenfi@redhat.com>)
 id 1oGclv-0005RF-84
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658911921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N9fl2ECPfbL3NdpC9IzM5XIPqDjdZgI620s6UkyJVWY=;
 b=iTbxpj7P+iwD7jL+TgcDxoAeYKYGbWL+DL/CrLXOwH6me3t20IZvpd9gvKB/EsCqV+52p5
 WWCZ95arBhOnE4zRxeW1SdeST/C2rpXmGrab/kdxInYEAvENI5QUCODI1IeJQSLZjqliqt
 j95zASJYw6qyuM/ZhZE22Ioa13Utqow=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-YPB-IN_xODe4HlxrY00YWw-1; Wed, 27 Jul 2022 04:50:46 -0400
X-MC-Unique: YPB-IN_xODe4HlxrY00YWw-1
Received: by mail-lj1-f199.google.com with SMTP id
 g3-20020a2e9cc3000000b00253cc2b5ab5so3802863ljj.19
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 01:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=N9fl2ECPfbL3NdpC9IzM5XIPqDjdZgI620s6UkyJVWY=;
 b=uut+huWs31UNXb4sjqAWAaOvLX4Tlj0s7msbAOF7Ycy3ehjRj+Tk/P3y5oUdnjhsOo
 c7+dE+3NRz1mrqbskgDruwq00GtwvlSd0sIlFvH3uTTAfdmHWZWmc10jJ+rgflgnEZKf
 EwU4I0rm/KH99B+zs89z815JrX5/SapE7jJ8+G+lshpb1mUouyBeAvLE4G+vIo8ODdmP
 o1m/jTNGJjwsd1Jzhv2Jy912aahFmTnauM756CuE5r5qbidABH0oV2uPDhPz5uLGRV5S
 PcBEzw0YaGyeI3K6emvIuvJtLvESBqcvFEjXoS2E619sFEq/2EKv4F6aZNPQKLMyVg0n
 RrjQ==
X-Gm-Message-State: AJIora94PNosTLceUv4aNXOQgjx4ebQAqDOj3tFM8ah2EK2oYFXyRYzT
 dZHMIQ9mLdZNbO0b66XppnDpw6eR3zpEF95y0evj+6SOJEhxb08o/qPoBvZmNFlVKsn9dzBf1xr
 dSkC7Hq9g/VaeC5VZue6wh+fhHypMZFg=
X-Received: by 2002:ac2:546f:0:b0:48a:8214:dd73 with SMTP id
 e15-20020ac2546f000000b0048a8214dd73mr7682117lfn.379.1658911845148; 
 Wed, 27 Jul 2022 01:50:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1us3/T0CtlFNOhDwO4QEO57QKOIxMFaYpN/tRfIB2Tmq3qz2/9qJTpurG1tHYZbgo3i9Ncg3Q75nXtcDAdz3TQ=
X-Received: by 2002:ac2:546f:0:b0:48a:8214:dd73 with SMTP id
 e15-20020ac2546f000000b0048a8214dd73mr7682103lfn.379.1658911844734; Wed, 27
 Jul 2022 01:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
 <20220727073542.811420-3-bmeng.cn@gmail.com>
In-Reply-To: <20220727073542.811420-3-bmeng.cn@gmail.com>
From: Yan Vugenfirer <yvugenfi@redhat.com>
Date: Wed, 27 Jul 2022 11:50:33 +0300
Message-ID: <CAGoVJZzZN5CNoURh4-uMqkPwUd-Z03PmZZ04v8M+BYi2tX37_g@mail.gmail.com>
Subject: Re: [PATCH 2/5] util/oslib-win32: Add a helper to get the Windows
 version
To: Bin Meng <bmeng.cn@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=yvugenfi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Jul 27, 2022 at 10:43 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This adds a helper to get the Windows version via the RtlGetVersion
> call, for QEMU codes to determine the Windows version at run-time.
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  include/sysemu/os-win32.h |  2 ++
>  util/oslib-win32.c        | 15 +++++++++++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
> index edc3b38a57..1e324026a4 100644
> --- a/include/sysemu/os-win32.h
> +++ b/include/sysemu/os-win32.h
> @@ -204,6 +204,8 @@ ssize_t qemu_recv_wrap(int sockfd, void *buf, size_t len, int flags);
>  ssize_t qemu_recvfrom_wrap(int sockfd, void *buf, size_t len, int flags,
>                             struct sockaddr *addr, socklen_t *addrlen);
>
> +void os_get_win_version(RTL_OSVERSIONINFOEXW *info);
> +
>  #ifdef __cplusplus
>  }
>  #endif
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index 5723d3eb4c..6d2387b9ff 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -547,3 +547,18 @@ int qemu_msync(void *addr, size_t length, int fd)
>       */
>      return qemu_fdatasync(fd);
>  }
> +
> +void os_get_win_version(RTL_OSVERSIONINFOEXW *info)
> +{
> +    typedef LONG (WINAPI *rtl_get_version_t)(PRTL_OSVERSIONINFOEXW);
> +
> +    /* RtlGetVersion is available starting with Windows 2000 */
> +    HMODULE module = GetModuleHandle("ntdll");
> +    PVOID fun = GetProcAddress(module, "RtlGetVersion");
> +    rtl_get_version_t rtl_get_version = (rtl_get_version_t)fun;
> +
> +    info->dwOSVersionInfoSize = sizeof(RTL_OSVERSIONINFOEXW);
> +    rtl_get_version(info);
The original function, when it was present in qemu-ga, tested that
getting the function address succeeded.
I think this test should be kept.
See below:
-    PVOID fun = GetProcAddress(module, "RtlGetVersion");
-    if (fun == NULL) {
-        error_setg(errp, QERR_QGA_COMMAND_FAILED,
-            "Failed to get address of RtlGetVersion");
-        return;
-    }

Best regards,
Yan.
> +
> +    return;
> +}
> --
> 2.34.1
>
>


