Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 871B01D347C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 17:08:05 +0200 (CEST)
Received: from localhost ([::1]:54712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZFSu-0005RR-Ga
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 11:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZFOe-0007Vg-IW
 for qemu-devel@nongnu.org; Thu, 14 May 2020 11:03:40 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34673
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZFOd-0007SK-HW
 for qemu-devel@nongnu.org; Thu, 14 May 2020 11:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589468618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ib1jZqcZTKUreBUO4yjOAVNa95yQ87ye9PVw4urA0FA=;
 b=I/Jx1X6oumEqgq6U+aIUF1fiqMD0UL1ggqEcD8bU8lL/Isge1vZ5WsZNqchM4hU1IbCHA0
 HZ8rIjiWJvyrDnw/5h6ga8zZTT9tsesgDvAGFxlzK7KqxOWPQapT4HVZk56YoeMr7E9DZA
 V9/URkxR4YKUYoPFeuS74/eGzAluWL0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-mgvaOxvAMoSKg1gs-MzahQ-1; Thu, 14 May 2020 11:03:34 -0400
X-MC-Unique: mgvaOxvAMoSKg1gs-MzahQ-1
Received: by mail-wr1-f72.google.com with SMTP id z8so1702938wrp.7
 for <qemu-devel@nongnu.org>; Thu, 14 May 2020 08:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ib1jZqcZTKUreBUO4yjOAVNa95yQ87ye9PVw4urA0FA=;
 b=KHW2Wjaa14zedhFrEhRMH5baefjAk+SDgH5BRFRVuPQ66B8C+0tjRJJMKz5KpvCMMu
 H1Uh0Sa/olM2aSVSOXh3PzAHOWo8jxrumqHHjL7vdjeQn01ukhgAwU70U4wtvmoEnIlj
 fij2k4+HvJj8TlJhzPP07iVYviO/EZUEhnIRixamlp9RdjZRSLotE14P/8UE980eFJS4
 HwLgj9YAU/5CyVw4mCCgEW3VZqLwx2sOZ/dSO6U/RrPTENuEsrfxgdcdrTs+a5RRMnnV
 DTEkjiqNq8+JAV4NV53giodrbTAyJ8dI7TDRnuwyfqmWYvjMXokC5TABycnVsy3C/8Ji
 i0cA==
X-Gm-Message-State: AOAM532Ja94PbMRrZxySakgwfdbTq/sHOtSlIgx2yw3l3z6ixXavd1ug
 o/GTIypQVkcnqYypybJj48L+J9Wu+qMxvybHMv/AOIQz50Td7eiN+7rJ6tRDTK/890p3jpg+KgA
 vVB6RilwTk3FgquE=
X-Received: by 2002:adf:edc1:: with SMTP id v1mr5797861wro.125.1589468613040; 
 Thu, 14 May 2020 08:03:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy00maDHf8cimdjR1C6Ru3uS76/XtbEmi+B3N6unTmAYGQSGYsrxBWu6p6p/Azz1712ap1o5Q==
X-Received: by 2002:adf:edc1:: with SMTP id v1mr5797835wro.125.1589468612770; 
 Thu, 14 May 2020 08:03:32 -0700 (PDT)
Received: from [192.168.1.39] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id w15sm4288516wrl.73.2020.05.14.08.03.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 08:03:31 -0700 (PDT)
Subject: Re: [PATCH 0/2] block/block-copy: Fix uninitialized variable in
 block_copy_task_entry
To: qemu-devel@nongnu.org
References: <20200507121129.29760-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6073e714-cf37-8f8b-364e-8392ceedc327@redhat.com>
Date: Thu, 14 May 2020 17:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200507121129.29760-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 22:25:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/20 2:11 PM, Philippe Mathieu-Daudé wrote:
> block_copy_task_entry() might be written differently to avoid
> the initialization. This silents the warning and let me build.
> 
> Philippe Mathieu-Daudé (2):
>    block/block-copy: Fix uninitialized variable in block_copy_task_entry
>    block/block-copy: Simplify block_copy_do_copy()
> 
>   block/block-copy.c | 14 ++++----------
>   1 file changed, 4 insertions(+), 10 deletions(-)
> 

ping?


