Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465B766CE0A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:53:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTfj-0007se-DO; Mon, 16 Jan 2023 12:53:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHTfg-0007sQ-V8
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:53:24 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHTff-00089G-Fr
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:53:24 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so22755597wms.2
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 09:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FprRK2Nys71yJ+NdjBjA3Ed3LxlAfzw2tN6/qZDL/Jc=;
 b=NLLQ1ySx87BBv1dU1bg6ABVHytVduH1ywDn+7u1bZprpSeKRJirq6UVAfiERfPgIYc
 WPKpkakokf9hsz75HiT/cqgi0UeAuypIxGekBdGQSXc+pQQtnBLu2n8WbAZejw6slJNE
 jUi/rwpiSTIOO8/zfSReyjEMhwP2UUTYDG5KMgcuK8TO/1x8/5hamrHm4wU+689fgZ75
 F67QCufYqeXGFYKlVhg5YDwaj9nsYQp81wO1UQmVDAPit2/6d/Fh7zCkuxm9RVJ3wKls
 gaQ6GhG059K8D1IP31g0oiiiqh+b5m7QG8FI3E7vXylufGI5xl0UtfG++xZAw5sdFiMo
 P4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FprRK2Nys71yJ+NdjBjA3Ed3LxlAfzw2tN6/qZDL/Jc=;
 b=uLNhrsxqZD1scC0SmJ9T62mScC3ghW5AZTarh6VIiVhce2V4El9AmeTvSccW4uqa0F
 26sEWCAaRtL+/NDKpoEElK36/EyTp1y56gOI5kF8D1KrLTRoJVfUtgyrRkEq/au0C+fV
 qqLZRNB1bqgIRI0ZF/aEGZhCrVrt2kTDhz1Xh9QaN5zYck5x8HD9NoQulKXQjsEVeQgc
 rv/BKSR4s2OstJykT+f4nKjcg6H0m7qigOrNUKRzpPKkEwBbBpiBA7kZrEh5Z1/Y7SGh
 idJy/jAR12zH0uC9hELR1paMYaKcuEfbyNfj4zjmG4A4oqcTFYAfihDhPXN1pIoHjkCz
 dwTg==
X-Gm-Message-State: AFqh2koaNCXP4NzZBEq51spX5zOqj7tnp41dzZXqbYsws/GEpT4A8nHY
 TfXEFInOvx6cTWUD6sZOgkw=
X-Google-Smtp-Source: AMrXdXvi+o29RUbnR1OhyAz67HGzkl3jxUcNuSKVXkYQB7963jpkEkM9A1sHLKX20xWkdPvGb1/ZyQ==
X-Received: by 2002:a05:600c:5024:b0:3db:392:ecee with SMTP id
 n36-20020a05600c502400b003db0392eceemr987069wmr.31.1673891601993; 
 Mon, 16 Jan 2023 09:53:21 -0800 (PST)
Received: from [192.168.6.176] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a05600c314e00b003d9fa355387sm22946508wmo.27.2023.01.16.09.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 09:53:21 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <4aeca63b-95e1-2dbf-68d8-26513af9571f@xen.org>
Date: Mon, 16 Jan 2023 17:53:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 21/51] i386/xen: handle VCPUOP_register_vcpu_time_info
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
 <20230110122042.1562155-22-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230110122042.1562155-22-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x334.google.com
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
> In order to support Linux vdso in Xen.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/cpu.h         |   1 +
>   target/i386/kvm/xen-emu.c | 100 +++++++++++++++++++++++++++++++++-----
>   target/i386/machine.c     |   1 +
>   3 files changed, 90 insertions(+), 12 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


