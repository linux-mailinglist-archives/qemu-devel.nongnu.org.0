Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 801AE6D3E72
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 09:53:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjEzr-0008Lr-Ju; Mon, 03 Apr 2023 03:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjEzp-0008LM-8c
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:52:57 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjEzn-0002jk-Nh
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:52:57 -0400
Received: by mail-wr1-x430.google.com with SMTP id m2so28290720wrh.6
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 00:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680508374;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QyxxQswOfzvKp0DeYOtie1OPrAovV5e6QgyQvc9o4wE=;
 b=wMvMFk4poEx3CB0Xgcsz4Hk3fP8uWzS+AM+do7lXc3jXEsMij7w8Xh9CulCzQGc/TV
 LpewFX41xnj8nHEHk0TtJ6r2EhXT82gXln7IyXpSX/r9LQFhX4GgNZhZmAfF9NW4w4B7
 RC3RE2YBu13Wpfg2qpkQE7eIEgSxvSYm5DYLbAsWjMvVoEkR5Xb5Ruthoh8QWZDAGVkZ
 NEYN5o9fs+HFfdtSiC/ez439vf3CyD3su1Au9AW0l/RG5HlTOXW96NNLk1OxmsribFHO
 a3SwX8y/t+6SKUwEpXGlMKsiTGsbwsqm79EBCp+EYpsa1S8ZBUTEUsMMnQ+iWhvsqJGX
 Ojpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680508374;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QyxxQswOfzvKp0DeYOtie1OPrAovV5e6QgyQvc9o4wE=;
 b=h42EEqWHaz6Sv2gMP33RJGuHYl171Wsf4bJ+vjGzCbEPEQCHaNjCDjXjugWcDUvxvD
 YWcCHBIU/E1HrhQ2RWg07X4Q744GngFJvEr2GUYyrMhByfs0yKYqfe5aOqfvm2ruDgxv
 ZMEm0Hgn34QSJpi8tPatyvAfeC32icBAIFQCfCU6Htt6gH3g3fZD7Mwf4lAOIXoLVepH
 tIX2kcPqCt29INmG38cOmtOqbCmXqaRBrmuknviFZlWSh2WbwbNqHewmjjl4QadsyFyw
 vZiaBIV8nMAPM/NZnTlFj1GKuxpWsI33cR6jTdAZHgJOxiKzfHwdXoLli88RDcZOwLxn
 IgXQ==
X-Gm-Message-State: AAQBX9dagRXC5SsHUGcFkvpHOkAg7KpYTQp8+/R8d2i2aGbe6hTuNSQd
 hxXQjBIdNdcKd+ziFvnccw7Qyg==
X-Google-Smtp-Source: AKy350bYTz28z8YwTHSK08fjwlt25goGmmyvYzsGykr18TnLFXgz9d/j1fRnDGyHNDIfWG45hj0iPw==
X-Received: by 2002:a05:6000:136f:b0:2e5:73af:978b with SMTP id
 q15-20020a056000136f00b002e573af978bmr7190087wrz.12.1680508374280; 
 Mon, 03 Apr 2023 00:52:54 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l4-20020a5d6744000000b002da76acfee1sm9012841wrw.28.2023.04.03.00.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 00:52:53 -0700 (PDT)
Message-ID: <5c74d606-9dfb-69cc-3af9-93a45816c343@linaro.org>
Date: Mon, 3 Apr 2023 09:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH=5d_MAINTAINERS=3a_Add_Eugenio_P=c3=a9rez_a?=
 =?UTF-8?Q?s_vhost-shadow-virtqueue_reviewer?=
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20230331150410.2627214-1-eperezma@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230331150410.2627214-1-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.37,
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

On 31/3/23 17:04, Eugenio Pérez wrote:
> I'd like to be notified on SVQ patches and review them.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   MAINTAINERS | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


