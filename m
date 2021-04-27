Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF47D36CBC6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 21:38:36 +0200 (CEST)
Received: from localhost ([::1]:43856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbTXX-0001t5-Tw
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 15:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbTVI-0000tV-4T
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 15:36:16 -0400
Received: from mail-oo1-f52.google.com ([209.85.161.52]:42618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbTVG-0005UR-No
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 15:36:15 -0400
Received: by mail-oo1-f52.google.com with SMTP id
 w6-20020a4a9d060000b02901f9175244e7so1199680ooj.9
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 12:36:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QDlihRskUAhxwiuEr2BXnDXbtPbV3nkvi3hBDcdnpe4=;
 b=PtSkVqVmGbhNBjiTzO2z+Ac5OoKR9SvQyffYYb4ri1K0dmd/EbWsA4xcZFF2EA8UK5
 FQ1GYsKbI7KzF+OVI6iqxCzyqYPKd6vwdLhGAXipRaOWHUSP7dCZYDbH5AeolvvmHgmM
 z2vh6yPaMAFVS1AA5hdxgwUwbHFl8ZoRsLfvzV+tPNMdbiAI7m+Fi3Vb6jcjTS4m7eMx
 hlTtm++sQdkYMa3NvXIQ++R1HLlvvVect2sMuh7nudlv1aMY3qdyZ9yGddsqhUvn5B8T
 agSkHOMWd+R7z03PHGq5AUT6KVDRrn7BEQGI8xAFgDEZLHENmMHDxxUu1ej0isosoom1
 Ww0g==
X-Gm-Message-State: AOAM530JlNWaJ2ZOcQSLlPWNcMO+aar4JWx98NQIf6TJTEsMIQx7PCc7
 x2DkuJQ+Ro56X6k5dVPqdIJ/8ry83jdNoRcrIG631aEnBf6EUQ==
X-Google-Smtp-Source: ABdhPJztRU+Sn3FGwD5WdKz6ZH6KgRM1INQefZIN3cXSQSwvDb25VxfizD80TCiaYupFdoAZszaRlCB/4kYnNli4LJg=
X-Received: by 2002:a4a:765c:: with SMTP id w28mr19356910ooe.8.1619552173575; 
 Tue, 27 Apr 2021 12:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210422081055.2349216-1-f4bug@amsat.org>
In-Reply-To: <20210422081055.2349216-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 27 Apr 2021 21:36:02 +0200
Message-ID: <CAAdtpL7qixc2Nn3iX2rNGZoxj-+4bfo0YsAi=oo_QGcTcoA1GA@mail.gmail.com>
Subject: Re: [PATCH] target/mips: Remove spurious LOG_UNIMP of MTHC0 opcode
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.161.52;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oo1-f52.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 22, 2021 at 10:10 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> When running with '-d unimp' all MTHC0 opcode executed
> are logged as unimplemented... Add the proper 'return'
> statement missed from commit 5204ea79ea7.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied to mips-next.

