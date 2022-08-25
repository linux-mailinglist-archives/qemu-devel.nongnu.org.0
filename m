Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9755A1018
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 14:13:26 +0200 (CEST)
Received: from localhost ([::1]:40376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRBjg-0003o6-ED
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 08:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRBcv-0006r9-OO
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:06:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRBcs-0002dN-I6
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:06:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661429179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JsONsv5Ual5KyxmeXIOyaq0XH/+R0lxjFiUy1yukfwc=;
 b=BySm9Grtl5/No+mAUNBs/rtx8AUYBcrjL8I2YcSqlf1zAKqkB3q7mQrXdVeKL0EtmWXbv0
 GGxkm9KuA/HHkWYH3d6RW+76aIe6QPwJKX31k07qz3rC/964XFFjoyzIpQgrs6nMnBjBBI
 rdlBheFEC1xzcpAabS4FJJmqUmUW8oo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-513-L_8BNLbVP2eWATNGSIi7pw-1; Thu, 25 Aug 2022 08:06:18 -0400
X-MC-Unique: L_8BNLbVP2eWATNGSIi7pw-1
Received: by mail-wr1-f69.google.com with SMTP id
 d11-20020adfc08b000000b002207555c1f6so3292030wrf.7
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 05:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=JsONsv5Ual5KyxmeXIOyaq0XH/+R0lxjFiUy1yukfwc=;
 b=kDZ6pCOGfT/SIF4QYUBrjv68tU80xw3cihepmBKcNN4cTx4YmQsf9o7WOR03UbpTHg
 ZnloCXTaoYAWcNn4F3IEN7vNUtKAG6jk03rlI2nW9D+2LO0jeMhXS2h3l25xye7a0Aqu
 tA7e3sEcaI9s7HQW6qTqCMHzHc2LaxLlrIbxPIAEGvQdWAPG7XbnsmXlxLM/BltTSA4M
 6Oj1NfBSvKs5GCW41hX9QaDSgT7JdqBoIB7tujqi94DOXsYFU0bzXOMQVanyjA5SnTSN
 nZg7Y8MT0UqzFj+n8cD6OYuOFXXh/F+zoZBi5ZvZ0E0vPLnpSdythIRuq0l14BnbEEpO
 FS/A==
X-Gm-Message-State: ACgBeo2ShfSAgFDVcPlX6Mk02w1BWSXNG8N+ydSzl6KY2cSY9RFzjPgq
 D3OvRB+FfYmaAO45jUB2deug4W//W5pDSH6GkAIy7cC4Y6kBPu34paEI6f3Nb8XIJ6ay1lmb+6L
 kphMacNfwGSb0M9g=
X-Received: by 2002:a5d:4283:0:b0:225:2231:3fd0 with SMTP id
 k3-20020a5d4283000000b0022522313fd0mr2158854wrq.382.1661429176984; 
 Thu, 25 Aug 2022 05:06:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6V88Lh3hHtQqr0KhI1XjDJPdCPui/D0/o4KqU+/nfaC8V7OgrJMRRyUnM/hx+6VjMF1HEsiA==
X-Received: by 2002:a5d:4283:0:b0:225:2231:3fd0 with SMTP id
 k3-20020a5d4283000000b0022522313fd0mr2158828wrq.382.1661429176672; 
 Thu, 25 Aug 2022 05:06:16 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 bo20-20020a056000069400b0022585f6679dsm658324wrb.106.2022.08.25.05.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 05:06:16 -0700 (PDT)
Message-ID: <b4085443-80a7-e660-ebd8-badc031281fc@redhat.com>
Date: Thu, 25 Aug 2022 14:06:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 32/51] tests/qtest: Fix ERROR_SHARING_VIOLATION for win32
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-33-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-33-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/08/2022 11.40, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> On Windows, the MinGW provided mkstemp() API opens the file with
> exclusive access, denying other processes to read/write the file.
> Such behavior prevents the QEMU executable from opening the file,
> (e.g.: CreateFile returns ERROR_SHARING_VIOLATION).
> 
> This can be fixed by closing the file and reopening it.

Would it work to use the glib functions instead (like g_file_open_tmp() ?)

  Thomas



