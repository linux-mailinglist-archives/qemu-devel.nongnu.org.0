Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715B748BABF
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 23:26:58 +0100 (CET)
Received: from localhost ([::1]:53924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7PbV-0002RS-94
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 17:26:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7PZF-0008Iv-B8; Tue, 11 Jan 2022 17:24:37 -0500
Received: from [2607:f8b0:4864:20::62d] (port=45865
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7PZC-0004es-TE; Tue, 11 Jan 2022 17:24:35 -0500
Received: by mail-pl1-x62d.google.com with SMTP id g5so951896plo.12;
 Tue, 11 Jan 2022 14:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yC9dQGu4zSexbQceNI+qVqpCoQXJTetS7FBiFg4do+A=;
 b=TgaCeEhytOpLoWnSIBryOCxquAipEAEJGTIcr8JRU8EyWSX8ap79nKjUgV3jd029XZ
 46GUVeBz6bxzidRDgvSv47HtUVZyIlQtmWAfGTBXZa5Lm2xlTPf/BvcRML2EqhrwgqJp
 p0GrJoIxrAX26SjFMBgxU0WCluX8F9RD+A20+xcuqBgYC8y7fpU/vzy+SphHXL9DLcKC
 G5kc1dSERocgHJJJZqL/jIR1h4Euny/dZTFVmC+gQlgyI72p1JOVCzx4yawmlaAbgivV
 6XI+mKqVDzZ7PmwBV86Znhd/rSIg0p7lyTz1VTf9UcaZAaumIgr/Vx2sYThs3FNZ2qbJ
 cQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yC9dQGu4zSexbQceNI+qVqpCoQXJTetS7FBiFg4do+A=;
 b=rsDc42etj0ThgBQoqUTbPrYawfAfrH36oHz7ecTWki8RTrpkG6DHbrq/ar6+jU89/9
 se2ySzZithhfpLHvQIOv3yomWOIVYWeWsaLb/oPCZ4qqi3bbxWUSNb7vv1XUvlmHbNtv
 iGnEXEYjQYFmDU6C1eJVe7RtEwsw/7E5qPYUNnWIDJZaCsVHaVILWFPRMti/uv2BnEir
 JdkLzDB2LSJ+1g2znybEq16CWjGWtvtyMcFYnTJeBeNDB9A1FEPT5vqOeV5+frM5bqW1
 AOaCU7Dg2rCDL+W4PFbfLxWHyOdCov1ttAy4C7LxZtp1dsxvDztrjuPitpZmAClG41ds
 WuOg==
X-Gm-Message-State: AOAM530A1xFEbzynOg1r67OQXJcaiwZmKAaba1XkbIlclQb98JTNQE/2
 puizkfXjINq/g4ZXZ+kKEyYGOjo8VlMPqQ==
X-Google-Smtp-Source: ABdhPJz79mvF0YrOeYzGQE8ZotdsQJJnxc7/dtOCiKi2xYDp3jinOgD9iFPYXrJWPI+75hHsbyJxEA==
X-Received: by 2002:a17:902:b414:b0:142:431f:3d1c with SMTP id
 x20-20020a170902b41400b00142431f3d1cmr6814410plr.32.1641939873507; 
 Tue, 11 Jan 2022 14:24:33 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id i9sm9155381pfe.94.2022.01.11.14.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 14:24:33 -0800 (PST)
Message-ID: <718931aa-7c18-4335-8d57-bcb9d7dc06f9@amsat.org>
Date: Tue, 11 Jan 2022 23:24:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH] tests/qtest/hd-geo-test: Check for the lsi53c895a
 controller before using it
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211222153600.976588-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211222153600.976588-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/12/21 16:36, Thomas Huth wrote:
> The lsi53c895a SCSI controller might have been disabled in the target
> binary, so let's check for its availability first before using it.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qtest/hd-geo-test.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

