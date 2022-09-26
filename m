Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22B85EB163
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 21:33:45 +0200 (CEST)
Received: from localhost ([::1]:36830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1octrM-0004Gd-C2
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 15:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1octmu-000275-QD
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:29:08 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:38580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1octms-0002Oq-Au
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:29:07 -0400
Received: by mail-yb1-xb33.google.com with SMTP id c9so9703893ybf.5
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 12:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=a5spTz0sIiDMUUUzzTv7OMfXqC8UuO0VxfLomTVhgCo=;
 b=aruxVNRRwKBxeGWqDf/GQ6I+pByDlGZH7xICL13HY7k5zcP1CSdmPhbATtoKsEpMzx
 eC75qBZUgc43j8GiZAUKkdT+suL1wd97TyFJb0AbCpXV8mjqugIJwVKPUk0dHG/IA2MI
 1epHLfsqCKPUgIBlBJwFayaxXB59qx34sS1t9t3qbssOmsNOUhT9Ej0+xBBU4D1EufSS
 t1UZMUTFZXZCyApd2trZOSXZZeafC/18nLG221PdqzrxB2cenj7acuvZdRlyKfBLu96V
 aI2xg8OKLCg1oKef9EDvjOa87yz28dPgR4b6D3e5NEc0tqti22y0Reux47IPwFCgGX0e
 ynhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=a5spTz0sIiDMUUUzzTv7OMfXqC8UuO0VxfLomTVhgCo=;
 b=quDDWfB4z5YnkJPZNb9IBxQj1CSid286yoKT2sM5ypJGapx0N/9mxFRHGKgkWGfjKm
 Fk1ril/zjLKLhe8ZXTu2Zx36l7+Q6RS1O9gj37wTiSufjdRTNqbVMw4nBOi8D6VVZMAv
 QfE8ijUwpLs1Lp3NTPq0kcTpsRrjsfV6lMHe4BTCGZ1SWe2XhusUjM02p7mTBN6UwXnz
 ozVhd8hvi2Hrr8tPXS5N8cfB+RJAozGb0nc0DUIiwhGvG5kmRj7nes7pzldPTsKn3K2w
 sIgfNAgZlFcW1NpHhqGRejc8BDh8Cv1G8gVc7tIil7/+wX3fDZ4kgK1pNizfRbFw/dHr
 MBwg==
X-Gm-Message-State: ACrzQf2L13JxNmqgscUfIR/QpL2K6ORv33oycWYBaWDkQEcSAnT8bhmp
 7PZRX7MSi3m9GuOjh9ADSvzk+TgsDSeRQfgLL9U=
X-Google-Smtp-Source: AMsMyM5cSkA+8nM2vParNSLY7bhLMkR2tEWb7K8W5I2pNghJiD9wamyf4vP8n1KdzRtGPt9ljfycLLoCSs7M2GmhJtc=
X-Received: by 2002:a05:6902:1142:b0:6af:61be:ab53 with SMTP id
 p2-20020a056902114200b006af61beab53mr24462870ybu.118.1664220544630; Mon, 26
 Sep 2022 12:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 26 Sep 2022 15:28:52 -0400
Message-ID: <CAJSP0QWi_xpNynSKsxH5gdK8gqt1jOjZqEsJ=eiJkypVShuc4g@mail.gmail.com>
Subject: Re: [PULL 00/12] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-devel@nongnu.org, alistair23@gmail.com, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Sept 2022 at 00:08, Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git pull-riscv-to-apply-20220923-2

Hi Alistair,
Please use the HTTPS GitHub repo URL in pull requests. Setting
separate "url" (HTTPS) and "pushUrl" (ssh) settings for your remote in
git-config(1) should solve this problem.

Stefan

