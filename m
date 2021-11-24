Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C056D45B5B2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:40:23 +0100 (CET)
Received: from localhost ([::1]:39410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpmtC-00007F-Nm
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:40:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mpmYR-0008Vi-6F
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:18:56 -0500
Received: from [2a00:1450:4864:20::434] (port=41932
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mpmYM-0001iz-Er
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:18:54 -0500
Received: by mail-wr1-x434.google.com with SMTP id a9so2365676wrr.8
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 23:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zzH2uOMffUT0vvWUxhOWh7ls3cA0ZRRI4ppbt0ln9cU=;
 b=TAgiLgR+G3mYeHFyMAsgXu9Cg4ML97+yDj2nT9jK6WNHQqZw/jn6HOEQ3ztp3Ti4lO
 CllsHJk40s0A3xcImDrk9fKislQJHO+I2m1K57rdvR9tU4sEtOeBTz6mHIGoQVwt8eNw
 EvA7DboD3cvRxyl2ViaEeWms/0g5cAzm9H+y+l0cwWuBKBWuYMXLZaXphpmMi/+4py2g
 aZiDBqvUY0R6MMnzYo0fNHUdRTnpUTafGATCRwYTskDyVMt3ITP6NvDTy138C8KV1BCK
 w4Lq+dKzNuHrQNrA8dVNcvn9PLgtS/BoZ5nxci1TUn/ilF6w474NWkBpPSARgGlVQYKA
 tk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zzH2uOMffUT0vvWUxhOWh7ls3cA0ZRRI4ppbt0ln9cU=;
 b=ploimp/lA/FlY66J6LtG/7PAPkwVrEcYEkJO5JKoIhGmM/woa8eciNKlgQdnUff0bD
 ObG45iHkftAq2/nPTnwZmhAXvhuRy3sYZmupvjGUD7A2NkzydYkzcpdOxTBZwJCvysIv
 k+ovJ6H6u/tjIAtD/+UsoXCOYMuuFB1TN5DVq45F+2M3ciZtifSiuJGVNQCbVgzBXQLp
 4E1s6BZvYrZO8+B57xCYaMbpBayGFTHFj4N36UjBWoD2ye3L3c/JdoR5MAfQsu4tmZs3
 jVFX3wGUImHp3ENK5ICdVvBa5kIZnTtD1mKUbjl6RgKlP1nZpR6qLG2/zGW1Z4DmA/PR
 OAKw==
X-Gm-Message-State: AOAM532/an9qIix3qsgTpA1gueLzPbczxCr1GQfbVvbqSKlFkMOrN8OU
 SkoqS90Bp3RJquD2P6Dz/cc=
X-Google-Smtp-Source: ABdhPJws+G0w7YLP823d0SgIo2NVQAXRzxeJJEKBy3ywszY901xpHVXXiRSzeTaSv/zXh3JPOFUCtw==
X-Received: by 2002:a5d:6043:: with SMTP id j3mr15660173wrt.375.1637738327111; 
 Tue, 23 Nov 2021 23:18:47 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 38sm14762425wrc.1.2021.11.23.23.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 23:18:46 -0800 (PST)
Message-ID: <aef0e015-7fe8-7ab5-ef5f-a744a7ab81c0@amsat.org>
Date: Wed, 24 Nov 2021 08:18:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1 4/7] plugins/meson.build: fix linker issue with weird
 paths
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211123205729.2205806-1-alex.bennee@linaro.org>
 <20211123205729.2205806-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211123205729.2205806-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, Stefan Weil <sw@weilnetz.de>,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/21 21:57, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Stefan Weil <sw@weilnetz.de>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/712
> ---
>  plugins/meson.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


