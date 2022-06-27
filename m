Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000C155B8CA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 10:54:51 +0200 (CEST)
Received: from localhost ([::1]:47160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kWA-0005At-RR
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 04:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1o5kTv-0002zH-RB; Mon, 27 Jun 2022 04:52:33 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1o5kTu-0005Ar-EG; Mon, 27 Jun 2022 04:52:31 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 v65-20020a1cac44000000b003a03c76fa38so4407403wme.5; 
 Mon, 27 Jun 2022 01:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:reply-to:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zD66L3mdITq6+N0oV3/QTMI5HSL0Xxy8B+3UI/gTIVM=;
 b=TUSft++HYTitNFoJnWHbmDqufQ4HfFly1XJ4egP6cXvI5z266MLmIl7Ce3bMsU2YMs
 fNcDKlR8JNXt6e+Utbq3VP1DIH+/QT5/SXiBygQRX/wJNourEWlo11KETbNEUk+fQRgG
 fuxJyCkABCAZF04NPfC/cH8urAZj9MCmXLfFobyuncMGq5Ji1wU6gnEjN8YJ2/FhOqdB
 yvWsnyuhH/tY4wPTDyResr7nm3TtptsknA092VQf5QudMjpDP9zxEEuhEy4gRz3dnWmF
 GSTXZfrmujZ38tCF7ScXpFfRoV+e1menEOotT7PheEkKOsjelG44c+Sko/TRCZn8BNTN
 CJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zD66L3mdITq6+N0oV3/QTMI5HSL0Xxy8B+3UI/gTIVM=;
 b=OspuG1fQvRuJevHZw65+WnJOP/CbthOtneuLvApZp4ctu4DPrBiQbJ+T1IAvbK8alQ
 2djSOjA9ktwyIPxoHqzUvCvwO+rHTteHpetyQLwOvc9i4SNXN20nkUaJ+JbbQ79nnrkc
 RGOBPHWtIKV6qYXB755RvvlcFP6EtOSnmcwBDUAYcgmtCRky7DN4R4k8iELO3A1w1xKM
 1VgGEnr79a7t7nFKU2L5huWL/Aare+6L92K2lCFyBkHYagans1TQuXZ42MdKa8nbDk31
 ML7MMi2TPx3LOs2oD1u4N0guBXhok0GbuY1XB/FdJE7VuItjqmNe3PaSdam4WeK5cciB
 WBIw==
X-Gm-Message-State: AJIora+wde8/baTNihif36r1+MmKBGdp1UIdt5jh65IqPb5LU2rcfZla
 9K6m6XbRCIqFiMuHViZPnN0=
X-Google-Smtp-Source: AGRyM1ue2+04Ox+iCpYrG9OKwUuld6DMVA7PofR/8yOuTsxVhCP+SVqFxzUGM+CPo+6IY4qnNykyJg==
X-Received: by 2002:a05:600c:35ce:b0:39c:7dc2:aec0 with SMTP id
 r14-20020a05600c35ce00b0039c7dc2aec0mr14143744wmq.33.1656319947966; 
 Mon, 27 Jun 2022 01:52:27 -0700 (PDT)
Received: from [10.7.237.7] (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id
 h13-20020adff4cd000000b002103aebe8absm9720868wrp.93.2022.06.27.01.52.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 01:52:27 -0700 (PDT)
Message-ID: <0044de2b-d25e-ba76-64e1-46316e786fb4@gmail.com>
Date: Mon, 27 Jun 2022 09:52:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] hw/i386/xen/xen-hvm: Allow for stubbing
 xen_set_pci_link_route()
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
 <20220626094656.15673-2-shentey@gmail.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20220626094656.15673-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x332.google.com
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
> The only user of xen_set_pci_link_route() is
> xen_piix_pci_write_config_client() which implements PIIX-specific logic in
> the xen namespace. This makes xen-hvm depend on PIIX which could be
> avoided if xen_piix_pci_write_config_client() was implemented in PIIX. In
> order to do this, xen_set_pci_link_route() needs to be stubbable which
> this patch addresses.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Paul Durrant <paul@xen.org>

