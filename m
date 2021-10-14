Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31D242E045
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 19:45:29 +0200 (CEST)
Received: from localhost ([::1]:35982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb4nI-0006i4-RZ
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 13:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mb4l2-0004sC-Cu
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 13:43:08 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mb4l0-0003uH-M4
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 13:43:08 -0400
Received: by mail-wr1-x431.google.com with SMTP id i12so21726262wrb.7
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 10:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=thHjVE9B7Md1Fyn/Iohmsj18oZyXzhEBBFDrZYOqpc0=;
 b=WZmdKgR2g/wKmO+lVW602sF1xnyJx8+n2WtU57yKx9BQuk1p/UKfExHRvldq6WQEtX
 diWqKdaCEO46lMAjTe5NDeis6/ROITxgWhq/M6g7b1WH2YzN2QMBvbI4S/Bz5NAqap5V
 P5+A+Bl7AVgxdctLYWsI7SfB4pl/pGMOkAmKv0jbZlkqq+c2zHD2OwiNkLGpW902EMZu
 JPqZskRNK3T+Ox+Ma8nTzIYzSo/ugJ6XvnQnXZj6I28x1Gi1tjMg/pxyK4eyieHXhLYI
 lvwyXlBbif3Oyt8KaFkxNH/Cw1uoHk6UoFawA/kY8g2M+F6045LXhGPPAZr/8MX2kCnb
 B0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=thHjVE9B7Md1Fyn/Iohmsj18oZyXzhEBBFDrZYOqpc0=;
 b=tV0CmHnTeEWh25nvZJ7E4iXWQp39CGicnxXmwK4GoXp4q3ThVkYgMI8aQ5W1NLaqaI
 yKQuwiDjodacC1o4AZXspH273ThmKZ+nQv6qZ5cZFLBIsGhHO5P41s3doPvsV1dKJsYZ
 6wMaXS50rrsFviulxuY3TvFqtVaGlKbu1DBxKT0U6vfCRHEfQYoN90qeQq9u+/nCfqAH
 I7PY5l/1PqWlLisWSlsYarZXLbK26+ds5dIk+QNCiIixMnKnkIGGKQ84o9WZmouWHjVI
 f3ceNECcR+9rMWtLT9Ttza0J4oTonYT6GPldzqhrIMw6GIHM1qU6U9yxA5ZheusVGTO6
 VoWw==
X-Gm-Message-State: AOAM531pfHVPFu7eG3yV95I6yUsvVV+ryMPiH+fi5rfgxmeHbGPUyHl9
 D7ZchypEeyCfDQ83YxvQJaY=
X-Google-Smtp-Source: ABdhPJzS58BIhfdcA6F86RUCcGQa2gt4UGbrXEIAzWnHLlDveZ4HhAq9mhvLUMSE5vYb61Rd75oPXQ==
X-Received: by 2002:a05:6000:162f:: with SMTP id
 v15mr8580428wrb.118.1634233384828; 
 Thu, 14 Oct 2021 10:43:04 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id c204sm8598143wme.11.2021.10.14.10.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 10:43:04 -0700 (PDT)
Message-ID: <537adf28-351b-c975-9fae-49057db21893@amsat.org>
Date: Thu, 14 Oct 2021 19:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 1/3] usb/uhci: Misc clean up
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1634232746.git.balaton@eik.bme.hu>
 <2a28285f638bd1fd015e906c840f2e71b9d4b6b9.1634232746.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <2a28285f638bd1fd015e906c840f2e71b9d4b6b9.1634232746.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 19:32, BALATON Zoltan wrote:
> Fix a comment for coding style so subsequent patch will not get
> checkpatch error and simplify and shorten uhci_update_irq().
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/usb/hcd-uhci.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


