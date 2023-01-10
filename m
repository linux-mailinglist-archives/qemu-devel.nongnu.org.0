Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292CD663AC7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 09:19:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF9ln-0002TF-64; Tue, 10 Jan 2023 03:14:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9ld-0002PX-5V
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:14:00 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9la-0002Iy-Td
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:13:56 -0500
Received: by mail-wr1-x430.google.com with SMTP id t5so6434259wrq.1
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QA5NvsWRZLEzMaQ/o/YgGaYzPr6DKLgnx3nQB22q8bU=;
 b=ZPdyy8jkVMmc1RYvsW45NzxWbYeDKxYRSqBToFe/zCer4sBlhQaHo8/TOMUCvOCKLC
 Tum3C2nhcQm3ji3QHGKwOTKKrnlGbRr9w94WtjxfdqeWYGpHIh+tuM6XWADNXkVYsGq6
 7uF3rpeK7cAL+Ftr6Z8UW8OfUG09YCAgAV3etZ3OfiQtTzt2UaiPZ/8zoo6LnARQWjIQ
 Y9nRVuHmn08vwBly/vGOwwCj8Clz2SP3+eHQELtpN6eJkhvubYKW2r+KWokxz6iI9bvS
 yZ5jbk0eUCac1jTlYHW0JLX+ZNKFP3El8sOEb3oAQdQu1icC4itrywbPic0Qjq/80efF
 205w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QA5NvsWRZLEzMaQ/o/YgGaYzPr6DKLgnx3nQB22q8bU=;
 b=QwZSzACps35kvWDmaQAzk29NVQkSGWbAAZRxiOGUeqnE+cxDxI8yas08Rd1asE19ks
 v+BBCBxfiov77cbVsQrONZFjGSJkBYJn8piWxwE4r01nev3YYpzR9sojIx2oVRzO0IZ2
 EIjdEw7kzeu4iZrFPd47BCTUk5ymgVeSK5yta6SUd0TIwV7bGZ2y1Ov9zSilyT1qE3jJ
 3gpctEH8JABZEFUrM9KKAFDmrnQx+Qy69/KTW5IBRgDMsTFM4a8BlKM/XBQSmqjoZ956
 MNlthiGFKZsmIW8olX7P67Maq5My2TLqctCUmbEP5IixvOHYVwz4pE20tzjaLSUT4pif
 z2ew==
X-Gm-Message-State: AFqh2kqsuWwCLyUivwYoHWuglkSgPKqCzF0qrm4Km0tHAgjhWcNv87CL
 OY6Ab1jD4uuH6Vxfg5cCE44lXw==
X-Google-Smtp-Source: AMrXdXuA3EGgUxAU8eyzKd2KgShIJt5L4HvFjl2IYy1AuHXS6j1PNfjeQtHzp+EdMrjg9gz4qhkqvQ==
X-Received: by 2002:adf:b1d4:0:b0:2bc:850c:594a with SMTP id
 r20-20020adfb1d4000000b002bc850c594amr1780717wra.2.1673338433317; 
 Tue, 10 Jan 2023 00:13:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m10-20020a056000008a00b002683695bf97sm10392096wrx.58.2023.01.10.00.13.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 00:13:52 -0800 (PST)
Message-ID: <b73123a5-7467-292b-31e3-24bc9f11b1cf@linaro.org>
Date: Tue, 10 Jan 2023 09:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/1] python/machine: Fix AF_UNIX path too long on macOS
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
Cc: jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com,
 wainersm@redhat.com, qemu-devel@nongnu.org
References: <20230110080756.38271-1-peter@pjd.dev>
 <20230110080756.38271-2-peter@pjd.dev>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230110080756.38271-2-peter@pjd.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/1/23 09:07, Peter Delevoryas wrote:
> On macOS, private $TMPDIR's are the default. These $TMPDIR's are
> generated from a user's unix UID and UUID [1], which can create a
> relatively long path:
> 
>      /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
> 
> QEMU's avocado tests create a temporary directory prefixed by
> "avo_qemu_sock_", and create QMP sockets within _that_ as well.
> The QMP socket is unnecessarily long, because a temporary directory
> is created for every QEMUMachine object.
> 
>      /avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock
> 
> The path limit for unix sockets on macOS is 104: [2]
> 
>      /*
>       * [XSI] Definitions for UNIX IPC domain.
>       */
>      struct  sockaddr_un {
>          unsigned char   sun_len;        /* sockaddr len including null */
>          sa_family_t     sun_family;     /* [XSI] AF_UNIX */
>          char            sun_path[104];  /* [XSI] path name (gag) */
>      };
> 
> This results in avocado tests failing on macOS because the QMP unix
> socket can't be created, because the path is too long:
> 
>      ERROR| Failed to establish connection: OSError: AF_UNIX path too long

Ah, I'm using this klugde:

   $ TMPDIR=/tmp avocado run ...

> This change resolves by reducing the size of the socket directory prefix
> and the suffix on the QMP and console socket names.
> 
> The result is paths like this:
> 
>      pdel@pdel-mbp:/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T
>      $ tree qemu*
>      qemu_df4evjeq
>      qemu_jbxel3gy
>      qemu_ml9s_gg7
>      qemu_oc7h7f3u
>      qemu_oqb1yf97
>      ├── 10a004050.con
>      └── 10a004050.qmp
> 
> [1] https://apple.stackexchange.com/questions/353832/why-is-mac-osx-temp-directory-in-weird-path
> [2] /Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/un.h
> 
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> ---
>   python/qemu/machine/machine.py         | 6 +++---
>   tests/avocado/avocado_qemu/__init__.py | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


