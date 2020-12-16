Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F522DC263
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 15:41:10 +0100 (CET)
Received: from localhost ([::1]:54616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpXzJ-0005fW-SV
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 09:41:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ml.linux@elloe.vision>)
 id 1kpXd5-00070g-7S
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:18:11 -0500
Received: from soggy.cloud ([2a01:7e00:e000:151::1]:48487 helo=iam.tj)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ml.linux@elloe.vision>)
 id 1kpXd1-00009D-VQ
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:18:10 -0500
Received: from [10.0.40.41] (unknown [51.155.44.233])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by iam.tj (Postfix) with ESMTPSA id F39D934149
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 14:18:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=elloe.vision; s=2019;
 t=1608128285; bh=Y6SminExjQTXkQQm2dMbjLfxNsJ93uv3//g66yE9NlU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=VXfM+h2O78g1Pz7te1mQpWBlw+kbKcJ7Fxga0UtsiqxCK0QUGxTCS10iSmt7gL0Gg
 xr0Sti5fX10i7dv9EBDx7WOppr87p/23+bUQonREbRN6gc3wB/ZMLl05yiMzeXKSjz
 7VYGOmcKZ1nCuLt5PMxpVZPAo8/Ykd9vuYX8MWt3awLLHA4X0uh8ZJC73wFUL9JtCP
 to0Bwc+5nzHOkMvs42fhqkfO5lX1hvgWwZm9OUtfdlCHk1LFNAUrRc0eLXJmdaITa1
 l3CTlYnVEROYTnW9dwjs2a0hewM2VDgWkqCwuONsN5Kz5lq2PWTk4fvCORR5oVkk9B
 UU2xZJKMKMAkQ==
Subject: Re: Are user static builds really dynamically linked ?
To: qemu-devel@nongnu.org
References: <8732c6f5-34ac-dcce-ee9f-69e7dd612e4e@elloe.vision>
 <CAFEAcA8L2gHB6HMPO8YHNZff4pfp+VTrgK++3DH--OeqCZh-3w@mail.gmail.com>
 <afa57723-2ea1-d381-e548-30bd73e2885d@redhat.com>
From: "Tj (Elloe Linux)" <ml.linux@elloe.vision>
Organization: Elloe CIC
Message-ID: <530dc301-fb34-edc8-f6a9-38f2c7fceb62@elloe.vision>
Date: Wed, 16 Dec 2020 14:18:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <afa57723-2ea1-d381-e548-30bd73e2885d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a01:7e00:e000:151::1;
 envelope-from=ml.linux@elloe.vision; helo=iam.tj
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/12/2020 11:39, Paolo Bonzini wrote:
> On 16/12/20 12:07, Peter Maydell wrote:
>> Something has definitely changed here. What you had with 4.2.1
>> is what you should be getting. The obvious suspect is that
>> something weird happened in the meson conversion...

Ubuntu/Debian maintainer reproduced and confirmed my findings. It's been
git-bisect-ed to the addition/use of -static-pie on 'supported'
architectures when calling configure with --static at commit 127814629b
"configure: Support -static-pie if requested".

Using --disable-pie works around it on x86_64 for us.

https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1908331

https://salsa.debian.org/qemu-team/qemu/-/merge_requests/16

> Please send the (gzipped) build.ninja file.

build.ninja archives with and without --disable-pie can be fetched from:

https://iam.tj/projects/qemu/

