Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 047B948AFA0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:35:04 +0100 (CET)
Received: from localhost ([::1]:54204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7IEo-0004Fc-IC
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:35:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7Gvo-00040i-ET
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:11:20 -0500
Received: from [2a00:1450:4864:20::32f] (port=33641
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7Gvm-0007Yn-Pu
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:11:20 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 o7-20020a05600c510700b00347e10f66d1so809909wms.0
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 05:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:from:subject:content-transfer-encoding;
 bh=FBNTR5A9MUkj3NaxGX9Lc0fqgH2d01iXMLPl3gvHgRE=;
 b=JudhGFkSxNIG6asJ21l7FOveJv7a4LQloHBZpq3k3+pwla5//EleVjKZpFz+xHkqAP
 yDC8k8YoPsDM413h62yMCPNvODfCkcHkeYYCuPD8xbKAcGlO3cTFVcl5SvFgxKlW/2Lg
 VfkZx7/Kx1luxb8f1tPVqmzTLGGQnDJIfAH02ymdSBeAVJaMN9pOCwRlCpumQm0R5niI
 aqcKxjp1ZuMV5I3FQ4MhaXbz3KiB/yvj8v5WoACRZco/3UBohTIT9cY7dGo59R9DPH3B
 iqnuFgJOXVrxnxnuBR/oRR5QTwtvRBL4JyaD2dXO3oauN9yQsJQLRiHsQg+QdMA7p9fn
 jQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=FBNTR5A9MUkj3NaxGX9Lc0fqgH2d01iXMLPl3gvHgRE=;
 b=0XoZAhrBzQ3JVj13usOPNLTIqDMNkyibjGyoF2UunhhrUbtRRVVCwIQA51/gk9HEKL
 8hjOpp+/FVC+g5fXEjYHlpjYJKD/07GQgLrJ+4RO+O5pLQDNx9bPSUTH76+PkGJh6jkk
 xUJnOeIern/07l8/Myr0oRP+0OQZMMHA4WINGmkfA3Do9/t4w3cWmsSGk0ikWND6WyOm
 jpK7ORZejezK63MJ+WC5RURu9Tl3DvffW8MN2/vx0fH0FW0nUpIQmAZtyesXRjGmMRET
 C+5ImbSdfirlR85r12hHbKJ4wsh5fMxW/OD85Osrm1PHIIxoSfiqgQ7pD8YCDeD3mA4d
 gUkg==
X-Gm-Message-State: AOAM53161ZMCTD/V1MHA3cl6wYNTHWKc6GgqMGUrytu7jhPrCeNPW8/L
 R4WLEnnQ0E9rr+gFAxDR4tI=
X-Google-Smtp-Source: ABdhPJxGJRyzoz3RYMw+6MGXv9CObeu/lh0aQKZe+g6QduCBAS8uLpyoeompN3EOOecNwPB2uE8s8w==
X-Received: by 2002:a05:600c:5025:: with SMTP id
 n37mr2447638wmr.18.1641906676592; 
 Tue, 11 Jan 2022 05:11:16 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id k31sm1889828wms.21.2022.01.11.05.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 05:11:16 -0800 (PST)
Message-ID: <c4b8b407-e270-b5eb-8f41-2b28d94059e3@amsat.org>
Date: Tue, 11 Jan 2022 14:11:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Subject: cirrus-ci: FreeBSD failure (lttng-ust package not found)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

I am getting this failure for the x64-freebsd-*-build jobs [1, 2]:

pkg: No packages available to install matching 'lttng-ust' have been
found in the repositories

Do you know it this is fixed in your testing/next branch?

Thanks,

Phil.

[1] https://gitlab.com/qemu-project/qemu/-/jobs/1962062060
[2] https://gitlab.com/qemu-project/qemu/-/jobs/1962062061

