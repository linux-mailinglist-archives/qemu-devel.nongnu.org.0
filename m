Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397B4565450
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 14:07:51 +0200 (CEST)
Received: from localhost ([::1]:53758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Krm-0007Oo-AA
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 08:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Kmy-0002dl-Lj
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:02:59 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:38856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Kml-0005ED-6Q
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:02:52 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-31c8a1e9e33so27591297b3.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QaSQc951CE9MI+P/5fjBEYTsbczMqj7zV7C8rroQKXU=;
 b=wlYtuMl1cd3KLPMRyDjRmci/K/GKsd4Y0N7kuys1OBPAUaYA1FVxkk83RySr5oSJNE
 yjCnKA40HxG467dVwI3t3lEorpRFzSGQUNTDKB2YJWxBLRzb1pVDN/VxNgs0zWBFo0Tu
 I0bxA81d2RgeYN7Ie1QLGgbunKWHWtivjVUWp+h/4LOLGTWwU433XUMRPCTHhzF+f6HT
 2gFu44LWstot+2+Ponx9gnd4vKWepv7T28YCSC6BFYCPU24/MTL5q8WnPyZLGY8eqtPo
 /Pd2PmInfBc4E6CFiwZEl61cQ7i3xBBnSoapzo0MXWwZKsBqllRL7PwzQB5YuaL0hhxZ
 GkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QaSQc951CE9MI+P/5fjBEYTsbczMqj7zV7C8rroQKXU=;
 b=TrYb3eVVkMzyvmKVscf0ELKwunC9e6878ccTw17HQVcxrGUuF0HMqB4tOLZNReW56Y
 syX4ND7RxrENGsOtlDNukIMOHGelzb3qg52oi+wIMRwSwtD1lLhM2Ox6AmN3b83BZR2E
 lWvDyagmBxqxnczzo9H6w3z2JfqeKUttqSNYrwiCz0v3VI6KUBQBD+XBmi7t/2Sxs33G
 1XB/cY2iGfa3T/yFMa2AcAbNteIuRCWLAyjTPCYd9tuDPc9KBVnLxIm5VvG/ajzeFuLN
 h1+F9oykQRdmImCNySCEEG/SHfj/7aZ79ibAkkGYtkbaOOL17lbmYDup2eKW2wIRL0ON
 /1fA==
X-Gm-Message-State: AJIora8dyhAaZQwbsaTf0+OjhtyKSjBGIVOUKFv/ZMesDXT5EqRNcuWX
 Jf0EjX9CjviVgeLJuKCRQuUphr21kfhD7foGpRp3mw==
X-Google-Smtp-Source: AGRyM1tibJuhhWv9wU2U95l83l70Jk0R5LJcfRaGqQQUd8G6xbAoTgqEammRTHmFA5S7rGUumLFO9+uKa8kiCZzQFd4=
X-Received: by 2002:a81:6585:0:b0:31c:b55b:dd36 with SMTP id
 z127-20020a816585000000b0031cb55bdd36mr387204ywb.469.1656936158140; Mon, 04
 Jul 2022 05:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-36-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 13:02:27 +0100
Message-ID: <CAFEAcA80YR_jKXqW=qfVBFgd_FG9ZiMiqLs29Njsw3jtXdSgxw@mail.gmail.com>
Subject: Re: [PATCH v4 35/45] linux-user/aarch64: Add SM bit to SVE signal
 context
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 28 Jun 2022 at 06:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Make sure to zero the currently reserved fields.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/signal.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
> index 7da0e36c6d..3cef2f44cf 100644
> --- a/linux-user/aarch64/signal.c
> +++ b/linux-user/aarch64/signal.c
> @@ -78,7 +78,8 @@ struct target_extra_context {
>  struct target_sve_context {
>      struct target_aarch64_ctx head;
>      uint16_t vl;
> -    uint16_t reserved[3];
> +    uint16_t flags;
> +    uint16_t reserved[2];
>      /* The actual SVE data immediately follows.  It is laid out
>       * according to TARGET_SVE_SIG_{Z,P}REG_OFFSET, based off of
>       * the original struct pointer.
> @@ -101,6 +102,8 @@ struct target_sve_context {
>  #define TARGET_SVE_SIG_CONTEXT_SIZE(VQ) \
>      (TARGET_SVE_SIG_PREG_OFFSET(VQ, 17))
>
> +#define TARGET_SVE_SIG_FLAG_SM  1
> +
>  struct target_rt_sigframe {
>      struct target_siginfo info;
>      struct target_ucontext uc;
> @@ -177,9 +180,13 @@ static void target_setup_sve_record(struct target_sve_context *sve,
>  {
>      int i, j;
>
> +    memset(sve, 0, sizeof(*sve));
>      __put_user(TARGET_SVE_MAGIC, &sve->head.magic);
>      __put_user(size, &sve->head.size);
>      __put_user(vq * TARGET_SVE_VQ_BYTES, &sve->vl);
> +    if (FIELD_EX64(env->svcr, SVCR, SM)) {
> +        __put_user(TARGET_SVE_SIG_FLAG_SM, &sve->flags);
> +    }
>

The kernel documentation says that if this is set then the SVE
record contains the streaming vector length. Does that happen
automatically (ie vq is the right thing for both streaming
and non-streaming) or do we need to do something there?

I gather that the other half of handling this bit (allowing
it to be changed on signal-return) is in a later patch.

thanks
-- PMM

