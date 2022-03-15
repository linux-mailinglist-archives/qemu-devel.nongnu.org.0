Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E60B4D9A05
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:09:47 +0100 (CET)
Received: from localhost ([::1]:54810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU53h-0004b3-Lj
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:09:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU51Z-0002QY-Os
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:07:34 -0400
Received: from [2607:f8b0:4864:20::1034] (port=44680
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU51Y-0005XJ-6l
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:07:33 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 gj15-20020a17090b108f00b001bef86c67c1so2081955pjb.3
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 04:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TbF3R/Q4WuTSnh7bmFl5qxOS3vGtoEf6SACumUG3DKM=;
 b=owZtBzJwMCkYaqfPXX7TAqJqHhjfzmlQS9skkrgzhQZ+0I58Rc28mGXZWWkCh/Jk/y
 ekogIg6HfgSfGYLpxkzcBnIO3/p28IdIiH3wBW/4bO83SNLJMm6tY3xd839NIS41Joya
 m5zpZWPkL5j640J6nnQnrs+el+ILwjUaKW7ZWuJbYr2rFjoRKivbR9/5wcOTIDY8Pxru
 UQ0kEnJlTSpoDTBEs38V3oh0F2SqIh7KXf20BYpPq4llY4SaxlVUlY2By7DrAChmnroW
 aN1xx/K9EFU5E97+S7R2UzuK9Fso7texmcr/5Dckwbpa/bXye4SZvtELwju5i2p60yLR
 98cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TbF3R/Q4WuTSnh7bmFl5qxOS3vGtoEf6SACumUG3DKM=;
 b=WfovLamik5Pzk47/mQRm9pm9vy15Yq3rBQVwffRZ4SiY3EHEeRvmXu4MvilGWK7LBw
 8v+R+Z+prHPCkszz6xCe3tDgNVGVj7+0NPf7469U4D2tB+l/kPQPADYeG5nRLVEGz0JU
 bU//8+dlPDNiSYpWcknFMJpCpguI1GE78rkt7h7yL1odVBNt7LYW2GoPLC4VTYO8oFZn
 n8Dlv+O3p3fjeVz9b210QUL4JJo4xoJkcSBq3fT36so49LOhYAPFkppL6pA/GfSYjizw
 +7vlPVGtd8H9vIDmJauW9PZGWKUXVFhiDVUM9ViYdmfqj194jQfPC+yJxPjIGXyJgDD+
 AzHA==
X-Gm-Message-State: AOAM531bUy2bF1h2Wo07DmB5wF4hhNC0GG77mrBvizGRfZgb4Qvq36LG
 YzTnETKFyKjLlGM4AZR/UZk=
X-Google-Smtp-Source: ABdhPJwcVhIteSHowNzTRVGJckqQy0F2/8zfwQUMCG1C1d5rwUafQdI4eaIqvqpvCMXb/hdxkBAyJw==
X-Received: by 2002:a17:90b:3b50:b0:1c2:5a5c:8cc3 with SMTP id
 ot16-20020a17090b3b5000b001c25a5c8cc3mr3984857pjb.42.1647342450522; 
 Tue, 15 Mar 2022 04:07:30 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 16-20020a17090a199000b001bf4b1b268bsm2649450pji.44.2022.03.15.04.07.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 04:07:30 -0700 (PDT)
Message-ID: <c667520e-e4f9-a435-1316-ce1f04077512@gmail.com>
Date: Tue, 15 Mar 2022 12:07:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] hw/sensor: enable setting adm1272 temperature with qmp
Content-Language: en-US
To: Patrick Venture <venture@google.com>, thuth@redhat.com,
 lvivier@redhat.com, pbonzini@redhat.com, cminyard@mvista.com
References: <20220106173814.3580141-1-venture@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220106173814.3580141-1-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>,
 qemu-devel@nongnu.org, Chris Rauer <crauer@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/22 18:38, Patrick Venture wrote:
> From: Titus Rwantare <titusr@google.com>
> 
> Reviewed-by: Patrick Venture <venture@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/sensor/adm1272.c        | 27 ++++++++++++++++++++++++++-
>   tests/qtest/adm1272-test.c | 28 +++++++++++++++++++++++++++-
>   2 files changed, 53 insertions(+), 2 deletions(-)

Queued to i2c-next.

