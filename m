Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909AC66CDCB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:40:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTTE-0006Eu-LU; Mon, 16 Jan 2023 12:40:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHTTD-0006El-Hp
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:40:31 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHTTA-0005w1-JN
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:40:31 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso674894wmq.5
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 09:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6oKN8OwnuH0a5SA5Z/X8QHh1oNoVksuVqgQrlTvJKlI=;
 b=ZFIGK2/woZ1+zB/F/HJt+gYwrpwefAppXSWvUKyFA7QIiHYmiZqGCvR7fRd0lQ93lC
 6W5/8cKdAaFWJxmk3mqGmzU5HMt3ewzf8wZdFs8Wmi4l5dUMCPBbaUOJNjfzICZdoJPK
 oQUcskNu9JfGV4UIh/RJTPFjCOMBaWutArcVslPUndtbe+2Kcv4p2d4kKAoiem6w5Yza
 iY4duVaogNJPxXbI9qF44EO1nbxxrVO0YKqiBFYgtl+f0Y+fMKLCRnyy/WOv8HNWDXUx
 FzJabtYyEHYqBXHuMFq7NH7GhQyWEsA+7q7jp1Oa6Al2TrRBFDAMMC6M0xzs4tj1X2ov
 X7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6oKN8OwnuH0a5SA5Z/X8QHh1oNoVksuVqgQrlTvJKlI=;
 b=ltTqjH1lm5+odA0140BWsDnkKhP0T2tdIs6D6tH+wt0gYGp4mS9viHfXi23zjueQn0
 bHUkwXVX7mjcfzDUdMmqZleWaaWb06UVhGXP2LzvhJIfUAmZdfqBXx1J5ZgNdBMHrKfx
 l0FJqipo6Q4f7wGeFoMeA4P1SShHI6cRkFuu/hWkMXZRB0S/+u8kJtJtxlmSWJ7szVcT
 /QOcmfhiE9NkOzHDjuVFYGTOLR4coI3Dj6U6TgAGp7w3nrz4NX9CxFhjnZKw+J3zvgRO
 xAha+BqtEdvzxkrTt9YOUByPGztGH0VWyxnXY9YCf6HO+aP2WA848B7C4XyxEiu/SnAl
 6tuA==
X-Gm-Message-State: AFqh2kob1q61j23Sr0PTLT1M2JDbuYacr4BfpKl95iPLTAk/enpFUPb7
 nI9oJvfdtT0++EJQtSzwCtE=
X-Google-Smtp-Source: AMrXdXuvU9S4leD20vs21gJ3DVfC8qKhRq4oyx0C4eXGK+fsg/9Mo55O1MbsPKwSj4xDJNsEgiNnLw==
X-Received: by 2002:a05:600c:ad0:b0:3d9:ebab:ccff with SMTP id
 c16-20020a05600c0ad000b003d9ebabccffmr8906316wmr.33.1673890827106; 
 Mon, 16 Jan 2023 09:40:27 -0800 (PST)
Received: from [192.168.6.176] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b003d99469ece1sm41734547wmo.24.2023.01.16.09.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 09:40:26 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <4eae6bd2-cba6-192f-6f36-2bb3fb1c29d6@xen.org>
Date: Mon, 16 Jan 2023 17:40:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 19/51] i386/xen: implement HYPERVISOR_vcpu_op
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110122042.1562155-20-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230110122042.1562155-20-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/01/2023 12:20, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> This is simply when guest tries to register a vcpu_info
> and since vcpu_info placement is optional in the minimum ABI
> therefore we can just fail with -ENOSYS
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/kvm/xen-emu.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


