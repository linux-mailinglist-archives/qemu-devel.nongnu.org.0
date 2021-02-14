Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0FF31B21A
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:50:38 +0100 (CET)
Received: from localhost ([::1]:41386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMTe-0000hR-15
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:50:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLpN-0000s2-Du
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:09:01 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLpL-0005Ox-Gc
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:09:00 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v14so6115432wro.7
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5THvuzSi7hsrv5LEWVRzltau/DgVvaeqzoTkKSs4G2M=;
 b=K7CUT4+V6z5EOCqNf7s6baUx+VqBoDypWDlSt5StGlrsWwpWGaOuINEo3PTTPmtRyf
 KysIklbG7L0E2Gz/DVl79jzd/bOt5v8KVBhWqaW5D7YZ65DBkAfwNGs/IcdLpDuKE/9w
 MfY8oeoWczURF71bGKioi75rbJTjhd8hTeTrMtCN7nxxVWdI8pckSlDrzxi9FwxID+v1
 /wggYJ3tHp6VYKceIc/XY19OBBocA0GZcex4byvWELgo/yP6op8vexlYq+h0QuQJ1FG/
 Jfd46v3cIOTVMVvX84x8EMcoYE2PzsHkshRfDGhTtQRt5dTmd0jdFlX6jlzbUpuTbaVY
 I1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5THvuzSi7hsrv5LEWVRzltau/DgVvaeqzoTkKSs4G2M=;
 b=b5y+usCuc0RO6Lvory/onn4dpU/nD9mrdCUj/50APSetWGlag+DXRxgFXCYYl/9cYG
 i/uhM3vVa8+YZvEHTiuCttNHqDypz2VquPG6QrbSrC63Nzh5wS60xxjTVKJnVWjTGVjY
 ZrhrU8zb1LZT09NpurWz8/pXssppOlAbDRCJIwCoeAhIMo6i2ZWk67lxjH40kmNF4S05
 roeNLV64LhtT6PN7uOAx6vjwxSVy9F49QdpVBx7IXkXjR7YwL1yeqrhaM41n18X1Qa0l
 WcxcCaIg6S24Qo5+WxTMF+paFdmNqae+MoiDK4PILdQE+vU7eVnQg+P/WONyRSPcI5ra
 SotA==
X-Gm-Message-State: AOAM5304WycezF+W5MefcQzBNA3qHokmWmt4FDBD1Iqeg7v9C7byUreC
 XcSX+qk2p01b+ZdEprgJrrE=
X-Google-Smtp-Source: ABdhPJxASv8tOa0vfZByD0/63/nh5MFwQqshg5A8+K39knJHTEOgEmYIizi44Ptmidrj7MjntD+7QQ==
X-Received: by 2002:adf:fc4c:: with SMTP id e12mr15520200wrs.106.1613326137803; 
 Sun, 14 Feb 2021 10:08:57 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z8sm19635976wrr.55.2021.02.14.10.08.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 10:08:56 -0800 (PST)
Subject: Re: [RFC PATCH 00/42] target/mips: Reintroduce the R5900 CPU (with
 more testing)
To: qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fdd63a2e-7f17-bb7e-2d0e-26480533503d@amsat.org>
Date: Sun, 14 Feb 2021 19:08:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 6:58 PM, Philippe Mathieu-Daudé wrote:
> The R5900 CPU was removed some time ago (frankly I don't remember
> why). This series add it back, but to prove it works, we also add
> testing at the end.
> 
> The main motivation is to have MIPS R5900 coverage, but to be able
> to run real world r5900 binaries, I had to implement more opcodes.
> 
> 42 patches are a lot, but 3 are already queued in linux-user-for-6.0,
> and the 11 last ones are pure testing. I suppose in next versions
> I'll split the testing patches, but to show the final objective I
> included them in here.
> 
> I tagged it RFC because some parts because:
> 
> - We'd rather not add yet another target, but we need the
>   ILP32-on-64bit ABI (o32 64-bit)
> 
> - RDHWR glibc kludge for user-mode
> 
> - Avocado patches are only here to show the final test.
>   They are useful for my set of tests, but not meant to
>   be merged in mainstream.
> 
> - gitlab jobs are only here to show the tests work.
>   If the target is ever accepted, it would go in an already
>   existing job.
> 
> I'm OK to maintain 64-bit o32 and the testing out of tree, but the
> TCG opcodes are worthwhile review for mainstream.
> 
> Note: there is a sign-extension bug somewhere but I can't find it:
> 
>  $ qemu-r5900o32el busybox free
>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
> =A0total =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0used =C2=A0=C2=A0=C2=
> =A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0free =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sha=
> red =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0buffers
>   =C2=A0Mem: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A03682012 =C2=A0=C2=A0=C2=A0=C2=A0=
> =C2=A0=C2=A0812620 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A02869392 =C2=A0=C2=A0=C2=A0=
> =C2=A0=C2=A01367556 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0321136
>   Swap: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A02095100 =C2=A0=C2=A0=C2=A0=C2=A0-149854=
> 4 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A03593644
>  Total: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A05777112 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-=
> 685924 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A06463036
> 
>  $ free # host
>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
> =A0total =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0used =C2=A0=C2=A0=C2=A0=C2=
> =A0=C2=A0=C2=A0=C2=A0free =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0shared =C2=A0buff/cac=
> he =C2=A0=C2=A0available
>  Mem: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A016264924 =C2=A0=C2=A0=C2=A0=C2=A093=
> 23500 =C2=A0=C2=A0=C2=A0=C2=A02822500 =C2=A0=C2=A0=C2=A0=C2=A01377288 =C2=A0=
> =C2=A0=C2=A0=C2=A04118924 =C2=A0=C2=A0=C2=A0=C2=A05149548
>  Swap: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A018872316 =C2=A0=C2=A0=C2=A011084368 =C2=
> =A0=C2=A0=C2=A0=C2=A07787948

[Same but unescaped]

Note: there is a sign-extension bug somewhere but I can't find it:

 $ qemu-r5900o32el busybox free
               total         used         free       shared      buffers
   Mem:      3682012       812620      2869392      1367556       321136
  Swap:      2095100     -1498544      3593644
 Total:      5777112      -685924      6463036

 $ free # host
               total        used        free      shared  buff/cache
  available
 Mem:       16264924     9323500     2822500     1377288     4118924
    5149548
 Swap:      18872316    11084368     7787948

See the used swap:

  11084368 = 0x00a92250
  -1498544 = 0xffe92250

Regards,

Phil.

