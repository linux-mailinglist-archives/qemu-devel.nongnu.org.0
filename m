Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670F64C6D3D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 13:54:16 +0100 (CET)
Received: from localhost ([::1]:39106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOfXZ-0002iy-Qg
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 07:54:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOfNa-0007M9-FN
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 07:43:55 -0500
Received: from [2a00:1450:4864:20::331] (port=37729
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOfNY-00011D-M1
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 07:43:54 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 l1-20020a7bcf01000000b0037f881182a8so5668611wmg.2
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 04:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eHlcmYQ7+TC7u/PlV2yME/qeZjUEs7iCpg8LlE2282A=;
 b=OqrNBudR5Sat+zBu5UHghI8kMpjimCrinoG7cFxB6iKTWaLOzrAc9QT7RxAl2Pb0nD
 ErZYbwxK7JfsE7k+xfpdLSE0AO6pw1wUhQlSiuFcHEwyAL5Ra7C1AVxbXMt9ZwniOo6f
 SpCDCEp7brg0L1NvFtyriGHXMaBojlTkCkA7Mh1zrY1ZZKXI7fwvjYil29c0Z/kv3Mvi
 1UbT5Tj3F800ir519EQiAhPoeeKHp3guhpJrrMwUzdDBTErShiilNQNEPVekavpAIrog
 Z/4j1kGt6IEzTXNuyLfl4ikt+58lZlSlQB6dn58nQCU6njI48oWaavoZsV2J46a92NWO
 kWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eHlcmYQ7+TC7u/PlV2yME/qeZjUEs7iCpg8LlE2282A=;
 b=OwZ2rUj6ukycALjaB45xvEHIneh+NbkPFp2skx26MBaxa/dmn2Oe6hLitH+9fxJiaO
 2mY050Gmpxh19cVJsTDW/FDg57HnI4QVNW/gGAIqyhD6T6LcaC7/Pg98ySSpdX6l+208
 UFkaqq/cQeemCBSLCsbhU5fc0JuQASw1WywIkSjda7MpGqiClX0J5AcWsFhR5GGwSXwk
 Ui8SdEMSmoBuqzEboyE3P5WCCsrRlYJn7ShmdH7sXHymAiQ2eP+rcI7crkRPwBd38Fi+
 GM+on2c6pbo3yoKntGT/XTAUzrH5Wh3nMK6focgRZEwVLwIKXZOOtrrbxfyLwuabnLxp
 SrTw==
X-Gm-Message-State: AOAM531ofeWHmDwUo1OU+vFTaIXKg7mdsakzTPP0evG0d80nxZaRv0rh
 8YzwdOHiqMhrJDUsosEmpPU=
X-Google-Smtp-Source: ABdhPJwDC1wV7DKeaqhdPZbl9G4813JJ4gFaTcbzZDgH6XW5oz/r59qJnE3xKNeu9g92vtGm+ypqzw==
X-Received: by 2002:a05:600c:5024:b0:381:5a59:c048 with SMTP id
 n36-20020a05600c502400b003815a59c048mr5192280wmr.185.1646052230005; 
 Mon, 28 Feb 2022 04:43:50 -0800 (PST)
Received: from [192.168.64.175] (22.red-95-127-166.staticip.rima-tde.net.
 [95.127.166.22]) by smtp.gmail.com with ESMTPSA id
 c14-20020a7bc84e000000b0038100c9a593sm19292186wml.45.2022.02.28.04.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 04:43:49 -0800 (PST)
Message-ID: <d2302870-0771-b1c0-55b3-7391e722f3a5@gmail.com>
Date: Mon, 28 Feb 2022 13:43:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] meson: fix CONFIG_ATOMIC128 check
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220228120720.722632-1-marcandre.lureau@redhat.com>
 <20220228120720.722632-2-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220228120720.722632-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/2/22 13:07, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> testfile.c: In function 'main':
> testfile.c:5:11: error: incorrect number of arguments to function '__atomic_load'
>      5 |       y = __atomic_load(&x, 0);
>        |           ^~~~~~~~~~~~~
> testfile.c:6:7: error: argument 2 of '__atomic_store' must be a pointer type
>      6 |       __atomic_store(&x, y, 0);
>        |       ^~~~~~~~~~~~~~
> testfile.c:7:7: error: argument 3 of '__atomic_compare_exchange' must be a pointer type
>      7 |       __atomic_compare_exchange(&x, &y, x, 0, 0, 0);
>        |       ^~~~~~~~~~~~~~~~~~~~~~~~~
> 
> And it must be linked with -latomic.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   meson.build | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index a9ec3974bc67..a3d8af7a501b 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1841,13 +1841,17 @@ if has_int128
>       int main(void)
>       {
>         unsigned __int128 x = 0, y = 0;
> -      y = __atomic_load(&x, 0);
> -      __atomic_store(&x, y, 0);
> -      __atomic_compare_exchange(&x, &y, x, 0, 0, 0);
> +      __atomic_load(&x, &y, 0);
> +      __atomic_store(&x, &y, 0);
> +      __atomic_compare_exchange(&x, &y, &x, 0, 0, 0);
>         return 0;
> -    }''')
> +    }''', args: ['-latomic'])
>   
>     config_host_data.set('CONFIG_ATOMIC128', has_atomic128)
> +  if has_atomic128
> +    add_global_link_arguments('-latomic',
> +                              native: false, language: ['c', 'cpp', 'objc'])
> +  endif
>   
>     if not has_atomic128
>       has_cmpxchg128 = cc.links('''

Shouldn't this be 1/2 for bisectability?

Anyhow "We deliberately don't link against libatomic", see:
https://lore.kernel.org/qemu-devel/CAFEAcA8V-PAwbtPWghvyjgKtzi949F6g9TnBJpLsGGHt51J64w@mail.gmail.com/

