Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB5D45A41D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 14:51:42 +0100 (CET)
Received: from localhost ([::1]:40202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpWCz-0001fz-Ox
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 08:51:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpWBD-00084B-AB
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:49:51 -0500
Received: from [2a00:1450:4864:20::329] (port=38518
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpWBA-0004k5-O2
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:49:50 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso2308906wms.3
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 05:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G5zK/eRdETamzb8gKiWmWX53TyEdVumrkxrNmo9PRHM=;
 b=XwFHWyx/i8Dcktyyt9Zkx74aPvgeo2ZsdhX0ezQnHwId+iOlJ5hnHIoEKVSwQfZ7sO
 mKXSp80wRz1UGJuu01U8bZorPxTECLdAv8OAWb3XMGSNixdCtrGqrQDW5DlTmQWpFLz/
 mgthQuApD75TllzV5zuVSoWpeMLhHDhlOMUfBFpBzoCRoqhsTTr3JIFtFK/Ay43OqtT+
 UjJVV755dVNp8OTCUCSL0AkvoYJ/EHcO3az8LcyO12OXYVIyWLbpnta0MKkakqtbpHg+
 PQ4hBc992Id2uy2fO5/sxK5Gsp7/XC5F15WWx683tZ0oBVoAm4vYf38KMUUNYBP3/fgA
 xQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G5zK/eRdETamzb8gKiWmWX53TyEdVumrkxrNmo9PRHM=;
 b=uuMXnlp+qIbjkYJeo8FeGIVsVTMomskdLmnDPjPQOb90OBENGJV3ezFNv0KoHjSJyk
 abZOdoYOcdM0SnI1zyJmA2eoHWzdPrvaMU3NGoSjfPDCgKgb62C0QxDD5Q/SGqqJ1mLr
 uT/IBb8mHVqZX3KW1O/8516GephKJ+mCv9M68cdaxL3tO1u+gz5MNdpXn5y/OEJ4VZj/
 njfwhYAoApihpdLf5aPU7iY7MSycl4Zjqfehjy/TzyPGEVpvbLtozawxtG2wfzDl/IbJ
 hZlqWq3wWXIsSXTMcjHg0rN+p9PURFheSe8YOnVh5VFxKEU2QWKs32buXB7SEySjHCOy
 08hg==
X-Gm-Message-State: AOAM531SzCawrB3tnj2aqupvh7NCFMUopxTFfTXpR8VLeH0h9+LfwgUW
 pqN7sbL2jh80C4xTTz3GHDbVew==
X-Google-Smtp-Source: ABdhPJxh5Rn2inQuW3WLqf22Ex2sO66TBkUvITfv0FwthKcXD3BOqw4mo4nwPUAn4xvSeYObInGRpQ==
X-Received: by 2002:a05:600c:2f01:: with SMTP id
 r1mr3292153wmn.153.1637675387168; 
 Tue, 23 Nov 2021 05:49:47 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id m7sm1090420wml.38.2021.11.23.05.49.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 05:49:46 -0800 (PST)
Subject: Re: [PATCH 2/2] spice: Update QXLInterface for spice >= 0.15.0
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211123134302.45741-1-berrange@redhat.com>
 <20211123134302.45741-3-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a723b8de-e273-a759-9265-59553f608329@linaro.org>
Date: Tue, 23 Nov 2021 14:49:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211123134302.45741-3-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.515,
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
Cc: John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/21 2:43 PM, Daniel P. Berrangé wrote:
> From: John Snow <jsnow@redhat.com>
> 
> spice updated the spelling (and arguments) of "attache_worker" in
> 0.15.0. Update QEMU to match, preventing -Wdeprecated-declarations
> compilations from reporting build errors.
> 
> See also:
> https://gitlab.freedesktop.org/spice/spice/-/commit/974692bda1e77af92b71ed43b022439448492cb9
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   hw/display/qxl.c        | 14 +++++++++++++-
>   include/ui/qemu-spice.h |  6 ++++++
>   ui/spice-display.c      | 11 +++++++++++
>   3 files changed, 30 insertions(+), 1 deletion(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

