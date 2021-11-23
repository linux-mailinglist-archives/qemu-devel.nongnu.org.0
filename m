Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE3445A04C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 11:34:45 +0100 (CET)
Received: from localhost ([::1]:57200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpT8O-0003tO-D3
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 05:34:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpT6h-0002tH-JO
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:32:59 -0500
Received: from [2a00:1450:4864:20::32a] (port=35509
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpT6e-0000XX-Nd
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:32:59 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so1807315wme.0
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 02:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x48pBdvV0/yd3GhQtZEdcTzOmtBXGrQPVQZIjoCVfKk=;
 b=OEl+6aDbv5ck0M4NwCBg+bYMXOIgk1QG3KEaLmWXdvCvCaZoQBuHPYkM3QuLHrAJFz
 euDzyAYH7rb/EYwcFGcJn74KbQSjKaeMdAqw6ichcGGPf7smoLb+GWegUWUz8NcwC06B
 8G83P56DMIma9mb5KgOaypkmCTRrz9WdQTw4Z3zu7RE0ucAUwQsUkXRj//9EaTwkOtx3
 l9OSD5CltQ919IuffSOUFefEA5S5C5ai5LIb5i4UwRnIIGDUJVw7eFjfG0ixwnXUSX+o
 BkYbcmJTTi0uqvF97vVwVXNgC4s13VrKxWei4lt4rv+8oo3a2Vkg2uQkMaopzZ0NLfeg
 y+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x48pBdvV0/yd3GhQtZEdcTzOmtBXGrQPVQZIjoCVfKk=;
 b=3MJGNsgAN8hNguPE2xQL9z8AXwSMCO2SCdf6pazbj0rJpuiOa09ybXsSkkA3u2vtH2
 n/DzYd+s2ZHhvjvG4CSVCldpmKHkfm5DAEGWgvc5VF/S2q2fEjfmQB31hDleIjjn2bHG
 PfXRXX3jj26krNG8mhM3yu0uttMVu8T23xgLHbAVDWKr9DoGITxdJez3iXp0z3op3Wkn
 HscqC83srQ8H5kZ9WbDPogLAFP+WOxxEHVNDACgiSytHVv1g2HeUuXVR97yNwr3Ma98v
 OWQRh45KPLm44ghGNdiHnWACtigQJxVHhZAg1xox/rMt6xhk4iYL4t1JKZ9Tf0fZ5mdj
 zRgg==
X-Gm-Message-State: AOAM5335YVFar7zASEmW0g74G3aFKWLO1taxq1w/80byH/eFpzm921Fk
 UvlUfw4T4jVwr8lfXQ+8kq5rXg==
X-Google-Smtp-Source: ABdhPJzEMQx3cTDiR+1BDVykyok7ZUEDA21kvArePfCous3sA62GY+D1DcvqwvJg56JSbkr/8lIXBQ==
X-Received: by 2002:a05:600c:190b:: with SMTP id
 j11mr1698519wmq.112.1637663574904; 
 Tue, 23 Nov 2021 02:32:54 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id 10sm15068920wrb.75.2021.11.23.02.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 02:32:54 -0800 (PST)
Subject: Re: [PULL 0/7] Python patches
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211123023805.2745382-1-jsnow@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9bcf25fd-d008-08fd-c0ad-9577f9f2cf1d@linaro.org>
Date: Tue, 23 Nov 2021 11:32:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211123023805.2745382-1-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.515,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/21 3:37 AM, John Snow wrote:
> The following changes since commit 89d2f9e4c63799f7f03e9180c63b7dc45fc2a04a:
> 
>    Merge tag 'pull-target-arm-20211122' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2021-11-22 16:35:54 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/jsnow/qemu.git tags/python-pull-request
> 
> for you to fetch changes up to a57cb3e23d5ac918a69d0aab918470ff0b429ff9:
> 
>    python/aqmp: fix send_fd_scm for python 3.6.x (2021-11-22 18:41:21 -0500)
> 
> ----------------------------------------------------------------
> Python testing fixes for 6.2
> 
> A few more fixes to help eliminate race conditions from
> device-crash-test, along with a fix that allows the SCM_RIGHTS
> functionality to work on hosts that only have Python 3.6.
> 
> If this is too much this late in the RC process, I'd advocate for at
> least patch 7/7 by itself.
> 
> ----------------------------------------------------------------
> 
> John Snow (7):
>    python/machine: add @sock_dir property
>    python/machine: remove _remove_monitor_sockfile property
>    python/machine: add instance disambiguator to default nickname
>    python/machine: move more variable initializations to _pre_launch
>    python/machine: handle "fast" QEMU terminations
>    scripts/device-crash-test: Use a QMP timeout
>    python/aqmp: fix send_fd_scm for python 3.6.x
> 
>   python/qemu/aqmp/qmp_client.py |  9 ++++--
>   python/qemu/machine/machine.py | 59 ++++++++++++++++++++--------------
>   scripts/device-crash-test      |  2 +-
>   3 files changed, 42 insertions(+), 28 deletions(-)

Applied, thanks.

r~

