Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD06E30C162
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:22:09 +0100 (CET)
Received: from localhost ([::1]:37384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wZE-00088H-OP
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:22:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6wWd-0006O6-HU
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:19:27 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6wWb-0007cj-Us
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:19:27 -0500
Received: by mail-wr1-x431.google.com with SMTP id b3so2519184wrj.5
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lrd/LqP3hHERdRSXnayolY8/G9TUE0rkRQtnW3clWG0=;
 b=VWDBJPDEAHJ846t1oYTE9d1Dxc8pRlPrBhoqgo87LCDxt7BonnFER4X0iI8gOGS4V5
 FNOctHBsm5ypVhGZ4YhG71l7P1lwl6xuwgo+AEt7vSknx8tkszmxDUiSbwNu7oamonfQ
 TGO0gamOxvLBopX1MYaMl5lLVRHihyCDq3ROMnlcPCPPZXeVsGfsw3eCtolpc49TOV4/
 IwJNDFspIZ62PWGg1yf1PQKg90HDyuYKbH7sCQTdptlmUyD/QvWJ0fFoz9r68/QgdJRB
 NzVJ5DJHhN+k05S7iFDMsdBQtk1Gs7Kuiu6A7F2EcVyGOf8xsidF9F/lJVQGv/EguIgB
 cBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lrd/LqP3hHERdRSXnayolY8/G9TUE0rkRQtnW3clWG0=;
 b=rx9Aj6/NE9rtKpoUOQEaZKZoDQ50oRVzQEupW2vHRmyFuGCHxvgBXhsFMC660NrwKz
 Zv7ECcJI2QtX8dzjuZARUiwRNVDHJn+/mSvPLk2kNxQUxq/D2aXBHiSeUp6v/xGqtf8t
 XodfRNrU+ScyT08kt0dfYBC1pYKN4yUwgCOyKwUo3RseNZK9Vzebk+8unVvR96dPBghh
 l5xVqeCf70TyfNYrgnTZ1HyKZxaFZ/MQG2v4Cdxzv5W+HDTF4ulhJovfFXiuXNtRrsFl
 DQH8Ldl4hmfoYfTlLl+9y71v+LWjha+bCQP02u8V3pDyUUgUOdl/7iWLUa5hN0rGV1Jk
 to9g==
X-Gm-Message-State: AOAM531Rsu4vBt8aMWYD68h/xODoB/GpZNvfsh6XGP77daYDf8d4EFUg
 ztwS4ZXGr7U7lNsn4vRwEJI=
X-Google-Smtp-Source: ABdhPJw8PbizjqS8GnDQ13kJ2Wl0CssQr2ptckN/hcpHJ3T6/MvYzTttjSRud+L1R7mZjc2ESNdRsg==
X-Received: by 2002:a05:6000:48:: with SMTP id
 k8mr24537435wrx.340.1612275564218; 
 Tue, 02 Feb 2021 06:19:24 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id z1sm31940546wru.70.2021.02.02.06.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 06:19:23 -0800 (PST)
Subject: Re: [PATCH v1 05/15] tests/docker: alias docker-help target for
 consistency
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210202134001.25738-1-alex.bennee@linaro.org>
 <20210202134001.25738-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6bbf097f-7ed9-268a-5657-8f363031e636@amsat.org>
Date: Tue, 2 Feb 2021 15:19:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210202134001.25738-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.155,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 2:39 PM, Alex Bennée wrote:
> We have a bunch of -help targets so this will save some cognitive
> dissonance. Keep the original for those with muscle memory.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> ---
> v2
>   - also fix help-on-help text
> ---
>  Makefile                      | 2 +-
>  tests/docker/Makefile.include | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


