Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B0C1EC896
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 07:09:22 +0200 (CEST)
Received: from localhost ([::1]:53372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgLeT-00074a-Ur
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 01:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agrecascino123@gmail.com>)
 id 1jgLdh-0006ez-1M
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 01:08:33 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:50674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <agrecascino123@gmail.com>)
 id 1jgLdf-0007ZW-G5
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 01:08:32 -0400
Received: by mail-wm1-x341.google.com with SMTP id v19so547530wmj.0
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 22:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=b8KtrBQL2g5mxsGEXrW2kz5E/Tv95+KXaRkSlB2LE0M=;
 b=q2kt2qK+nqlwt8hHtj+b+prcU4BiQtvMuYLQVTu3XJjbQBPpAPxInvbnHFO+OvyBdy
 3HV6AfLC9SwnBVjaQghIo58zg/3rERT+lnbV2VD5lvVPfmTDwpewYhvARyUzfhMNlarL
 w7WIXdOkwdDtNdAlKt4ozl14ib+kaxFXlu+ZBG7lvP+hGdRICfw22B5dhjyHFjHB0izu
 hI0Z+4nHJGVNWEc/WW9ZQnhlviC975fcHYnJVELhR94WJWPL4Ry1vDjw7pjDQj3ibEDL
 uyU9E5qfTuHrXCEJl0zObK8dH1c/UCgzWRnrdRgjTn+ZV350dxwvT+kCb0VZUSYdy8rV
 A73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=b8KtrBQL2g5mxsGEXrW2kz5E/Tv95+KXaRkSlB2LE0M=;
 b=gw8TkLXp84LMbta8RNEZdVF93Gz6ktk5RKebzzM9gGdzIjSQb+lDgQf9d+jIobm3Mr
 WrlRoUhy7VhWT42w21oNTG2wSaiwyrXIT/ixx+JvjbdmsqLAmpLx4u0ttf274W1BbEt9
 sGaj5N+n7AMVo+izG8ott09nTWDwJBnv7zBUqvGTHQMeV9INLWNI7L8KzeWLZrPOSH8R
 KYcTV0jpvPMqwE/HqQZALTrWi56pc9JoA/9GVsGDXM71tCst0Lo+tLWNMy81GWzYwQCX
 +knT3N9VCuThmQx6YsNfmCJ3HwdHZ4y4Ng7tUqBu9lyzylExFeDy1o/sJpmX0GC/UoIq
 SY7A==
X-Gm-Message-State: AOAM533rj6LEYSabXvLyriZab/1QlrHhN5PdboMLTrsqPLr9htpLdFg8
 oJ4PaN/3S9AJHoNoV6o6Z5nqF6b3pPBPdWilBhs=
X-Google-Smtp-Source: ABdhPJzKDEI/EqIXJwzJmwgff6bod8HmT8l+gV0VFx+voCezoZw08wjAw/k5dkvX013GA3mQHiL42YTC2y1UzDqiuqY=
X-Received: by 2002:a1c:3b8b:: with SMTP id i133mr6853040wma.111.1591160909822; 
 Tue, 02 Jun 2020 22:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200603044701.10748-1-agrecascino123@gmail.com>
In-Reply-To: <20200603044701.10748-1-agrecascino123@gmail.com>
From: "Catherine A. Frederick / mptcultist" <agrecascino123@gmail.com>
Date: Wed, 3 Jun 2020 01:08:16 -0400
Message-ID: <CAMEuMrKtpPwk0TsP+BU_v_EOUBW+QNt7gQHZYsexF3jT-dpzLQ@mail.gmail.com>
Subject: Re: [PATCH] tcg: Sanitize shift constants on ppc64le so that shift
 operations with large constants don't generate invalid instructions.
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=agrecascino123@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Oh dear, it appears that git send-email ate the formatting, hang on.

On Wed, Jun 3, 2020 at 12:47 AM <agrecascino123@gmail.com> wrote:
>
> From: "Catherine A. Frederick" <chocola@animebitch.es>
>
> ---
>  tcg/ppc/tcg-target.inc.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
> index ee1f9227c1..a5450a5e67 100644
> --- a/tcg/ppc/tcg-target.inc.c
> +++ b/tcg/ppc/tcg-target.inc.c
> @@ -790,21 +790,25 @@ static inline void tcg_out_ext32u(TCGContext *s, TCGReg dst, TCGReg src)
>
>  static inline void tcg_out_shli32(TCGContext *s, TCGReg dst, TCGReg src, int c)
>  {
> +    c = ((unsigned)c > 32) ? 32 : c;
>      tcg_out_rlw(s, RLWINM, dst, src, c, 0, 31 - c);
>  }
>
>  static inline void tcg_out_shli64(TCGContext *s, TCGReg dst, TCGReg src, int c)
>  {
> +    c = ((unsigned)c > 64) ? 64 : c;
>      tcg_out_rld(s, RLDICR, dst, src, c, 63 - c);
>  }
>
>  static inline void tcg_out_shri32(TCGContext *s, TCGReg dst, TCGReg src, int c)
>  {
> +    c = ((unsigned)c > 32) ? 32 : c;
>      tcg_out_rlw(s, RLWINM, dst, src, 32 - c, c, 31);
>  }
>
>  static inline void tcg_out_shri64(TCGContext *s, TCGReg dst, TCGReg src, int c)
>  {
> +    c = ((unsigned)c > 64) ? 64 : c;
>      tcg_out_rld(s, RLDICL, dst, src, 64 - c, c);
>  }
>
> --
> 2.26.2
>

