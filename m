Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF20321BA0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 16:37:46 +0100 (CET)
Received: from localhost ([::1]:54256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEDHN-0004A9-U3
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 10:37:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEDEs-0003QD-FS; Mon, 22 Feb 2021 10:35:12 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEDEo-0002Xy-T3; Mon, 22 Feb 2021 10:35:09 -0500
Received: by mail-ej1-x62b.google.com with SMTP id hs11so30145524ejc.1;
 Mon, 22 Feb 2021 07:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wyBas48ZELzJVZiXTdRF/v2cojCIAy9JbUfyh8ucTAY=;
 b=RKvLX3DWqFvwnhGOOmzlzuTpF4Blyh9XtnlYQ/6h09/Q9zCqvRb9Ec1KeCnl7Et+AZ
 Z+uMJUz42MeXyiuqeJ4STXOQMjtM2xPLmtrFwSSwoVP/1rwULRivAWoMKw/q/OGnT/G3
 vPn8npH2AHYLND5NUyMxIm+68VZoJCDoBy0cLf+E7fWSW4XqCjI9KIe7N0a+88y6uk0D
 pn+vX0aYVvxnbqN3Im12kWVhnwyD/eYxySx5/8MMPDdlGICHBdmBOFc0OJK/DUF6vCIS
 gt3PYNoSTC8PVvE68R3mAuYPQtJhN9yyoHD1b9vqi7N1upMvwFw45P5uVewUiWxz2qLH
 2EOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wyBas48ZELzJVZiXTdRF/v2cojCIAy9JbUfyh8ucTAY=;
 b=kcgsv/ITlry6cABTVO90vnj8IXfOsVACQ1wm6bUrOzMc2YSAA1aQ1eJGkMsgxVJEll
 wUUqbHKGLjXJe0dWJnJoviBkjOnO4GKvSegedzk0NCxfTMPkcOiIRy/mKFmZCvVJ7y76
 BnVN2y+8AaoVbLTCfs8jRC99rcwe34ML993iZZvPX4M3Qmy/pi6qjb2K/9HrVzg+x0pX
 Dr6dYuPYKZbn0ikKNw4btdcvF2wyEBEaUQDK0kPIwcfR3/89Y8aLtH7taa7XCHFmPQsv
 AnHPL758UkYXzhhvzkzExFnURbkGQI64Bdb4fVcnzLYsEKFIW0qCIboyr1qRApcUQg24
 3CzA==
X-Gm-Message-State: AOAM530c/E/zT51kTOBuoSaAhZmUrxeJhqMdLp++XOk0qymmYz3ciQrk
 hy9655jp0MmZqpdETCAEzwBOKUx+rHo=
X-Google-Smtp-Source: ABdhPJxPiY4DZvgVYg6IIdIqQZT0MIMjfYuS0KSP/z9dZ5jZloIGf/A92gBx7uWTKeIlCKey4rPBAg==
X-Received: by 2002:a17:907:7667:: with SMTP id
 kk7mr9538172ejc.92.1614008102862; 
 Mon, 22 Feb 2021 07:35:02 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id ga5sm10801504ejb.114.2021.02.22.07.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 07:35:02 -0800 (PST)
Subject: Re: tests: n810 arm failing
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <cef2f119-3612-65a0-d828-b480179dc3a9@amsat.org>
Message-ID: <cbf28177-bf94-2452-1c66-2f99a8f3dbf0@amsat.org>
Date: Mon, 22 Feb 2021 16:35:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cef2f119-3612-65a0-d828-b480179dc3a9@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 6:26 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> The n810 arm test failed on latest master:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/1045015424/artifacts/browse/build/tests/results/latest/test-results/26-tests_acceptance_machine_arm_n8x0.py_N8x0Machine.test_n810/
...
>     raise RuntimeError("Test interrupted by SIGTERM")
> 16:03:49 ERROR| RuntimeError: Test interrupted by SIGTERM
> 16:03:49 ERROR| ERROR
> 26-tests/acceptance/machine_arm_n8x0.py:N8x0Machine.test_n810 ->
> RuntimeError: Test interrupted by SIGTERM
> 16:03:49 INFO |
> Runner error occurred: Timeout reached

What we are missing here is we got a timeout ^
but return an error, so the debug.log is not shown:

> Original status: ERROR

...
> "tests/venv/lib/python3.7/site-packages/avocado/plugins/runner.py", line
> 77, in sigterm_handler\n    raise RuntimeError("Test interrupted by
> SIGTERM")\nRuntimeError: Test interrupted by SIGTERM\n', 'timeout': 90,
> 'whiteboard': '', 'phase': 'FINISHED', 'class_name': 'N8x0Machine',
> 'job_logdir': 'tests/results/job-2021-02-21T16.00-e662b93',
> 'job_unique_id': 'e662b936b3c04ad082359ee970534ac7ae7ec3bc', 'params': []}

