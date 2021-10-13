Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF5A42B1DF
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 03:13:18 +0200 (CEST)
Received: from localhost ([::1]:57276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maSpZ-0003c9-Dv
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 21:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maSiu-00066C-H2
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 21:06:25 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maSir-0007Bg-BO
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 21:06:24 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so956344pjb.5
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 18:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BfIUx2pYC43mZtvTJ476vU4NM2JC+TFnsDEWMdAzoxA=;
 b=ty2kcaIdmHh5oSOUG7iXzYBgk5ozWknLwNsrqw2xCj0RgyolY4waF63yrt/Bt+3KYd
 r60CLvKvqp6th12rmPfhnLkW9YMDtN2q60QzAb90abOVYpgSxhaS/j+GwGT93Piuy57E
 EdHrPi0hv9mOxEad1w2lULWlrTyj0E91nbNcdCnRDpI5JUEvdyzZGpdvbzWsaEBjiRUx
 10Y9KfSzbQwLLSbkeKHeoZNFThqdVRhprN0OLvejlc5dBMgsSyC+GAdR4gs0osWLHg38
 NLGjlMcg1hPiRnDcwtA/Veu4ARxpdn7Nd6EpTFGueP9Q5XOF1K77aBA+HdnxYjfhomYz
 rNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BfIUx2pYC43mZtvTJ476vU4NM2JC+TFnsDEWMdAzoxA=;
 b=V4gBFBoe6eJjACsfI7ysiCBtwmMz29VS5LSV2oMEY/M0aMN6iU79YzXlYB0xCzcd03
 HcGiJr+IC8BfpzarKn4CTnBnjrx6kZWbSjZoGGYRzu1ioH2dwtI0zImdwTwjxObKrobY
 OzSwQhf9o1cA8v5duNkYyVVHmDG1+MA9QMBqxeePLlX4cA7a9itHswztRGNVc8bQiGsy
 5Y9ItHYRu96rEbIikD87WNFW+XaHL+W2qN0qqbmxjOC1T9hPFrvt3Hr7dsH6yTOka2ku
 32DeXKzP0kuCmY+He+Q0vdj9ijzNqi2e15+/spqWGH8CNAGyyxtdac8glsxH4+wfxS6R
 kfvg==
X-Gm-Message-State: AOAM532G5vJtC8UAvWMTRZoElWvqQ02l9rL+AO1tZwZCSkSvhxtJrT7D
 hQp05VQPkI6AbbKHFhwnwM9iAA==
X-Google-Smtp-Source: ABdhPJx/+xZjy7hsu7OFGg0j7eM16HHKkJ+9jVWV/QY1SUNXk1iV53vz1im6NPzIkKVARGjAw7ABnw==
X-Received: by 2002:a17:902:9303:b029:12c:29c:43f9 with SMTP id
 bc3-20020a1709029303b029012c029c43f9mr33316768plb.5.1634087179646; 
 Tue, 12 Oct 2021 18:06:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d14sm12105187pfr.123.2021.10.12.18.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 18:06:19 -0700 (PDT)
Subject: Re: [PULL 00/10] Python patches
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211012214152.802483-1-jsnow@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de0d6962-79bc-0c29-71ee-313ac20fdee0@linaro.org>
Date: Tue, 12 Oct 2021 18:06:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012214152.802483-1-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 2:41 PM, John Snow wrote:
> The following changes since commit bfd9a76f9c143d450ab5545dedfa74364b39fc56:
> 
>    Merge remote-tracking branch 'remotes/stsquad/tags/pull-for-6.2-121021-2' into staging (2021-10-12 06:16:25 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/jsnow/qemu.git tags/python-pull-request
> 
> for you to fetch changes up to c163c723ef92d0f629d015902396f2c67328b2e5:
> 
>    python, iotests: remove socket_scm_helper (2021-10-12 12:22:11 -0400)
> 
> ----------------------------------------------------------------
> Pull request
> 
> ----------------------------------------------------------------
> 
> John Snow (10):
>    python/aqmp: add greeting property to QMPClient
>    python/aqmp: add .empty() method to EventListener
>    python/aqmp: Return cleared events from EventListener.clear()
>    python/aqmp: add send_fd_scm
>    python/aqmp: Add dict conversion method to Greeting object
>    python/aqmp: Reduce severity of EOFError-caused loop terminations
>    python/aqmp: Disable logging messages by default
>    python/qmp: clear events on get_events() call
>    python/qmp: add send_fd_scm directly to QEMUMonitorProtocol
>    python, iotests: remove socket_scm_helper
> 
>   tests/qemu-iotests/socket_scm_helper.c | 136 -------------------------
>   python/qemu/aqmp/__init__.py           |   4 +
>   python/qemu/aqmp/events.py             |  15 ++-
>   python/qemu/aqmp/models.py             |  13 +++
>   python/qemu/aqmp/protocol.py           |   7 +-
>   python/qemu/aqmp/qmp_client.py         |  27 +++++
>   python/qemu/machine/machine.py         |  48 ++-------
>   python/qemu/machine/qtest.py           |   2 -
>   python/qemu/qmp/__init__.py            |  27 +++--
>   python/qemu/qmp/qmp_shell.py           |   1 -
>   tests/Makefile.include                 |   1 -
>   tests/meson.build                      |   4 -
>   tests/qemu-iotests/iotests.py          |   3 -
>   tests/qemu-iotests/meson.build         |   5 -
>   tests/qemu-iotests/testenv.py          |   8 +-
>   15 files changed, 85 insertions(+), 216 deletions(-)
>   delete mode 100644 tests/qemu-iotests/socket_scm_helper.c
>   delete mode 100644 tests/qemu-iotests/meson.build

Applied, thanks.

r~


