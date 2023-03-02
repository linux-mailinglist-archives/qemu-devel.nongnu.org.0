Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C2B6A805E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:54:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXgZE-0001Ip-Nk; Thu, 02 Mar 2023 05:53:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXgZC-0001If-Th
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:53:42 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXgZB-0002z5-0y
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:53:42 -0500
Received: by mail-pf1-x432.google.com with SMTP id fa28so389645pfb.12
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 02:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677754419;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nZs76zvUKqoDzsCwKSmYZOaIG6KZ7U1AT+WK6MWuBq8=;
 b=p2/nhuH3fSHSMA21xuL/WoATWUwcsNhNYkQxalAIS4C2y0A4pgRiJMIObXODlqzwmj
 4xfUaP+RQlTZdIlEZuEBY7utdV9RO5Ih7HTLZZfVHfcMvOFbdxJWiyKuBskZ0TqOX2M0
 FOYGEqt4i1KOJcvgYpuCcpxaiBoaiIIwuV1+uFi/AVFB51nYQ5E6wIdIfhcAc8VRt931
 4GyAnwhLP9FSndS/Ja3roNDwXtsKqyKmuPyyC9eLVy/vSBXBJswLZjINlDbaku/IXBm6
 OXNUlO0w8EuFgoRj5//Nbjo+Y35fGKBEo3P0M90InJJcCw7oC3CNM0wBZ1fFay0W4i8u
 xuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677754419;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nZs76zvUKqoDzsCwKSmYZOaIG6KZ7U1AT+WK6MWuBq8=;
 b=Aoc4ALuv4K6Qm5HnE36THh5TI+FaEKGEhB+7dydgjuMv2UqcaGyV1WlzaeQeTHtTaa
 lvf7eXo6+JfFsh7uLVjFgr8TQRImR5YLb5W7hWUF2dq6eRRBTZKH1nKNa4kNO6hcJ3kj
 dkR1OmJsekBW0kqgwwOKTYnDhx0TIaB17d/SQhNmnh9DZru1j9MhzHptSQW3UiYveU3h
 XhR+OYfYc8/32+GdNCoscK4Zo91gnNrCI47pIZgQyUMkq4Qz+uhYwyaA908ZN+23Fr2I
 m1+wkGhvPGItp/j4F291m+8DT2mknvrINeWtWtLzz9jzrKl5uxbEGGMTCcBRBwu7FRz+
 jbgQ==
X-Gm-Message-State: AO0yUKVg+Eahh4TowTk3e1VlnMqlb3AvsqJSha+OW7/bRvJMDHv0Wfhq
 yJVg39HYPtkHIgOERQpVjhi2cXKoskSHIQ66aAy4Eg==
X-Google-Smtp-Source: AK7set+XZ33i4TzS4p5od90dNC72c8t+gMKaDgw623oeSk4KFbwZHpLcpVO+wgbHCDhvB/bEslCeeoQrEZoQ/ugI+As=
X-Received: by 2002:a63:b55a:0:b0:502:fd71:d58c with SMTP id
 u26-20020a63b55a000000b00502fd71d58cmr3323415pgo.9.1677754419338; Thu, 02 Mar
 2023 02:53:39 -0800 (PST)
MIME-Version: 1.0
References: <20230301174104.1455421-1-richard.henderson@linaro.org>
In-Reply-To: <20230301174104.1455421-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2023 10:53:28 +0000
Message-ID: <CAFEAcA_kU=zHWQhPnBNO04zLzbcj8=sfn0hgOBN5g22ya7srJw@mail.gmail.com>
Subject: Re: [PULL v2 00/62] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 1 Mar 2023 at 17:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> v2: Fix mis-attributed --author.
>
>
> r~
>
>
> The following changes since commit 627634031092e1514f363fd8659a579398de0f0e:
>
>   Merge tag 'buildsys-qom-qdev-ui-20230227' of https://github.com/philmd/qemu into staging (2023-02-28 15:09:18 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230301
>
> for you to fetch changes up to 9644e7142a2a2bb4b4743a3a4c940edbab16ca11:
>
>   tcg: Update docs/devel/tcg-ops.rst for temporary changes (2023-03-01 07:33:28 -1000)
>
> ----------------------------------------------------------------
> helper-head: Add fpu/softfloat-types.h
> softmmu: Use memmove in flatview_write_continue
> tcg: Add sign param to probe_access_flags, probe_access_full
> tcg: Convert TARGET_TB_PCREL to CF_PCREL
> tcg: Simplify temporary lifetimes for translators
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

