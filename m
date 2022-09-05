Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB085AD3E0
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 15:28:23 +0200 (CEST)
Received: from localhost ([::1]:54356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVC9G-0003v5-Ke
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 09:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oVBtr-0002Zl-82
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 09:12:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oVBtl-0004TW-9u
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 09:12:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662383537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BlBuzzveU79Y9/VceTdF+jgNgyBM5wU4o1EXPE165Ss=;
 b=SuQIcIy3zqIi4USF1Gbn+hi52kELCl7xKlNAF+3waLy7fuLEcazJP1N1Y1q0bn5ie1qcXC
 UYT1RDizFaGEh9cCVxsFPT8BVVyI5zmYgw82YGgjCDH9QW4/oRZaaQEF1EguncQrWbCJNC
 DVrxPoZDwyUTRdlzxg8APcNsBlRPRyI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-OXUCqxFMOmeCqDgTUaO15A-1; Mon, 05 Sep 2022 09:12:16 -0400
X-MC-Unique: OXUCqxFMOmeCqDgTUaO15A-1
Received: by mail-wm1-f72.google.com with SMTP id
 x16-20020a1c7c10000000b003a5cefa5578so1701623wmc.7
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 06:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=BlBuzzveU79Y9/VceTdF+jgNgyBM5wU4o1EXPE165Ss=;
 b=qIiGKNmQZNUde7HC5PfINMFuISYDMZwRZ7r7iXMZZjpJuN1VkZXBZW2XC8fRaetK8I
 CQk6ZD4CndQn8vcb8Qc5QDOH39ydNqKBiBDLoqtRdhwexDZnx5i5bmp/HjaYuB5Bp+4P
 oQDH4/NhvQlaRhYBq6cMCjMrQEcnD4PmyIKGYOJjyVEvnh3Qv/m5lInpeYDdWbwVvASe
 O6qXIiWhunq3AYEkKcgZ6/8kedEWrn+FbAkhsAdu2iBdzoVgyS/PAQjaCI2PehAL7ToH
 a9YN/haGTlbu/Y2p8xuW14S/E78M00LwyYw8EpRuCbScj2YGEkHvJ7wOD78Zqu8OMOQb
 O4fA==
X-Gm-Message-State: ACgBeo2R0S42e5oYXreat7zOsIfDYTuf+iByyE5xkkQ2x4jKhJIY4iDV
 bVvKJA6IPd7B3ppVlcCyH37MIyVQ0KFXrEO9YYy2DbzXDCqjxpLZ172bnJlBNBaGfWpS78gxqQD
 8d64pUs9EpnmMTqg=
X-Received: by 2002:a05:6000:690:b0:228:6358:aa7f with SMTP id
 bo16-20020a056000069000b002286358aa7fmr4618154wrb.75.1662383535479; 
 Mon, 05 Sep 2022 06:12:15 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4KXLbyaEI982du6/gm+yQSMdKoJJ1S4JLfjWJ8fgSEDNDDwX4aZ1Sy4pAR/iqwMjNTxRP55Q==
X-Received: by 2002:a05:6000:690:b0:228:6358:aa7f with SMTP id
 bo16-20020a056000069000b002286358aa7fmr4618136wrb.75.1662383535175; 
 Mon, 05 Sep 2022 06:12:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:ba00:c951:31d7:b2b0:8ba0?
 (p200300d82f0dba00c95131d7b2b08ba0.dip0.t-ipconnect.de.
 [2003:d8:2f0d:ba00:c951:31d7:b2b0:8ba0])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c310b00b003a5ea1cc63csm17909301wmo.39.2022.09.05.06.12.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 06:12:14 -0700 (PDT)
Message-ID: <666f71bb-ee33-0119-57ed-ff3bbe283442@redhat.com>
Date: Mon, 5 Sep 2022 15:12:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 1/2] dump: simplify a bit kdump get_next_page()
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qiaonuohan@cn.fujitsu.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20220905125741.95516-1-marcandre.lureau@redhat.com>
 <20220905125741.95516-2-marcandre.lureau@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220905125741.95516-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.09.22 14:57, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This should be functionally equivalent, but slightly easier to read,
> with simplified paths and checks at the end of the function.
> 
> The following patch is a major rewrite to get rid of the assert().
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---

Thanks!

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


