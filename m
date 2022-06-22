Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECF75543B0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 09:54:58 +0200 (CEST)
Received: from localhost ([::1]:45612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3vCS-0003di-Or
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 03:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3vAu-0002Ew-4D
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 03:53:20 -0400
Received: from smtpout140.security-mail.net ([85.31.212.149]:42784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3vAq-0002Ac-Jf
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 03:53:19 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx409.security-mail.net (Postfix) with ESMTP id 5808F3239D8
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 09:53:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655884393;
 bh=hMNXupoHg6uykLd+7xVk9/fOEBkDoR22WE9QQs/o2d8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ndbVwDflxh75NbRp5nNCsvU4s8nFEjHtNCLVGlY5I7DeZR/+WdFgV20ijx63OUguf
 MV7dpb+rSxHr07Mhn1cj3c7AZ3TFtCFxeFN5kgKlxEa/u1nUweqFeY8jAE5Q91Bavy
 ArdAKtpCOBzuuX/OMNjFkq/KhaLEhXqqS4umiCWw=
Received: from fx409 (localhost [127.0.0.1]) by fx409.security-mail.net
 (Postfix) with ESMTP id B61633238D9; Wed, 22 Jun 2022 09:53:12 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx409.security-mail.net (Postfix) with ESMTPS id 1622932380E; Wed, 22 Jun
 2022 09:53:12 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id EE2F227E04CD; Wed, 22 Jun 2022
 09:53:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id D751727E04DD; Wed, 22 Jun 2022 09:53:11 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 5Da7IJxt-pkj; Wed, 22 Jun 2022 09:53:11 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id BEC9827E04CD; Wed, 22 Jun 2022 09:53:11 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <16028.62b2ca68.147ba.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu D751727E04DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655884391;
 bh=QjjExzgle2yy5KSCN2Pf45yOkRfmqv2B81tj+ya342s=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=NGuBBiCXqCc+aksvQ4W7+XyOQF5gtbDF1hjtGBFgbSwMI15Iqw7GNfSXr+BmkcrcT
 g0ktfzlnju9PULNvprbkmjVIAY9Hl8lkbPs2qKfMKAGMRoq3sU6whHZvPFf8fFiuOW
 ZjBiYtS++fuksyCPtuFNzdpiLa1CX5fu9Gmx0BpE=
Date: Wed, 22 Jun 2022 09:53:11 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 19/53] gdbstub: Convert GDB error numbers to host
 error numbers
Message-ID: <20220622075311.GC28991@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-20-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-20-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.149; envelope-from=lmichel@kalray.eu;
 helo=smtpout140.security-mail.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 13:45 Tue 07 Jun     , Richard Henderson wrote:
> Provide the callback with consistent state -- always use
> host error numbers.  The individual callback can then
> decide if the errno requires conversion for the guest.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  gdbstub.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index a3ff8702ce..ecc9d9cd6f 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1878,6 +1878,37 @@ static void handle_file_io(GArray *params, void *user_ctx)
>          } else {
>              err = 0;
>          }
> +
> +        /* Convert GDB error numbers back to host error numbers. */
> +#define E(X)  case GDB_E##X: err = E##X; break
> +        switch (err) {
> +        case 0:
> +            break;
> +        E(PERM);
> +        E(NOENT);
> +        E(INTR);
> +        E(BADF);
> +        E(ACCES);
> +        E(FAULT);
> +        E(BUSY);
> +        E(EXIST);
> +        E(NODEV);
> +        E(NOTDIR);
> +        E(ISDIR);
> +        E(INVAL);
> +        E(NFILE);
> +        E(MFILE);
> +        E(FBIG);
> +        E(NOSPC);
> +        E(SPIPE);
> +        E(ROFS);
> +        E(NAMETOOLONG);
> +        default:
> +            err = EINVAL;
> +            break;
> +        }
> +#undef E
> +
>          gdbserver_state.current_syscall_cb(gdbserver_state.c_cpu, ret, err);
>          gdbserver_state.current_syscall_cb = NULL;
>      }
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=12eb3.629fd0dd.8c7c2.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+19%2F53%5D+gdbstub%3A+Convert+GDB+error+numbers+to+host+error+numbers&verdict=C&c=cdb84b0ad101f626e700d163f173cb52e6d969f7
> 

-- 





