Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9124B677C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:24:14 +0100 (CET)
Received: from localhost ([::1]:51210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJu4D-0007NU-3H
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:24:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nJu13-0004wa-OJ
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:20:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nJu11-0006Wm-4l
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:20:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644916853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eBGcXeUGGE+W3tchOOnZSlS+Sj5JpsGcrf3L/Wiz6L8=;
 b=Y4qjyQ42zQBegJVjak/Hq+Wyz6NVjfA+iZzYm1OhoF8PHYR/OPaAsuhqGdFLFVZlkxWGSb
 4JgrADt6/Ml2JLexktm1Mk27KBkxKXIoZ0AcYGDSbmclb7qEw0hlU3XiYWuY8PhwElTAl2
 TOYqA6rUYE/SUYlpoGrB6thResOjWvM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-BXMQ4q2_MFC7Gufo2UnRdw-1; Tue, 15 Feb 2022 04:20:52 -0500
X-MC-Unique: BXMQ4q2_MFC7Gufo2UnRdw-1
Received: by mail-qt1-f197.google.com with SMTP id
 l15-20020ac84ccf000000b002cf9424cfa5so14489824qtv.7
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:20:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eBGcXeUGGE+W3tchOOnZSlS+Sj5JpsGcrf3L/Wiz6L8=;
 b=S5pcNqdK7zPIJgCcw7xARGmOjRnnXXivuFK+4jEx5wZJnTH19gBokyAUxwww9oj0rr
 uxTEnnWEXE0Ax8/w1ZzGsbn8VpogRc0OmA7EEBwkhgm09RoDxopxGv9xIk0bqdE+7T4U
 gj9CSaQebdiGje6UGuMfB0Yz1K0/1IqqcrK7jeyduK91OFRzkgh/OwEPFDufRJxLOKdt
 ULGzdzIXwQE++uGHM6HzukPqtXeSrBHnoJ0WFFkazlyGsVjuhZ0Six2wNihahWRzaMkR
 Qlnjn8/wv+H7hTEwCY0vlbMNK7KYk3f5PxwcER70qDAiJT9pjjgkoInJ0omaAfd8lo69
 eHYQ==
X-Gm-Message-State: AOAM530RGYGlUTcsqnwPt9z7q1MfKjjylLBgqyMEGv+/poIukrvSdV58
 jgfvjw1QB+mY8ImYzWFAfbnRnxQuUI76VoCPFQOpqmtALhiARMKy6o4BVqqF4MmkpdVdXeOM3Me
 PUc0pHlJaWSzGjfi3Cx1VjXoYFJYPCJz/zNVsT7QgurWRKE6rPQ9INeWLPGV/MUcMGw==
X-Received: by 2002:ac8:588a:: with SMTP id t10mr1989053qta.540.1644916851749; 
 Tue, 15 Feb 2022 01:20:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPWE48VKjqoSc9tnfpfSQHiEWrpBkhFZOGB+2lGk54kKxKqYIPIhiuzIstx4F1MP2I8hsvMA==
X-Received: by 2002:ac8:588a:: with SMTP id t10mr1989046qta.540.1644916851502; 
 Tue, 15 Feb 2022 01:20:51 -0800 (PST)
Received: from [192.168.100.42] ([82.142.13.146])
 by smtp.gmail.com with ESMTPSA id bp37sm16367787qkb.135.2022.02.15.01.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 01:20:51 -0800 (PST)
Message-ID: <b389e735-1802-890c-bb9e-7b5a84aa9095@redhat.com>
Date: Tue, 15 Feb 2022 10:20:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/7] tests/qtest: add some tests for virtio-net failover
 (part 2)
To: qemu-devel@nongnu.org
References: <20220203141537.972317-1-lvivier@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20220203141537.972317-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping ?

Thanks,
Laurent

On 03/02/2022 15:15, Laurent Vivier wrote:
> This series adds more qtest test cases to test virtio-net failover feature.
> 
> New tests are focused on the behavior when the feature is not available.
> 
> Laurent Vivier (7):
>    tests/qtest: failover: clean up pathname of tests
>    tests/qtest: failover: use a macro for check_one_card()
>    tests/qtest: failover: check the feature is correctly provided
>    tests/qtest: failover: check missing guest feature
>    tests/qtest: failover: check migration with failover off
>    tests/qtest: failover: test migration if the guest doesn't support
>      failover
>    tests/qtest: failover: migration abort test with failover off
> 
>   tests/qtest/virtio-net-failover.c | 911 +++++++++++++++++++++++-------
>   1 file changed, 716 insertions(+), 195 deletions(-)
> 


