Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793686920E8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 15:37:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQUWF-00076g-Pw; Fri, 10 Feb 2023 09:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQUWD-00074p-SS
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:36:53 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQUWB-0001qc-Qo
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:36:53 -0500
Received: by mail-wr1-x430.google.com with SMTP id bu23so5256668wrb.8
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 06:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Sc06D5Qxmqoq5S+jJ0pwAIt0PoDhAZt2Fq0XV4y3yDA=;
 b=OrYUAFukwdCwivXi3GIcrPYHt3A7ApwBYVgFbf2FXDhi/520Pk1dJSo0VMmTPMCfMX
 tbYU+Tfki5X3phyqnSbBN5CurLNdfVRdw2QgEO0VaQi3Nh91TwxwEglnV0kCvIHes5FQ
 7bvbC0Klil09QYvaMNjigK9uY9a5WU3wOjMb2M5/pIKnJm+qtZBFnvbFer9625yi8Igl
 ZcUb0883hUq+DA71lxwlmdJsYOBdWH9Lrw142tiLBNAWtwIR85yyOCI7Dw3cFDB0Pnv2
 ZCVzmc9xE2YpAiofi3KCPDvKl7KxewTINIFuGNAncl4P9pB5/brx6KrmIXK0n77e0SfP
 YcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sc06D5Qxmqoq5S+jJ0pwAIt0PoDhAZt2Fq0XV4y3yDA=;
 b=1ApKJ/wp+YbkOromTIvhbgf7QyEJNi7DdRjgphTtQmPULq8Vunb/PAxL6VTyikgPD8
 FrQDhogYSvelmktgeIHB29rYbNzKLIvBCu7ysOtmpFSUhiA5U0unbCj3NqRFlufhCC4D
 rx/XVoSLXcF8gqRywlhjO9vqzb86XyjjOu3McpzTkVoRilHmQWiFp7z4wsbHMpzWNFF0
 F+9XnLyy4UAw34IPLkaClgIdIlvJSpl0uKXMWzvZljV/bscXtK4Zf2weMrM4EPuz5B9g
 jjwtqOIXp5RpNGNWo6AB/rgTA2y9h9IE5zg1t/T5OjIXBWbZ21P/nb8SYcftTJ7NNdOf
 oRDA==
X-Gm-Message-State: AO0yUKU8BpW7uLHWOjLBIhii52yWDK1Pb+uOn91TBxu8YaFvaa2tGB+2
 d6JTq2h2INlk+awLWRFkYsY=
X-Google-Smtp-Source: AK7set8qd2y2nUgirsA55g36horMawxDf6cm23AOfi6BT2RKU2ZEBJ6FnqNKjcobjQRF8fUb8ofXUA==
X-Received: by 2002:a5d:6842:0:b0:2c3:e76e:3115 with SMTP id
 o2-20020a5d6842000000b002c3e76e3115mr14345028wrw.45.1676039810110; 
 Fri, 10 Feb 2023 06:36:50 -0800 (PST)
Received: from [192.168.15.58] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a5d6252000000b002c3dc4131f5sm3808642wrv.18.2023.02.10.06.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 06:36:49 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <f6e4b64b-ed61-1417-bba3-80f540c5f406@xen.org>
Date: Fri, 10 Feb 2023 14:36:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 37/59] hw/xen: Implement EVTCHNOP_bind_vcpu
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
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
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-38-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-38-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 01/02/2023 14:31, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c  | 40 +++++++++++++++++++++++++++++++++++++++
>   hw/i386/kvm/xen_evtchn.h  |  2 ++
>   target/i386/kvm/xen-emu.c | 12 ++++++++++++
>   3 files changed, 54 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


