Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8E14542F0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 09:49:18 +0100 (CET)
Received: from localhost ([::1]:45626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnGd3-0008QH-Hv
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 03:49:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnGbN-0007OS-H9
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:47:33 -0500
Received: from [2a00:1450:4864:20::32f] (port=36485
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnGbL-0004qd-V0
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:47:33 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso4126637wml.1
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 00:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aMWmqktPcuRin6MKj/rT6vMEbkabEcSbKVH7fq8Z/PU=;
 b=rkIC1VBFpY3NmXTfLzwvBdrq5UHTF5hkdPPmLPt/AvkDeTnk2IDClwD9/3ZrKagd1y
 ZumDpVCzyXPVEO/s0rbzpiw2qpKnrVv9aG/eVvh0l1ugeH80GLyk6QiEwV41MxvWxC8c
 DlyaBGQVvS1i0uTEawoJKq5eqKp1/XrArUV/3tSSf9TQ6LO3nz+xDFA9bmcXZehcvtn6
 dFxW7PvY9jSpegSltvmaSRme8e4adD/3AtIqf/Cxc/HXOaLG+ETtwbQANGlsd9OXMQtR
 x5IHN6AyLNFjeAJLLbsokQ12Se/sTMjyJInhsSOWlhZKNnz7Bm6GnJGxOjTu2nzeZIBW
 zO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aMWmqktPcuRin6MKj/rT6vMEbkabEcSbKVH7fq8Z/PU=;
 b=w4H7OlkZfRZzQViM1V6guT8/GNywWECHQTpjj6XZhuScJVaoZWoSLd1PTRe5Z88z9I
 7eNX34BZPLIcBhbYmbDv87tJLxQoJIoD+ylw9R0/ttI7ztmtynrx+/naN5BIrIPcCd57
 Pf7BVvANPiKyZHSup8npBRHNx1ZryXW3f1Irvsji3+eD/YkOCFz+jmuiEknEsbZNesJ0
 vQr3eQtPCW3Xj5OVE0IfmEC//MSZWkE2RXttuM7vx31Gt6DdZAaOLu4qp+iecLdYL0cB
 2CwEn5E1aLGDDJCoQJ76XfJIpUqdv9Hb+NFv7ShNYQhhddEVAqp283YE/wv7vaiK0EXJ
 2Mjg==
X-Gm-Message-State: AOAM533QjoAVQvvLnY9ODe5EKn1c9v0782Orzn7ZMo8xb6YsF3PqDnWG
 f6ZRYjsTzDf/IlbaCb+5XidTjg==
X-Google-Smtp-Source: ABdhPJxAmXHBAF98fw9zytuFA7pUddoy1vLvaaUcQ+DUdVBWfO/dP/JcYuFriWGy1jiRLxwQtYstZA==
X-Received: by 2002:a05:600c:6d2:: with SMTP id
 b18mr16090243wmn.98.1637138850679; 
 Wed, 17 Nov 2021 00:47:30 -0800 (PST)
Received: from [192.168.8.105] (101.red-176-80-44.dynamicip.rima-tde.net.
 [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id g124sm4276177wme.28.2021.11.17.00.47.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 00:47:30 -0800 (PST)
Subject: Re: [PULL 0/5] Python patches
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211117003317.2844087-1-jsnow@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8f9e0d2e-18be-1221-56bb-349a1c7a93a0@linaro.org>
Date: Wed, 17 Nov 2021 09:47:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211117003317.2844087-1-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/17/21 1:33 AM, John Snow wrote:
> The following changes since commit 2b22e7540d6ab4efe82d442363e3fc900cea6584:
> 
>    Merge tag 'm68k-for-6.2-pull-request' of git://github.com/vivier/qemu-m68k into staging (2021-11-09 13:16:56 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/jsnow/qemu.git tags/python-pull-request
> 
> for you to fetch changes up to c398a241ec4138e0b995a0215dea84ca93b0384f:
> 
>    scripts/device-crash-test: hide tracebacks for QMP connect errors (2021-11-16 14:26:36 -0500)
> 
> ----------------------------------------------------------------
> Pull request
> 
> ----------------------------------------------------------------
> 
> John Snow (5):
>    python/aqmp: Fix disconnect during capabilities negotiation
>    python/aqmp: fix ConnectError string method
>    scripts/device-crash-test: simplify Exception handling
>    scripts/device-crash-test: don't emit AQMP connection errors to stdout
>    scripts/device-crash-test: hide tracebacks for QMP connect errors
> 
>   python/qemu/aqmp/protocol.py | 24 ++++++++++++++++++------
>   scripts/device-crash-test    | 33 +++++++++++++++++++++++++--------
>   2 files changed, 43 insertions(+), 14 deletions(-)

Applied, thanks.

r~


