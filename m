Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A839121DBB1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 18:27:35 +0200 (CEST)
Received: from localhost ([::1]:35296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv1Ik-0002du-OO
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 12:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jv1Hg-0001nY-KF
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 12:26:28 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:36816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jv1Hf-0003YP-6d
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 12:26:28 -0400
Received: by mail-io1-xd42.google.com with SMTP id y2so14128241ioy.3
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 09:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J+Skp2J3Ni4CwHZNKmvPL+0FuhwsB/yiv6Pcy66jR5U=;
 b=SIt8C4C8fez1nbCnfuqLY9lNorjP6S3isCPg5fv6mQguPMGgTVspd3VGTcEWjRwY0x
 hXRrivIfPPhpUm6B1MqsuafdrB/zPQAg2Wgx0uqZQ0HDYgXRC1wD1TeDBDmzqU+sEmdr
 vBUgQwC7xicvKs8B6lbmTRpOz3L9H8o2Nc8M3eleivJosHHjsfYo/tAKrIHG66LFDiGW
 gDxOSF5MsJuX7YdvSrXAJ+K+iRxlBgRB4NjnXJCVrrfp/E7qRo+vnr9ph3id8c9T9bfv
 GGG/e/Y64pCD/pjmqT4ex2LtrfUUmjR5k0XNoxrP74zNe37vuKIA1bWxLaf+KTrdQQS4
 ifLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J+Skp2J3Ni4CwHZNKmvPL+0FuhwsB/yiv6Pcy66jR5U=;
 b=dOq0d3yQOKVfuftvXHGOupeFVt1c5gxq3+q2KBZBdEsjWy4j5Q9fDTcwDo5UJETZ53
 BEJXkzZdEI6f4CEBpiaoZCmkKRlvaQ9q0I3/d4DUaP4TI00PslQSK0OpzfIsyVajWEr+
 Oim0hb23UP8mi6f85SGKiLK+HTS4xz6pBrS9NnScxSaybuH2YQj2FwU6sGQYExmwR65Q
 KATHKaK6H0R0tfc7HJIinPnsAlM590IDt5XrDaTohLg5/oPyr8sXCjkSpHHYgRfoSdgV
 2FARONZyT68sTPhIq+LyC5XSiBzhhfSQdrbihTLQiyrSFhsrd4DXOhlafRhikFEXmg7R
 cyJw==
X-Gm-Message-State: AOAM532FTh/Gr4jA6Bw0kKNYUVzHi4lzNUsSqCR3pbvXfM8YgFgfNcQt
 oMIqqEsBUzR4h62Cza1gzCy47PkPrEaXDK2EAiU=
X-Google-Smtp-Source: ABdhPJylgAFKhOa4y3r1+OB+BnM8buE41ybLj/EN6kmyAB2kZ2DUYERCvQJWA/WSEIGruHr0uQ3TfZ1KTnHZ8fBtAII=
X-Received: by 2002:a5d:9ed0:: with SMTP id a16mr511524ioe.176.1594657586180; 
 Mon, 13 Jul 2020 09:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <1594600421-22942-1-git-send-email-wang.yi59@zte.com.cn>
In-Reply-To: <1594600421-22942-1-git-send-email-wang.yi59@zte.com.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Jul 2020 09:16:24 -0700
Message-ID: <CAKmqyKO95rLxrQGU9iwtCAP8roUU+qOsGRZhbACPaizM5K-uJA@mail.gmail.com>
Subject: Re: [PATCH] tcg/riscv: Remove superfluous breaks
To: Yi Wang <wang.yi59@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: xue.zhihong@zte.com.cn, wang.liang82@zte.com.cn,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Liao Pingfang <liao.pingfang@zte.com.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jul 12, 2020 at 5:30 PM Yi Wang <wang.yi59@zte.com.cn> wrote:
>
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
>
> Remove superfluous breaks, as there is a "return" before them.
>
> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tcg/riscv/tcg-target.inc.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
> index 2bc0ba7..3c11ab8 100644
> --- a/tcg/riscv/tcg-target.inc.c
> +++ b/tcg/riscv/tcg-target.inc.c
> @@ -502,10 +502,8 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
>          break;
>      case R_RISCV_JAL:
>          return reloc_jimm20(code_ptr, (tcg_insn_unit *)value);
> -        break;
>      case R_RISCV_CALL:
>          return reloc_call(code_ptr, (tcg_insn_unit *)value);
> -        break;
>      default:
>          tcg_abort();
>      }
> --
> 2.9.5
>
>

