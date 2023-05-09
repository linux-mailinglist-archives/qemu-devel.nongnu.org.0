Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C746FC6F5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 14:44:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwMhA-00016B-6N; Tue, 09 May 2023 08:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwMh7-0000uT-Tp
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:43:53 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwMh6-0006mU-5a
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:43:53 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bc3088b7aso11308432a12.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 05:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683636230; x=1686228230;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Nk4TEHNOs90iwHkFOwbA6BuB3e1X3a2ozmlu8smgHQs=;
 b=qnJZ55WYIB61+M9ppgaVHXvvY3UHcVELqGi9cX0SAtYIpGuIgn4aqlGfmQG+k34qOo
 fYL0vGyC8cQ0bi/bcnEDcXaQWIPHEK7VwfsJzI+jlls1tz3KKiHeiARnzGQGEZAV6JW2
 Aq5+z3unUNXuAIuTP38SCTEd0ekvYK6Fu6SrYLp3AT174jKns4XG7t3GOual5sLAmZ6i
 ontFU4lQRW6THPiVv/Pl69SNwLfRvAbJu9Ipc3rOsevw4jTME31fCEza4U2jsZjFsguu
 9zd0jf2whlTOwN3lGqdRqTThxtGD/HkkjCJI8haZajinM5cd9J0zCb9Dch80/BAWRhLM
 SoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683636230; x=1686228230;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nk4TEHNOs90iwHkFOwbA6BuB3e1X3a2ozmlu8smgHQs=;
 b=c5/cvlH/jINRWNFlhG+XFMPhT08z0PfqtbNJ/H3I8oZXExKb/1HcZUlzAeuRaBaLc7
 VUl64T6BmN44vM0m7g3v930F5xUpQiC6pMow4JaQ4efOOzRxq1Ds+DrT5bz7owf3yF6r
 9kTvhSBY7ibVVvQ5l6XipMvtnCYYE6Hs6wYnULdj5i9wDbPcdVS7SCKTg0f5rvbyisah
 qsvboXbUJb6Pn9M5Idg6GZiq8o7ol0s/yK8aRPNwa8LwJ3wxoy5hAboMNJ1j/+CFwADG
 zYEQrRzfgF5jtuAzkeG/7QfUYq/nLVdoTAR+jMe/gqs4sIay85um85AEjOTVoOWqx4DO
 R5og==
X-Gm-Message-State: AC+VfDw7UFW9VjpFXRJc0lXPSfZPsymHk3LV54tAoXs5AxOC93+dcYRv
 +fYCJjTItTNeWjnoDu2lqEkCWggmQk981YVjCE28bNFTJPCQccx9
X-Google-Smtp-Source: ACHHUZ5QFuLFQaRBwzwrplJBHVmE3gokDvZG8KMu+1TXvylnPSdqgGOY3z9GI0lfurzhMxf7dFz75/PBz+Zt2GISRdE=
X-Received: by 2002:a05:6402:1a48:b0:506:7385:9653 with SMTP id
 bf8-20020a0564021a4800b0050673859653mr11540286edb.39.1683636230522; Tue, 09
 May 2023 05:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAP5Nno6LjKpvwmvFXoAo3bNpCSkVJTKe+ENxjGf8kt4ENAEMyg@mail.gmail.com>
In-Reply-To: <CAP5Nno6LjKpvwmvFXoAo3bNpCSkVJTKe+ENxjGf8kt4ENAEMyg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 13:43:39 +0100
Message-ID: <CAFEAcA-qVPABh-B8D7Ds20NwT_zGq9t_za9xFR-x2mfNjUMuYg@mail.gmail.com>
Subject: Re: [PATCH risu] --group option to allow all instructions in the
 specified groups.
To: Jun Sun <jsun@junsun.net>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 17:35, Jun Sun <jsun@junsun.net> wrote:
>
>
> Current semantic is a little strange when multiple --group options are specified.
> In this case,  only instructions in *all* these groups (i.e., intersection) are used for
> generation, which is not very useful at all.  This patch changes the semantic to
> include all instructions in these groups (i.e., union) for sequence generation.

The commit message which added the --group option specifically
documents a case where it is useful:

      ./risugen --group v8.2,Cryptographic aarch64.risu v8.2-crypto.bin

where you want to say "only test the v8.2 crypto insns"
(i.e. not any crypto insns from other architecture versions,
and not any non-crypto insns).
Changing the semantics to union would break this.

Being able to specify that you want insns from multiple
groups seems like it would be useful, but we should add
it in a way that doesn't break the existing uses.

One idea that occurs to me is that you could allow
multiple --group options to mean "union of these"
and multiple groups within a --group to mean "intersection".
So for instance
 --group v8.2,Cryptographic --group v8_3_compnum
would select all the insns that are
   (v8.2 AND cryptographic) OR v8_3_compnum

(This does technically break some existing commandlines
because the current code makes "--group A --group B"
do the same thing as "--group A,B".)

Alex, you added the --group option -- what do you think?

> diff --git a/risugen_arm.pm b/risugen_arm.pm
> index 2dc144d..dc08ec0 100644
> --- a/risugen_arm.pm
> +++ b/risugen_arm.pm
> @@ -1112,6 +1112,7 @@ sub write_test_code($$$$$$$$$)
>      }
>
>      print "Generating code using patterns: @keys...\n";
> +    print "Total insn patterns : " . $#keys . "\n";
>      progress_start(78, $numinsns);
>
>      if ($fp_enabled) {

These changes seem unrelated to the --group option.

thanks
-- PMM

