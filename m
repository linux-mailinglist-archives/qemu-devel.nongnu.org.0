Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923E3474A84
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 19:12:15 +0100 (CET)
Received: from localhost ([::1]:45638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxCHe-0006t6-6t
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 13:12:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxCGA-0005z0-HX
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 13:10:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxCG7-0003C2-Nd
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 13:10:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639505438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NnqvdFsXjKmz9KdJ/OROMzXsWw4Wm/eVlknFurk49fg=;
 b=A4BjY/CE373pH4T83vxkwkyCd2PlX67x01ZyJLW/7SBUxNHt0/J0VK1Piy595fGt3jaPb0
 4XKqjVvHKTK5H/jZCYgfZmwu8/Bt4mnATm3Vn7qwE9d8mR5H7QZTV8RVdSr3Vt4Mm5aFdb
 941Nthvgj8/tMZSMYx9n/Yk81rZv2WE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-UiVjpOnPNGae2SoTo5qRdQ-1; Tue, 14 Dec 2021 13:10:37 -0500
X-MC-Unique: UiVjpOnPNGae2SoTo5qRdQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 m12-20020a056402430c00b003e9f10bbb7dso17700912edc.18
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 10:10:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NnqvdFsXjKmz9KdJ/OROMzXsWw4Wm/eVlknFurk49fg=;
 b=wx6JEmO7WZonOFLofq7M11aKd4Y0c+hgW13A5LsLZ+Zp3CbEhhM6vFxBocydU0DIo/
 NZbH36Ei2QD3CIYUc4bN/IcZv1gSBsMkgDApu42aTBVwzCr//cMALFWeOuMYXYJFJvsc
 pqGwo8OgThQe536dkGQpxtJBnom2U6VCitld3D1PS1wXarBBJ9BI9C/y4aio1eEYiP5O
 j8ogTvcobXBQG2rimtVoCBeldsNbGnO+ZMtamgmF/DheEy488uzOQ5TFm9GHj/tnmhQi
 mKvbhXK1Yyh2mApfxEFeUcp4JNTgKBfzvphCq2YVftiToUZO49EHniiwU264J2/67HIn
 n2aQ==
X-Gm-Message-State: AOAM53335dbIHjmQr4QkLuO+9T7Jz9PLIjrHjH/UYGiDI5VasluOs1Pg
 o1zucPJIKfk3EHI3TXo0o9Xw0YlkOGsgU1o5HCTZxQ0Ll6dp8UAvmgm7qEpOMsbXYjPRlQ5LZDk
 QGAzY8NNo5C4mFYk=
X-Received: by 2002:a17:907:6d20:: with SMTP id
 sa32mr7500549ejc.688.1639505436009; 
 Tue, 14 Dec 2021 10:10:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrrXp0NCLQDq1cuzBIWGVJA3uf6ZAiCvOpSe+E9OekCwy0AIrx2mYzrtPGtsjZmiDhgFTgfg==
X-Received: by 2002:a17:907:6d20:: with SMTP id
 sa32mr7500529ejc.688.1639505435822; 
 Tue, 14 Dec 2021 10:10:35 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id j5sm155563ejo.171.2021.12.14.10.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 10:10:35 -0800 (PST)
Message-ID: <5fe9120f-04d7-0cfa-36b0-33c9f1680809@redhat.com>
Date: Tue, 14 Dec 2021 19:10:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 0/6] Removal of Aiocontext lock and usage of subtree
 drains in aborted transactions
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20211213104014.69858-1-eesposit@redhat.com>
 <YbdeS/q3L1mBmEyT@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YbdeS/q3L1mBmEyT@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.962, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 13/12/2021 15:52, Stefan Hajnoczi wrote:
> Off-topic: I don't understand the difference between the effects of
> bdrv_drained_begin() and bdrv_subtree_drained_begin(). Both call
> aio_disable_external(aio_context) and aio_poll(). bdrv_drained_begin()
> only polls parents and itself, while bdrv_subtree_drained_begin() also
> polls children. But why does that distinction matter? I wouldn't know
> when to use one over the other.

Good point. Now I am wondering the same, so it would be great if anyone 
could clarify it.

Emanuele


