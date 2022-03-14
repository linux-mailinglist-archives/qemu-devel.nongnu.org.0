Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F914D867D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:10:46 +0100 (CET)
Received: from localhost ([::1]:52232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTlPI-0005T4-U6
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:10:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTkeP-0005Qo-34
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:22:17 -0400
Received: from [2607:f8b0:4864:20::1133] (port=35115
 helo=mail-yw1-x1133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTkeM-0007Dd-Lj
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:22:16 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2d07ae0b1c0so163059867b3.2
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 06:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ev9xacKU5mXltVgGiAyNsfCdQ1B1yIV78co8uiC3xRk=;
 b=jRvUP8I4KgBGxEz6MyNz8w9BF1Nn4GtYJfb7AFIXu91PLbi+SGSuxQ8BWkSZnfy0Ar
 ixyeHt5XJhSndW98gF10PHwAY0tcPwL5rdzAqvOHRbUgwVMRmaMkf47sL5eogTlWMWnc
 V0GHXuW7QRRA3aDaAP3mEeGuRbp2UOq0OccORgVqrj05yu6FsAgFUZI1L5cTxGC4Xtjs
 ALmLYNU8RjiF5A8IqmKO0tRmA3MwF96DUt4H2sCegEe7Don2Xd0w5Kr/Ks93mSUNRV80
 EXjV5gsQ3/LzAEzQJw0ku0taCYhHtBm2Rv5upYW+PfXSmxq0B+Q0ZzpymGPdMqzKIsH/
 b7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ev9xacKU5mXltVgGiAyNsfCdQ1B1yIV78co8uiC3xRk=;
 b=po8Mh5JXzp5+JL39MYH4pZxDPAa49Vlxen6hAXRjO7ZAuMTAifxSS5PZGxm6FCsmRc
 Yqk+/XD5XHvcxn47IXvx19i2sLHSVzsRcj6L3Fj09SGjR1x7ChZ1nsxKWm4ty/GNu8yr
 4mUHWwD1imTJRpoCNwPmHRhbRh9klqTObflcx6IKtlUm82wCYihYQt/zfyfyB9X6RoOY
 /RqVCjEFJiYTNwAQGYz6+jcOJf+HYB5ts4hPky6x+FA821wxoU2HTl58RLte7PaxUxwJ
 z4JdNQQotfz6jJCK+nZjS2AuHEwwgp6IhAps5DuzhqQQaMRMH7Thb9NcCyetX1UIc0YQ
 oOwQ==
X-Gm-Message-State: AOAM531Hy0vZuWKOktGTQHqMhYfkDRwIK7waKM08mXleFuXpoAceWXu3
 CQsH/AE8v5sCJFXGjNh8wHRA7Ell1IuREMVhfQAS4Q==
X-Google-Smtp-Source: ABdhPJxOP2OlIIOqEyasVN/yIBSXlSlVhY0KrnC5chPLfJFbuys6RrEXpeKwsfuswWfUYu1k4K8ifGhkzySEQLJSs3w=
X-Received: by 2002:a81:12c3:0:b0:2dc:5f5a:38ec with SMTP id
 186-20020a8112c3000000b002dc5f5a38ecmr18832479yws.347.1647264133646; Mon, 14
 Mar 2022 06:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220312201319.29040-1-tsimpson@quicinc.com>
In-Reply-To: <20220312201319.29040-1-tsimpson@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2022 13:22:02 +0000
Message-ID: <CAFEAcA9OFB8dFV5x=uQ6O-Fvv29uDy_p9KNnhtMULnya7XUKhA@mail.gmail.com>
Subject: Re: [PULL v2 00/12] Hexagon (target/hexagon) queue
To: Taylor Simpson <tsimpson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Cc: zongyuan.li@smartx.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 12 Mar 2022 at 20:13, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> The following changes since commit 1416688c53be6535be755b44c15fb2eb9defd20f:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/q800-updates-for-7.0-20220309' into staging (2022-03-10 13:16:37 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/quic/qemu tags/pull-hex-20220312-1
>
> for you to fetch changes up to 4a818b3767220dcd21cf5cc7f12e33e28c2073ed:
>
>   target/hexagon: remove unused variable (2022-03-12 09:14:22 -0800)
>
> ----------------------------------------------------------------
> Hexagon bug fixes and additional tests
>
> Also includes a patch from Zongyuan Li <zongyuan.li@smartx.com> to remove an unused variable
>
> ******** Changes in v2 ********
> Fix problems with build-user-hexagon CI job


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

