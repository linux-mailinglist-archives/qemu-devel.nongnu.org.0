Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB1434ADFE
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 18:54:20 +0100 (CET)
Received: from localhost ([::1]:59456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPqf5-0002MU-Nb
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 13:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPqe1-0001jz-7I
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:53:13 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPqdz-0006aP-MI
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:53:12 -0400
Received: by mail-ej1-x630.google.com with SMTP id u5so9677433ejn.8
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 10:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pWt45CEx0ZXZS8JZQLZZy0w1fdo2hEcVuK9ZEYEkRko=;
 b=HHGWbN+EuKEQaO3dtsxkxcvpsEFvCy9rbomjojmZsMW366She3IzQi9cqXcsF+3/RZ
 BkETrMqUhbcmrpG2zqqQogkeomHDO0zkfGw2wky9xeHZ7eapjiuzOxQUDEvmv813i4y4
 8v2PgCOP93TVqdj9vr0pP+k2+GeB84Lot+aMl5VfTeIxvSOu8NDjH1YRTudqaGhZy3NW
 qfFqUEuSJzzEXKB/Sgv2FwA+XSODXtfkGqknUHMsxzAJ8r5Cp7xcVv5/m5zNskzfAM0C
 QyG/oaaFhFOr6aO9tquHaG1Zm3ORjNTCcj9zp0NDxZl95IS7lzIulgJ1DP5C/zMPbREa
 nz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pWt45CEx0ZXZS8JZQLZZy0w1fdo2hEcVuK9ZEYEkRko=;
 b=gsvrTrdcd4mTNo99I/iS8Lu1S/ubQ7mBmw/3YV+htEM1TOD4QLFboL3ISh3sr1cOuh
 l+3DniF50+EDFVf2pCT3Z5XKV5t3SJKM10jccxrZC79ZzqZwTiT/106w3jHAasf8/6WB
 CyHQpb05DoV9ouQMSDqMW8UvzTf2KTxmochRrDWVHL/DmvPdZA0d3Qv6GBV74rCmonsR
 gAAMbTtic+ybNgAvPFuXhxqd0hzeYG5pYaOYfbyh5SQX/G70jIalxl8qq562KgIFJNFM
 1Ub4E3f2UAIy2c1TBMnryBGAk2ogX2RFPswCNVDgo0Ev3hVWShIrME3XFhhnMgqyN8xE
 GWkQ==
X-Gm-Message-State: AOAM533wbaNyIXOaftv2kBByD3uWp+Nu2zexNURWcEKyazQMvK0xCLOx
 HzEOZtTPfDW7Tbf50hmvcIaWHOY0XMMNbn/QkSLZXA==
X-Google-Smtp-Source: ABdhPJxhLPkSajZ+wzxqcfXjAm51qgetFRNgk937iC+JyiF7n99KJHwkSX1jtWWEeAuHz8eGW9sa0AgHBzkd90bcq6Q=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr16566710ejh.4.1616781190223; 
 Fri, 26 Mar 2021 10:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616779714.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616779714.git.lukasstraub2@web.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Mar 2021 17:52:40 +0000
Message-ID: <CAFEAcA_xF18iG3da8EfTSE7oLQrP056+RjdNrNGpk3F+Qj7NYg@mail.gmail.com>
Subject: Re: [PULL for 6.0 0/6] Yank fixes
To: Lukas Straub <lukasstraub2@web.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Mar 2021 at 17:34, Lukas Straub <lukasstraub2@web.de> wrote:
>
> The following changes since commit 5ca634afcf83215a9a54ca6e66032325b5ffb5f6:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/sdmmc-20210322' into staging (2021-03-22 18:50:25 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/Lukey3332/qemu.git tags/pull-26-03-2021
>
> for you to fetch changes up to 7c2f1ddcaa1c97462cb0b834d5aa7368283aa67d:
>
>   tests: Add tests for yank with the chardev-change case (2021-03-26 17:12:18 +0000)
>
> ----------------------------------------------------------------
> Yank fixes for 6.0:
>  -Remove qiochannel dependency from the yank core code
>  -Always link in the yank code to increase test coverage
>  -Fix yank with chardev-change
>  -Add tests for yank with chardev-change

Can we get these through some established submaintainer tree, please?

thanks
-- PMM

