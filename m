Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 016B530AA7C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:08:36 +0100 (CET)
Received: from localhost ([::1]:39806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6aod-0002k0-3L
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ajs-0006V8-El
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:03:40 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:40212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ajq-0003zO-Lv
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:03:40 -0500
Received: by mail-ej1-x630.google.com with SMTP id i8so8404001ejc.7
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 07:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ItIUiM0aLwbM9lyTF6RB4Wu4NtMA16B0xx+bNnVTY2Y=;
 b=bXFAKquoJ4fiFHIXj+lFdfFV2FxPXxZOXMf9OYq2BKN8NDTuWbwfgTJVFsGF337bcN
 YzpcwuOUMq3HBjE/OKJNx1PYdITvy5oDLdLT8uOWW3Nt+2BX6OmM9bEtZXEDWcBg5QlP
 mrbJHzJPYe6QHKOgE+FFhWYusUfRUxinz+L5MYAI9i7O8LML3xjIiCtFlj5QWkbhuM2Q
 uW0mflLqYAkWQTQt7U5LNwZG3gC4x/vOAhMbKdpJvpnAMykaqtz6pN9joRdEHclaLiIs
 H3DnLn57O/PmnHYGlRCFdr2/bErFzINoxlBRvkDfkB4uDRzDaf+HOl71ALOunw7qKLAk
 QlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ItIUiM0aLwbM9lyTF6RB4Wu4NtMA16B0xx+bNnVTY2Y=;
 b=LtPBkt/ZNHOegFd0Vsrr6bkY1VpClIs+J7BmNIhk2l24+K1bP67SCrgfvugTIX3Fs1
 1pfZgciaAopjzrHKNdMyra4VrZtxDsc99XCBZvZDM5SbLF8OmSCFa3ZIyQw7h178fv7u
 /iZWUMjYfXtY3sxtePtWIa/2+B4OFIGmBUCwipwxvGa593XgfdonW9YceAchUAJ7jA/+
 mxqmke3T12fp6tPR8nIiLmU9qmdIz/ej7rm7GjsMTQxw2zjyHgh7m+dej6sT7dujqlVX
 wXtbjNXI30Gp3GOhYdU/nYAZCSH2y8w4dN8QjwXjZIZzzaaP7oHyaJ7OECwcGyAb+7bu
 Zhiw==
X-Gm-Message-State: AOAM531iYum6VYoFJPzX6jt+uoUnvwE1LFkOvM5+NEFmHy2PNBl9gv8c
 J2ZipkstzTps/jdgJM23GlxfxDPgBnZ93csRezHVXw==
X-Google-Smtp-Source: ABdhPJyhZn/xqPwuDfqeQNNDQoK7ZSrsEnc21m5iMdsp5bd7hwD/HKe+DYhYnzX0h4A+ZC+nkLyaxRgPRVc/mY2mUj8=
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr18147821ejc.482.1612191816924; 
 Mon, 01 Feb 2021 07:03:36 -0800 (PST)
MIME-Version: 1.0
References: <B8D9E184-5C5A-4A15-BF48-927F0138F0DE@gmail.com>
 <e18f2bd3-fcfd-2804-91d0-b4ecdb450bdc@weilnetz.de>
In-Reply-To: <e18f2bd3-fcfd-2804-91d0-b4ecdb450bdc@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Feb 2021 15:03:24 +0000
Message-ID: <CAFEAcA-x4EACAB6RX4qHtNMggs6bsRfC-MUrx9CbP+hGm6biFg@mail.gmail.com>
Subject: Re: Makefile has local changes that will be overwritten
To: Stefan Weil <stefan.weil@weilnetz.de>
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
Cc: Dan Streetman <ddstreet@canonical.com>,
 Programmingkid <programmingkidx@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Feb 2021 at 14:58, Stefan Weil <stefan.weil@weilnetz.de> wrote:
> Running ./configure is no longer supported.

Yes it is; it is a convenience wrapper for "do the configure
and make in a subdirectory named 'build' which we create for you".

thanks
-- PMM

