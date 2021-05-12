Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868C937B320
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 02:41:53 +0200 (CEST)
Received: from localhost ([::1]:55614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgcwi-0005Os-3d
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 20:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgcuN-0004Dj-8X
 for qemu-devel@nongnu.org; Tue, 11 May 2021 20:39:27 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d]:44588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgcuK-0001Ik-Eo
 for qemu-devel@nongnu.org; Tue, 11 May 2021 20:39:26 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 s24-20020a4aead80000b02901fec6deb28aso4589443ooh.11
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 17:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JZgWixcMEHFHrb2g5EzVdlvTBAZkPH5zrHudQtOl8Nw=;
 b=UzMPoAUd7cYC9iDyLb1LUJzthzlYJ3ki9IC0DwFmdO/wrL7Cvb7h2qx2Z8O1gjdY+J
 aRoxjYRHLRry9T4+T2FgmhEuUxOlKmxV59ZD7s0ivrlQzMjYHD4AiDG6qVdOi+VLueyz
 JXfWheelEglMTR5DXmNgjDTsRpDbnBnR/wCqUbc2BTFI2gvUCQQDuwhEJLI1ss0ootUD
 ZhtSkkpMMPtbZWXtvoRI1lEAY1pPAcJO5CUfyIraVQWNZE0lrkC3L/MmbdZXWYfJlf4F
 7sU3iADV5puU2JDQc8pa7fv32RYxPJikYTadlwH8Xoap9QAAbA/sOoUDXBoJIPeNiw0/
 N5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JZgWixcMEHFHrb2g5EzVdlvTBAZkPH5zrHudQtOl8Nw=;
 b=BhvxBttUXWPOqSL7ZFpwdReeHRhQh1riOCXJgZYQ33pY8ml7DYOT6phmSN3fi0VFIm
 ZTLapYJECAYoOUmhFZ5aGBdCbYw4X2/FhmHck0+XWFaZTbl5o2d4Ip0MVg1DVtpuGEL+
 rZ5Gn6+SKeiY+uHDtMALZLqvvspfX6KC8FRILJ5PZsL9hjI4YBNULOfpCLYYAZE+0N+e
 SdnUd5WeFpjA+jkrPKrcZdPYMAbPvEHZey9Ino6BJvBOv/lmQnM6NuM5qJlygf1ApbGP
 rLoZjNbhXA7AbDXI9/UnreVdRY+PcAYTUKzsjTSHsSYWtmmV1I7rPz36IctXzfJ77PjV
 vVlw==
X-Gm-Message-State: AOAM530oET9Ra/Pki9RwqixX+5WIXlg2EUsK3qKoIDBKEsfRaZRawIh6
 5RgxymMWakxVjGeZiNIIZCf4Bw==
X-Google-Smtp-Source: ABdhPJwJndBRJsP9xgbUAz2eS7C+vT1siry1d0d+FNPjkVEpcRXnF/AnfiQcZiyzveR1eI2RRpX5+w==
X-Received: by 2002:a4a:d2cb:: with SMTP id j11mr25847512oos.87.1620779962936; 
 Tue, 11 May 2021 17:39:22 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id 128sm2054579ooh.45.2021.05.11.17.39.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 17:39:22 -0700 (PDT)
Subject: Re: [PATCH 06/12] crypto: bump min gnutls to 3.5.8, dropping RHEL-7
 support
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-7-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <389ae637-0bde-7648-232e-b1a6ae526ea2@linaro.org>
Date: Tue, 11 May 2021 19:39:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-7-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 8:26 AM, Daniel P. Berrangé wrote:
> Per repology, current shipping versions are:
> 
>               RHEL-8: 3.6.14
>       Debian Stretch: 3.5.8
>        Debian Buster: 3.6.7
>   openSUSE Leap 15.2: 3.6.7
>     Ubuntu LTS 18.04: 3.5.18
>     Ubuntu LTS 20.04: 3.6.13
>              FreeBSD: 3.6.15
>            Fedora 33: 3.6.16
>            Fedora 34: 3.7.1
>              OpenBSD: 3.6.15
>       macOS HomeBrew: 3.6.15
> 
> Debian Stretch has the oldest version and so 1.7.6 is the new minimum.

Cut and paste error from nettle.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

