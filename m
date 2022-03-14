Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4004D86DF
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:20:43 +0100 (CET)
Received: from localhost ([::1]:48564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTlYw-0004nY-Bl
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:20:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTl2h-0003kV-5H; Mon, 14 Mar 2022 09:47:23 -0400
Received: from [2607:f8b0:4864:20::102d] (port=39928
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTl2f-0003SC-A9; Mon, 14 Mar 2022 09:47:22 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 mr24-20020a17090b239800b001bf0a375440so17490710pjb.4; 
 Mon, 14 Mar 2022 06:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DWhSACVHWwYPBciaqaGRAR3kQYlpgvTH+dLB0I6XKSk=;
 b=Ov7M/zyGqWOG7J6PAVLltdD6ckSQJkvRoRKbEjfL+drGTTKsFZHiezdGg4RftkUDi8
 wPTFJmz+t2dMg4cRnHuR4vlugb6CoWo3Lk4YJ6/RFW0u0ESY0wXzq/qxQa+zCCthcCFc
 UDvPmP8uC+0UomAf5zlaAHhZKRYTLEGH3S77f/RngjjXYKPoyDM1Ud6bReLIY+orWpxx
 zoCbicOI/oyKcRep+t2f4fK8JifIOgjueN22leqRc52Wd1COvlOJD2VUSka8HTB3DNxU
 6L38uhGbqYpKLxLduVtgLQMxwEKVAVYp7fWPjJ7Nhal+tDJ6Ii4uaqqbk13VSSXO/OAQ
 R3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DWhSACVHWwYPBciaqaGRAR3kQYlpgvTH+dLB0I6XKSk=;
 b=OPq+CHpByMyJrRhpBc+jGxlP750xYFq0Mm/N01K1o1krDt+fmqlJ0aNuBPdVqvfE+K
 dEKoGQI+KkwjOHr4jgwWWNiMLAWE6FObgLyqqwCqZSKymd+fH/j7dNEPLvqwFfia4yBC
 EDKWaCUKvM17/M++XZy7aUd1UKfyrkNoBGWWF3nfzZdjXDOHTaLh5rUMls/cMB36tpCZ
 YGrJPQx7mAbe153zoTWq+K5aNq+rgSZkDciQgrrWPeKv/vERDL7hIUh8puEKOXHLEUT9
 qrHh/uQP2lupEEcVBe52TbHsvngqw5KlscNET1NDi5JbSk6JToEu9pvMyg6kAIuD29ed
 RDCA==
X-Gm-Message-State: AOAM532vIROnaa4qhZJxHC2lZ+d4aOzmLDeBZRfGaGPu+dVMVT1tD/YC
 NQQmRrTTSprq2FiJeAxYRqc=
X-Google-Smtp-Source: ABdhPJyMegpqcoyUR2tDKIGCoUWtGuOk6hEDtSwuO75pdZw/vtDZqibwEyobNs6lLIxU+h8IjULbcw==
X-Received: by 2002:a17:902:f113:b0:153:2161:2843 with SMTP id
 e19-20020a170902f11300b0015321612843mr21513691plb.95.1647265635510; 
 Mon, 14 Mar 2022 06:47:15 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a056a00130900b004f73df40914sm21339835pfu.82.2022.03.14.06.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 06:47:15 -0700 (PDT)
Message-ID: <a7ce477a-ebed-dbb0-3257-8bc82fe27ce4@gmail.com>
Date: Mon, 14 Mar 2022 14:47:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2] block-qdict: Fix -Werror=maybe-uninitialized build
 failure
Content-Language: en-US
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220311221634.58288-1-muriloo@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220311221634.58288-1-muriloo@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 11/3/22 23:16, Murilo Opsfelder Araujo wrote:
> Building QEMU on Fedora 37 (Rawhide Prerelease) ppc64le failed with the
> following error:
> 
>      $ ../configure --prefix=/usr/local/qemu-disabletcg --target-list=ppc-softmmu,ppc64-softmmu --disable-tcg --disable-linux-user
>      ...
>      $ make -j$(nproc)
>      ...
>      FAILED: libqemuutil.a.p/qobject_block-qdict.c.o

This part >>>

>      cc -m64 -mlittle-endian -Ilibqemuutil.a.p -I. -I.. -Isubprojects/libvhost-user -I../subprojects/libvhost-user -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/sysprof-4 -I/usr/include/lib
>      mount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 -I/usr/include/p11-kit-1 -I/usr/include/pixman-1 -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem /root/qemu/linux-headers -isystem linux-headers -iquote
>       . -iquote /root/qemu -iquote /root/qemu/include -iquote /root/qemu/disas/libvixl -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite
>      -strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-label
>      s -Wexpansion-to-defined -Wimplicit-fallthrough=2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE -MD -MQ libqemuutil.a.p/qobject_block-qdict.c.o -MF libqemuutil.a.p/qobject_block-qdict.c.o.d -
>      o libqemuutil.a.p/qobject_block-qdict.c.o -c ../qobject/block-qdict.c

<<< is noise (doesn't provide any value) and could be stripped.

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
> Fix build failure by expanding the ternary operation.
> Tested with `make check-unit` (the check-block-qdict test passed).
> 
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> ---
> v1: https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03224.html
> 
>   qobject/block-qdict.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/qobject/block-qdict.c b/qobject/block-qdict.c
> index 1487cc5dd8..4a83bda2c3 100644
> --- a/qobject/block-qdict.c
> +++ b/qobject/block-qdict.c
> @@ -251,12 +251,12 @@ void qdict_array_split(QDict *src, QList **dst)
>           if (is_subqdict) {
>               qdict_extract_subqdict(src, &subqdict, prefix);
>               assert(qdict_size(subqdict) > 0);
> +            qlist_append_obj(*dst, QOBJECT(subqdict));
>           } else {
>               qobject_ref(subqobj);
>               qdict_del(src, indexstr);
> +            qlist_append_obj(*dst, subqobj);
>           }
> -
> -        qlist_append_obj(*dst, subqobj ?: QOBJECT(subqdict));
>       }
>   }
>   


