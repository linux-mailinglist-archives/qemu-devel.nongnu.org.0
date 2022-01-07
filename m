Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F6E487DAB
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 21:24:23 +0100 (CET)
Received: from localhost ([::1]:38080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5uPY-0002d7-AL
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 13:56:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n5uIl-00085F-Ap
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 13:49:27 -0500
Received: from [2a00:1450:4864:20::535] (port=39582
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n5uIY-0005Wy-Ef
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 13:49:23 -0500
Received: by mail-ed1-x535.google.com with SMTP id c71so13998939edf.6
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 10:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jML/Da5MbArYq8VlU7uRAi+6d0BJMTIKS9L8QAwg8gY=;
 b=Xw5uG7MMyQI9O2Z1L64SCA8wUhiQo9b01jo7DRSwsFzZhgV2yD+a5SWUxdE6UQJxqI
 y25PTPUc6b4B+BVlISjAEWMNNi//NToryk0efCTkVHlHH8O7OKTjTYNkEOiUSNSESfLt
 rO118zu1ADEoYVRTSd9vu3+e8fJACuo0OPiBEfC2+AasMyuU9fWHO/HtqngGumThPuou
 MhIa99G9cOgAz85flSa6NttGnIee0baBTJadaTvgIn2hFowTIvKQHpQw68wsIrwOOuaz
 ToJJ2CCXQl7GdcT7X2IGWTPNW/YqPqPV59OJfnKsZtunL1Z19Kllu4IIzY6echrxfIpM
 iVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jML/Da5MbArYq8VlU7uRAi+6d0BJMTIKS9L8QAwg8gY=;
 b=RkS6n8a60/Kr2TIosPzoi4Qd71jh88PLICw5dwsnsJJY1tHgxDp4DlpnYZWdjAE1G6
 P7FsIGm1CGun4gnYoL3QmyRS2mzJzg9JkQmykk9EQxQinNPvwGNBLdfMYIG107/42oSw
 rzcsvukK8i1ESIk4PKFdrgvD5FWGP/i6GpwmfxB951p4RpnXqdwNHf2tLYNGkuPdlJxy
 O0IXjE77prFqtnUstrQtD66tD1gBt40i41YTINk4nXzDkPRcnv+Togpw/G3yzCe8V4Vb
 uLZiOs716jshIlr+lz/2hxGahgtKMwkRyBTQl7KNs00kAuzExtRwxjzp5LEYvYZlye2I
 wQ/w==
X-Gm-Message-State: AOAM531O74tQdD3r5yP/AWInuzSgmJ3ytauT30xkeldVFwk0oeUF+2t7
 QhmExuF5PFH/eYDlJP7wZVA=
X-Google-Smtp-Source: ABdhPJyIm/J+IiUryqGrHUoKPeGcw9BgokbQkCqyWb6wT5V+pFG3j5d0ix1WgSVOP8qDQM198VZ1BA==
X-Received: by 2002:a17:906:1405:: with SMTP id
 p5mr1620196ejc.113.1641581349139; 
 Fri, 07 Jan 2022 10:49:09 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id j13sm2460626edw.89.2022.01.07.10.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 10:49:08 -0800 (PST)
Message-ID: <c91e2193-1d38-9c66-5dd8-d1f1d340a9bd@redhat.com>
Date: Fri, 7 Jan 2022 19:49:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] meson: reenable filemonitor-inotify compilation
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
References: <20220107133514.7785-1-vr_qemu@t-online.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220107133514.7785-1-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 14:35, Volker Rümelin wrote:
> Reenable util/filemonitor-inotify compilation. Compilation was
> disabled when commit a620fbe9ac ("configure: convert compiler tests
> to meson, part 5") moved CONFIG_INOTIFY1 from config-host.mak to
> config-host.h.
> 
> This fixes the usb-mtp device and reenables test-util-filemonitor.
> 
> Fixes: a620fbe9ac ("configure: convert compiler tests to meson, part 5")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/800
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   tests/unit/meson.build | 2 +-
>   util/meson.build       | 7 +++++--
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/unit/meson.build b/tests/unit/meson.build
> index 90acf5b0da..64a5e7bfde 100644
> --- a/tests/unit/meson.build
> +++ b/tests/unit/meson.build
> @@ -129,7 +129,7 @@ if have_system
>       'test-vmstate': [migration, io],
>       'test-yank': ['socket-helpers.c', qom, io, chardev]
>     }
> -  if 'CONFIG_INOTIFY1' in config_host
> +  if config_host_data.get('CONFIG_INOTIFY1')
>       tests += {'test-util-filemonitor': []}
>     endif
>   
> diff --git a/util/meson.build b/util/meson.build
> index 05b593055a..71543e1a85 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -83,7 +83,10 @@ if have_block
>     util_ss.add(files('readline.c'))
>     util_ss.add(files('throttle.c'))
>     util_ss.add(files('timed-average.c'))
> -  util_ss.add(when: 'CONFIG_INOTIFY1', if_true: files('filemonitor-inotify.c'),
> -                                        if_false: files('filemonitor-stub.c'))
> +  if config_host_data.get('CONFIG_INOTIFY1')
> +    util_ss.add(files('filemonitor-inotify.c'))
> +  else
> +    util_ss.add(files('filemonitor-stub.c'))
> +  endif
>     util_ss.add(when: 'CONFIG_LINUX', if_true: files('vfio-helpers.c'))
>   endif

Queued, thanks.

Paolo

