Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC74365AC5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 16:05:42 +0200 (CEST)
Received: from localhost ([::1]:52990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYr0X-0006eY-Vj
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 10:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYqyn-0005nz-HZ
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 10:03:53 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:46831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYqyl-0006Lt-No
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 10:03:53 -0400
Received: by mail-ej1-x632.google.com with SMTP id u21so58478160ejo.13
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 07:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BsisRs1T+ea8wYHs812ktP/Rf0lEBNIkxJWsMV3btwI=;
 b=wE+72ALyDP0VzIlC3CyvXW77nh8N/eCSXGM9kmX00SJCXk6nB14zqQUKBbLsA6euoZ
 U0J6ymAc0Maf7dwhltu5ShDT7JiU8MkDOchMvqNMmZxDp5xicd7IvaMH7tvyi8nGB0Zu
 bEKVbgsd/5BYCWWaYcazqHc3vM7nnMHzPEbDOMW721X9+kfHXtLZGifb8hPINjYdBE22
 aWyT8Ft+mnnPr8fucrXjZ0n7C+nOs18pXalkEAbfWxPIqj9djl6B6SNUU9/2Co61BUvh
 JgnyOfxd9uc7bvG2MKmKeKGTxHGZ14vO24uPvqtXc9fThfIFXJQJ2Z37xVDo+/sqGX/i
 q7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BsisRs1T+ea8wYHs812ktP/Rf0lEBNIkxJWsMV3btwI=;
 b=Mh2tobc1v4ThgoK1jTQzy7h+KnCQqLAJgxlUt4UjY/3guNEmEh1eQADkcWt/5oRJT6
 ieGPXaeu0N7Oog1P3+p6jccKXUJ2TU6ScimNlCJ+CTbUvgRsnloCHqQOgZJAAExuJrCe
 2HP+IBSlT4TvUx9FiS85mqw/TzGMIJocfzVA2tLfwWRirmSLK9RV0vL0Z5QGKuHvZ2t4
 mmLd+mEbFhum6IcZRWp/81jsUJVZXHdDk1uLBePG2m49NMjXaiBv/RXOTd9tHdBo9NXM
 va69yp8h7Alc+ohJvMeUcrk66V8X4yzJDr0pMJX7xvxXevH+y73NFiBKT+x5JMp0yRVv
 grPg==
X-Gm-Message-State: AOAM530MCVKtaNMZihufecyTzqCX9WxXMgI0I6sBNQas4PZdpzJtxNHC
 7OmFozWyVEUBVq/Rd0yoUzehtmESQOuznpT8y2m34w==
X-Google-Smtp-Source: ABdhPJykPK2y49qD/vGKzOM4yia/6W0ep0gGUnaZ4opZsWfd2j8qDRMcv38LjEF8uyehdvFFVxVDI66QZntUPmuySJA=
X-Received: by 2002:a17:906:8303:: with SMTP id
 j3mr27816343ejx.85.1618927429684; 
 Tue, 20 Apr 2021 07:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210420100633.1752440-1-f4bug@amsat.org>
In-Reply-To: <20210420100633.1752440-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Apr 2021 15:02:57 +0100
Message-ID: <CAFEAcA9MUVbeAO3MJ3NdFqEENeTqjzkvpaoBeHaYKSCO-LHZcg@mail.gmail.com>
Subject: Re: [PATCH-for-6.0 v2] target/mips/rel6_translate: Change license to
 GNU LGPL v2.1 (or later)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Apr 2021 at 11:06, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> When adding this file and its new content in commit 3f7a927847a
> ("target/mips: LSA/DLSA R6 decodetree helpers") I did 2 mistakes:
>
> 1: Listed authors who haven't been involved in its development,
> 2: Used an incorrect GNU GPLv2 license text (using 'and' instead
>    of 'or').
>
> Instead of correcting the GNU GPLv2 license text, replace the license
> by the 'GNU LGPL v2.1 or later' one, to be coherent with the other
> translation files in the target/mips/ folder.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Commit introduced after 5.2 release, during the 6.0 cycle.
> Harmless and useful for 6.0-rc4 IMHO.
> ---

Applied to master, thanks.

-- PMM

