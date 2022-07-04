Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0119B565506
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 14:19:17 +0200 (CEST)
Received: from localhost ([::1]:48238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8L2p-0004kv-SZ
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 08:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Kv5-0004Yl-G4
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:11:15 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:46799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Kv3-0007Fc-Tj
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:11:15 -0400
Received: by mail-yb1-xb36.google.com with SMTP id l11so16499887ybu.13
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rp/juf6Qk342zuIX3XCF8Pnd2LF6056IHoKs8WvbCU4=;
 b=MabpslxAQeuAD+wcOhiA9g5HuFQtrO6wFP0hwTyNn7nf4p5JIaLnc3UO4oKc5cUT0a
 uuuJ4ItV07LkYAiSEE0wMQSOSxgVuTor8h0pWBhgR1X40/IVxSjKikT5xQzRo8wnUUnR
 RhiDsB5dRp6bhEUqPQVMn9jwXyBe2vflOoTgDR8i7+b4HR81V8On5TVfwSWIbQOLW5ry
 L8uyRtZQoZxC9AyGoDYhFHIU96DqPS62vIYMtX6RDtG6D26yPF7tZR2rqsRxcjP+odi8
 yLERzTIVOFAxneMXskq85LOFxPyr/6G/nzg58QzaZay9HdUknpDN12ifSq+BRqspTJ7s
 S8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rp/juf6Qk342zuIX3XCF8Pnd2LF6056IHoKs8WvbCU4=;
 b=I7ogcBJMfkNm7tpgNsJjSMbJBb4bfmwe+tG3+y+2TBR39ifO7seTq6c22kOdv8pL+p
 PDkb1THkNgIlbeF6FXzSuEbN711O2hlgIIexQAVytHnEahEmg3qTzZAtEqnjlzIoWHKf
 taRGIf9YiGKbA3ckKP8Ps0HQ3DrvFc6t/hLq1S2P5dMiE8s8Ky3c50XhhXXcqCM7HN1w
 0z7XQcZghLxdj07M+nYimGjlFsCu0jtzUpXW27vtd99PqyklwtMqIiVPDbeeBwUHH+Oa
 6pD+8OwYkr0cLAep5Owc3p/VG1Szda2mj29LMPmmC8KXHEXmIUYF2H8yEbqjBhVWnjWk
 BEcg==
X-Gm-Message-State: AJIora8NAbx24V89hw0oSS/V2RZIapBRD2gYC9poaAINbQ7rQHSzazOS
 +NDNgxy8xnK4mJ20XJQ8xROLqKuwgB+rsK2yz5MXRv2GCOg=
X-Google-Smtp-Source: AGRyM1s9U15uzeuuuYsBCfHcy3EtpjfaY8GMNxI5qJZsnrgUmURo+Ebm/otRUtGmBEtZlVELLKrD0JJF6aA+2PiWhXk=
X-Received: by 2002:a05:6902:1183:b0:66e:4860:575d with SMTP id
 m3-20020a056902118300b0066e4860575dmr5790733ybu.479.1656936672820; Mon, 04
 Jul 2022 05:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-39-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 13:11:01 +0100
Message-ID: <CAFEAcA_HLkU+=CvahdYM99CVXMapckgUnm7VQgsOy4pEw-aRHA@mail.gmail.com>
Subject: Re: [PATCH v4 38/45] linux-user/aarch64: Verify extra record lock
 succeeded
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 28 Jun 2022 at 06:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/signal.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
> index 8fbe98d72f..9ff79da4be 100644
> --- a/linux-user/aarch64/signal.c
> +++ b/linux-user/aarch64/signal.c
> @@ -340,6 +340,9 @@ static int target_restore_sigframe(CPUARMState *env,
>              __get_user(extra_size,
>                         &((struct target_extra_context *)ctx)->size);
>              extra = lock_user(VERIFY_READ, extra_datap, extra_size, 0);
> +            if (!extra) {
> +                return 1;
> +            }
>              break;
>
>          default:
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

