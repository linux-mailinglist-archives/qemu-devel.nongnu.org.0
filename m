Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BD7415A07
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 10:27:30 +0200 (CEST)
Received: from localhost ([::1]:51534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTK4m-0000ur-Q1
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 04:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTK3H-000078-On
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 04:25:55 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:46652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTK3F-0000If-Ux
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 04:25:55 -0400
Received: by mail-ed1-x530.google.com with SMTP id ee50so20578523edb.13
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 01:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wditbNMHGHaVJG6i7uoZN+tNuAkXZXQmZAYgkFJc9bU=;
 b=XOqANGer8nKzwQJpZfESxhpZ05nnjlaN0rC4EVfzvWT3QN3PQ7r9f0x6GZUd/cDqAa
 8lI1vcd5XrDu1ZgrokZ1UwxAqPSiDSFDnlJUd72VErNBx5XB+H56kDSVkGPh/TGP5jTD
 KCx1dhUiZZIGD3gaT7VwfneCf+eJIa4Aa8jc8i7WAN/rYaxtroWr1tDej7M2zP35fcEA
 EageB135XQnVSv3sWQ7mhQAKYR4UlM0oZTrH5FbXPQXFFYQOcajvViGnOTJxwtg1KvVX
 Sl/udjgkM4Pn/RPdX5YDZ7U0vjWqPh62e7LUD/6KH4cHO1S9mt8L3i4xr3EXcEX6ES79
 uv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wditbNMHGHaVJG6i7uoZN+tNuAkXZXQmZAYgkFJc9bU=;
 b=IMqvrA5RHi3lz484br5fCv1hHOTLQ0+gSOM5TbZZa95MWNTu4CFR2FcxB5C9M4oXc5
 ury72mn2HoByhShsrOtx8y1CanICSFNpfQLT6BKVVh6gPtRNBkCxZoaqZjw2o8jwbC/s
 oAPVZxhUIqcY2KiB9O8xGBtKcInlPKsjgVKYxE8lbH1KpGdR7rnD8boyGkjGCYrT1klQ
 KFDOdqopidB8fs0YiLjucxN+xkOtxWxa8lwARF3JcZ3ElGc79TZ4E4O4Pbbqa45eNC9j
 lm5Tk9bWH4tI37Wivfh56v9VWZn6HY7rtK8hUSNc4F5qYnnCQ7tdfwKpvXl54lx6LbWM
 MZmA==
X-Gm-Message-State: AOAM533U4MPUj+Svv+rxNIIBFG9aN61pfGpqHddEEoSYsxEuOhhuYJZN
 JZ/cl+0iJ2XKK1Y7nvb+qbZ4TX9sFaE=
X-Google-Smtp-Source: ABdhPJw+Vl+htPjIm9S+OJDnxnROwzhX+UK5qy7uUtQYPwizQpsAndV+GjYyfLmrFc+KsvAcdJSbYw==
X-Received: by 2002:aa7:d5c3:: with SMTP id d3mr4030107eds.151.1632385551851; 
 Thu, 23 Sep 2021 01:25:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id o7sm2930476edt.68.2021.09.23.01.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 01:25:51 -0700 (PDT)
Subject: Re: [PULL 0/3] Update meson version
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210918093140.5797-1-pbonzini@redhat.com>
 <CAFEAcA_07d87j7y1qnBeTuoKQw=9=fY0Ci=6ky=XxBQbuEqDnw@mail.gmail.com>
 <CAFEAcA_rhpcE9jMXazbG2vdfcDuaczdM488bZChDFHORbr23JA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4c948d18-8ef2-2a79-9230-3d57a6be223b@redhat.com>
Date: Thu, 23 Sep 2021 10:25:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_rhpcE9jMXazbG2vdfcDuaczdM488bZChDFHORbr23JA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/09/21 20:22, Peter Maydell wrote:
> I had another go at this. As far as I can tell it causes all
> the vm-build-{openbsd,netbsd,freebsd} build-and-tests to hang.
> At any rate the VMs are sat there eating host CPU.
> Does 'make vm-build-freebsd' etc work for you ?

It has been hanging for some time but I hadn't debugged it until now. 
It's caused by a missing dependency that causes bios-tables-test to fail 
(badly).  It's plausible that the meson upgrade triggered a different 
build ordering for make/ninja, and made it hang for you as well.

There was also a related bug that caused the test to hang if bzip2 was 
not available.

Paolo

