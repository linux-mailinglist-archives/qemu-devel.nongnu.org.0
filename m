Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F680570CFB
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 23:49:02 +0200 (CEST)
Received: from localhost ([::1]:56466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB1H3-0004Gt-0v
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 17:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oB1Fb-0002iX-Vd; Mon, 11 Jul 2022 17:47:32 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:45853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oB1FZ-0005CM-Tj; Mon, 11 Jul 2022 17:47:31 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-10c0052da61so8221177fac.12; 
 Mon, 11 Jul 2022 14:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rlf+49nmeFEtckQzJk0WNr1lC/oiyJiwcUPVV8ryTKQ=;
 b=YF70KO+8IUkuFh93SFrt8dHPuije4+oYIfORk723eI8d+SrZP+vIydEUfO7pGCWKON
 cBbq1tkRSRsBNQ1Nw/Z+D1oe1X2Qd0n64eum/6IH0huBTeE3owceUWEzCCcRn/LjlzXz
 CopbiG+orxdC3bikk+X8Efrpj9uoENgOrnlMteuyrkvE6T4z5cvm85z01ZwnKxL1p3N7
 AiHNeRxdpysZLRvacqjM04WcTedP1VbulXGRRar0WIcrufD6mJ5St/eptrmOtpTlOGyX
 d7N+RbLeew+6HnzdxGy6fuMj5jgwt3x0dy+JAfkOW47lD4XKKmWMpGf2nzXvGby2J1PN
 QYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rlf+49nmeFEtckQzJk0WNr1lC/oiyJiwcUPVV8ryTKQ=;
 b=PYQF92zhMXCNTBxQmenfkyG5UHdsNDduAcnuoffqpxJReVJrIkiaNT63iv9WC4g6Bu
 rvYFTjvFvbI8nvN3IbwAQnrhYpJGfiBaaHvcPmlWZtLRnYpGhokriLKP1Xa+kvHYTje8
 SRBRRWSUm51Sb65iHCsDa8MeiCtZPjMqOAs49WLYHfOCEKvPL8fgqhb+0NFHxc8TlAth
 JnKHa5wbL32F3McyByKabbs6iqkrHiCEtl0KontNwd7rPZRI3qzUMNVXrF+fdHhQtJCH
 BaUEZJ0iIWscgDGK1HABs3GwH7N+Bt5oRzEZO7cCGQ16vMvqzYG6KsEe9FDXdIKVfv/f
 vNcA==
X-Gm-Message-State: AJIora+rQBrUgM9FYNYHqX4BTpEF70dWX22gB4ph7DkdmhL0FCUHpJtY
 rrzBvoh/1j1sI9wROzT58+s=
X-Google-Smtp-Source: AGRyM1uejTKvuyXcza2Qw51+3mCsj/ghtHdl/e2wwZ7+uZluGA3GBANgCEhoMRt5C7ETskRplkKznA==
X-Received: by 2002:a05:6870:f2a0:b0:fe:29a0:4b48 with SMTP id
 u32-20020a056870f2a000b000fe29a04b48mr219653oap.183.1657576046688; 
 Mon, 11 Jul 2022 14:47:26 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 y10-20020a9d518a000000b00616a2aa298asm3014900otg.75.2022.07.11.14.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 14:47:26 -0700 (PDT)
Message-ID: <e7211718-4cca-91c1-c9c8-661741bd9a43@gmail.com>
Date: Mon, 11 Jul 2022 18:47:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] target/ppc/kvm: Skip ".." directory in kvmppc_find_cpu_dt
Content-Language: en-US
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, mopsfelder@gmail.com, Fabiano Rosas <farosas@linux.ibm.com>
References: <20220711193743.51456-1-muriloo@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220711193743.51456-1-muriloo@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 7/11/22 16:37, Murilo Opsfelder Araujo wrote:
> Some systems have /proc/device-tree/cpus/../clock-frequency. However,
> this is not the expected path for a CPU device tree directory.
> 
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/kvm.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 6eed466f80..c8485a5cc0 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -1877,6 +1877,12 @@ static int kvmppc_find_cpu_dt(char *buf, int buf_len)
>       buf[0] = '\0';
>       while ((dirp = readdir(dp)) != NULL) {
>           FILE *f;
> +
> +        /* Don't accidentally read from the upper directory */
> +        if (strcmp(dirp->d_name, "..") == 0) {
> +            continue;
> +        }
> +
>           snprintf(buf, buf_len, "%s%s/clock-frequency", PROC_DEVTREE_CPU,
>                    dirp->d_name);
>           f = fopen(buf, "r");

