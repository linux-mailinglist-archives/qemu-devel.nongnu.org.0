Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EDF4D5330
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 21:43:46 +0100 (CET)
Received: from localhost ([::1]:50622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSPdQ-0004x9-PH
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 15:43:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSPcM-00048s-Hd; Thu, 10 Mar 2022 15:42:38 -0500
Received: from [2607:f8b0:4864:20::c2c] (port=45642
 helo=mail-oo1-xc2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSPcK-0002Qj-Sd; Thu, 10 Mar 2022 15:42:38 -0500
Received: by mail-oo1-xc2c.google.com with SMTP id
 u30-20020a4a6c5e000000b00320d8dc2438so8198388oof.12; 
 Thu, 10 Mar 2022 12:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xb+4HGC1DkcQ1tFA/eXhTg5MD9GUCbj2jRVx8qI4etk=;
 b=ljqRFfI3yXIR2rvjsXZSGvkyVpKYqno/gDaUkyFp0SD+CzD2vXy/ytcWP2HOgziErQ
 I0sLVbZ38tIjKh7D9h+IyhnNRA9yTdVS5mNFI/B2M9GU+aiZAFo4O+3tUFjJbmIUz/yJ
 LfLxTrJKkdEge928Te2FltqjBC/JUB+SON0xTiCDBhQtLAKyqdojqxV+cK8D69z+m4S+
 Uqn48HlAd0tK6fm/FU8YV9WKu43Y93u0yx/ZBjJffK3vLvGrWq+zsqFBpWDxA/c6ebbO
 4F93eQPCGd0YmN0uixTI3gsYtoNX8wOCFh+bfE5mrlIXoiYtcrgmcyCLGzOmztkDun4X
 G0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xb+4HGC1DkcQ1tFA/eXhTg5MD9GUCbj2jRVx8qI4etk=;
 b=3uPEiUKSFxDT+x4ye87D7Wm3BKw72rHfnLwzjmuq6CDj3bLp0FnpdqUzr5WYwpijvZ
 DLNGyB6PmPjdYYe3NkFiHrTmHx+7i9JXoF1XOQpoiyoCwsjezI6eXOEZKujCN14wOZjZ
 heBYUfMnYLkVsxG6ZNHpBERtzTNVK7blALhyG2+LHGAwKMSg9Txoh1qIK2JKW4M55IZi
 25LPQd0QQl+j1LjcMkGVrgPiPdVT7S7mWhSqDnG6p6CTE7vQtRVyb63Iypa4Qz+Sp7LU
 iccz+Z4LbYZfhQaI0U5WQgZsZdMm6R4JHcXKjeOAMH0Tr7wTfY28v9saN5wxiQ3SuCD7
 dVHw==
X-Gm-Message-State: AOAM533kfhlWsXX6OkyUQvM6KIaM//fVqLyM2KXYtV6fZI2x6uGBCBM4
 rNKEAV3o9nOSk8YivMdS0+Y=
X-Google-Smtp-Source: ABdhPJysYsUW4SIP5Nuj86+lIZD9/h533xNIvdpWTxtW1v9FOtYFTREIndOsdEXVdIJ/JNbfnYer8Q==
X-Received: by 2002:a05:6870:2483:b0:da:b3f:322a with SMTP id
 s3-20020a056870248300b000da0b3f322amr3796446oaq.218.1646944954938; 
 Thu, 10 Mar 2022 12:42:34 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:5655:fd2a:accf:db6c:e4fd?
 ([2804:431:c7c6:5655:fd2a:accf:db6c:e4fd])
 by smtp.gmail.com with ESMTPSA id
 125-20020a4a1483000000b003175bffb677sm2862901ood.2.2022.03.10.12.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 12:42:34 -0800 (PST)
Message-ID: <aec57086-33f6-4cf0-4de0-86a7bdbc4b70@gmail.com>
Date: Thu, 10 Mar 2022 17:42:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] block-qdict: Fix -Werror=maybe-uninitialized build failure
Content-Language: en-US
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220310200511.44746-1-muriloo@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220310200511.44746-1-muriloo@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 mopsfelder@gmail.com, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/10/22 17:05, Murilo Opsfelder Araujo wrote:
> Building QEMU on Fedora 37 (Rawhide Prerelease) ppc64le failed with the
> following error:
> 
>      $ ../configure --prefix=/usr/local/qemu-disabletcg --target-list=ppc-softmmu,ppc64-softmmu --disable-tcg --disable-linux-user
>      ...
>      $ make -j$(nproc)
>      ...
>      FAILED: libqemuutil.a.p/qobject_block-qdict.c.o
>      cc -m64 -mlittle-endian -Ilibqemuutil.a.p -I. -I.. -Isubprojects/libvhost-user -I../subprojects/libvhost-user -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/sysprof-4 -I/usr/include/lib
>      mount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 -I/usr/include/p11-kit-1 -I/usr/include/pixman-1 -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem /root/qemu/linux-headers -isystem linux-headers -iquote
>       . -iquote /root/qemu -iquote /root/qemu/include -iquote /root/qemu/disas/libvixl -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite
>      -strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-label
>      s -Wexpansion-to-defined -Wimplicit-fallthrough=2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE -MD -MQ libqemuutil.a.p/qobject_block-qdict.c.o -MF libqemuutil.a.p/qobject_block-qdict.c.o.d -
>      o libqemuutil.a.p/qobject_block-qdict.c.o -c ../qobject/block-qdict.c
>      In file included from /root/qemu/include/qapi/qmp/qdict.h:16,
>                       from /root/qemu/include/block/qdict.h:13,
>                       from ../qobject/block-qdict.c:11:
>      /root/qemu/include/qapi/qmp/qobject.h: In function ‘qdict_array_split’:
>      /root/qemu/include/qapi/qmp/qobject.h:49:17: error: ‘subqdict’ may be used uninitialized [-Werror=maybe-uninitialized]
>         49 |     typeof(obj) _obj = (obj);                                   \
>            |                 ^~~~
>      ../qobject/block-qdict.c:227:16: note: ‘subqdict’ declared here
>        227 |         QDict *subqdict;
>            |                ^~~~~~~~
>      cc1: all warnings being treated as errors
> 
> Fix build failure by initializing the QDict variable with NULL.
> 
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   qobject/block-qdict.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qobject/block-qdict.c b/qobject/block-qdict.c
> index 1487cc5dd8..b26524429c 100644
> --- a/qobject/block-qdict.c
> +++ b/qobject/block-qdict.c
> @@ -224,7 +224,7 @@ void qdict_array_split(QDict *src, QList **dst)
>       for (i = 0; i < UINT_MAX; i++) {
>           QObject *subqobj;
>           bool is_subqdict;
> -        QDict *subqdict;
> +        QDict *subqdict = NULL;
>           char indexstr[32], prefix[32];
>           size_t snprintf_ret;
>   

