Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA7C4006A3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:30:53 +0200 (CEST)
Received: from localhost ([::1]:46332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFps-00071H-4w
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFhC-0005ig-LM
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:21:54 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFh7-0001t7-OU
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:21:54 -0400
Received: by mail-wr1-x430.google.com with SMTP id b6so314737wrh.10
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mnk5zSmpT/p699xgSKxNbIV/1GCHbsuA6wEF56QNf+E=;
 b=GhgL9+LGgM+gjslEr/EdoI7/xsxfmmw67TehO/6U7pPlE/OPtA9LjE4SDDmXvYLAmN
 yZeX0gl3cDixUofaJ53d7PYirmx3VephL7Fp2AHgbYGFY+2vJtFBsCzJiTNZI+nj8zOU
 lX3C3n2CsiqPN2JfeGez5wPcTov60f+AYR19eDiQGHsrHnbpM5alfslIIIHhsT0nTxma
 DXlSCsL0edylOOeUn7jofbIz89KxP2tF8ZT5uMLxWfF0tNPmLeVePpEpIaz8SindXxiw
 pPRklR9Iklk2ipRx/ia9X3h7Q3ffP7aRj506nP6FYfGI6tshEguc/NBqS4OKI2Ci9Ann
 FGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mnk5zSmpT/p699xgSKxNbIV/1GCHbsuA6wEF56QNf+E=;
 b=W4CB75Zu0X04ezKAYIqoxe1OdBgV4neiWrSBFqG0o6f8z3uIOhGSnGxs1Pq9GEJ0Bk
 bkEiDanNfqX24C5M0yUC7attszvUdXIdsfDlal7kjfjyNNp/A0gC3B7fFVs/TaiwdQi5
 qH1SLCDjtsvWNcCkmfUV52Vbu8mOq3MiES5bNxUqF4AL9sStWUvGwykpGVJRX4CrfBIe
 8iknQN/cAyOWcJd/P3Kc8EiHN6jaU5nEZuI6LlQmW+MyWw6dAmKCsc8WJjASn2LkoLkz
 M8vYO7U2kQIgZvTFf8pPidRsxUGAXUGqEunhgh/U68qwtBpx2zMX5vWX8qhbqxjmV6lP
 zeIA==
X-Gm-Message-State: AOAM533KmolTGmnm8Y+yxZH3URPgM13s8avbYkB1MUotWk1f7S++XG28
 Xsak31fyYcdl4Ew7IHu8BQlz7g==
X-Google-Smtp-Source: ABdhPJwPe1mnKhrxerAyhvhbZ2seI44kln/Bm0nN+tszrWb4ThZb+maUMAoke8HDY1589uhlj92r0g==
X-Received: by 2002:adf:8b03:: with SMTP id n3mr768062wra.439.1630700508096;
 Fri, 03 Sep 2021 13:21:48 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id r15sm402884wmh.27.2021.09.03.13.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:21:47 -0700 (PDT)
Subject: Re: [PATCH v3 12/30] target/hexagon: Remove unused has_work() handler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-13-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c91731f-a11c-3555-93d8-cd3379fb727e@linaro.org>
Date: Fri, 3 Sep 2021 22:21:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> has_work() is sysemu specific, and Hexagon target only provides
> a linux-user implementation. Remove the unused hexagon_cpu_has_work().
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/hexagon/cpu.c | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

