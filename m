Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D45D7A977
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 15:25:08 +0200 (CEST)
Received: from localhost ([::1]:32854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsS7n-0003wA-It
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 09:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47035)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hsS6c-00031r-Pi
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 09:23:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hsS6b-0006gP-UK
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 09:23:54 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:37795)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hsS6b-0006fi-K1
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 09:23:53 -0400
Received: by mail-pg1-x542.google.com with SMTP id i70so19323110pgd.4
 for <qemu-devel@nongnu.org>; Tue, 30 Jul 2019 06:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J2XeK3YSzNzSZPnprYs7B817GoMveTDdgLHp0SJRj9s=;
 b=cDdDCh+ctkOvhUKb7h1nGNO7wAVeW2bCoahPZvMUt5T/aMIhOi+ugtONARJ0vfX8+K
 +FoBI6cYNo+bMr38SDsAgw1u0zQKNrcfocGukvwvNJBRI65+BRT6oGCG/pdiWWdqAKZs
 tUG5d/aYnbQYGr2SLVfL+CsVdunIVzu4IQCzfkHZtNmXzE5UkIes0pLyOLbBeqtWNssA
 EpgcNBYeTQ7DuQ6oj+RFYSy1aXuIL9Dn0eXxfvjYGT6QwY3CP+09I1GpUsQIHkcI0p8C
 4PQMKGyRKU1BftcOnxG991sMWtjXhjyDSazrS1gKXth7juQnP6NV+YHwB6PBKJ2k68L4
 bU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J2XeK3YSzNzSZPnprYs7B817GoMveTDdgLHp0SJRj9s=;
 b=UFVVkOemDt8Np91sw0hym/Yt+VLFTeZFFhLIlgBK0TVgXwBP7wiq2tXnmiOmO3zONN
 IBO8bZZnTCsUYa4SKa4WeH1WR8P7LZ1N/tjKRTvboAQDxF1DDzTM6nEPcIrCPhSKEHL6
 uXUVXbYjJTEdiJD8V2rz6Z33pMtk80IeQi3FzN/4nrZ2RVoeej7sA32yYGO4sHoqUWNO
 X/toNg1uX9Wb9lhMojxgQUnDybClVa+mawStZn3CkwI9XDQkvny2teC3QeFxc4/wzGIu
 VXeGKhKya2CO/qlv19expPN8b+QgDlc12qx550CXENCQ2dXeYinWvgUUnkUqV24FD3lr
 b4cg==
X-Gm-Message-State: APjAAAXIPCX7kE1D+PCLZFC2OrnCZaNcRTZvhG9dqKRE5Cv0SWJ8tZWJ
 Kch87PbMyxQRNnQBLyCXspUbsQ==
X-Google-Smtp-Source: APXvYqzdxJey+g3cA65b7sSNTBvFuYiPw+S93bPIVlWG59+beiqbIRYw/IaTb+u5Pnd6jKIRlNk/4Q==
X-Received: by 2002:a65:4948:: with SMTP id q8mr50455795pgs.214.1564493032298; 
 Tue, 30 Jul 2019 06:23:52 -0700 (PDT)
Received: from [192.168.101.105] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id m20sm70685467pff.79.2019.07.30.06.23.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 06:23:51 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190614171200.21078-1-alex.bennee@linaro.org>
 <20190614171200.21078-26-alex.bennee@linaro.org>
 <bd131b16-2f38-4112-4e09-6a2f63908bf2@linaro.org> <87ftmnitjp.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <67b32364-c3dd-ff0d-fba8-7737327fc1b5@linaro.org>
Date: Tue, 30 Jul 2019 06:23:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87ftmnitjp.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-devel] [PATCH v3 25/50] translator: add translator_ld{ub,
 sw, uw, l, q}
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
Cc: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/19 5:41 AM, Alex Bennée wrote:
> Do we ever need _code access that isn't part of the
> translator loading instructions?

We use it; I'm not sure that's the same as need.  ;-)

Lots of the uses that I examined should use a mechanism
like arm does for recording syndrome data in the unwind slots.

Quite possibly the only legitimate use is sparc, where it
has an alternate address space that reads with execute permission.
We could probably find a different way to accomplish that
if we removed the *_code helpers.


r~

