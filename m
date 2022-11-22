Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8351633FC7
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 16:04:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxUns-0007RR-Mx; Tue, 22 Nov 2022 10:03:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxUnk-0007P3-S6
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:03:08 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxUnj-0003mW-5I
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:03:08 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 o7-20020a05600c510700b003cffc0b3374so11319105wms.0
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 07:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1cG7JjZKrDJMJiFBZz4LFWA1swu2frAZNVzdjz69N8g=;
 b=vFt++CBA+6wZ8Bc/+CrSx929SKa3a14SLbJc66HUCRCwK0uMTwXUw7yBZJxsSjjXLq
 QIlxt2snSfdPqycssCGhCOS6itQAT0ld3atsOSs+sOh9cW+FJnW4cmaL54hUu/ML1Jp0
 txqbmQxX6MRKld+o6rlckro0O/xJXs5Q1LpJIO4TfM38rMI5SVkf1ST6n4Abur98Gxpj
 +5BXEspfChP3+uPkGEBITZNTKj5VNMoeAAaU99JE/EgbIeTgZt0qeP59hwlL485DQg2P
 MifhBtCWXe+JSEimVzyxYJcQqrl2WP81AMLvC5Q97MiMosUppkDXWJgEBlxc2/x7R9v2
 Ywyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1cG7JjZKrDJMJiFBZz4LFWA1swu2frAZNVzdjz69N8g=;
 b=ImgnKARGnvaFKddO9G9cRMOPOA3T1UqH48wVGnslv7oZ/N0vGCsKzhcPOJ5jqzs/DT
 CoJ+uDNadg+JWeNeIRIgtwLx0+/r23vE5qGNoTEGF9nZDfzlUjopq98HCdr1gC5/U0bW
 e6IYWTWQyuCVNWIy56dk0r6Bb2BCPpYzcoYlSinRjugglaUndjJN/YRDU2ZNUuKWNpNj
 YwAcT6RrZ5a3WDFZznuwn6019lOTScLAmMl9Pgf8jr5y5K2tQEWOaIe/sKxKLx7ZX0r/
 PySMCXWB27WtjJred38RR1dzBvrlY+UXXt8v7qUJX/EnVZA2H2dl75NCMc6on6EyT1bW
 N31A==
X-Gm-Message-State: ANoB5pm61iG0NVWvQAxGZXZFxoUeTzp18CBkx8rLSyYx+YV/Mwo0jyHX
 A05XDjIOZsoiu0erv2JP1yC8dg==
X-Google-Smtp-Source: AA0mqf40N+nxtt5mODcVyTIwvzVjIYRVuF+NeVQUiZmfqWhgfHBzMks+PRX47j6dxuCqBJ0ckzp2Mw==
X-Received: by 2002:a7b:ce05:0:b0:3cf:7c1b:3c29 with SMTP id
 m5-20020a7bce05000000b003cf7c1b3c29mr6124578wmc.23.1669129385495; 
 Tue, 22 Nov 2022 07:03:05 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r24-20020adfa158000000b00236b2804d79sm14811403wrr.2.2022.11.22.07.03.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 07:03:04 -0800 (PST)
Message-ID: <506afd42-89ab-cc6a-42d7-4544244f8672@linaro.org>
Date: Tue, 22 Nov 2022 16:03:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] cleanup: Tweak and re-run return_directly.cocci
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>, Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, fam@euphon.net, kwolf@redhat.com,
 hreitz@redhat.com, groug@kaod.org, qemu_oss@crudebyte.com,
 Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, yuval.shaia.ml@gmail.com,
 marcel.apfelbaum@gmail.com, mst@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, pavel.dovgaluk@ispras.ru, alex.bennee@linaro.org,
 peterx@redhat.com, david@redhat.com, mrolnik@gmail.com, gaosong@loongson.cn,
 yangxiaojuan@loongson.cn, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com, berrange@redhat.com, thuth@redhat.com,
 lvivier@redhat.com, suhang16@mails.ucas.ac.cn, chen.zhang@intel.com,
 lizhijian@fujitsu.com, stefanha@redhat.com, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, virtio-fs@redhat.com
References: <20221121140121.1079100-1-armbru@redhat.com>
 <CAMo8BfKxve8=RKqT6S8XXy1E7hczF0VO9XXZeUpha_4xNSV6WA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAMo8BfKxve8=RKqT6S8XXy1E7hczF0VO9XXZeUpha_4xNSV6WA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/11/22 17:42, Max Filippov wrote:
> On Mon, Nov 21, 2022 at 6:01 AM Markus Armbruster <armbru@redhat.com> wrote:
>>   .../xtensa/core-dsp3400/xtensa-modules.c.inc  | 136 +++++-------------
>>   target/xtensa/core-lx106/xtensa-modules.c.inc |  16 +--
> 
> These files are generated and were imported from xtensa configuration
> overlays, they're not supposed to be changed.

Tools can get the repository file list using 'git ls-files', which
itself support file pattern exclusion [*].

We can create i.e. 'scripts/imported-files.txt' with:

   linux-headers/
   target/hexagon/imported/
   target/xtensa/core*
   tests/tcg/mips/user/

Then use 'git ls-files --exclude-from=scripts/imported-files.txt' ...

[*] 
https://git-scm.com/docs/git-ls-files#Documentation/git-ls-files.txt---exclude-fromltfilegt


