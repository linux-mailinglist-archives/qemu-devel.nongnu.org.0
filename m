Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B247B442
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 21:17:58 +0100 (CET)
Received: from localhost ([::1]:54024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzP6b-0002C6-J7
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 15:17:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzOrh-0003Io-DT
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:02:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzOrb-0003Qi-5d
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:02:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640030546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5FWYNzHTpYnidYB8a9wS40QuBOq8TcpBPfUKHOel8Wc=;
 b=SDADHT2n1B/s9niUXB9i2i6vmZDXC9qbqVuHwsoMXcB6NVfZOoOp/5sbKG9hrqa37rDdXv
 +UZeISMw7FFy1EwFieqFPfTotH7/h+Ry7OCcIQFFts4RfM9nBxkxdY1JtKMgA5dYJMAqaT
 YaXopoamA5LjfCEzbcGG+EnDBPHVV3c=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-vA0r0jIuNzGkOkA-iplryQ-1; Mon, 20 Dec 2021 15:02:25 -0500
X-MC-Unique: vA0r0jIuNzGkOkA-iplryQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 t1-20020a056402524100b003f8500f6e35so3536271edd.8
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 12:02:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5FWYNzHTpYnidYB8a9wS40QuBOq8TcpBPfUKHOel8Wc=;
 b=BTx3dlKt+gRrpDu/iHSjEPHxFjofq5XT/KvoXJC+C5b8wZw9Ot/dAT1lAOFGHmWOTq
 +IXuil42WpHvscgU2iTI8fiyx3EeMtcOS5zCF7F/biUy5jdDUlhKxAnPVfPS/t52SJwb
 N3ASIhdjFDD5S/PKDwYCJib/zZfmUF3rsihvQhNqHfPDVIhnB5ddNccnNfJp33mqk6Wu
 mFIvVfStG5UdaIDxfUA+6FSb45oh8rLYvN5DhjRpTYc7HhIzynA+huYv/2VUMYS5oGAz
 /H3DuvZxDlGHC3CESj7DANRtygoUIjlbFJWQHcT5K9LAmLOsgv1/up8KjAzWokegBAJB
 eYRw==
X-Gm-Message-State: AOAM530pmCEHEU1iA6Wdu0DfpXE2O1G+4UkE/vGD0Xd5fn+AfadploZW
 iBm0QnjVdI7AlCoRY+JjK8Cdq02HhHCXb6L/qU6vBV13M6wJ1tVdoyu1T9B8IljlNOFiwkIQN+M
 nwotNKQngj0DBQHM=
X-Received: by 2002:a17:906:300e:: with SMTP id
 14mr14224892ejz.732.1640030543944; 
 Mon, 20 Dec 2021 12:02:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwr/scmx1L+0N2Hm5LfkJiAcgYv9dw4Je0bK2bWk+D8OsLcLR1Q444XRA2+vy5tLzNwZ6dNg==
X-Received: by 2002:a17:906:300e:: with SMTP id
 14mr14224880ejz.732.1640030543726; 
 Mon, 20 Dec 2021 12:02:23 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id h7sm7369985edb.89.2021.12.20.12.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 12:02:23 -0800 (PST)
Message-ID: <72a60ec5-156b-d73e-9150-91c79eb92fc7@redhat.com>
Date: Mon, 20 Dec 2021 21:02:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] tests/qtest/virtio-net-failover: Use g_random_int()
 instead of g_test_rand_int()
To: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>
References: <20211220102759.311224-1-thuth@redhat.com>
 <a752f53a-f563-4d54-affa-40925f39b62f@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <a752f53a-f563-4d54-affa-40925f39b62f@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 20:26, Richard Henderson wrote:
> On 12/20/21 2:27 AM, Thomas Huth wrote:
>>       const gchar *tmpdir = g_get_tmp_dir();
>>       gchar *tmpfile = g_strdup_printf("%s/failover_test_migrate-%u-%u",
>> -                                     tmpdir, getpid(),
>> g_test_rand_int());
>> +                                     tmpdir, getpid(), g_random_int());
> 
> Random numbers plus pid are irrelevant, because you still don't have
> guaranteed uniqueness -- think stale files in /tmp.
> 
> Use g_file_open_tmp.

Another use in test_socket_unix_abstract(),
tests/unit/test-util-sockets.c.


