Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025EB3476E5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 12:15:46 +0100 (CET)
Received: from localhost ([::1]:46530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP1UG-0001IK-1U
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 07:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP1SP-0000T6-O1
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 07:13:50 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP1SO-0000lK-2l
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 07:13:49 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so947677wml.2
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 04:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=WHbZ8rx+eN1/Yn+rDUmm40mtdiRkKht/6defbVJwSzI=;
 b=usIHAtHoM30HrDehds1OhIxzRvhUoRNUNF/9M1mvyJdC1NqfvqV6SzGX4qCUii2/v3
 1xIUmJkDochBn+ix8/OhY8IqtqIxwBuBHT4WWC486akcro+0uVpjRkO2V/XDpf3JEWKE
 VnrB/L0Dx/VtIUVMWc613UrytvB51fMh2qV98XZ/XFKjoJBmzMOzsuqo8lRp4GoyLnA5
 1si8Ss4l1qGUlj0jv3lJO98KYfBP13kZv2PQpHZSAwVQUHX2SznXYw4t5qO25D5YU0ht
 fZnGWrICf2fmg1bkepIZ/LmAyqe9NnSC6xFlH2uLmXWOb6Jb/eOfoYZPPlKQEuAm3Io9
 Ay7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:from:subject:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=WHbZ8rx+eN1/Yn+rDUmm40mtdiRkKht/6defbVJwSzI=;
 b=jL64Dz1g9e36W1I/meLRfMSHwhVbxzz8WyajOTqq8FDJsWloMNyomJ2LwaQat+dWoz
 aeycv6+/dJHo1zQox3y1s2tLemopon0ZEMBWzoa0QsLi5MPhUQxKuzBqyv/reM6b+VTz
 /A0Pj6dU3hln2fMX1T978x6KdEh37Ixg4uVltoxDgChRlTuzjX2x0e+G3yJN4/wuqfQP
 BkTIm1PRrj6VwVrSxN8dD82m1zG0tLXBJaCxCp15g80kzuYDUClcPcHLyqmWHjZo1HGh
 Yc4Zk9fEVG0x3L6eGoIym0au74HLSdOuE/LCfBLg4jY44qRAnxtcyDFzOzDqLCYbjkpj
 iwlQ==
X-Gm-Message-State: AOAM5338LBh3sz2q3idGU8eAfH5TMqdUxkWsli4icEodOTGi6MTyc9rg
 CFhTF70cRdn1yxxgUD29Jcw=
X-Google-Smtp-Source: ABdhPJxWIjgYriErwDI3aFl6CI6QCwdr3ci0wKNwVHgaWAzUIPXjVowUkGSy3IgIHZyVJOVg1/UcGw==
X-Received: by 2002:a7b:c931:: with SMTP id h17mr2428937wml.4.1616584425372;
 Wed, 24 Mar 2021 04:13:45 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id w11sm2648881wrv.88.2021.03.24.04.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 04:13:44 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Subject: qdev: Regarding lazy ISA bridge creation
Message-ID: <f56a86b6-784e-15dc-fd8b-68c91102378c@amsat.org>
Date: Wed, 24 Mar 2021 12:13:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cédric,

I'm trying to understand the comment you added in commit
3495b6b6101 ("ppc/pnv: add a ISA bus"):

 /* let isa_bus_new() create its own bridge on SysBus otherwise
  * devices specified on the command line won't find the bus and
  * will fail to create.
  */
 isa_bus = isa_bus_new(NULL, &lpc->isa_mem, &lpc->isa_io, &local_err);

Do you have an example so I can reproduce?

Thanks,

Phil.

