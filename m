Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802FA4CE656
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 19:04:06 +0100 (CET)
Received: from localhost ([::1]:57772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQYlB-0001jO-2R
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 13:04:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQYkG-0000vs-31
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 13:03:08 -0500
Received: from [2607:f8b0:4864:20::1136] (port=38998
 helo=mail-yw1-x1136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQYkE-00022P-Dp
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 13:03:07 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2dc348dab52so89835717b3.6
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 10:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xdlyHIGyS0hvYFB8Mazf+xTzECgHmPP/3x9X81HPoPU=;
 b=i16qezXO3z2vGTpKwqyju0dQ+8gZia0X8kShY2dWTXsXneaTMDS4PECIQIHdlX1oaE
 TFu3rwgqqO+6s/3cC2ESWoVNxtAf9wo7NgYQAkGs3mPAreAMqB9RCt4K0/bWNI8Q2T8P
 N/iZzTWiM7ZM6oiBozRQSkeKtdxT+TBFfe0NfI2EDOHjpAGQ82Onud1TQ1ubcy2tMqpp
 bGKc3gXskGGIoKQsK3hjGUxjDRgzJvJ1PjEDWkRY6LpPJ28OsTXnA0lJEWI4pu67DVeG
 Iyl49JgCCrqVGM0Pv1fr+o9qY5sWi6nfvATfsZcpRDv7ssIBofMz0vX11bvQ6pkuOmLn
 I4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xdlyHIGyS0hvYFB8Mazf+xTzECgHmPP/3x9X81HPoPU=;
 b=zaIPRu4QYGBMcMiwEjJGnCHe1HBmsoziWNl//dlxzWEo1kOzf23fTRIg/T3Fsldw4z
 0A2iN5Sq/dPyBdH2F/U39LEOhOdf4BPr1acNKXrVK4y7ILswla230NzwWLWpcPS4Gddj
 g6f46tDSkUebR4+qKZMNRsK2KBkVehUDGvlFttbFOHTUH0+2K5Xmo4YUKXbL8GocxUn2
 m7o5DedYz262btlSt5xAyRAn6wVzjbb4RIs/E8SGYEfX074X/dovW+Z5GbtsW53j/i77
 WJZu6ns7Ff3adbDUDlfP81T+ap8U9kasuxSVis+q8EcbxN8ya/T7JjyV4aA8hAIWjtk2
 cjBg==
X-Gm-Message-State: AOAM531EZ0V3rQbY/mc7JAqOuPub7n3PssUdOWkp8aXaEbBKePQOfzzR
 L3sjnk9H+khm6ETeUDAUi9ghJB3kt6/wk0z2rcdEUg==
X-Google-Smtp-Source: ABdhPJzNXvJ1364sQ4hw7iflmWsrfFCThlvIRpx+JB411zhEYAr9wjcKFqNfGw9xP0IX4rzN0AG9Tn0e0h6H0dCT9P0=
X-Received: by 2002:a81:164f:0:b0:2dc:3906:27c0 with SMTP id
 76-20020a81164f000000b002dc390627c0mr3144449yww.64.1646503384961; Sat, 05 Mar
 2022 10:03:04 -0800 (PST)
MIME-Version: 1.0
References: <20220304190951.522227-1-richard.henderson@linaro.org>
In-Reply-To: <20220304190951.522227-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 5 Mar 2022 18:02:53 +0000
Message-ID: <CAFEAcA8qj4bkuFfW8S2-66-p3YY4GQx9DoW9TPcj_=0fkXtOAA@mail.gmail.com>
Subject: Re: [PULL v2 00/21] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Mar 2022 at 19:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Version 2: Drop signed 32-bit guest patches while CI failure examined.
>
>
>
> The following changes since commit 3d1fbc59665ff8a5d74b0fd30583044fe99e1117:
>
>   Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2022-03-04 15:31:23 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220304
>
> for you to fetch changes up to cf320769476c3e2820be2a6280bfa1e15baf396f:
>
>   tcg/i386: Implement bitsel for avx512 (2022-03-04 08:50:41 -1000)
>
> ----------------------------------------------------------------
> Reorder do_constant_folding_cond test to satisfy valgrind.
> Fix value of MAX_OPC_PARAM_IARGS.
> Add opcodes for vector nand, nor, eqv.
> Support vector nand, nor, eqv on PPC and S390X hosts.
> Support AVX512VL, AVX512BW, AVX512DQ, and AVX512VBMI2.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

