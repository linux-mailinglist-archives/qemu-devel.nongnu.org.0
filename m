Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843A63B8F33
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 10:55:54 +0200 (CEST)
Received: from localhost ([::1]:54824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lysUD-0000NW-Kd
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 04:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lysT4-0007Ua-KM
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 04:54:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lysT1-0006AZ-Ny
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 04:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625129678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=roCpQ1ySRSP8WVJRGzFhKll5Szlxo/sKJysDV/AMUv8=;
 b=A20ExBeJUSi8ivBB/EPXnGdWFXV570Xmi54wpsNymcPlk+rm1tgN9Xgh3kHMTHzO56O8qA
 xy7D+AGZ3Dql9B7mjpozbOZhWvjU4v2ga8UUW6tiklpHxZOaIQxK14LAlx4tJOBy1LyVsv
 gwBN9/r/TZTEeyNv4lFSJUUElU8vXdc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-aVFbU1BNNlaXRHquacTekw-1; Thu, 01 Jul 2021 04:54:36 -0400
X-MC-Unique: aVFbU1BNNlaXRHquacTekw-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so1029988wmj.8
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 01:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=roCpQ1ySRSP8WVJRGzFhKll5Szlxo/sKJysDV/AMUv8=;
 b=QGynXoeu/ftlQM+jDQ2tAOcsDdO4vwdVh7t+E8/sV8GObtdQqE2wMGEnGk14bBoeK2
 zO/yIVCpOc7Y2pny6bq118sx4ol3FhdG3Ad1AxN4OYKj148POd7sYqZBXn2QiKhZ/G1O
 bNtJ7enJXEIvgkIy+OoOeL3tyZbNsK4To7UVsVncHwX56kgbNbd+NvwtOCbucxuEHdkt
 bUtghn7QLBJClNBtmb/1UDTiSXsdQvQWvn87bXCm42jS2dAfkAlGH+5Ul0b95x7fxJMU
 uPd35VUC2nJBOHfN/QqjjF2KaCPXfHLLe+w4mCh5zuHBUN7eZGqYl/bhh+1Jfa0WKi1i
 G7YA==
X-Gm-Message-State: AOAM5338hfje9dnmplm92thiRZMa72fOK8hgzPU8VI6TdGusmgLFr3rG
 LVCbGbNm6bXvDAeAJAgeNyqrYYWY22YwuWpsS8DYYONTDhqtp1cDx1MWjTfSXF3p7RWEU2HfmDb
 7MsD0wzsfYaxXsZU=
X-Received: by 2002:a1c:cc02:: with SMTP id h2mr42414796wmb.39.1625129675833; 
 Thu, 01 Jul 2021 01:54:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywPYe1lSDLA6uBRZRtghFt/eqwkEEIDoq76ZlwUJ7UBE3NrvuT0CNBRdSeIUvmw8iK0d+wog==
X-Received: by 2002:a1c:cc02:: with SMTP id h2mr42414776wmb.39.1625129675613; 
 Thu, 01 Jul 2021 01:54:35 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-35.mobile.abo.orange.fr.
 [92.184.108.35])
 by smtp.gmail.com with ESMTPSA id g15sm24157624wri.75.2021.07.01.01.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 01:54:35 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] hw/i386/pc: pc_system_ovmf_table_find: Assert that
 flash was parsed
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210701052749.934744-1-dovmurik@linux.ibm.com>
 <20210701052749.934744-2-dovmurik@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cf931732-2bae-4ed1-6c62-784f36647fa1@redhat.com>
Date: Thu, 1 Jul 2021 10:54:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701052749.934744-2-dovmurik@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/21 7:27 AM, Dov Murik wrote:
> Add assertion in pc_system_ovmf_table_find that verifies that the flash
> was indeed previously parsed (looking for the OVMF table) by
> pc_system_parse_ovmf_flash.
> 
> Now pc_system_ovmf_table_find distinguishes between "no one called
> pc_system_parse_ovmf_flash" (which will abort due to assertion failure)
> and "the flash was parsed but no OVMF table was found, or it is invalid"
> (which will return false).
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>

For obvious / checkpatch fixes you can keep the tags ;)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/i386/pc_sysfw.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)


