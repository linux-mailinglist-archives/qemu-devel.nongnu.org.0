Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9780243B579
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:25:06 +0200 (CEST)
Received: from localhost ([::1]:47236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfOK1-0004rp-OI
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfO0V-0000w7-6E
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:04:55 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfO0T-0002da-Ns
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:04:54 -0400
Received: by mail-wr1-x429.google.com with SMTP id z14so18667110wrg.6
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 08:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lYJXsbipHt/pCr/jVYdTeTDRRU0+CamWoe6+TXRy9U4=;
 b=X4k8aSeAfmgKjMjw0dJ3XcO620sFYhfe3h6bxkPdqyryW05veyUlRSJnrUmf/8t53V
 wuQfxe4rnlBwj1TPtHbfGZU3rhoySJdhQUsM6ybuoEl8jbKSItQhx1oAPmfePFNHncvJ
 WBy2Ucz5rnfNVFL45NLhjSlVXaU3qJWy3qBJsJqIZC6H5Bol2mS/BrRkVcBz2GkUswEW
 2bfgpNLtOuYkJItYZs9fu+1G9ynBYQlq0Mm7ab4UpVD/W4g8Ki3CY93/0wpD+w3EBzkS
 tIWq0Tl0wpkuaDVriusu1J6mqKqrEHcIdHlpZy3oYbfkD1JV7mWrvKkQoMAByKWUo++s
 FUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lYJXsbipHt/pCr/jVYdTeTDRRU0+CamWoe6+TXRy9U4=;
 b=QxKAGEv5yrqs5PoAQj0O6c3AWEju5dn8b+zwVdfJ2iyXwG1v/rm25uoakqksFVxApc
 rYYXmxhgVFTRDCmNuKCmKrMXXNj/6n1N/AgrxNB25hJPhtNexM14Cn8/hlAxL1fZrlgo
 lzUtsqpHGz+wNnpam+RmI5z/rC9e5aH8pteWeOcJuGwjuEd2atBHWvG+xiY+eZvP3ciz
 kwqONlSEBhpWD06lb+tUxK7whQ/FEZsodGyyuaC7X/mBXjzMPyPjuV324UHO2vXS9x0X
 xSUT/1OGgKi6YnncnMhldZQEpoPvtsuxzKHXrH7s6drBRO6gIxqv2CbkBmdu9XVaDTC6
 eR6w==
X-Gm-Message-State: AOAM532cg6iZ27k4gBbTXlIDDo+1wuSjPxXj2BkIusSCESOwqAJeuMhb
 gfXCc7j7fykTcOj7sLinOME=
X-Google-Smtp-Source: ABdhPJxHvlMrvHsn5TxNY8UhApPdSCLVk+GvbGohYL9JMft/oPE5h8vmkqYQUptppYLCXvmTIA3xzw==
X-Received: by 2002:adf:ecc3:: with SMTP id s3mr32499930wro.150.1635260691306; 
 Tue, 26 Oct 2021 08:04:51 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id b6sm4460970wrd.85.2021.10.26.08.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 08:04:50 -0700 (PDT)
Message-ID: <5df61bce-d7d5-33af-3828-ffb0d3c1fb1f@amsat.org>
Date: Tue, 26 Oct 2021 17:04:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 11/28] tests/tcg: enable debian-nios2-cross for test
 building
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-12-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211026102234.3961636-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.215,
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com, crosa@redhat.com,
 aaron@os.amperecomputing.com, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 12:22, Alex Bennée wrote:
> Now we have a nios2 test image we can start using it to build tests.
> However signal handling in nios2 is still broken so we disable the
> signals and linux-test tests that trigger the bug.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  MAINTAINERS                     |  1 +
>  tests/tcg/configure.sh          |  6 ++++++
>  tests/tcg/nios2/Makefile.target | 11 +++++++++++
>  3 files changed, 18 insertions(+)
>  create mode 100644 tests/tcg/nios2/Makefile.target

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

