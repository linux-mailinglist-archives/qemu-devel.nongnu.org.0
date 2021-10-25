Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37D9439843
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 16:13:44 +0200 (CEST)
Received: from localhost ([::1]:42428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf0jP-0005hr-Sd
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 10:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mf0fe-000101-I9
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:09:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mf0fc-0005ZJ-FS
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:09:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635170987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z/T/IvEVgc7GqBTFKVhzJzJeo8g/kRyHun53y0nlQDE=;
 b=EEkkFbmjalnI7ZljmgjIAGB/nR3EdPobLXOyG/yCEPD9aPaCqDHx6RqHNnoBBza/eTOwkn
 mMGtXHbQOEqwnJnwUEt9EayVO01TmyUDvvbmYdMgsqaqe3lB8W9g+073e7/P7sHcrnx/in
 UuAnS3Uglf3KfL/A//by/gsm+0vL6hQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-U50e-d6yOvKiiNrKWdRuFw-1; Mon, 25 Oct 2021 10:09:45 -0400
X-MC-Unique: U50e-d6yOvKiiNrKWdRuFw-1
Received: by mail-wm1-f72.google.com with SMTP id
 d73-20020a1c1d4c000000b0032ca7ec21a4so244972wmd.1
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 07:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z/T/IvEVgc7GqBTFKVhzJzJeo8g/kRyHun53y0nlQDE=;
 b=FENkrfVuEQcIyYZLrYIcejuEsMO/R4bTWBC33YIKNVwb3QiBEoFNDpmSTehBwLjeYm
 nv/HBHbQk882+HW3lPyZZtSVGoXDfLhDiM/G3Yl4WWvzeqN7zAWjlTk5xAWn+fblsaW4
 60qiK+vscmHnY7fsFOdikjddEX6j2Mmj9hVFnB3Mypr6VRxc5Xt6Xkso5iWMg8A3hUuv
 6lUJU3C9WjgCm84hRFUXmxsKAb2cQAqn15/33NOhfmNPeZotfKjKZx+BI80voqUpj2KB
 cc3qsSEWqViaXbMD72a4M9YMGasiRSghf4TWvpPlOYGXaJkWnPp/wB/TfIdRvds4SYiF
 qQPw==
X-Gm-Message-State: AOAM530c4gXD4ObPR9CB66Z2P+6JjeO/rJx+TOb2zHBbCibHRyVqvTuc
 CDr7+c4KjgiI0KrDt5HLTSCX4oZUEKsYvicxthT58PhaiZU/WX0eFDUPSEpk5Kq9zAGRksl8bt1
 IGSALpNO2twqpYUc=
X-Received: by 2002:adf:959a:: with SMTP id p26mr23123118wrp.342.1635170984245; 
 Mon, 25 Oct 2021 07:09:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdqwXHn8VFB1acGdAzMYAvMn6ZuONsTe7i/gdblfpfNE30oYeNNXei2y9+ZzkBRUH9+KlERw==
X-Received: by 2002:adf:959a:: with SMTP id p26mr23123036wrp.342.1635170983842; 
 Mon, 25 Oct 2021 07:09:43 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id e9sm16669412wrn.2.2021.10.25.07.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 07:09:43 -0700 (PDT)
Message-ID: <5291fbc6-ac6c-8632-c3ba-ab1252ee7a28@redhat.com>
Date: Mon, 25 Oct 2021 16:09:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 00/25] block layer: split block APIs in global state
 and I/O
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211025101735.2060852-1-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.846,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 12:17, Emanuele Giuseppe Esposito wrote:
[...]

> Each function in the GS API will have an assertion, checking
> that it is always running under BQL.
> I/O functions are instead thread safe (or so should be), meaning
> that they *can* run under BQL, but also in an iothread in another
> AioContext. Therefore they do not provide any assertion, and
> need to be audited manually to verify the correctness.
> 
> Adding assetions has helped finding 2 bugs already, as shown in
> my series "Migration: fix missing iothread locking".
> 
> Tested this series by running unit tests, qemu-iotests and qtests
> (x86_64).
> Some functions in the GS API are used everywhere but not
> properly tested. Therefore their assertion is never actually run in
> the tests, so despite my very careful auditing, it is not impossible
> to exclude that some will trigger while actually using QEMU.
> 
> Patch 1 introduces qemu_in_main_thread(), the function used in
> all assertions. This had to be introduced otherwise all unit tests
> would fail, since they run in the main loop but use the code in
> stubs/iothread.c
> Patches 2-14 and 19-25 (with the exception of patch 9, that is an additional
> assert) are all structured in the same way: first we split the header
> and in the next (even) patch we add assertions.
> The rest of the patches ontain either both assertions and split,
> or have no assertions.

This seems a lot of assertions added in hot-path code.

Does it makes sense to use a BLOCK_ASSERT() macro instead,
only expanded when configure with --enable-debug?


