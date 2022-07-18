Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD1257898C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:29:13 +0200 (CEST)
Received: from localhost ([::1]:34922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDVUW-0004Hz-4i
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDVP7-000705-Lu
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:23:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDVP2-0003zm-HY
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:23:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658168611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kTri+VevjSdwY7eSJiuS80q1k8/EuWIWJVPI9TemQaI=;
 b=ISiahg+M0PW9EN338llQanxgwTwbj5TT+5F/l51o1HXAw3r5zmewaAlzItgECQvZHPPRG/
 M5gLlvvYn01ZjfT1g9jTiQxrK0oEXUks4OQb07A5+cjLfDX+QlWbPgdO+bLGOU0M8nEnEj
 nM66OMXakSB4sGh1AMJIhs5+P+91R1I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-5jcnUwfmMouQXY9gNIxgCA-1; Mon, 18 Jul 2022 14:23:30 -0400
X-MC-Unique: 5jcnUwfmMouQXY9gNIxgCA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v11-20020a1cf70b000000b003a318238826so1721179wmh.2
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 11:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kTri+VevjSdwY7eSJiuS80q1k8/EuWIWJVPI9TemQaI=;
 b=GG8pyYSWJVYTotJ6arSXjZDucz8RiCBi33XK43Nnt1/IByV+xJKMgFHkOGMuKtHZFP
 pjHjdOmE3/+v5oy1efTAAL31st320WLNPejDSIO9HpuOvr4XMhRwVjOkFSWIcaj36lSb
 1HHB/tKCBKD3sHxmN3lAzwngr6OUc+1ztOsHu/buh5MzbYF5V/cgq14yAJpqC2hTgNiq
 8qFwP0TmQ6Q0q9v8l0XoF7yVvChoHAREytqYbfai2WkUSTc4OIyrN2fLgdVn6k5Z/E52
 iiiypLfEzliSNwIaZ0S+m7KYq7qK8u4hU9aE2/Fl1cDrUxunhVzZBKVDrhQ+IZ721lMd
 hZmw==
X-Gm-Message-State: AJIora8FC/Wa6kPt9vocX/MaO+sunVA/kKBUHM2kHPZ5vq/hnOUlBpf+
 w0IS0qvOBEcvMeyk3inR6WniUV/hohxTqnnu0dAOmQYggcd+2Ynw64XmvxMGcRQTnhAcysPvV2v
 jVk7w+XySkOIczCc=
X-Received: by 2002:a05:600c:1f08:b0:3a3:1b00:c201 with SMTP id
 bd8-20020a05600c1f0800b003a31b00c201mr6017195wmb.171.1658168609065; 
 Mon, 18 Jul 2022 11:23:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v3QmMpHiSlkDqlbYHWiTj5WnFrXpiM8flXXHpb2oJRtNRpKlIPXprPKEFuJ93mPb5i4KGIyA==
X-Received: by 2002:a05:600c:1f08:b0:3a3:1b00:c201 with SMTP id
 bd8-20020a05600c1f0800b003a31b00c201mr6017176wmb.171.1658168608802; 
 Mon, 18 Jul 2022 11:23:28 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 c12-20020a5d4ccc000000b0021d6e758752sm11530508wrt.24.2022.07.18.11.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 11:23:28 -0700 (PDT)
Message-ID: <bcd9b961-d1b5-e334-5bb1-7ee56be29725@redhat.com>
Date: Mon, 18 Jul 2022 20:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] tests: migration-test: Allow test to run without uffd
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220707184600.24164-1-peterx@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220707184600.24164-1-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/07/2022 20.46, Peter Xu wrote:
> We used to stop running all tests if uffd is not detected.  However
> logically that's only needed for postcopy not the rest of tests.
> 
> Keep running the rest when still possible.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   tests/qtest/migration-test.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)

Did you test your patch in the gitlab-CI? I just added it to my testing-next 
branch and the the test is failing reproducibly on macOS here:

  https://gitlab.com/thuth/qemu/-/jobs/2736260861#L6275
  https://gitlab.com/thuth/qemu/-/jobs/2736623914#L6275

(without your patch the whole test is skipped instead)

  Thomas


