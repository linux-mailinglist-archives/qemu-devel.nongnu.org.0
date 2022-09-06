Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F865AF3EA
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 20:49:30 +0200 (CEST)
Received: from localhost ([::1]:58962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVddT-0006ss-Kf
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 14:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVdYY-0004kS-1e; Tue, 06 Sep 2022 14:44:22 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:34354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVdYW-0006nd-1N; Tue, 06 Sep 2022 14:44:17 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-11ee4649dfcso30473525fac.1; 
 Tue, 06 Sep 2022 11:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=mgxseVPIodiWGi7DYVtENEKXdSjlNfWDlNxwS6imp2o=;
 b=qHUd04VGEV1S7xQ6ptkwT4oRSt+xsHe/caSy9UNqxmqgewMxbEuNGv54/sfJKTddfM
 gM25BxjJ9T6HgZHZcXfLVwoxQVi/jNQ9JjubjF6LgAHraWyv+VM35pOfJ5algRgC9bir
 BSWJtInUSsYqA5JaaOeDPaORBfYRn3ez0vG1B/N5nImCm2Ig/Zi+wm/KglhWW1u+OT9X
 5H+dARP8Aw0OZnSda25vbHebN2ncAn7pYmuCav+Vn3CwlcCcjOglf28oWjkU/3ami4vl
 V8I+tEzk60iXP39iM2eW31u6fUjdvfrnrmkZOYUmLDUg+01GuK4Q0qfWCcXb03fe3f5u
 rOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=mgxseVPIodiWGi7DYVtENEKXdSjlNfWDlNxwS6imp2o=;
 b=mvtpGThnmloBcs1yg61wrcyfKhpY4mAGn/qt2MCYAqKyd15Dt7hNim0jCwZaICqLwM
 ZtGyuwE5h5ENB3tGTH6PU4aABDxp14ufSpJ5zYgsfrYOThFY6B3wvoa5fz3A9OugiLdI
 O7bBVG+cfWIKK1h7uvyoYCmZxJMg+jPn/ajnx7iuOmvMv89mQ7NjsabMvs85pSfp2phB
 HDA7m7Zdc2J60Ll9ScJEa5+mCKkSFr4PlqOf+nkDjmdycmJJSfFAdjBRRjZHHAGjQbLK
 S0N16U/o1d25vIEpsymLWqxZBpGv3w80vBJP/D412JrEHV5Dwbu7fgo39KnDi7KTkEZP
 Nxaw==
X-Gm-Message-State: ACgBeo02clpvovZ/CaKOPxKTmigT3PdimewrtF1smBnLuy6GAPyDGzHU
 SIHARQOh3/NRWBXTMO+C2D4=
X-Google-Smtp-Source: AA6agR5mvyFbZwhl14zfMPruOltGUcWPELpYhUSc1O4SLaVTiz/YlxzdYMOf0RZ90sHrxEcNlzRKcw==
X-Received: by 2002:aca:1219:0:b0:347:b79d:280 with SMTP id
 25-20020aca1219000000b00347b79d0280mr10489836ois.102.1662489853559; 
 Tue, 06 Sep 2022 11:44:13 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 r130-20020a4a3788000000b00448a3ecdc9dsm4374250oor.22.2022.09.06.11.44.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 11:44:12 -0700 (PDT)
Message-ID: <966684c0-d41e-a54a-7c48-27b728dafe4a@gmail.com>
Date: Tue, 6 Sep 2022 15:44:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v4 0/3] Implement Power ISA 3.1B hash insns
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, cohuck@redhat.com, farosas@linux.ibm.com
References: <20220715205439.161110-1-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220715205439.161110-1-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.752,
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 7/15/22 17:54, Víctor Colombo wrote:
> This patch series implements the 4 instructions added in Power ISA
> 3.1B:
> 
> - hashchk
> - hashst
> - hashchkp
> - hashstp
> 
> It's built on top of ppc-next. Working branch for ease of use can be
> found here:
> https://github.com/PPC64/qemu/tree/vccolombo-hash-to-send-v4
> 
> What do you think about the choice to implement the hash algorithm
> from the ground up, following the SIMON-like algorithm presented in
> Power ISA? IIUC, this algorithm is not the same as the original[1].
> Other options would be to use other algorithm already implemented
> in QEMU, or even make this instruction a nop for all Power versions.
> 
> v1->v2:
> - Split the patch in 2
> - Rebase to master
> 
> v2->v3:
> - Split patches in 3
>      - the new patch (patch 1) is separating the kvm header
>        changes [Cornelia]
> 
> v3->v4:
> - Remove Patch 1 (linux-headers/asm-powerpc/kvm.h:
>      Add HASHKEYR and HASHPKEYR in headers)
>      - Daniel recommended drop the kvm part:
>      https://lists.nongnu.org/archive/html/qemu-ppc/2022-07/msg00213.html
> - Substitute Patch 1 with a separated patch setting up the registers
>    for TCG only. Also, now setup it with a random value in linux-user.
> - Change the registers naming:
>      - SPR_POWER_HASHKEYR -> SPR_HASHKEYR
> - Drop RFC tag
> 
> [1] https://eprint.iacr.org/2013/404.pdf
> 
> Víctor Colombo (3):
>    target/ppc: Add HASHKEYR and HASHPKEYR SPRs
>    target/ppc: Implement hashst and hashchk
>    target/ppc: Implement hashstp and hashchkp
> 
>   target/ppc/cpu.h                           |  2 +
>   target/ppc/cpu_init.c                      | 28 ++++++++
>   target/ppc/excp_helper.c                   | 84 ++++++++++++++++++++++
>   target/ppc/helper.h                        |  4 ++
>   target/ppc/insn32.decode                   | 10 +++
>   target/ppc/translate.c                     |  5 ++
>   target/ppc/translate/fixedpoint-impl.c.inc | 34 +++++++++
>   7 files changed, 167 insertions(+)
> 

