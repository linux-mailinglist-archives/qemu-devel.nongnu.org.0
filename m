Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5125B4B243A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 12:24:12 +0100 (CET)
Received: from localhost ([::1]:42812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIU27-0007lB-EN
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 06:24:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nITxQ-0000ev-VN
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:19:25 -0500
Received: from [2607:f8b0:4864:20::632] (port=46804
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nITxP-0001IP-1Z
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:19:20 -0500
Received: by mail-pl1-x632.google.com with SMTP id u12so4396742plf.13
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 03:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=aW1CzZLQSL856yTTb5rMCEv0Q4Z9HzR24X8S9mi2KL0=;
 b=6kbHIkt8Cj0GkMd5086F5Gu+ILl7r9polNccEw7yZjkMhXq0U5vEsO8iXfzs4w05W5
 UNC5WABj/F8Y26zuutd0Ze/oR4cgh/UnkIMb7YrQCBFXZKagxfQMiz66b6lQbChRf7GE
 upysGIcctcxa8ToZq7utox/TlgkmQAEt1HzYmcMy65nypd/0FquT6MyAdUhAu8McG/RK
 iwj1b7o/Rp4uMNYEk7blzNZq9GnPp78vLQxfTadSed6+J9L6w14Prnl8eyrvDy6PTpH3
 X8Qx2LqrFJ0SbNOT7Hmyx7us1Xqc86e39uzlbevDz9UUS+7c6vLUyhnYnWWESp/YKwHf
 MPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=aW1CzZLQSL856yTTb5rMCEv0Q4Z9HzR24X8S9mi2KL0=;
 b=lv40+MdQEyw8kJzh3FuuMMclJYQ+9i6fLY5aMcyxGofBY2zOFJ2jvKmPVD11XWJJWS
 Q7e+6D1p7UAhz7YG9DCmIElFCu9vDu6qLA3LmwE2LVfGPoB0IxIEHJf1Db2LzlvVTNoa
 wfD6w51LkNpuAIVx/oEldDX5dH2h1ZdyGNajJPM7nhFqjRAg0yediZjC3PCbOnQbynmR
 Lfmr1XahtM1t+VpzybK3uuBhNW5eG349mZ0FqbVkGOUlQhQV/0Go+oCBhP+8JcQ6IgxN
 ovvvuxXm9gJWgy2hIP0L5agRImpqTt4oAOsj/Iit1ZgCl2cnkDZ7PQ+nsXVIxwQMjVmO
 rtdg==
X-Gm-Message-State: AOAM531VN7n6o/3UZF0eR4nzeGp9ZNOnliLbWqhKaTgvteHABb3AAUuQ
 zovkb4kavNamTSv3pHxKie0HlQ==
X-Google-Smtp-Source: ABdhPJy/zgBtar249n4FVo9PRG6Vq2LYvIMkbRBXROZAnd9+cph1ZIwq26Nvsdo6KKi9DPUHu1QV3g==
X-Received: by 2002:a17:90b:4f85:: with SMTP id
 qe5mr2119804pjb.142.1644578357156; 
 Fri, 11 Feb 2022 03:19:17 -0800 (PST)
Received: from anisinha-lenovo ([115.96.197.200])
 by smtp.googlemail.com with ESMTPSA id u37sm19559758pga.2.2022.02.11.03.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 03:19:16 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Fri, 11 Feb 2022 16:49:12 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] hw/i386/pc: when adding reserved E820 entries do not
 allocate dynamic entries
In-Reply-To: <aaaf4fe9-525f-c54b-a7c7-3c7195dff37a@amsat.org>
Message-ID: <alpine.DEB.2.22.394.2202111644300.2941252@anisinha-lenovo>
References: <20220210132822.2969324-1-ani@anisinha.ca>
 <aaaf4fe9-525f-c54b-a7c7-3c7195dff37a@amsat.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="2088271309-1294814942-1644578358=:2941252"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x632.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 kraxel@redhat.com, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--2088271309-1294814942-1644578358=:2941252
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Thu, 10 Feb 2022, Philippe Mathieu-Daudé wrote:

> On 10/2/22 14:28, Ani Sinha wrote:
> > When adding E820_RESERVED entries we also accidentally allocate dynamic
> > entries. This is incorrect. We should simply return early with the count of
> > the number of reserved entries added.
> >
> > fixes: 7d67110f2d9a6("pc: add etc/e820 fw_cfg file")
>
> 8 years old, so this path is clearly untested (unused...?).
>

untested, yes. unused? nope!

$ git grep e820_add_entry  2>/dev/null | grep E820_RESERVED
hw/i386/pc.c:        e820_add_entry(pcms->sgx_epc.base,
pcms->sgx_epc.size, E820_RESERVED);
target/i386/kvm/kvm.c:    ret = e820_add_entry(identity_base, 0x4000,
E820_RESERVED);

particulatly the kvm code path.
--2088271309-1294814942-1644578358=:2941252--

