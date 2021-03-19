Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A09341EC6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:51:30 +0100 (CET)
Received: from localhost ([::1]:44216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFXF-0005oA-FE
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lNFFy-0001U9-UE; Fri, 19 Mar 2021 09:33:38 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:43749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lNFFx-0007mv-0h; Fri, 19 Mar 2021 09:33:38 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so5253407wmj.2; 
 Fri, 19 Mar 2021 06:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=driZ+VMbhDV2I4D+xUm/l33bp4yklldFnn4cUejCFO8=;
 b=Pcpumnunr3aTBrX+VoaXLsQKYOFNzYBWzD0q7S+H1vH2e/O8ww/0+ObiDfgIYBUPTp
 b/kpl3Y0NdZZBjX0JejS86hRp9cKozSzazpTotF0EGevU1v1wUtEF3SgsyTgG7SyxTZh
 AFuLYLQLPs4htls4+a6A7S6oI4w195Jcrs6dz0mU/+Mq6jvQWu02Z3v57fH6KAOQdjNm
 RPdcGQcNa/zujTrVEPAGn1BZAjuAESsL0qlE/EwVtjQo7wIAGz9L/5wdlKuzqKN31Z6V
 fZiuhpkfAgygWCUqQbMsJvWque3PcPvaaedqhDFFtE4ftZ/dY0zLZqfNyDLpCiTEvyg6
 VkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=driZ+VMbhDV2I4D+xUm/l33bp4yklldFnn4cUejCFO8=;
 b=LPU0Lu/bUirA1D3g7fQK9qxt/6gGK3YS8cSK/kr5Bag5kPDzsR7YJBfdvko+Co1DDi
 3LBQ3YR7bZ/jmfJg35O2+I8EYE/JOCaHIW85A17TVbAHVg2CytNEfwHFHbM2YX0dGqYG
 /Kheow9zVsc/930Tv7dvb/mSnlLKyyMEgtI1hnmklPqLMUEUO4M7PZZ3y+mpFs43G/BP
 2x/a8ahyiqdMFji6HUIGaWQeQeKv8Rw9qnOz0eHebPTMFh+eNBc2GLiAOVaxsMhLEvC4
 1ZpIZfss0nGWWuWleDdyqNlAkg6CdMyWfDVQhBBhFeVU0n4TM58i01W/Qi2x7+Enf1Zd
 aZ9Q==
X-Gm-Message-State: AOAM533z2U0ITfSWqB3KvST0KkwoA800WRbPgbC/2FFeDJ88tCXNQ8fv
 LG1pjUpw3ZOMEqh40XUwFnM=
X-Google-Smtp-Source: ABdhPJy4GqwIu5C7eerd+UdsBdAeRbM8fwh95Q1AddzL+fhoKFqTmkpNzXEbMfvWYmWK3OW37O/y4w==
X-Received: by 2002:a1c:a791:: with SMTP id q139mr3761799wme.20.1616160814903; 
 Fri, 19 Mar 2021 06:33:34 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j123sm6420348wmb.1.2021.03.19.06.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 06:33:34 -0700 (PDT)
Subject: Re: [PATCH v2 2/6] m68k: add the virtio devices aliases
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210319132537.2046339-1-laurent@vivier.eu>
 <20210319132537.2046339-3-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <15073fa4-9de0-8e45-5a25-b4e3ad2bee4f@amsat.org>
Date: Fri, 19 Mar 2021 14:33:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210319132537.2046339-3-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/21 2:25 PM, Laurent Vivier wrote:
> Similarly to 5f629d943cb0 ("s390x: fix s390 virtio aliases"),
> define the virtio aliases.
> 
> This allows to start machines with virtio devices without
> knowledge of the implementation type.
> 
> For instance, we can use "-device virtio-scsi" on
> m68k, s390x or PC, and the device will be respectively
> "virtio-scsi-device", "virtio-scsi-ccw" or "virtio-scsi-pci".
> 
> This already exists for s390x and -ccw interfaces, add them
> for m68k and MMIO (-device) interfaces.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  include/sysemu/arch_init.h |  1 +
>  softmmu/qdev-monitor.c     | 12 ++++++++++++
>  2 files changed, 13 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

