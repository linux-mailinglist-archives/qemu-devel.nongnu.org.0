Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6536651F4A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 11:54:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7aEn-0006ji-1E; Tue, 20 Dec 2022 05:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aEd-0006iv-0x
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 05:52:42 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aEb-0000gy-2K
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 05:52:34 -0500
Received: by mail-wm1-x329.google.com with SMTP id o15so8365658wmr.4
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 02:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cH8FhgsBwCp7huEZ/90fO5d44i7Lmt+ZHS2Z1r3M68I=;
 b=cPNQa0mKf8Yfp8F6sO8dked42GAjUrz+V3u4N5xt/3hrNMoN/m23nYfB3Hq/IkVf0D
 EIKLRDncvRPKg6oVpwMKyV6CrS3Ss+IX6H5O2iOTfCrQTbtO7gUJOIGRkraWfpGTtrFq
 V5RuVBy+uqNP2EXOXXPqgWYSY4q2Pvrf6t2xNo7jEHXy5CHl+qXnbgJLUNb8cizVdV1t
 bPNRNWpoA5QDaxRzUOkoEDXibMi4iEwKN5J+5pLyGPOAkEqY6HuI/T/o9dH/9X7PzND/
 jvAaoAfduUaGGEvUB2TV/CBxWgO0nSix3lC3t5lxsImRbQ6657dOMapyRFDzjCrnPHSI
 Tn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cH8FhgsBwCp7huEZ/90fO5d44i7Lmt+ZHS2Z1r3M68I=;
 b=h6ZORzBoswZBGMSq3CzLNxrHvA0Udp1uwUnMpGvrpDnJ9RShZisUvnq1I2CE34hwoG
 SVZKp+jxamKaLk74Xe+CvUW2wGhDaB7b7Y3yoRHPuiP7p5EIJZhWeffoEIwvfyCLaqif
 Mup25/nMZ6JHm1CPgIwl0qtEAe+bt7KMIWXohI4MYMk5aKcaVtuGnw1ohK35fGF5yT/Z
 kxxToLXZerNXZRIMGNa5GEAjfV4CM9jOZSOUQdZInbMuj/CfOFMBLpfHWJIMGM+q1uJp
 8JiwmmGbY1/xh1T2XXxrEJBd+1g2H0ArsYqAHdUndQ5EGAruhnsLKksvLGPQ8e4uxZE6
 qmuQ==
X-Gm-Message-State: AFqh2koww53RAntbzWxQ/D+8+pyqvQ7IzrEHHX3KUMfx/9RRBOAmwbYS
 P9m0m2eyv98/qUXpca4xYFGihA==
X-Google-Smtp-Source: AMrXdXvWN8wFWdCaX7iBOj+7E4S4jr2o9udJenWd8r4EEu60pTWsyAyI0CaQ+0lYszyoyI0UZSqflQ==
X-Received: by 2002:a05:600c:4e0d:b0:3d6:6a17:7015 with SMTP id
 b13-20020a05600c4e0d00b003d66a177015mr262965wmq.15.1671533551176; 
 Tue, 20 Dec 2022 02:52:31 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m34-20020a05600c3b2200b003d208eb17ecsm16307881wms.26.2022.12.20.02.52.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 02:52:30 -0800 (PST)
Message-ID: <92b0d029-386d-8cb3-8dc6-416a24db2aa1@linaro.org>
Date: Tue, 20 Dec 2022 11:52:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v3 00/18] ui: Move and clean up monitor command code
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20221220090645.2844881-1-armbru@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221220090645.2844881-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 20/12/22 10:06, Markus Armbruster wrote:
> This is mainly about splitting off monitor-related code.  There's also
> a minimum Spice version bump, and a few UI improvements to HMP
> commands sendkey, change vnc, and info spice.

Possibly related, use of InputEvent in replay:
https://lore.kernel.org/qemu-devel/20221219170806.60580-5-philmd@linaro.org/

