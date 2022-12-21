Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC1D65384E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 22:50:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p86wc-0003lI-3k; Wed, 21 Dec 2022 16:48:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p86wP-0003km-Bf
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 16:47:58 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p86wM-00005A-Gk
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 16:47:55 -0500
Received: by mail-ej1-x633.google.com with SMTP id kw15so631514ejc.10
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 13:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DyOSa9169n2zrZEDsVPLzpCPhafi4QZ5NGN1qzCqO9g=;
 b=OdDBpv8kXL09PEPR5TYNqqIVmRVIS5KQ2v3eA2i2ERCj5C+9YDJNCweNYX8fmzUjFx
 s7tgkDinLvQxzAKeY6eZDSRqpEFwuxYsQa7dkih7QWOk2900cea+1xRcWmmW9fwma7u8
 1VCwDlomUnINV9NjW01mTNA5Hotxy5G8TKEB6EmLof/Ys8r3vcPewIJuWAamPdDT2ADg
 wYIu6oZAQ/U+nn5n54g+KvaT76aN/ixbI36LFiGPW1auF+4YvHavRGWqG/oZ1HNm5f56
 836KrjA9jA3ifcW1lVglzR5jUt0XprY60HOt9YlqZr+O6eXWZxNiCJ0fId46/jGr8L6e
 b+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DyOSa9169n2zrZEDsVPLzpCPhafi4QZ5NGN1qzCqO9g=;
 b=NcGYigPzwPOtMP2QjEFpW2B1zs9q1wMRpbvMPn/W/ippbYnXF++xZmak1Q34bLMcU3
 AZD2eeS3FTY/xCcwa4RC2lr/r+1TRBxtfemShPWyug7J7c+B2e5r2+WjumxR1drcA5hg
 82OnGeehmfnoklhM+is2o4ugfj5hdI3hTZrWnO3xiEa6vlk68t9hz3RryJ2Mdc8p4s6Z
 rbVq9MlTsduZ4QOEjXyWDXDp+IS/6AYMThaARD5lujJKPKA19gpr8an/BuLrjXltviYi
 9pg1wC5S3Kvj6zTUcVZiXa5IRfpn8JTKSEL/o5BpK90ev/Lveg2jCj9RQ5Mayi83Hh3c
 A5BQ==
X-Gm-Message-State: AFqh2kqEKAIYaL+qb+3qyR1DK34eiO8qCOBhp+NTBXoM0EbSnc0l6jsj
 pPX0yexHCbVhVXytyQ7cxvIzyQ==
X-Google-Smtp-Source: AMrXdXuenXEBF6Kx5WdEwNyNxZ9b2uo+kt2SCfPiNhBG/FQrF10Xp1SE+x35SS9o3P/NHPjAIZdjlQ==
X-Received: by 2002:a17:907:9d19:b0:7b9:f9d8:9554 with SMTP id
 kt25-20020a1709079d1900b007b9f9d89554mr2464948ejc.40.1671659272047; 
 Wed, 21 Dec 2022 13:47:52 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ox16-20020a170907101000b007c16f120aacsm7552850ejb.121.2022.12.21.13.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 13:47:43 -0800 (PST)
Message-ID: <18f53ca6-3cd0-313c-8940-1f7d013eba87@linaro.org>
Date: Wed, 21 Dec 2022 22:47:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/5] coroutine: Clean up includes
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, kwolf@redhat.com, pbonzini@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20221221131435.3851212-1-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221131435.3851212-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 21/12/22 14:14, Markus Armbruster wrote:
> v3:
> * PATCH 4: Unnecessary hunks dropped
> 
> v2:
> * Rebased
> * PATCH 4: Rewritten [Paolo]
> * PATCH 5: New
> 
> Markus Armbruster (5):
>    coroutine: Clean up superfluous inclusion of qemu/coroutine.h
>    coroutine: Move coroutine_fn to qemu/osdep.h, trim includes
>    coroutine: Clean up superfluous inclusion of qemu/lockable.h
>    coroutine: Split qemu/coroutine-core.h off qemu/coroutine.h
>    coroutine: Use Coroutine typedef name instead of structure tag

I had to add:

-- >8 --
diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
index fb7591d6ab..b09fce9377 100644
--- a/hw/pci/pci-hmp-cmds.c
+++ b/hw/pci/pci-hmp-cmds.c
@@ -15,6 +15,7 @@

  #include "qemu/osdep.h"
  #include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
  #include "monitor/hmp.h"
  #include "monitor/monitor.h"
  #include "pci-internal.h"
diff --git a/hw/virtio/virtio-qmp.c b/hw/virtio/virtio-qmp.c
index 8e7282658f..3d4497da99 100644
--- a/hw/virtio/virtio-qmp.c
+++ b/hw/virtio/virtio-qmp.c
@@ -11,6 +11,7 @@

  #include "qemu/osdep.h"
  #include "hw/virtio/virtio.h"
+#include "hw/virtio/vhost.h"
  #include "virtio-qmp.h"

---

Otherwise I get:

../hw/pci/pci-hmp-cmds.c: In function ‘pcibus_dev_print’:
../hw/pci/pci-hmp-cmds.c:129:31: error: invalid use of incomplete 
typedef ‘PCIDevice’
   129 |     int class = pci_get_word(d->config + PCI_CLASS_DEVICE);
       |                               ^~

../hw/virtio/virtio-qmp.c:187:19: error: 
‘VHOST_USER_F_PROTOCOL_FEATURES’ undeclared here (not in a function); 
did you mean ‘VHOST_USER_PROTOCOL_F_RARP’?
   187 |     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Maybe some recently merged change?

Otherwise:
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


