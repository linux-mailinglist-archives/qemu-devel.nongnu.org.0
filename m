Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87FB51FDEA
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:18:30 +0200 (CEST)
Received: from localhost ([::1]:58130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3HR-0004vJ-Lo
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2w2-0001JD-8k; Mon, 09 May 2022 08:56:22 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2w0-0003ZQ-Lh; Mon, 09 May 2022 08:56:21 -0400
Received: by mail-pg1-x534.google.com with SMTP id 202so11958155pgc.9;
 Mon, 09 May 2022 05:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DxFp0KnE84nYenMXrzvL/CH8PkMyvx3gQMh7ApmVB90=;
 b=gSQzr5LZDLhNgR+w8DlL1T3vgFMcPmuoQZJbx91T4UVX1LwJPz2tWZGAmkDjGOGolE
 WSlyiLTPz6fmUHmobmYFMLHwhAj855oKQRrTBcC2WoWjDq4lU0/a9ICqcISqUEeAcWy3
 9Zl0sSAUAEzXTgXJNqheTiGbsfciTxHjLCiT0/11uVXORfpg3NxExaQKS5xB/FdnX5rr
 I8KlJuS12vh6VZxZp4L42IcgOliZJAGKb0arF+vATexZlhZvq97bgFEZTsEXO8ABTRpJ
 Dbek+ngDjEUJBvrI8Um3Nq17owUISV/AQfrgOhONyhJFh5TVFQzezkuygbnc6wc9piGz
 W7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DxFp0KnE84nYenMXrzvL/CH8PkMyvx3gQMh7ApmVB90=;
 b=QqO+PvRXFzoVHw+93Wd4kXmMANHVZoSZvmSxZGg3bwOWw9pvRe61SNdLMVh8NECOV6
 lLmi4VfCtlkUvAR3rp19FMyIYyuRmejRS5znapGaigDbDwJPK9UMk2SmnfF5HNBIywq8
 SQfaVFikqoAPhC1s8BHgqBZLv+rGweZthNBJ5JJ8lxZTLakSWuksidGS7W/Ep/78Z0zY
 r6obmYzHOVTt8FjMYICR2QitItUfK6gFdPAdK2OOhaxOwQS/+PgGQL/0267QFaZYa928
 mhCMc4CcV5rVA1IjDxWRucMo+HAfeicewA3RmRlthhfpQMRCVWk4rhN+0ZfP303TKkKy
 7rNA==
X-Gm-Message-State: AOAM5320LhI7SBMamAbuRlcqa/8V2JqGefIHimYsUdyinRDchF4wJn4j
 XRbxnJvMKG3xltJy/AyFsYlHFPmYnY0=
X-Google-Smtp-Source: ABdhPJxIb4XImMqwIwuC7P2rHIV4kPood5TlQIln/R/AwCV7dpW4CHoDu8poXa7R5loSWZ1KyFvuFA==
X-Received: by 2002:a05:6a00:2484:b0:50e:68e:d5a5 with SMTP id
 c4-20020a056a00248400b0050e068ed5a5mr16032190pfv.47.1652100978603; 
 Mon, 09 May 2022 05:56:18 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a63ed54000000b003c2677c9c9esm8235518pgk.67.2022.05.09.05.56.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 05:56:18 -0700 (PDT)
Message-ID: <2af15d6d-ad10-2f98-fb0a-37d0125044ca@amsat.org>
Date: Mon, 9 May 2022 14:20:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [RFC PATCH 0/3] Remove some of the old libopcode based
 disassemblers
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220412165836.355850-1-thuth@redhat.com>
In-Reply-To: <20220412165836.355850-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 12/4/22 18:58, Thomas Huth wrote:
> Many of the disassemblers in the disas folder are based on old
> versions from the GNU tools (libopcode, GDB, ...) that were still
> licensed under the GPL v2. The GNU tools switched to GPL v3 at one
> point in time, so QEMU is stuck with the old versions, i.e. these
> files did not see much updates for new processors anymore. But
> for most architectures, we're preferring the Capstone disassembler
> now anyway, so the old libopcode disassemblers are also hardly
> used anymore.
> 
> I'm not 100% sure (thus this is marked as RFC), but I think we could
> simply drop the old disassemblers nowadays, and hardly anybody would
> miss them, since we now always embed capstone as a submodule anyway.
> Or is there still an advantage in keeping these old files around?
> 
> This RFC series tackles with s390, arm (32-bit) and i386 ... I wanted
> to get some feedback first, but if we agree that these can be removed,
> the sparc, mips and ppc disassemblers likely can be removed, too.
> (I think we should keep m68k.c since Capstone does not have support
> for Coldfire CPUs yet).
> 
> Thomas Huth (3):
>    disas: Remove old libopcode s390 disassembler
>    disas: Remove old libopcode arm disassembler
>    disas: Remove old libopcode i386 disassembler

>   disas/arm.c             | 4012 -----------------------
>   disas/i386.c            | 6771 ---------------------------------------
>   disas/s390.c            | 1892 -----------

>   10 files changed, 12700 deletions(-)

o_O Nice!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

