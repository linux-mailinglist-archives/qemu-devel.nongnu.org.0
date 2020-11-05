Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3BA2A84DF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 18:29:14 +0100 (CET)
Received: from localhost ([::1]:51220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaj4T-00019Z-GD
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 12:29:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kaj0d-0006et-SH
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 12:25:15 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:39542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kaj0b-0001Es-B4
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 12:25:15 -0500
Received: by mail-ej1-x632.google.com with SMTP id s25so3748069ejy.6
 for <qemu-devel@nongnu.org>; Thu, 05 Nov 2020 09:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LWFZFt6/lAdxK2htyE5ncud4LoGvYVo336GqLiPXDCM=;
 b=a92q+7ZFTvkD4OdABZaxBn7I4DCcVWHpC2znxUk1MAGPU5PAYPoLMChq99TSUgAMqm
 7mTLsfBNvsQCmlj9QzIL3+ab13HRSnY7V0J+9MH3glwB/L15C/ytdGVJi1JZvFJYgJP+
 srIvDnW+bqXkQTFRegYTv0KGnaw0T/Zq6hxm6/GPk0GMmzUC8mkE+tpKyeHHI8Tm5uFU
 jvKhsiZ+jqFELfc7v0zsgC9DuZsuGicD3BxeoWYFdeaO2yYiBcyuqacSHsoeyYJOyHT8
 yZjWX+y3YjFz/d3OHpO83aJ5UMkP0toEr+RMsN5ZtCTCmHBOM2jWQESwCLMdjekjObOq
 ndag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LWFZFt6/lAdxK2htyE5ncud4LoGvYVo336GqLiPXDCM=;
 b=fJ922NYWRnkrChjSW+LYKy+fuXqri9rc1zOnoK6NFUIqHZ6MCdQrOKFIMj1SD59bky
 upux0RbrwKKR+pvyO6DavmGpWbxMnqbWUnUeKbKRnHnWfE5vv6o4fqPIH66vGhYCcQlX
 D5YOtie2xxTl/bIN4WkUdtFLA19fIpgt/uJk//V/QdsBfY5BXS6+kY9vdV6ExhHA2mcm
 3qwh2hwJN7U2WevLDX47EMbsWT5bcDEgDa0yz8ptQib5zIbbt4TWkOrL5VyDbrr47Yyf
 hxECF8tnYeNNbryXx5ep5vzdpLP1WrJtqhFAD7i86vlRku/tC96W3j8MnHapH52qGAYb
 r5eg==
X-Gm-Message-State: AOAM532urKGKH/oPH+YGKMav8cyNJphJvyCGfE30Mwr2qF1hIKvenbv/
 GA+RInkUqCDKhOltiCKtvdRPFmRChb5WaKgyUDj4fQ==
X-Google-Smtp-Source: ABdhPJxZeFVOasktVo7HP1j4YQxsrU/84PBpGec7qA3a5U063+qrsqp82VGHGrwXNdQyRpNxZ/LKR27qybq20YDAN5Q=
X-Received: by 2002:a17:906:3a97:: with SMTP id
 y23mr3296799ejd.250.1604597111111; 
 Thu, 05 Nov 2020 09:25:11 -0800 (PST)
MIME-Version: 1.0
References: <20201105002935.680486-1-richard.henderson@linaro.org>
In-Reply-To: <20201105002935.680486-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Nov 2020 17:24:59 +0000
Message-ID: <CAFEAcA_1w29gHJHnB6rC35p6DOf5g6zHPFQyKeW0QBRtbx-18g@mail.gmail.com>
Subject: Re: [PULL for-5.2 0/2] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 Nov 2020 at 00:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 3c8c36c9087da957f580a9bb5ebf7814a753d1c6:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/ui-20201104-pull-request' into staging (2020-11-04 16:52:17 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/rth7680/qemu.git tags/pull-tcg-20201104
>
> for you to fetch changes up to c56caea3b2a4ef5d760266f554df0d92c5a45f87:
>
>   tcg: Revert "tcg/optimize: Flush data at labels not TCG_OPF_BB_END" (2020-11-04 10:35:40 -0800)
>
> ----------------------------------------------------------------
> Fix assert in set_jmp_reset_offset
> Revert cross-branch optimization in tcg/optimize.c.
>
> ----------------------------------------------------------------
> Richard Henderson (2):
>       tcg: Remove assert from set_jmp_reset_offset
>       tcg: Revert "tcg/optimize: Flush data at labels not TCG_OPF_BB_END"


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

