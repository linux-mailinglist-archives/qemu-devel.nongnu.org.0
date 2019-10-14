Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79432D67DC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 18:59:46 +0200 (CEST)
Received: from localhost ([::1]:53892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK3hB-0006zx-7i
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 12:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38906)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iK2zn-0001wv-1P
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:14:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iK2zm-0004jd-0p
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:14:54 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41703)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iK2zl-0004j3-Qw
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:14:53 -0400
Received: by mail-pl1-x642.google.com with SMTP id t10so8218706plr.8
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 09:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+F6X02wRzPqupguhzonf54LCqxepyVKk9l04jtHzBBQ=;
 b=pA4yEJYhk+eiQ8iAT00sslie0hFquUaV04EYE5xfxgJPXkKW4fRLVddiM7h2Q+N4bo
 a6C0c2ITq/1qyV7ZhNtVFPV34m+nTLllR8dhOyFcQd0qmRfYJs6ZMyzo+5cxzQgqgDFt
 J7QnyoFviYXpM799nsv3UKQ/bCleMfnyvlgJc2WMvLLZxRyO5qevaE6D6dSi+eN93aYA
 ET3xsEsk+I3NXyfw22Bc0F9u+zY7Wdq0q+EgTBDsZ8dVoYu/j/0UFIzZZT2hqIMaCd4L
 LP9EzAsBcxTWFQ2Rr1qUNvlpdUHTh8EWMqdcrvusifvFEP+/yY1yj7weuCpisgaArS/G
 m20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+F6X02wRzPqupguhzonf54LCqxepyVKk9l04jtHzBBQ=;
 b=aDkgOsGuk5pq+7kr+8owOnhdvnVArm4rHjkb6vmpagUl6CWGRHJRB6ptHJwMS6Mf26
 BCYKo8RgIFPXouukElIjZMmLVfbW4ijQd8Nl+ugv3dJwenHl8pCq2L6tj3+qRhZ7CV7H
 tGjTcDYnSCCBu2F5hgZSX+5PJSjHTjpbrYe9IG9axj4i3YFbnqD0hiB/xzHmN9afGfiJ
 o725HogkMP7upsUOyZmjk8anld8PISkeNu06c6bBoZshO+5yf5EfLyUemfsYsQUDf00i
 0YAHlDU1tTLX+jq5jwFOEdpgswHPzWTUMMLIm48/Y9yVKI0NHmK1H+Om4ySd6NdwtNjm
 vAyw==
X-Gm-Message-State: APjAAAU/6EpQkki4hBv906vXjIjwLzUtgvwLXjZ5vDs5z7pRFkTDtWu+
 EtZjQFaaB+Nz2qsHM4g9ZkLXVw==
X-Google-Smtp-Source: APXvYqwbkWFjAfw/pXHVXrHnPghqMa6QoqPvPMneVPjZ2Gg7uBXdsfOu67w/gxNVD5aiLL4QapfhEg==
X-Received: by 2002:a17:902:7202:: with SMTP id
 ba2mr31411800plb.267.1571069692670; 
 Mon, 14 Oct 2019 09:14:52 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id n23sm16688690pff.137.2019.10.14.09.14.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Oct 2019 09:14:52 -0700 (PDT)
Subject: Re: [PATCH v5 39/55] tests/plugin: add sample plugins
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191014104948.4291-1-alex.bennee@linaro.org>
 <20191014104948.4291-40-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <74a7ca5d-9884-fd2a-c3e5-40e5ba0ddb99@linaro.org>
Date: Mon, 14 Oct 2019 09:14:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014104948.4291-40-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: aaron@os.amperecomputing.com, cota@braap.org, robert.foley@futurewei.com,
 peter.puhov@futurewei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/19 3:49 AM, Alex Bennée wrote:
> From: "Emilio G. Cota" <cota@braap.org>
> 
> Pass arguments with -plugin=libfoo.so,arg=bar,arg=baz
> 
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v4
>    - tweaks for hwaddr API
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


