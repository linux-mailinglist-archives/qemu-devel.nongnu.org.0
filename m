Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75AB59FD7A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 16:44:25 +0200 (CEST)
Received: from localhost ([::1]:39510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQrcG-0007HJ-Mh
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 10:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQrab-00059H-Oh
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 10:42:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQraW-0007Dn-OX
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 10:42:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661352155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sXRHr6+c8BPiNYWlT3xqfPlxwEz/NeEkSMYL+HRCHhA=;
 b=XhpSL0CkHrUEAhyXXwM7uCNqbk8670cwj9SgclNDin7QLJEXRqlJdeCV2W3fNvO0n1cpcf
 /0rooCJoHOpFHoqd8KoSkWx/jt9X2yN+bDGcW+JbSCXPHdAVXnxiT3xsHV5QQhZYTucmVd
 HQLLZzh757x0eVR01uSUL5zfXtPWMs8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-317-jeKuKXRrPxav4tAIiCnsUA-1; Wed, 24 Aug 2022 10:42:32 -0400
X-MC-Unique: jeKuKXRrPxav4tAIiCnsUA-1
Received: by mail-wr1-f71.google.com with SMTP id
 q7-20020adfab07000000b0022541376ef7so2150358wrc.23
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 07:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=sXRHr6+c8BPiNYWlT3xqfPlxwEz/NeEkSMYL+HRCHhA=;
 b=d1jFMTTGiTGf42eQBtcWGVN7PUwzWRo/7H6cQqaS3h6R8vW8rLMUsKc/n5ELknto3w
 uU+XWnBmadLy08pmoP/n7+rMeuEe2eSKw/pSwmBKzekLCUupMK+4rQJQ1HE1mKvAhao6
 pfH4w+3y8PYxS3MCwrLN/l9OlHmd4aj1rqERO57Se+Wz4D6nBIiyQxEm6NhuRvXGUjz6
 dtMGfwF+TtRiz7HjkdLLhGEFTonGTpnHv1f/L4JBEJOomjsd1MULpchd3FizBiT3Yfjz
 LBkir09vtM5NcZ142FQqBzy8zf7taNBc8w4wYW1cd15IuGlsjhAdLaZCIzGjrJWiGRT0
 C/oA==
X-Gm-Message-State: ACgBeo0Nh7IwCKNTMicSiqMWUT8nogWmJthKQdu3wIBUbtmfhAvpyeym
 7Qm08uVlMXy3edbT4J7/dvNAOCRqPSHz8y1TWuSf75ZFA58BmwX2TxQGSsMCNNPXR+m4WeuUAFp
 JlcBdTuMnKQpaZjk=
X-Received: by 2002:adf:d1c7:0:b0:225:60f5:98e8 with SMTP id
 b7-20020adfd1c7000000b0022560f598e8mr6692164wrd.118.1661352151433; 
 Wed, 24 Aug 2022 07:42:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4p2Zyd1WLYCXJJBbh8Mx1Ma9GKYAgv6eehRg5xObt/8OAKNAAxTq53pWUVIAebFjhypNL+Rw==
X-Received: by 2002:adf:d1c7:0:b0:225:60f5:98e8 with SMTP id
 b7-20020adfd1c7000000b0022560f598e8mr6692135wrd.118.1661352151155; 
 Wed, 24 Aug 2022 07:42:31 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-177.web.vodafone.de.
 [109.43.176.177]) by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c1d8700b003a5bd5ea215sm2206854wms.37.2022.08.24.07.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 07:42:30 -0700 (PDT)
Message-ID: <8c99615a-ad96-8db6-0324-259b7cdb7b69@redhat.com>
Date: Wed, 24 Aug 2022 16:42:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 02/51] tests/qtest: Use g_mkdtemp()
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, John Snow
 <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-3-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-3-bmeng.cn@gmail.com>
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

On 24/08/2022 11.39, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Windows does not provide a mkdtemp() API, but glib does.
> Replace mkdtemp() call with the glib version.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/fuzz/generic_fuzz_configs.h | 2 +-
>   tests/qtest/cdrom-test.c                | 2 +-
>   tests/qtest/cxl-test.c                  | 6 +++---
>   tests/qtest/ivshmem-test.c              | 4 ++--
>   tests/qtest/libqos/virtio-9p.c          | 4 ++--
>   tests/qtest/libqtest.c                  | 2 +-
>   tests/qtest/migration-test.c            | 4 ++--
>   tests/qtest/qmp-test.c                  | 4 ++--
>   tests/qtest/vhost-user-test.c           | 4 ++--
>   tests/unit/test-qga.c                   | 2 +-
>   10 files changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


