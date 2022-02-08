Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233EF4ADDE0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 17:02:26 +0100 (CET)
Received: from localhost ([::1]:60356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHSwj-0000O7-0v
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 11:02:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHRpz-0003h2-Cj
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:51:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHRpx-00039h-34
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644331880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wfn/qImx29gG136UEpGhVbSStsTXq/P3/jAbsNShslw=;
 b=bXXVJ5Kb2dBqhoX8Pwz2ZbadX2yYhcOT1IoZJSX8jfia+X7wp5bBOrkh6zHHurh39TA3YQ
 +H2rjZb5HFvwZTtSXun0UzJRCWkFwv2evNoRgSAgRhaSMZjVwhZjNNczNJnQ0wRRqSSMeg
 dQKDMFUb5D/+fUlXBOPW3lYGB8IgMPI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-uzAYmVo_O1ipG7wD5kKZwA-1; Tue, 08 Feb 2022 09:51:18 -0500
X-MC-Unique: uzAYmVo_O1ipG7wD5kKZwA-1
Received: by mail-wm1-f69.google.com with SMTP id
 r8-20020a7bc088000000b0037bbf779d26so637368wmh.7
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 06:51:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wfn/qImx29gG136UEpGhVbSStsTXq/P3/jAbsNShslw=;
 b=HzGZ9/C7VKckVg6P3kHHq6zrW/j3D7pqY8B/jpfAXryLp3ylIYXoegH0tdNSrdEWCw
 Rq5uvZGG2Ky3nRxDwM5meQt5DttgTe+iDqqA7H0DfbMicduWO1jk+4TBIFdRuGLmPfe/
 ODzeQj54mLd5rV2vq7eKoUA2NRvIkuZX5vL47F0Rxt7RjgVhCFirDteFI+RYURJoPIuL
 mRhPBUsyyAUIkthY5I/OFQa8gzC3Nq08hWVg4OGDxg+eUNCq4rE4mYlC5awALCvwWFwB
 UKu8QG9TTVHdDJQYyWqVaps2gVc6rwqAzdMZAtH5e56U+JaBCLnY22pYejnK3PkE5mOM
 vN0Q==
X-Gm-Message-State: AOAM530ZEYni4Zk8ci4JjPgOuQCRW+qmoj9cUbR2Ir45hgpEOVeo0T05
 qgjPxgZQrr0NSS1U4EwOVSnvRC2FNX9naXSwd60iPvYw8IV+vzR+IAuI+kdzcwzdL2RBDLPoIod
 oVYe3OnDac5aIL50=
X-Received: by 2002:adf:dd0c:: with SMTP id a12mr1631055wrm.312.1644331877427; 
 Tue, 08 Feb 2022 06:51:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwD+nKGRee2FOOcxUc2gIoX2gF4lFYKQYlpfgi3fY0okZ4S9HOKN2lKHoFsISjQUScGT/Gw0w==
X-Received: by 2002:adf:dd0c:: with SMTP id a12mr1631038wrm.312.1644331877232; 
 Tue, 08 Feb 2022 06:51:17 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id p8sm14712639wrr.16.2022.02.08.06.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 06:51:16 -0800 (PST)
Message-ID: <aba10fdb-c6be-f521-deed-b523bc084073@redhat.com>
Date: Tue, 8 Feb 2022 15:51:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] Revert "check-block: replace -makecheck with TAP output"
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220208124432.84924-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220208124432.84924-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/02/2022 13.44, Paolo Bonzini wrote:
> This reverts commit d316859f4e28c74ab8b618895d2a5e0a865d3cf1.  The
> TAP output is inferior in that it does not include the diff for
> failed tests.

What about dumping the output of meson-logs/testlog.txt instead? The diff 
also shows up there!

  Thomas


