Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202324A593E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 10:33:17 +0100 (CET)
Received: from localhost ([::1]:38672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEpXI-0006Kx-7y
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 04:33:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nEp9A-0001yO-4M
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 04:08:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nEp97-0001gz-7z
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 04:08:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643706495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T38JRXsJqp2fW1wqWtelwKft9XgJJu47+Tq9BlH6zUk=;
 b=eD+EX7+ieuvFr+6yQWLxXbSTOpeDWQ2zpBsRMa48GVaIjp+wBb7Hk3FbZVK4jgNvKMND61
 xFeUkUjyrLkoCPslT70wFNvTiWj59V06bwFFFcuPSErwTwotWHt+D/zcQjehJ9mNUDlJBO
 0JDx5bID8C9PJUGZp/dgpAQolLsamoY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-uXLWEaVcMhOky8NvcVNSnA-1; Tue, 01 Feb 2022 04:08:06 -0500
X-MC-Unique: uXLWEaVcMhOky8NvcVNSnA-1
Received: by mail-wm1-f70.google.com with SMTP id
 i132-20020a1c3b8a000000b0035399bb7e85so987041wma.4
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 01:08:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T38JRXsJqp2fW1wqWtelwKft9XgJJu47+Tq9BlH6zUk=;
 b=UpqOKhidFdJYvL1RSs/mgE4PHMsMnOm8w9cmgD+tdUsw6t5x3k3aQy0KJJLtrbkLba
 6BANjfI6wnu6aaCkgZiwOPgXhwlvEb9hozjME7vZpqZwj7vdmvhagfSOCWso1cKemrPT
 fY44o311XYW1c5k1UUQAdA3tSuc8Eo0cX8ldU82BIz2896YjNCdqBC7+8VOdKzDgdzdq
 /J+q+I4tkDvz6dXy9o6wfgF7dZPuld1WhF3f2s4PrpIerfMcQa5M8Q2vQyXvyhqb+1cJ
 zfeQTQz+tudgbzlOYmjHsWMffkhngaNjFl3LuPMrLGlOpKOY8ZGw+AHzzU6eXuiCOBcY
 SEEQ==
X-Gm-Message-State: AOAM533XX+wHjEZ6kicfLb3BogYYDmdjnSHgWqGWBfELBgi25a+Ib0qr
 jQpwoY6nGexe6fZSQHs3Edaqx81aF952A77RZ5S3kXGm0inlqey38yNLcpxqDEO1J8nkrvujJcR
 JBo8XqdZq1vk36So=
X-Received: by 2002:a05:6000:3c7:: with SMTP id
 b7mr20685627wrg.260.1643706485725; 
 Tue, 01 Feb 2022 01:08:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZNR5cSkCbZEe6Kcnp62ObefVwCTQRzUabozBHmf7dvrNGXB2Vg4PtB5MNBdIZuXmvVV59jw==
X-Received: by 2002:a05:6000:3c7:: with SMTP id
 b7mr20685593wrg.260.1643706485415; 
 Tue, 01 Feb 2022 01:08:05 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id o14sm16157235wry.104.2022.02.01.01.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 01:08:04 -0800 (PST)
Message-ID: <31dc1b10-655b-7465-4f55-c0b28b09b784@redhat.com>
Date: Tue, 1 Feb 2022 10:08:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 01/33] main-loop.h: introduce qemu_in_main_thread()
To: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-2-eesposit@redhat.com> <YfJ6dsVcmB4Uc2rO@redhat.com>
 <7ada78d2-0978-8f5a-f0f8-318d2f26ba41@redhat.com>
 <YffzLaIhjgfBkcXf@redhat.com>
 <3fa2d527-91f6-0869-d6b0-c82bdd04884c@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <3fa2d527-91f6-0869-d6b0-c82bdd04884c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 31/01/2022 16:49, Paolo Bonzini wrote:
> On 1/31/22 15:33, Kevin Wolf wrote:
>> I feel "use this function if your code is going to be used by unit
>> tests, but use qemu_mutex_iothread_locked() otherwise" is a very strange
>> interface. I'm relatively sure that qemu_mutex_iothread_locked() isn't
>> primarily used to make unit tests crash.
> 
> qemu_mutex_iothread_locked() should never be used in the block layer,
> because programs that use the block layer might not call an iothread
> lock, and indeed only the emulator have an iothread lock.
> 
> Making it always true would be okay when those programs were
> single-threaded, but really they all had worker threads so it was
> changed to false by commit 5f50be9b58 ("async: the main AioContext is
> only "current" if under the BQL", 2021-06-18).
> 
>> Documentation and the definition of the interface of a function
>> shouldn't be about the caller, but about the semantics of the function
>> itself. So, which question does qemu_mutex_iothread_locked() answer, and
>> which question does qemu_in_main_thread() answer?
> 
> qemu_mutex_iothread_locked() -> Does the program have exclusive access
> to the emulator's globals.
> 
> qemu_in_main_thread() -> Does the program have access to the block
> layer's globals.  In emulators this is governed by the iothread lock,
> elsewhere they are accessible only from the home thread of the initial
> AioContext.
> 
> So, in emulators it is the same question, but in the block layer one of
> them is actually meaningless.
> 
> Really the "bug" is that qemu_mutex_iothread_locked() should really not
> be used outside emulators.  There are just two uses, but it's hard to
> remove them.
> 
> So why are two functions needed?  Two reasons:
> 
> - stubs/iothread-lock.c cannot define qemu_mutex_iothread_locked() as
> "return qemu_get_current_aio_context() == qemu_get_aio_context();"
> because it would cause infinite recursion with
> qemu_get_current_aio_context()
> 
> - even if it could, frankly qemu_mutex_iothread_locked() is a horrible
> name, and in the context of the block layer it conflicts especially
> badly with the "iothread" concept.
> 
> Maybe we should embrace the BQL name and rename the functions that refer
> to the "iothread lock".  But then I don't want to have code in the block
> layer that refers to a "big lock".

So based on Paolo's reply, I would modify the function comment in this way:

@@ -242,6 +242,9 @@ AioContext *iohandler_get_aio_context(void);
  * must always be taken outside other locks.  This function helps
  * functions take different paths depending on whether the current
  * thread is running within the main loop mutex.
+ *
+ * This function should never be used in the block layer, please
+ * instead refer to qemu_in_main_thread().
  */
 bool qemu_mutex_iothread_locked(void);

+
+/**
+ * qemu_in_main_thread: same as qemu_mutex_iothread_locked when
+ * softmmu/cpus.c implementation is linked. Otherwise this function
+ * checks that the current AioContext is the global AioContext
+ * (main loop).
+ *
+ * This is useful when checking that the BQL is held as a
+ * replacement of qemu_mutex_iothread_locked() usege in the
+ * block layer, since the former returns false when invoked by
+ * unit tests or other users like qemu-storage-daemon that end
+ * up using the stubs/iothread-lock.c implementation.
+ *
+ * This function should only be used in the block layer.
+ * Use this function to determine whether it is possible to safely
+ * access the block layer's globals.
+ */
+bool qemu_in_main_thread(void);

What do you think?

Emanuele


