Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE03066727E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 13:47:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFwz0-0006qv-Q4; Thu, 12 Jan 2023 07:47:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwyx-0006oJ-P1
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:46:59 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwyw-00051Q-3h
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:46:59 -0500
Received: by mail-wr1-x42c.google.com with SMTP id az7so17970222wrb.5
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 04:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S38fk2tJJtHcgQic+iBsuH12Ik//PCr9dbdVCIaHrfw=;
 b=M0QMJ2pTlO9yoiHML5x8c8BTmkvTv+iG461EKSsmIY5nSJ1M4mTL8WnUIgnurVlhCU
 ZfSZT0IYjJuEYf/q3vM1FtSJCX3+E9OTqFpshmkqhcP88ZAitVxkWXmItYROj6xhhIn/
 QQ4nCtvqOQyXImAHkbycUXSrgPDZRZYlJhcz5WvqOcab4MYcT37nHklneVICQcDgiuBG
 5B4CyYP9CcljOqkESHIDAgTQev1+P61APdtnG7HXo+3t848azfR7biFVdUpJVuwHizZc
 rgdGE4ermmDMDb9LVPIBXcgEMdwBNEsvTG4HTpzeeRh09zhsIzZA/f8Oi1jMNaIu8Ngj
 oaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S38fk2tJJtHcgQic+iBsuH12Ik//PCr9dbdVCIaHrfw=;
 b=gc5Sjm5nrfCqZua8TsvW25zDFR8q0WJm03Yf/Dgu3ZLGz/XmYpQ15GcoQPOUS6b/86
 /KIpMP9NZa/mlP6o2UhhleOaeR7cYvwcWcPTZjaoI7+EXWnY5xqVIfX98yF+EdCBLoj8
 86sHDxQbqIktG+z4TcM4MAUb8BGfmPEuoURgptdepeLEJ7eMvi6LMWlRrKHT9OsHemFR
 3pXdsGonw66EabKTOdC9xLQisHsMXAh7UavahLPP/CA48laRRjPCotmADLtqPzj0pUxM
 XX6cUemLKv8cqfBXflXSVruwmrgl3V+nEKM4HZQ2FDa2wHrCFHOZQhaSvEI5ZnCoTIkT
 aMmw==
X-Gm-Message-State: AFqh2kqIc9CLeLOV+s09B6iWAaObjIdSQnrNuE8Z2VlCAchvoe4RfIi4
 2Kb04YJfqfgCG0PFSzU8oNZAOA==
X-Google-Smtp-Source: AMrXdXvxh2VsAGlVVLQ26kq3AQatOLkRTOcFw6Z6+OI1tpqmHxxsdf5Qxrc+s86BdUkH2JTIXsr8lQ==
X-Received: by 2002:a05:6000:1c11:b0:2bd:bcc6:c450 with SMTP id
 ba17-20020a0560001c1100b002bdbcc6c450mr6849428wrb.17.1673527616729; 
 Thu, 12 Jan 2023 04:46:56 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t6-20020adfe446000000b002bb28209744sm16049244wrm.31.2023.01.12.04.46.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 04:46:56 -0800 (PST)
Message-ID: <581c8788-80f4-1740-3772-5947647091a3@linaro.org>
Date: Thu, 12 Jan 2023 13:46:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 15/33] hw/isa/piix3: Create power management controller
 in host device
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-16-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109172347.1830-16-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 9/1/23 18:23, Bernhard Beschow wrote:
> The power management controller is an integral part of PIIX3 (function
> 3). So create it as part of the south bridge.
> 
> Note that the ACPI function is optional in QEMU. This is why it gets
> object_initialize_child()'ed in realize rather than in instance_init.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <20221022150508.26830-14-shentey@gmail.com>
> ---
>   include/hw/southbridge/piix.h |  6 ++++++
>   hw/i386/pc_piix.c             | 24 ++++++++++++++----------
>   hw/isa/piix3.c                | 14 ++++++++++++++
>   hw/isa/Kconfig                |  1 +
>   4 files changed, 35 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


