Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AB655B971
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 14:10:59 +0200 (CEST)
Received: from localhost ([::1]:37380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5nZr-00010F-UP
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 08:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5nXD-00008d-Tn
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 08:08:09 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:40574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5nXA-0000n8-E2
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 08:08:06 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so12221464pjl.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 05:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AaYG+oCGz4OgXG9O68HWOpLCp8iIFENEcQB4HQ/elVw=;
 b=dfZybid51kVd9w5JsCA16VQtz+g/3KIu0KRZ8Ey83q7G1ltATSMvz4Xp4b8Pe2hUJf
 rOLx6zTJTzE5BlFbBX48VtDW6ZEAiLKoYSpPt72KptCNHnsBP2wIrLelLZspQqQ5BF3C
 gTjIjNwp9FAMKjt8c0lIkTyW8IYJOlgeuOSuVG5UeRpxyqsdB25PCQa+9FlN49Yzvm8E
 9JwYQfuxZltln26PzK/3DtuNaiE5vaPGfp4K7sGBP1wN/o7Zwyl76yBrOakC6EiijOv8
 Fe+dQg3h6bMqcZ/wmkirgnD1V6hm9TJQ0YepwdAQmM6cWEzy6FZTG10gWoinGmzS6tD5
 XAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AaYG+oCGz4OgXG9O68HWOpLCp8iIFENEcQB4HQ/elVw=;
 b=36QpTTcw0Jfwnyv5rOFjW3AqpJrcY0aJb/Gz1K62Q3vMW82J27nqrTfbl7ZOA7iY+Y
 ttFbLVqDJ7cLtHDrNDAGaASxgMGMbqSN+USULhs2LIQhuKK9EAlQB4R+ljzprJ6iJSpk
 lF7xbqIoxvNqcj38CfUHMK0GK3CWwCgFiBTDkQZpDjgBLk3bqkTM/vj2MORN4Q4ST/S2
 hJw7xZreDzqgFFHaN90cd57bGHMFPg0/uLDSQuSi1rTcTsyjOghl8QREyJqXVICZEdME
 DMFQ2NKOoO1VJew896MvUJlfQNkBHt0JZFuGPRFzPLdch5SYq/3T5xm9+b+yrS0oKaJ0
 gqMg==
X-Gm-Message-State: AJIora/dKXFmtAka7FPGOETy8solsPD3iV6xmuZBtp0rJy7xOqARejrd
 QESmJuiwN4f+u+l+OMueUwVChQ==
X-Google-Smtp-Source: AGRyM1sKbx6eDATksM+JoYiZiSpxZ+rw5Q/lzPfGd+BbgUr3cr7/zztc6SXyG28IPjhajXQao1Fiug==
X-Received: by 2002:a17:90b:164a:b0:1ec:b991:b69 with SMTP id
 il10-20020a17090b164a00b001ecb9910b69mr20593282pjb.173.1656331682768; 
 Mon, 27 Jun 2022 05:08:02 -0700 (PDT)
Received: from [192.168.123.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 l124-20020a622582000000b00518285976cdsm7249423pfl.9.2022.06.27.05.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 05:08:01 -0700 (PDT)
Message-ID: <6bcec8e5-4fb6-db96-20ee-853f159c8a9a@linaro.org>
Date: Mon, 27 Jun 2022 17:37:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: virgl avocado hang
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
References: <7ad664fc-ca40-e446-028f-47ea1fd1c21d@linaro.org>
 <CAJ+F1CKJycsXw=o4=tr+GNFBWkK41WAM_0h428_joW+cF0-V2g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAJ+F1CKJycsXw=o4=tr+GNFBWkK41WAM_0h428_joW+cF0-V2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/27/22 16:10, Marc-André Lureau wrote:
> Could you describe how to reproduce? I naively --disable-virglrenderer and I get:
> 
> $ tests/venv/bin/avocado run tests/avocado/virtio-gpu.py
> Fetching asset from tests/avocado/virtio-gpu.py:VirtioGPUx86.test_virtio_vga_virgl
> Fetching asset from tests/avocado/virtio-gpu.py:VirtioGPUx86.test_virtio_vga_virgl
> Fetching asset from tests/avocado/virtio-gpu.py:VirtioGPUx86.test_vhost_user_vga_virgl
> Fetching asset from tests/avocado/virtio-gpu.py:VirtioGPUx86.test_vhost_user_vga_virgl
> JOB ID     : d9c5b65777777564d1d926fdfb58deaf0e967d15
> JOB LOG    : /home/elmarco/avocado/job-results/job-2022-06-27T12.56-d9c5b65/job.log
>   (1/2) tests/avocado/virtio-gpu.py:VirtioGPUx86.test_virtio_vga_virgl: CANCEL: VirGL not 
> enabled? (0.08 s)
>   (2/2) tests/avocado/virtio-gpu.py:VirtioGPUx86.test_vhost_user_vga_virgl: CANCEL: Could 
> not find vhost-user-gpu (0.02 s)
> RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 2
> JOB TIME   : 0.56 s

Ah, I beg your pardon -- virglrenderer is *not* disabled, I merely assumed it was.  But 
the effect is still there -- dead qemu not reaped, indefinite hang on the driver.

The end of the log is:

> 2022-06-27 17:32:19,746 stacktrace       L0045 ERROR|   Command: ./qemu-system-x86_64 -display none -vga none -chardev socket,id=mon,path=/var/tmp/avo_qemu_sock_4j1r4bdf/qemu-245052-7f2a8c8a3bb0-monitor.sock -mon chardev=mon,mode=control -chardev socket,id=console,path=/var/tmp/avo_qemu_sock_4j1r4bdf/qemu-245052-7f2a8c8a3bb0-console.sock,server=on,wait=off -serial chardev:console -cpu host -m 2G -machine pc,accel=kvm -device virtio-vga-gl -display egl-headless -kernel /home/rth/avocado/data/cache/by_location/892ae21f3ae7d04994d81e1c0bf204ecebe555bb/vmlinuz -initrd /home/rth/avocado/data/cache/by_location/892ae21f3ae7d04994d81e1c0bf204ecebe555bb/initrd.img -append printk.time=0 console=ttyS0 rdinit=/bin/bash

> 2022-06-27 17:32:19,746 stacktrace       L0045 ERROR|   Output: qemu-system-x86_64: -display egl-headless: Parameter 'type' does not accept value 'egl-headless'


if that helps.


r~

