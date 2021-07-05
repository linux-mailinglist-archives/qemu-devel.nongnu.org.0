Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504CE3BBB23
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:20:10 +0200 (CEST)
Received: from localhost ([::1]:49814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Lhx-00074v-BN
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0Lgk-0005fX-BG
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:18:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0Lgi-0003cy-JB
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625480332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g2nBldk8i0XbAMIzjT8LzdPfFsItMSIdFyaA+0/YACM=;
 b=MCFeXvU78gzR10aMrVD72Z5rw6JzfLd+EGGNmI5zNsTsdRZCZlCWdpucr7+vuAOXPvHSrP
 LmX1Xdn2Qj1myCDl2kRuGV9ob061RctlhlV7FMGsnW/CgCGATpTjtwRWoCfrThr6nPhlZ1
 A5TiUUdMCX+qHno6TmnJcmrlJMlxIPs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-fUgRpM76Ngym32LY_WEKig-1; Mon, 05 Jul 2021 06:18:50 -0400
X-MC-Unique: fUgRpM76Ngym32LY_WEKig-1
Received: by mail-wr1-f70.google.com with SMTP id
 u13-20020a5d6dad0000b029012e76845945so3971985wrs.11
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 03:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g2nBldk8i0XbAMIzjT8LzdPfFsItMSIdFyaA+0/YACM=;
 b=NOmhZdxjwvIH+W6YrWe1IieNDayxpLB9+L+hRX39PloSXTSJhtqSd5P1jtim4N7fTQ
 rtQyAKs+cb8u241htaY6fdSi4z8z2q9FRLDK894fLlo6Xv1RMF7YZgDYSk6ufGIY8n+I
 mlD58sX2U8Avm+EdEthjkd/I9IHBCUnHEbfoZ2y360Y2ycDABHD8jajbt7Fn+f9/rRDq
 yEqDT9FV4XN/mbcy1VHL+2i2oI9tbMN5FS0rRUEIMctCQVIuvjdHDINDQn84q6/3JpMg
 tzJFsab37wNnOX7MOUYLt82BUZWMUwK8/Is0vmI63ovpJ2RJ1i7upsxYmWOahb/VGmXW
 003Q==
X-Gm-Message-State: AOAM532GzZ7Cg2F1PLB7avTwodsphGYtcHYXws5Iaoz+v/pj3UFwePXL
 T6gcfFgaLW0xFtlta42uDlAyHHD0jo+/Vw+4WzuT0qlGXSaWa53GO4nnxP3A78XQr10JBt4ODEC
 GJBPwcWrFbgNA5JA=
X-Received: by 2002:a05:600c:2281:: with SMTP id
 1mr13903753wmf.138.1625480329792; 
 Mon, 05 Jul 2021 03:18:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBaXvQaLeU0GT+XMbOpMvc6jPu2nhlVxiF69M/zo9bIYMLinWYEjtyC90/Mc4cB7e92JVlFQ==
X-Received: by 2002:a05:600c:2281:: with SMTP id
 1mr13903731wmf.138.1625480329596; 
 Mon, 05 Jul 2021 03:18:49 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s3sm13205641wro.30.2021.07.05.03.18.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 03:18:49 -0700 (PDT)
Subject: Re: [PATCH 4/7] docs: Move deprecation, build and license info out of
 system/
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210705095547.15790-1-peter.maydell@linaro.org>
 <20210705095547.15790-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ecfa9d60-e07d-c672-4291-8c849fc46661@redhat.com>
Date: Mon, 5 Jul 2021 12:18:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705095547.15790-5-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 11:55 AM, Peter Maydell wrote:
> Now that we have a single Sphinx manual rather than multiple manuals,
> we can provide a better place for "common to all of QEMU" information
> like the deprecation notices, build platforms, license information,
> which we currently have in the system/ manual even though it applies
> to all of QEMU.
> 
> Create a new directory about/ on the same level as system/, user/,
> etc, and move these documents there.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/{system => about}/build-platforms.rst  |  0
>  docs/{system => about}/deprecated.rst       |  0
>  docs/about/index.rst                        | 10 ++++++++++
>  docs/{system => about}/license.rst          |  0
>  docs/{system => about}/removed-features.rst |  0
>  docs/index.rst                              |  1 +
>  docs/system/index.rst                       |  4 ----
>  7 files changed, 11 insertions(+), 4 deletions(-)
>  rename docs/{system => about}/build-platforms.rst (100%)
>  rename docs/{system => about}/deprecated.rst (100%)
>  create mode 100644 docs/about/index.rst
>  rename docs/{system => about}/license.rst (100%)
>  rename docs/{system => about}/removed-features.rst (100%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


