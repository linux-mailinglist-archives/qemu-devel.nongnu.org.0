Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F065B143C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 07:59:44 +0200 (CEST)
Received: from localhost ([::1]:55216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWAZi-0005IO-UY
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 01:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oWAVJ-0001go-1E
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 01:55:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oWAVE-0003Sn-3A
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 01:55:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662616501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PBQSb0I5j37ndw73K84FjIGZtWKiQ1gspq1VYrawRco=;
 b=R2/Q2QvPKVyYJGz8/HJg4H0sPqRz5TaPlBHFTeyxI1A8w/o9l95w0iysbJGWp5dfNRQNjg
 kEKCbTDngzKBK7Du4Ap3wV/UKh0+OAnaj7jQTNEazAIornRoL1r0ypQLx66m++KpKWHqKl
 WKcrCPNxhLTdy7iV8J0xG/b55UEE7pM=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-52-g5iYbKQmP9mnLPLTz79Kmw-1; Thu, 08 Sep 2022 01:55:00 -0400
X-MC-Unique: g5iYbKQmP9mnLPLTz79Kmw-1
Received: by mail-oo1-f70.google.com with SMTP id
 p6-20020a4a3c46000000b0044ada2fea24so6853919oof.2
 for <qemu-devel@nongnu.org>; Wed, 07 Sep 2022 22:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PBQSb0I5j37ndw73K84FjIGZtWKiQ1gspq1VYrawRco=;
 b=GMTHluU+WJcWJvmdlIudOnmBtG7R0JYRNbTBWpx4glAvVANQE7g+Imgse5X9RF5d7O
 LfGNU3mi8KgWgtbhLYbl+ERyhqzBAIbFTkn0O3FQy1H697A8Vkj2oyFSZeOs2/orWjMo
 xZHTwKgq57oLxdxpt8ve64EZyl58HdiU8LIcrWg/1K1FvaL5/vtV7EAEATD13vgmUeKq
 XY8opZ57VCmy+Oa8poUX2ryS025OheDxQzMr1htRsozDDX5QFa+WGg13vzGHQK1Nyzwi
 12wayc5QTWKa4V1zdWqQeKPrgxqYQS/ODza+ECOU24oVjFbL26aEiViHCrDWI3sDxUVW
 iSKQ==
X-Gm-Message-State: ACgBeo1JjGzAFEkvnfSn+pEwVKYmRazRitYCKdT6wiqv+PFVDHYrDFIr
 0y1AU5dvVncs8wA0Q96d/ZOpHNqn00K+ftMrUVvoA/CKVDJWiNtUBGLMC5oFR30ssWYqlhWXmTg
 cWo8Gg9RiJ74R+7HdI0Y2ChjV6nC3yls=
X-Received: by 2002:a05:6870:c1d4:b0:127:ad2c:3d74 with SMTP id
 i20-20020a056870c1d400b00127ad2c3d74mr1023567oad.205.1662616499454; 
 Wed, 07 Sep 2022 22:54:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6v5Ug6jzQqkJIUPueNN2F+qccdtpci9zI6nA2o2sH8aR0rILHtAFDLlHTwCU1CZWDMDS8bnfm4Wkt4LdlsJPA=
X-Received: by 2002:a05:6870:c1d4:b0:127:ad2c:3d74 with SMTP id
 i20-20020a056870c1d400b00127ad2c3d74mr1023559oad.205.1662616499208; Wed, 07
 Sep 2022 22:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220907222821.1285082-1-stefanb@linux.ibm.com>
 <20220907222821.1285082-2-stefanb@linux.ibm.com>
In-Reply-To: <20220907222821.1285082-2-stefanb@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 8 Sep 2022 09:54:48 +0400
Message-ID: <CAMxuvawPfNGoWRvXgzVZTserysw8Wd0cHt8D7-7C2XTh89OT-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] tpm_emulator: Use latest tpm_ioctl.h from swtpm
 project
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Sep 8, 2022 at 2:28 AM Stefan Berger <stefanb@linux.ibm.com> wrote:
>
> Use the latest tpm_ioctl.h from upstream swtpm project.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  backends/tpm/tpm_ioctl.h | 96 +++++++++++++++++++++++++++++++---------
>  1 file changed, 76 insertions(+), 20 deletions(-)
>
> diff --git a/backends/tpm/tpm_ioctl.h b/backends/tpm/tpm_ioctl.h
> index d67bf0283b..e506ef5160 100644
> --- a/backends/tpm/tpm_ioctl.h
> +++ b/backends/tpm/tpm_ioctl.h
> @@ -5,10 +5,15 @@
>   *
>   * This file is licensed under the terms of the 3-clause BSD license
>   */
> +#ifndef _TPM_IOCTL_H_
> +#define _TPM_IOCTL_H_
>
> -#ifndef TPM_IOCTL_H
> -#define TPM_IOCTL_H
> +#if defined(__CYGWIN__)
> +# define __USE_LINUX_IOCTL_DEFS
> +#endif
>
> +#include <stdint.h>
> +#include <sys/types.h>
>  #ifndef _WIN32
>  #include <sys/uio.h>
>  #include <sys/ioctl.h>
> @@ -196,6 +201,48 @@ struct ptm_setbuffersize {
>      } u;
>  };
>
> +#define PTM_GETINFO_SIZE (3 * 1024)
> +/*
> + * PTM_GET_INFO: Get info about the TPM implementation (from libtpms)
> + *
> + * This request allows to indirectly call TPMLIB_GetInfo(flags) and
> + * retrieve information from libtpms.
> + * Only one transaction is currently necessary for returning results
> + * to a client. Therefore, totlength and length will be the same if
> + * offset is 0.
> + */
> +struct ptm_getinfo {
> +    union {
> +        struct {
> +            uint64_t flags;
> +            uint32_t offset;      /* offset from where to read */
> +            uint32_t pad;         /* 32 bit arch */
> +        } req; /* request */
> +        struct {
> +            ptm_res tpm_result;
> +            uint32_t totlength;
> +            uint32_t length;
> +            char buffer[PTM_GETINFO_SIZE];
> +        } resp; /* response */
> +    } u;
> +};
> +
> +#define SWTPM_INFO_TPMSPECIFICATION ((uint64_t)1 << 0)
> +#define SWTPM_INFO_TPMATTRIBUTES    ((uint64_t)1 << 1)
> +
> +/*
> + * PTM_LOCK_STORAGE: Lock the storage and retry n times
> + */
> +struct ptm_lockstorage {
> +    union {
> +        struct {
> +            uint32_t retries; /* number of retries */
> +        } req; /* request */
> +        struct {
> +            ptm_res tpm_result;
> +        } resp; /* reponse */
> +    } u;
> +};
>
>  typedef uint64_t ptm_cap;
>  typedef struct ptm_est ptm_est;
> @@ -207,6 +254,8 @@ typedef struct ptm_getstate ptm_getstate;
>  typedef struct ptm_setstate ptm_setstate;
>  typedef struct ptm_getconfig ptm_getconfig;
>  typedef struct ptm_setbuffersize ptm_setbuffersize;
> +typedef struct ptm_getinfo ptm_getinfo;
> +typedef struct ptm_lockstorage ptm_lockstorage;
>
>  /* capability flags returned by PTM_GET_CAPABILITY */
>  #define PTM_CAP_INIT               (1)
> @@ -223,6 +272,9 @@ typedef struct ptm_setbuffersize ptm_setbuffersize;
>  #define PTM_CAP_GET_CONFIG         (1 << 11)
>  #define PTM_CAP_SET_DATAFD         (1 << 12)
>  #define PTM_CAP_SET_BUFFERSIZE     (1 << 13)
> +#define PTM_CAP_GET_INFO           (1 << 14)
> +#define PTM_CAP_SEND_COMMAND_HEADER (1 << 15)
> +#define PTM_CAP_LOCK_STORAGE       (1 << 16)
>
>  #ifndef _WIN32
>  enum {
> @@ -243,6 +295,8 @@ enum {
>      PTM_GET_CONFIG         =3D _IOR('P', 14, ptm_getconfig),
>      PTM_SET_DATAFD         =3D _IOR('P', 15, ptm_res),
>      PTM_SET_BUFFERSIZE     =3D _IOWR('P', 16, ptm_setbuffersize),
> +    PTM_GET_INFO           =3D _IOWR('P', 17, ptm_getinfo),
> +    PTM_LOCK_STORAGE       =3D _IOWR('P', 18, ptm_lockstorage),
>  };
>  #endif
>
> @@ -257,23 +311,25 @@ enum {
>   * and ptm_set_state:u.req.data) are 0xffffffff.
>   */
>  enum {
> -    CMD_GET_CAPABILITY =3D 1,
> -    CMD_INIT,
> -    CMD_SHUTDOWN,
> -    CMD_GET_TPMESTABLISHED,
> -    CMD_SET_LOCALITY,
> -    CMD_HASH_START,
> -    CMD_HASH_DATA,
> -    CMD_HASH_END,
> -    CMD_CANCEL_TPM_CMD,
> -    CMD_STORE_VOLATILE,
> -    CMD_RESET_TPMESTABLISHED,
> -    CMD_GET_STATEBLOB,
> -    CMD_SET_STATEBLOB,
> -    CMD_STOP,
> -    CMD_GET_CONFIG,
> -    CMD_SET_DATAFD,
> -    CMD_SET_BUFFERSIZE,
> +    CMD_GET_CAPABILITY =3D 1,   /* 0x01 */
> +    CMD_INIT,                 /* 0x02 */
> +    CMD_SHUTDOWN,             /* 0x03 */
> +    CMD_GET_TPMESTABLISHED,   /* 0x04 */
> +    CMD_SET_LOCALITY,         /* 0x05 */
> +    CMD_HASH_START,           /* 0x06 */
> +    CMD_HASH_DATA,            /* 0x07 */
> +    CMD_HASH_END,             /* 0x08 */
> +    CMD_CANCEL_TPM_CMD,       /* 0x09 */
> +    CMD_STORE_VOLATILE,       /* 0x0a */
> +    CMD_RESET_TPMESTABLISHED, /* 0x0b */
> +    CMD_GET_STATEBLOB,        /* 0x0c */
> +    CMD_SET_STATEBLOB,        /* 0x0d */
> +    CMD_STOP,                 /* 0x0e */
> +    CMD_GET_CONFIG,           /* 0x0f */
> +    CMD_SET_DATAFD,           /* 0x10 */
> +    CMD_SET_BUFFERSIZE,       /* 0x11 */
> +    CMD_GET_INFO,             /* 0x12 */
> +    CMD_LOCK_STORAGE,         /* 0x13 */
>  };
>
> -#endif /* TPM_IOCTL_H */
> +#endif /* _TPM_IOCTL_H_ */
> --
> 2.37.2
>


