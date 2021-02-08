Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E1D313BC1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:58:01 +0100 (CET)
Received: from localhost ([::1]:56878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9AnQ-0005TU-59
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:58:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l94ev-0008TH-TX
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:24:51 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:54346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l94et-0000Sb-Mz
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:24:49 -0500
Received: by mail-wm1-x32d.google.com with SMTP id w4so12240024wmi.4
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 03:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XgDXeWmn2d+eDtKnnsOFIs6clehVOm2rZB2og5BwlKc=;
 b=DkLDb36MKXUoqKUEOXeGOnZRowPWgBYyWXpyamg7ZLy4Hg+nkkshWWUqTNA6HlItDp
 K2v7XTeD8e4UwkGVsEbLU/yMVKZPpd55iloLzdyi2V0Y3aNLuPkyLMWlU3hVbHWi7P+a
 bq+/jlJkQdDdukfUj5Ct8NBTey9cN2TS6zX6YLLWuIFeWiA2L1w7uVsnn1sYyXdGKf/m
 LSNUH78HXMs4cpdxw0qOcyaCbM2aApC3Ks58+//4ByN5TeMdw/mCIRhwtw1aYpSy/kGB
 kbs9ktiJ9J7OKGibgJvXleJCJVgEybTPtpFvOsgNNnRQeurdUvXiLj/jMKpAVk5q9iSP
 o41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XgDXeWmn2d+eDtKnnsOFIs6clehVOm2rZB2og5BwlKc=;
 b=NQFOg8JxhuKHXyQsWKqgkcXVsykDTzZxreRTlU/5c6IRQLzitVVynIImFDtc4k7vD3
 eu+9ftrvRBuZD4r8FVUU/M82sJ3Xrb/OSvUBNkXTcSn7/7VP+f7iQ+l9VRWDVJuUm7Z6
 iu1QbjR2u4cXOidadD298z78hAUsD9HeuFUjxVn5GIfrf9hb8alzzJXmd06ed0Fj/TLf
 HYa3Dv3iQMvlS6nw3gTv5+figPL2yZvDimlAEVji1C2DQCBDhGE/vYVZjyIAxLZDbG2y
 sjHN6q+Aloi2JLzW5Ci0jwCh89g5i9jIP2X9VpriTFv5U90Dh31cs/pVWH+8T+bVHBSC
 JStg==
X-Gm-Message-State: AOAM532BIgqIi5l9Zad6a+Rg9UN2Xe7nIw+HnCYbKsf1hPxEII/fHt2B
 FFSIZOqnMVFoSL+dIN1ja2I=
X-Google-Smtp-Source: ABdhPJxzuc+VrwMqe5EM4miU5CWU7R87uo1OZYPXSGHDTz1RYU987nKFYdN4BxufvxcvA8FcNhYXyQ==
X-Received: by 2002:a7b:c2a9:: with SMTP id c9mr12630131wmk.116.1612783486253; 
 Mon, 08 Feb 2021 03:24:46 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b13sm26973604wrt.31.2021.02.08.03.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 03:24:45 -0800 (PST)
Subject: Re: [PATCH 11/22] tests/acceptance/linux_ssh_mips_malta.py:
 standardize port as integer
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-12-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <aa6fae11-7a8d-2db9-de76-b6991d084fc7@amsat.org>
Date: Mon, 8 Feb 2021 12:24:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203172357.1422425-12-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 6:23 PM, Cleber Rosa wrote:
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/linux_ssh_mips_malta.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

