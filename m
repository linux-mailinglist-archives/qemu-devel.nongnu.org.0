Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2128F66DA3C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 10:46:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHiWO-0000xp-JJ; Tue, 17 Jan 2023 04:44:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHiWC-0000eq-A3
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:44:39 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHiWA-0005Yv-Kh
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:44:36 -0500
Received: by mail-wr1-x42d.google.com with SMTP id z5so28888586wrt.6
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 01:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pYGJB2iXeEftio8QcddFOmpA1rxAFyakHiuYuwA7lx8=;
 b=hzy6OuyaYz7nc+iJfmQ7CYTKFsR4s4VBWxxEAUbMJCh51AIQq5UFwyXDGPZzbnlqWl
 ycn2OB37LPFgQaD+61nRHkxpOT1ii2+zpE8Hsz4AvHXbtkk5i0UTk7XQbQcoBXDHmO8Y
 GJd3ZnL6v5hO31i6dz9u8BjY6/Eg2/v0VgJjnqfLCRzBrbt75DsCtcCXFivN7AMVpzoT
 CP54Z4ve9y0sGfCFk82/E7oqRUYqjwU8AkFQjYYNue50XAniA7IjuL21XjkZXKRDeV3i
 txuS4miaYLK039Fswd5wBRed7veuyB5ayQI5fi6k28aeK5zYAJwE1b+dRio2TPcxCtvQ
 woYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pYGJB2iXeEftio8QcddFOmpA1rxAFyakHiuYuwA7lx8=;
 b=d1duR5Qp5b6S6nZi3mgxSMRHTvIEgRTZtaQS4sAyvZ5lvxCesv9M6MGjjr9m2pdKVv
 nU0ka7Jnawmcl8YMjKMhz9F3QlW57mLw0GT0YK/IUKemQzk4Ewv0NSo+vQQU74ENzXlD
 4aF4RQIlXOu3BJRmkoPttXq7dT3MHEYnQJlH95cImTMQgMf0NAzBn9oZsDscnjy3l0Vh
 2rP9r/D15pizKUEqPEJUc52Jm9NQYmnWAlq+9Lu6DV6KotwVxGr5aPpVCjMVxNB9iGW9
 mggN96ney+Zt+Utji/7YPZFwYecscA041hVs/fBTpQieLChZBgU7stGkRb60/SChK4qB
 S0cA==
X-Gm-Message-State: AFqh2kqe2xUB/xQ2X6YTqSbAEtZow+3jSjmKWrtNFJBJr7+i+IQ/ffIM
 61UcVexBqlvCvzMIUyG/qUc=
X-Google-Smtp-Source: AMrXdXsc2RoS1UhCoNyEyQIGMXuoZ2Xd9yO8U/iHWi8ehl5om1nwf4dVQ6+8Hc609POZtWUSKXFRhw==
X-Received: by 2002:adf:f791:0:b0:29d:f817:42c1 with SMTP id
 q17-20020adff791000000b0029df81742c1mr2260186wrp.54.1673948672502; 
 Tue, 17 Jan 2023 01:44:32 -0800 (PST)
Received: from [192.168.8.108] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a05600012c400b002bbb2d43f65sm25294295wrx.14.2023.01.17.01.44.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 01:44:32 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <e4095385-9f53-c476-2a8d-39c32adc8dd6@xen.org>
Date: Tue, 17 Jan 2023 09:44:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 08/51] xen-platform: allow its creation with
 XEN_EMULATE mode
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230116215805.1123514-1-dwmw2@infradead.org>
 <20230116215805.1123514-9-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230116215805.1123514-9-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42d.google.com
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

On 16/01/2023 21:57, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> The only thing we need to handle on KVM side is to change the
> pfn from R/W to R/O.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/xen/meson.build    |  5 ++++-
>   hw/i386/xen/xen_platform.c | 39 +++++++++++++++++++++++++-------------
>   2 files changed, 30 insertions(+), 14 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


