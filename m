Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA505AA102
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 22:39:12 +0200 (CEST)
Received: from localhost ([::1]:34862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTqxz-0002I5-33
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 16:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTqsx-0007KO-QU
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 16:33:59 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:36646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTqsw-0001gV-At
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 16:33:59 -0400
Received: by mail-pl1-x62b.google.com with SMTP id c2so18143255plo.3
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 13:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=VVIx+qG6WhsPwn0H5gtlM6vMkIaFF2BEtqpEMWr+dpk=;
 b=bdJpB3v/3qo3OqcfoalyCJSmaCV0LHsyArgGap/0nXXEcJlUDWqkJ5NfNmla8mtbJw
 lIaluYsY7a1iV1pEOmVYZ7EDsMLxteX/7j1MSDVIRvpYOBNrCJ212nErtuvGr2BOkcso
 tgGP9TiM7Qxy3ymxnx0652yfM0d0FlGdaspEpoF1F3wBM+CoKt55o2gtCn3bCxJm1Xp0
 W3fnf1djfwyakPbzTtn+hHMiKXw+yE3F/mLXWVvV6TltYldy6AdAA47NSlLpdY3PLsMx
 h37E7jM55nn5FQffuWO1/JFpD9yjA5Mhbew7PCv+EjBRr5JAj/XUu8P1sw2Mj2LaMWL1
 JCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=VVIx+qG6WhsPwn0H5gtlM6vMkIaFF2BEtqpEMWr+dpk=;
 b=E4JKjbFPy8Xyob3/CmjHbHwMTYPie189x66erdB/hSlZOJYz8tkNr3uSipxedN/shs
 sgSGLUxMe3CTsYEEGmoyZbsP7zyOuzLlAgjiImyiDXew/5iYIsFDMVG/rVJkHxHZ53Kd
 K9eCsswvUhjQgAlGug8xebFsiqYXeRoRCVQCRwIYEQ3TwH9/nbvU7jwRXS9IfKtUCmrv
 gYlpWc3yAF3QGmpJf2womFF8Ta6CBYd+KMZxIdHsSLAFCghuMPDW7j0PlW2U5+KGTCEp
 TMf/u12kqwRUb2pjtg9JQf9FO390G+NTXibfxs+JI2Bm7G6SpvLe32T2xqAk1tCjNe3e
 IYwQ==
X-Gm-Message-State: ACgBeo2Qo68bRpKyqX1CXxkWlb9Iillwf9QCe3nAlC9v8arj81T2xbZk
 AKC5PjtQtsFW6PRwOLn9gF8=
X-Google-Smtp-Source: AA6agR5cgTPJbbrJXvJxOCL9/QHa2ARoLWtgW6tZXRhniGKJUWG4IKxrKIwiDfoqj0F6iUX23eqzrw==
X-Received: by 2002:a17:902:e94e:b0:16d:12b6:b9fe with SMTP id
 b14-20020a170902e94e00b0016d12b6b9femr31816788pll.152.1662064436484; 
 Thu, 01 Sep 2022 13:33:56 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 11-20020a17090a098b00b001f8b3f7cc16sm3731989pjo.57.2022.09.01.13.33.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 13:33:56 -0700 (PDT)
Message-ID: <5cf1cf19-968e-d349-d64b-81969d043692@amsat.org>
Date: Thu, 1 Sep 2022 22:33:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 15/42] hw/isa/piix3: Prefer pci_address_space() over
 get_system_memory()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220901162613.6939-1-shentey@gmail.com>
 <20220901162613.6939-16-shentey@gmail.com>
In-Reply-To: <20220901162613.6939-16-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/9/22 18:25, Bernhard Beschow wrote:
> get_system_memory() accesses global state while pci_address_space() uses
> whatever has been passed to the device instance, so avoid the global.
> Moreover, PIIX4 uses pci_address_space() here as well.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix3.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


