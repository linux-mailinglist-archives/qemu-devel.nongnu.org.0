Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBE16E47DC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 14:35:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poO3X-0001GJ-Rn; Mon, 17 Apr 2023 08:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1poO3W-0001FM-9u
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:34:02 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1poO3E-0006hI-Lg
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:34:02 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 m39-20020a05600c3b2700b003f170e75bd3so1338752wms.1
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 05:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681734820; x=1684326820;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jwFF4OlAc8WhFMJkqHAMU3vekqaWmw/4QM0BxFjkB48=;
 b=YYiMHYka6VsDJYi2gscWqaahkAinjOFRm6DbLxe3JVigfbf7X8xyh196bUhxXbwGIA
 fbFosGudK5afJc3wrMrjhajrsnrRLbLK2pjN/r3cD0Ij+J8qQsmsVlAkcleKr72sMjGf
 vG/ofoI/fa128DN8xM4UZXfHugGHV3TLODbSj8oO5ArJpWf9mZcmvFc/NPZzxPmklgtr
 MmVsREIV3J4iU1jzKbFE/PjWoiOpE3qfrdcrf/BdwDVsEJ9Blm+iRI9J+jja3VJ6O104
 gMB+5mrzDPo6ZXmKOn+5BKTgDL4/cNnBbYw7xMcL4ZsPdMSknPudzQNuRW+ah/X8n4aa
 AfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681734820; x=1684326820;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jwFF4OlAc8WhFMJkqHAMU3vekqaWmw/4QM0BxFjkB48=;
 b=aa3eWF1Q2Fbe5pJPRgJ1DaRf5LcW3bPryFITgr/AkYq9U0HHVEk1+VXIeVbxk/KCyH
 Ia2y/wRMLPkSTrltMLCPWdreCX6WekVwWEEVUI2R0y/d0Ew+vrKc7S5rcGkl7iCCim2/
 TpPwTCvFO9G88KyBLWPOQ4s/qrjvVDWjb7U6F3HpMU6Li251cMuTuHjIHVZxxyJ2lF2h
 6pgKKZXi3eukJpZPBjPX5rKdFMh3Z7UGAcbkNUmbnWODieoxfjaz55/d5s5OfARn5sFp
 igkufvBZLrrCKGtdZSdAwYz3aJ41pPLcx0CXzrL1RIMd+oSXKaFvwLu9WflNmq+BrkUo
 f2AA==
X-Gm-Message-State: AAQBX9cMatBfhOmVGR1mR51ojGFJxALESPQCoyBHRnTh0DIjPvLWVxsr
 QCFtxSXoXqpQuEAtkpNp7SI=
X-Google-Smtp-Source: AKy350aN1LXr0qrwFoe7EoDFDDVNhV2/qcHWtPrIt1pJ+Qk+uDEMi1hR+uzq10YOMcZsvTQTe0DXYg==
X-Received: by 2002:a05:600c:2051:b0:3f1:6ec5:bc6e with SMTP id
 p17-20020a05600c205100b003f16ec5bc6emr5634089wmg.3.1681734820491; 
 Mon, 17 Apr 2023 05:33:40 -0700 (PDT)
Received: from [192.168.0.165] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a1c7406000000b003ed2c0a0f37sm11811485wmc.35.2023.04.17.05.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 05:33:40 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <0b67440a-9c65-6606-5e24-6fb01e8543a3@xen.org>
Date: Mon, 17 Apr 2023 13:33:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/5] hw/xen: Fix double-free in xen_console
 store_con_info()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: no Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, xen-devel@lists.xenproject.org
References: <20230412185102.441523-1-dwmw2@infradead.org>
 <20230412185102.441523-5-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230412185102.441523-5-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 12/04/2023 19:51, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Coverity spotted a double-free (CID 1508254); we g_string_free(path) and
> then for some reason immediately call free(path) too.
> 
> We should just use g_autoptr() for it anyway, which simplifies the code
> a bit.
> 
> Fixes: 7a8a749da7d3 ("hw/xen: Move xenstore_store_pv_console_info to xen_console.c")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/char/xen_console.c | 13 +++----------
>   1 file changed, 3 insertions(+), 10 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


