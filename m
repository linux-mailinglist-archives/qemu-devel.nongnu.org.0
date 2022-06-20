Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2751F551D8B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 16:23:12 +0200 (CEST)
Received: from localhost ([::1]:58208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3IJ5-0000sA-0r
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 10:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3ICF-0000FS-ML
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:16:07 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:35468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3ICE-0008Tp-6s
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:16:07 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-317741c86fdso100076867b3.2
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 07:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AX1TOGG6ZBRn7ntWQsUj6lU/UPbD7yXh7evS+SY2Cks=;
 b=vzh/D0INIa9AKp/HTj1sN+DAbmxed2zEWVb1NP3AX/DwRnVi/1c5lkS/DDlLjk6enL
 x0rbzCKdZ2MsUEOPztmQ9AkqACqbvNNp5LfnKlbm+ZesCQXksAn69LDANEZge8XkuAcP
 VCr3f2+VMds4fO7XlATHjkMPkKKsILe0Q15UKZYJQ1lfCmgPjEn2hzS6DKSjMzZPgUdK
 9MgSXdNIPGpOhmxrYiJbrYjd3eTgYrseW84I1pmqAkfcNhM4oBQENuwA1ik/l5PGpLUq
 Bls+vCGIXyfikFqsaOEkhw5mxipPXYponM4pQgmJNYl4f6McfKlP8G4N59gukkCyBdyX
 XBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AX1TOGG6ZBRn7ntWQsUj6lU/UPbD7yXh7evS+SY2Cks=;
 b=o+uGYIHPzwNuBgLb44C0hHPxx3GZ/q5PT0R33hH8SzIRPe7XDp+cTkbqYko8kzVomJ
 e91U3uBo7SHj53C60UQftKR5Z7/RAUwp/6fOSFvDfSQpm24M7KqXDrX+M3y+ECJxJ8WW
 Ls4vm3zOUOsgskbdTdBW1kyYD6AtR+4Qh3PS+fotwNMsrXzZW+WUMqOuuhB+UiQq4a7p
 SeVo7eGftb33N5vBthimkv9qC0FzeSEP17gQQ114lYQI4hpkWmlZZNDcDioqcga+1Vdc
 5UMKaiL1tl5uRXiDPT1e1wZCYlx5CmyzxucbyB46kMbxTRxd9bmAJ/oLA69rfEk3LZWA
 84LA==
X-Gm-Message-State: AJIora+eSAAfbybhP2vpoypNxModPogbvWateX2D0oNuOiYjHgkI4elr
 1Q040CG9CR93kSn1MCyEvVgQSfr8eh8posVhkxzVOQ==
X-Google-Smtp-Source: AGRyM1vmFME9pQpSgKkEPuSRLai6YaZw173zKiegiKU/J+zWZ6rcr1qu3+wn5Qv5ByTlpyiboJT3x4obffu9z+5XspM=
X-Received: by 2002:a81:a047:0:b0:317:8761:14f8 with SMTP id
 x68-20020a81a047000000b00317876114f8mr18850190ywg.469.1655734564915; Mon, 20
 Jun 2022 07:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <e91e51ee-48ac-437e-6467-98b56ee40042@suse.cz>
In-Reply-To: <e91e51ee-48ac-437e-6467-98b56ee40042@suse.cz>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jun 2022 15:15:54 +0100
Message-ID: <CAFEAcA9OrxxLYBdtqFucY7mpFT-NWBSS5BQ2rYsTJ-Q8AKpZcw@mail.gmail.com>
Subject: Re: [PATCH] sphinx: change default language to 'en'
To: =?UTF-8?Q?Martin_Li=C5=A1ka?= <mliska@suse.cz>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Fri, 17 Jun 2022 at 15:02, Martin Li=C5=A1ka <mliska@suse.cz> wrote:
>
> Fixes the following Sphinx warning (treated as error) starting
> with 5.0 release:
>
> Warning, treated as error:
> Invalid configuration value found: 'language =3D None'. Update your confi=
guration to a valid langauge code. Falling back to 'en' (English).

(The typo here ("langauge") is present in the upstream Sphinx error message=
.)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

and applied to target-arm.next; thanks.

(I also checked that this didn't break any of the older sphinx
versions we need to continue supporting.)

-- PMM

