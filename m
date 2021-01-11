Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA2D2F1A30
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 16:54:32 +0100 (CET)
Received: from localhost ([::1]:58712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyzWZ-0004YP-8A
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 10:54:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyzVL-0003T3-Jw
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:53:16 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyzVJ-0000BE-2g
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:53:15 -0500
Received: by mail-ej1-x630.google.com with SMTP id n26so284900eju.6
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 07:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XW4wW0k6ClvYnQCZkp15F8pGRv0nUqizott4QkQR1F8=;
 b=HXPxdFyBSsn4VERjQ6rhKW0uXfMaK26jhc03D8/qKF86l51Xl+zd9AqciVTaAdY47N
 cv5356zVcOnNd376iyVE1DaCOcUESs0nnDClt1UXarcLcU1TqcRuUoEKT31o8fQScBAa
 oE0YAbk16mklY26VwQc+SWHxHUuKUMDccYNlbO34YVOFS73x3w6qMvCUmHWH1oRyL3TW
 ajUu2qRs7E1z7pHdzy1eN+hSG4u8gzYJmgqXs9zyRPAKDaZ0X+W9ycwHAKbPyPyoB4ns
 Wj8ktwu3IrAI5IQFKI/tA56KSKfx+wKSbGFDElkV/HkV8M8BENskaqRk6FG/0fXdpev4
 KDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XW4wW0k6ClvYnQCZkp15F8pGRv0nUqizott4QkQR1F8=;
 b=c20BvOHG8X/sEfJ9yW8d3yrwwKzGq8BPYG0h1pFqqbfdS5xTMeUurTRAs4Q+ETpON0
 QSMPuGJGoheMaxOPft4Yw6C1/CEdZiG/lBneFU0XbfNSYFbtag+2127SSDaxNnD9XZW3
 VQOTz92dEYzHlCBXgEzpLpEL4wCneuNVqPXEEUKUoldrZRZFkrTLGSKr+n34BUwanXvH
 V8t/QWoPJpmm35zeiQjlH7ZqdkJ91dTkJnG+iKi0k3r3bMZrWihc9z+YSt1UmWtGef1g
 Lku8p44nd3vxentddq5kLnqm/5sy+w8K3lsA8zk1yFixd2CuyT8KYt388SL1aUpwfW4i
 hkxQ==
X-Gm-Message-State: AOAM531SigKsO6eIXbXs0TFAWv9IzaSGKDfzpKo+m9P7VqW6NoiqRYa+
 fn3wJMJIo2BFdMsfAnwYi3w=
X-Google-Smtp-Source: ABdhPJxN6SvYHgjr981dH8oYWmKHMbFw21IsL300dPxDzLyp4dA4tNCmJXAbMTDJEwh3tgHaUuIRUQ==
X-Received: by 2002:a17:906:3111:: with SMTP id 17mr97322ejx.152.1610380391271; 
 Mon, 11 Jan 2021 07:53:11 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id t15sm120152eds.38.2021.01.11.07.53.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 07:53:10 -0800 (PST)
Subject: Re: [PATCH] cirrus.yml: Replace the hard-coded python-sphinx version
 with the generic one
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210111103410.144797-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <546d0ab4-2d46-8797-819b-e7442dafbc3c@amsat.org>
Date: Mon, 11 Jan 2021 16:53:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111103410.144797-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 11:34 AM, Thomas Huth wrote:
> The mingw-w64-x86_64-python-sphinx-2.3.1 package has been removed from
> the server, so the windows_msys2_task is currently failing. Replace the
> old version with the current generic one to fix the issue (the current
> version seems to work fine now, too).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Successful run (with sphinx building the docs) can be seen here:
>  https://cirrus-ci.com/task/6568987054047232
> 
>  .cirrus.yml | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



