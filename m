Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0996948901B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 07:20:13 +0100 (CET)
Received: from localhost ([::1]:46160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6o2O-0004L4-0q
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 01:20:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n6nwx-00080h-Ds
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 01:14:35 -0500
Received: from [2607:f8b0:4864:20::1033] (port=53820
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n6nws-0001dq-JL
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 01:14:32 -0500
Received: by mail-pj1-x1033.google.com with SMTP id m13so12361598pji.3
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 22:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YrPZBfVhy+bnJkPG7D2dpoA///qCjFHrqF8mWEvGc5U=;
 b=8LmnJb4Pmur/Qvulq9LYTgbJ729K+NcGDIgxJAEOj0XrN9211Dr576O8cFhzOKY/7Z
 UoamciYeqjfTx4fXHnVS8Q0SXhE8tOlEZ5iZ3xFc/QEb81rYuP0d2CQHCv27p8o5giD5
 2ewDjWzLT+zHYsA2ZfbBAfFRG/glzAgSI1tvgWzdn/KAt+Tsd0t/RIqOdpU5OyEDnjUL
 GLVucZZ9cXFsLuAbQ62aS/FsA5vrbuEquYJIIvdkCqk4rFz4WeB8nwSLwCI0IwJGHY+H
 UeOs9AaVgVlkus841jzA6jY5pEvFmJX/+mwQZ6K71Ad1U+yJ4wS+8vxLfLvklGTpimVm
 b/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YrPZBfVhy+bnJkPG7D2dpoA///qCjFHrqF8mWEvGc5U=;
 b=WOGg7KtP3+gtRmGJLjoHYyZlgZgkSheTknoMWTml/mhNBD5D8L3M5asZ33ymc3GO0b
 IKubioOIXaaCzjoRZV80G3SYVggrpJMZRV0CxrseTFpC/YrirDyGBZIZKLefgC1+EtB3
 5DfOnVbV5g4uHb+9qf0ni6W7W3YZLTWLFtgJSdRhe8oHntDe785bFEUsJPEpGSmi5uhE
 cZWfzFywV6JjMpgKPKRoQd3NwPNBNwPhcsVOsBPFt1jb3aqrHLodb2bhUMcNjzSLYCU9
 yw0j8MaMN57TwP7zSWC02FQ6L+YKQeLAkqdcP/JQXAPmwRa00p3w/Zee3oUMiTNHVnxw
 fkKA==
X-Gm-Message-State: AOAM530BgXZU2BXMvSOCxEccSitjp9JtQNytkdOmO2R0PvPgxOfDevi4
 OtKK9IhCTCHfEmPaPpCUQrCcdQ==
X-Google-Smtp-Source: ABdhPJzwo9bbOBOSErUMobISv9p3+GnBbz0fZwgFHIpWtNwAqHNxzmjW6JKt9vm5BXcU9Q/ZT61Oyw==
X-Received: by 2002:a17:90b:4b0e:: with SMTP id
 lx14mr28575707pjb.132.1641795267762; 
 Sun, 09 Jan 2022 22:14:27 -0800 (PST)
Received: from [10.76.15.169] ([61.120.150.76])
 by smtp.gmail.com with ESMTPSA id p11sm2160744pgh.23.2022.01.09.22.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 22:14:27 -0800 (PST)
Subject: Re: [PATCH v2 0/2] Introduce camera subsystem
To: peter.maydell@linaro.org, berrange@redhat.com
References: <20220106085304.795010-1-pizhenwei@bytedance.com>
From: zhenwei pi <pizhenwei@bytedance.com>
Message-ID: <f390b6bc-6fbe-4820-926b-237e4d4b7acc@bytedance.com>
Date: Mon, 10 Jan 2022 14:11:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220106085304.795010-1-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, eblake@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Peter & Daniel

Sorry about that I'm not clear enough to add a new subsystem into QEMU, 
could you give me more hint?

On 1/6/22 4:53 PM, zhenwei pi wrote:
> v1 -> v2:
>    [missing CC qemu-devel@nongnu.org, resend]
>    Separate v1 patch set into 2 parts:
>      Introduce camera subsystem (this one).
>      USB desc fix and UVC.
>    Add maintainer infomation.
> 
> v1:
> 1, The full picture of this patch set:
>     +---------+       +------------+     +---------------+
>     |UVC(done)|       |virtio(TODO)|     |other HW device|
>     +---------+       +------------+     +---------------+
>           |                 |                     |
>           |            +------------+             |
> 	 +------------+camera(done)+-------------+
>                        +----+-------+
>                             |
>           +-----------------+---------------------+
>           |                 |                     |
>    +------+------+     +----+-----+        +------+------+
>    |builtin(done)|     |v4l2(done)|        |other drivers|
>    +-------------+     +----------+        +-------------+
> 
> With this patch set, We can run a desktop VM (Ex Ubuntu-2004), several camera
> APPs(cheese, kamoso, guvcview and qcam) work fine.
> 
> Some works still in working:
>    1, hot-plug
>    2, compat with live migration
>    3, several actions defined in UVC SPEC
> 
> Zhenwei Pi (2):
>    camera: Introduce camera subsystem and builtin driver
>    camera: v4l2: Introduce v4l2 camera driver
> 
>   MAINTAINERS             |   7 +
>   camera/builtin.c        | 717 ++++++++++++++++++++++++++++++++++++++++
>   camera/camera-int.h     |  19 ++
>   camera/camera.c         | 522 +++++++++++++++++++++++++++++
>   camera/meson.build      |  20 ++
>   camera/trace-events     |  28 ++
>   camera/trace.h          |   1 +
>   camera/v4l2.c           | 637 +++++++++++++++++++++++++++++++++++
>   include/camera/camera.h | 238 +++++++++++++
>   meson.build             |  20 +-
>   meson_options.txt       |   3 +
>   qapi/camera.json        | 101 ++++++
>   qapi/meson.build        |   1 +
>   qapi/qapi-schema.json   |   1 +
>   qemu-options.hx         |  13 +
>   softmmu/vl.c            |   4 +
>   16 files changed, 2331 insertions(+), 1 deletion(-)
>   create mode 100644 camera/builtin.c
>   create mode 100644 camera/camera-int.h
>   create mode 100644 camera/camera.c
>   create mode 100644 camera/meson.build
>   create mode 100644 camera/trace-events
>   create mode 100644 camera/trace.h
>   create mode 100644 camera/v4l2.c
>   create mode 100644 include/camera/camera.h
>   create mode 100644 qapi/camera.json
> 

-- 
zhenwei pi

