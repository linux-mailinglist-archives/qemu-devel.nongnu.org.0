Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5836549AE99
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 09:54:35 +0100 (CET)
Received: from localhost ([::1]:59564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCHb0-0008W4-78
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 03:54:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nCH20-0003ye-NO
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 03:18:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nCH1y-0001zm-L1
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 03:18:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643098701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NQjdaeaR4ir/rEiL85JX0LZpXHIcR8U40Su42+AHKOg=;
 b=bs5fy+1I5l1r15164aXGaOcuDdNdeT7xSure7dsNEOkmbwxKlUuQZB298oVH9dDkikpGXs
 N7jR0iqtuNoREK9uQ2wzHby2/dFsI+pMAJEf5Z7U4/bV1zKSuKMvATemnwaGEs/5S3SYW3
 B65+OQbybC/mvbJIapvtpnci715BiYE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-j4v7b4yuO0qSI6sPpFkJSw-1; Tue, 25 Jan 2022 03:18:17 -0500
X-MC-Unique: j4v7b4yuO0qSI6sPpFkJSw-1
Received: by mail-wr1-f71.google.com with SMTP id
 a11-20020adffb8b000000b001a0b0f4afe9so2668302wrr.13
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 00:18:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NQjdaeaR4ir/rEiL85JX0LZpXHIcR8U40Su42+AHKOg=;
 b=1qWbKqq/dvw0GnyjCLBFlW/m4bEFkztIIvd/4CYx4rwxrO3HSk3wUPwUJxB9Z97C83
 fKlanXDbKfLql6obMKmaTPyzwDwqaXtnNhjuyRfiDfQMyXUb9j0Vy0mUKyDR21DcZ9Qs
 LKA1ksXQpWLAH6MGtt15kFhH9aqbPnF95il+H/piNkefsBU2pH5ar0D9WfgDrkgFD5ei
 KPgwfc+wqNYIs4Od3vPT6x0kOMZZ4d6Y/3081zQYOv/imRfbHtdUQ1zGPRlxpWfBRsw0
 IWH4FTWpcIzqeVV7LxfT2aT8isznoOJBn5QRpgf403d3pqAk1dLdxMEkkvBMlB35p9uB
 HtPw==
X-Gm-Message-State: AOAM532cWR9uIdxkU1dKiWlgPo0aB+QEBX8sIA8vyXKZcwsA4TX7qndt
 9+1ijEP7il0EHSFQANAfEr4XIPYiF+5RYbkWbeAX7TQf+tpgGk3mI44QcwmJWAALedTga+NVsZh
 KsT2OvrsVj/+4rsE=
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr16685927wrb.448.1643098696465; 
 Tue, 25 Jan 2022 00:18:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRhUBwX+OA1fvGZIaL7bhrZjLi4CHy3hpVS3FLa6n2M3TaG8VGYVe+5/VbOynfM4Sj+zoiAg==
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr16685912wrb.448.1643098696300; 
 Tue, 25 Jan 2022 00:18:16 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id m5sm1667858wms.4.2022.01.25.00.18.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 00:18:15 -0800 (PST)
Message-ID: <227a11df-1d62-cf9e-8b0f-8beeca891f90@redhat.com>
Date: Tue, 25 Jan 2022 09:18:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 02/22] tests/qtest: enable more vhost-user tests by
 default
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220124201608.604599-1-alex.bennee@linaro.org>
 <20220124201608.604599-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220124201608.604599-3-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, Luke.Craig@ll.mit.edu, Paolo Bonzini <pbonzini@redhat.com>,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/01/2022 21.15, Alex Bennée wrote:
> If this starts causing failures again we should probably fix that.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/qtest/vhost-user-test.c | 21 +++++++++------------
>   1 file changed, 9 insertions(+), 12 deletions(-)
> 

Works for me, too:

Tested-by: Thomas Huth <thuth@redhat.com>


