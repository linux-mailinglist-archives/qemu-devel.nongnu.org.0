Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074F34DB182
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:31:17 +0100 (CET)
Received: from localhost ([::1]:32772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTkB-0006Vs-PD
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:31:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTVg-0008F8-Hw; Wed, 16 Mar 2022 09:16:17 -0400
Received: from [2a00:1450:4864:20::334] (port=32771
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTVb-0002qI-6G; Wed, 16 Mar 2022 09:16:12 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 n33-20020a05600c3ba100b003832caf7f3aso2525391wms.0; 
 Wed, 16 Mar 2022 06:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4JyIZgrE4P1Kn4wn07mmEvGGdYL63aqq7IDLnDUN0K4=;
 b=jU1+7OR0KHqAMwZSSC/AcyyfNbvez9kPQm09bYq4lrlWZsb0JAXV8pFTYoGRmngNft
 wJVP/QRVBGT+zv4eB7b9kU3ehp5LKO0WZ241yTPHIFn23dA8DNQyDwwq6TTIaAucarMx
 cCZEjICjiQ1nMgKmycyXt3ZIUCZ7jCx4yEFukj3M5rc2dCO1w1nqxGMYzD666z5c2biF
 AsVuyY0vGpjDnccH35/Y61O1IYfAkXZVlhVqWKvtWrHjwED0ttkaPnOgPke7EOw/tEzy
 O5DNRh+0bmuNwiDRZM4zCec1pjoaHyA2Fc8ZeODmMFP21dvx3i6g6cFJJDUN3+FiAJJv
 ZG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4JyIZgrE4P1Kn4wn07mmEvGGdYL63aqq7IDLnDUN0K4=;
 b=W3AbHmDjJ5UJ2WTdBiuZu6uRS7tvcgC8cSZd5qDHHvtCAr0r/+ynDl5Hj2BpFxZLn+
 OqHoSgElkAiXGKLJ6NSDvgo9jAlUyCHa/qy/N1Uh5SNE640TphTU0jHh01gI63KgWY9e
 o3VyJwCJlGHf51TKZbRxoH8XdDuOgymXdC+gpKlBg4ZerZ6IEs/n7gePucxav5xtCico
 1DTUqSm3obwDL3TtifyGyQp3O7FvODW2xhUdZBUz8I6yyE2JNJRL5Ed1ptJcPUr10RwX
 V7ph6vOhV8y9g/ffM/QrB5oS/upNSwYV7+c60j3OASUCO9HsTphhfCVWFp4pL0L+4Fj4
 Z5kg==
X-Gm-Message-State: AOAM532jmrIRttnmbd9NRVMkKhMRCL37p4UeLd6H04HW7OYo86Q1VtTb
 1y08F4ozQ6JejhKKnogMwJU=
X-Google-Smtp-Source: ABdhPJxZB6EkbrGbgbe1OHgAv3zK0P0DzBIxwvVRDujT7ZmPCtls8E9A1Qp3gQmydUuyyzx17yk30Q==
X-Received: by 2002:a05:600c:35ce:b0:38c:7457:425 with SMTP id
 r14-20020a05600c35ce00b0038c74570425mr484570wmq.200.1647436569158; 
 Wed, 16 Mar 2022 06:16:09 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a5d6b43000000b001e317fb86ecsm1699775wrw.57.2022.03.16.06.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 06:16:08 -0700 (PDT)
Message-ID: <dce310d7-35a6-d3df-734a-c9d184fc282c@gmail.com>
Date: Wed, 16 Mar 2022 14:16:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 07/27] Replace GCC_FMT_ATTR with G_GNUC_PRINTF
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220316095248.2613601-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220316095248.2613601-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Eric Blake <eblake@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "open list:blkverify" <qemu-block@nongnu.org>,
 Huacai Chen <chenhuacai@kernel.org>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiri Pirko <jiri@resnulli.us>, Kyle Evans <kevans@freebsd.org>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paul Durrant <paul@xen.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/3/22 10:52, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> One less qemu-specific macro. It also helps to make some headers/units
> only depend on glib, and thus moved in standalone projects eventually.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/audio.h                           |  4 +--
>   block/qcow2.h                           |  2 +-
>   bsd-user/qemu.h                         |  2 +-
>   hw/display/qxl.h                        |  2 +-
>   hw/net/rocker/rocker.h                  |  2 +-
>   hw/xen/xen_pt.h                         |  2 +-
>   include/chardev/char-fe.h               |  2 +-
>   include/disas/dis-asm.h                 |  2 +-
>   include/hw/acpi/aml-build.h             | 12 +++----
>   include/hw/core/cpu.h                   |  2 +-
>   include/hw/hw.h                         |  2 +-
>   include/hw/virtio/virtio.h              |  2 +-
>   include/hw/xen/xen-bus-helper.h         |  4 +--
>   include/hw/xen/xen-bus.h                |  4 +--
>   include/hw/xen/xen_common.h             |  2 +-
>   include/hw/xen/xen_pvdev.h              |  2 +-
>   include/monitor/monitor.h               |  4 +--
>   include/qapi/error.h                    | 20 ++++++------
>   include/qapi/qmp/qjson.h                |  8 ++---
>   include/qemu/buffer.h                   |  2 +-
>   include/qemu/compiler.h                 | 11 ++-----
>   include/qemu/error-report.h             | 24 +++++++-------
>   include/qemu/log-for-trace.h            |  2 +-
>   include/qemu/log.h                      |  2 +-
>   include/qemu/qemu-print.h               |  8 ++---
>   include/qemu/readline.h                 |  2 +-
>   qga/guest-agent-core.h                  |  2 +-
>   qga/vss-win32/requester.h               |  2 +-
>   scripts/cocci-macro-file.h              |  2 +-
>   tests/qtest/libqos/libqtest.h           | 42 ++++++++++++-------------
>   tests/qtest/libqtest-single.h           |  2 +-
>   tests/qtest/migration-helpers.h         |  6 ++--
>   audio/alsaaudio.c                       |  4 +--
>   audio/dsoundaudio.c                     |  4 +--
>   audio/ossaudio.c                        |  4 +--
>   audio/paaudio.c                         |  2 +-
>   audio/sdlaudio.c                        |  2 +-
>   block/blkverify.c                       |  2 +-
>   block/ssh.c                             |  4 +--
>   fsdev/9p-marshal.c                      |  2 +-
>   fsdev/virtfs-proxy-helper.c             |  2 +-
>   hw/9pfs/9p.c                            |  2 +-
>   hw/acpi/aml-build.c                     |  4 +--
>   hw/mips/fuloong2e.c                     |  2 +-
>   hw/mips/malta.c                         |  2 +-
>   hw/net/rtl8139.c                        |  2 +-
>   hw/virtio/virtio.c                      |  2 +-
>   io/channel-websock.c                    |  2 +-
>   monitor/hmp.c                           |  4 +--
>   nbd/server.c                            | 10 +++---
>   qemu-img.c                              |  4 +--
>   qemu-io.c                               |  2 +-
>   qobject/json-parser.c                   |  2 +-
>   softmmu/qtest.c                         |  4 +--
>   tests/qtest/libqtest.c                  |  2 +-
>   tests/unit/test-qobject-input-visitor.c |  4 +--
>   audio/coreaudio.m                       |  4 +--
>   scripts/checkpatch.pl                   |  2 +-
>   58 files changed, 130 insertions(+), 137 deletions(-)

> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index 3baa5e3790f7..f2bd050e3b9a 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -79,19 +79,12 @@
>   #define QEMU_BUILD_BUG_ON_ZERO(x) (sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)) - \
>                                      sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)))
>   
> -#if defined(__clang__)
> -/* clang doesn't support gnu_printf, so use printf. */
> -# define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
> -#else
> -/* Use gnu_printf (qemu uses standard format strings). */
> -# define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
> -# if defined(_WIN32)
> +#if !defined(__clang__) && defined(_WIN32)
>   /*
>    * Map __printf__ to __gnu_printf__ because we want standard format strings even
>    * when MinGW or GLib include files use __printf__.
>    */
> -#  define __printf__ __gnu_printf__
> -# endif
> +# define __printf__ __gnu_printf__
>   #endif

Can we also poison GCC_FMT_ATTR? Maybe split in 2 patches, 1 converting
and another removing unused & poisoning?

