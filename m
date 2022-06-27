Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DF355B8D5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 11:01:36 +0200 (CEST)
Received: from localhost ([::1]:56186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kch-0003AS-9S
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 05:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1o5kUL-0003s5-K3; Mon, 27 Jun 2022 04:52:58 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1o5kUK-0005EO-7K; Mon, 27 Jun 2022 04:52:57 -0400
Received: by mail-wr1-x42e.google.com with SMTP id w17so11984284wrg.7;
 Mon, 27 Jun 2022 01:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:reply-to:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YxRvcSf7ptmHEAYJ6Lp/sYOIY/HDDd80u0zELz0O8Rg=;
 b=EVJcXnYxGeVieQhSeOobV7k1U5qEBLh66Tb+4iTzlm7+StkuQ+u3asnIz4U8fiBzTf
 0umbG5MBglrtNKmXjJP97eeuVS/uOVu1ksrs5Cs6uSw3dhB9pUmvQEH3qxEYzOIaNJo5
 fgXXHRZfwU6u3uFTMuvfU6w4mi5IU2cOLcCvSosPuveAEqnoVO6Nld+kYMUXbSuaD9/+
 Q9oSXSH6u8lte9NUpeMucqprHFlnngCCUIQzJY2+aE5oq6kglUm2DxJH8CrwEs7WlqMG
 18hLEMdEfg3z7+vHQqtvJlHsdJ1qcDG0MkqAt+kwDI0LRKkH5quMmB/jEwoDTt7h7uhv
 UQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YxRvcSf7ptmHEAYJ6Lp/sYOIY/HDDd80u0zELz0O8Rg=;
 b=hR8opll8KlZihDQCaDVYPmXH89VQDSKhFShPr32dvWkqiXyg+TjHgCWoJtm6LBBiya
 JNoql874JnCssBmQxZCHowi34YaIz1aijqTO3U237DvJ8Zs9cr+MKav0txqsB01WL51Y
 so07xC9wA70GF8vnXp0S7Nj2SQKtkorDk/3TFWs+NtZVqtW3BFUc9qkt0Mk4TpxDERKx
 tJmHie+Y/AztP/W5/DJmrKggiKoSdqsYCb6vl+KZJ25fDuWDwmNEsghTy8Qt+bqMu9y8
 E3ZOu5bEe/T4BTmeojbJQ2rM49K8RTw7xck8kad2/NG3S0TG7mxbMJBiDkWvrgGw2iuU
 La9w==
X-Gm-Message-State: AJIora+RT2nOxCuIWCHHeGus5MmPALL2hUVQQ4l/tl27oHiyi7w2gGMC
 RbFJyXE3W70o6FENQGLAA3Y=
X-Google-Smtp-Source: AGRyM1sakRCV4QFb6DvtU4gnXvhnzZNuVTvM9I0nKjKAn0cOFnvi2cXEqpaAGuHVniGGE9URjY6kog==
X-Received: by 2002:a5d:4589:0:b0:21b:8568:f38e with SMTP id
 p9-20020a5d4589000000b0021b8568f38emr11039593wrq.165.1656319974592; 
 Mon, 27 Jun 2022 01:52:54 -0700 (PDT)
Received: from [10.7.237.7] (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a5d4bc1000000b00219e77e489fsm9633148wrt.17.2022.06.27.01.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 01:52:54 -0700 (PDT)
Message-ID: <c4dae18f-5337-ef74-ea9d-0d6f20c9b919@gmail.com>
Date: Mon, 27 Jun 2022 09:52:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] hw/i386/xen/xen-hvm: Inline
 xen_piix_pci_write_config_client() and remove it
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
References: <20220626094656.15673-1-shentey@gmail.com>
 <20220626094656.15673-3-shentey@gmail.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20220626094656.15673-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/06/2022 10:46, Bernhard Beschow wrote:
> xen_piix_pci_write_config_client() is implemented in the xen sub tree and
> uses PIIX constants internally, thus creating a direct dependency on
> PIIX. Now that xen_set_pci_link_route() is stubbable, the logic of
> xen_piix_pci_write_config_client() can be moved to PIIX which resolves
> the dependency.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Paul Durrant <paul@xen.org>

