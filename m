Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFAA4B7489
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:05:13 +0100 (CET)
Received: from localhost ([::1]:33818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK38S-0008TH-Ke
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:05:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nK36N-0006HC-LL
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:03:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nK36J-0002Wf-RK
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:03:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644951777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L4Y5B6aIhwE80I2k9LuGE64G0NL+HUE1nnNjP93Do4Y=;
 b=P9FJEacThwWEK+BO2veQ4CDtPjUu+KySvmeNZBCXNB+3UlXvXCToNm0m1jZYGptdVFI/vT
 UOuioTxNn0+pt/w1Nkmwh0uskgS4rnfhk2GaONqS+CI+eThEV43SZleKWm973pO5+cF1aB
 SpLztHNBTfzdtlMoCMCaWh+tSSV5sko=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-rYsxi0O8NoSJV6xehnGNyg-1; Tue, 15 Feb 2022 14:02:55 -0500
X-MC-Unique: rYsxi0O8NoSJV6xehnGNyg-1
Received: by mail-vk1-f200.google.com with SMTP id
 i2-20020a1f6d02000000b0032cf4d1abcaso2276688vkc.17
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 11:02:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L4Y5B6aIhwE80I2k9LuGE64G0NL+HUE1nnNjP93Do4Y=;
 b=LZnGOanQ/AI5RGSZ289sZm4YwwL23pcY9don/EIHq65Kf1wmEGL6VC8MHVNfOW36zy
 dEcpuYn720RLqT+99BZWgxyHsJGFwX0x0jJmxBR9AdGB1/uVOW3c7+0ACG3AEbybFojP
 leAKL4LzkeIZkyt1Q9rupDFd3LJmh2kyeKuKub1E9e5nUn6Qdo1vhRT9+NqUWOjEPOsQ
 xrGOPWU/73JUYXxcInN93AH8cUNdXZJJanH5RBmKAzYzrgSeoUpFEfBN0PN+MjqjkAV3
 bv51Ii2V4LAv8HuxJVGhr+6qjhwHHmUFW9RWqAzPiGEsKKZWP/VYIzINZcTdKudRJnY5
 xVZA==
X-Gm-Message-State: AOAM531CSxbaMvFx5dfL7QFX9xHR5kc2HB8qchhZJqpmsQ9/0PSSL98B
 b0VXOBkyoaKpsC6R4nErTfmJGLp9ITWe61QRS5LBIYU6zwvoEK3/Pse0J8VRi7ZRRWOFF27j1os
 tPDTNv+m6b3lW5qorb1LpVzokz4kD458=
X-Received: by 2002:a67:e182:: with SMTP id e2mr103759vsl.11.1644951775128;
 Tue, 15 Feb 2022 11:02:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpjtr+oV2LAB6Vz4jTDCFQOjCsyGAuzlt0aW4sSy0atV4ya78duh/1VYYqW+WQwh01A4BAiyvZioiIHdsYvNk=
X-Received: by 2002:a67:e182:: with SMTP id e2mr103742vsl.11.1644951774867;
 Tue, 15 Feb 2022 11:02:54 -0800 (PST)
MIME-Version: 1.0
References: <20220203015946.1330386-1-jsnow@redhat.com>
 <CAFEAcA_OXJ6C1UTFXiy6x1gp4VRmaWQY7ntU8N-3-O+TGcsKQQ@mail.gmail.com>
 <CAFn=p-ZeG2XM_cP3hpKN-Cagk4T1Sr05YEDhtwmR4+_VOjVt7w@mail.gmail.com>
 <CAFEAcA9fJMQizPmd1rUh7wPgPoz4dAXQPP07DzDFQK1ieN72VA@mail.gmail.com>
 <CAFn=p-Zpvf4W1zZtnv5a9sn=38=dgsa7HUMnYM7dk7xW7gRB3g@mail.gmail.com>
 <CAFEAcA-XvLDYRsM0Yf0TCg=7MMDCe7cKz0qcMFcOx5KZfZTyQA@mail.gmail.com>
 <CAFn=p-YnPiexJLCNGikCvJMSZKvuyUoWhb6vmBz966cWcEkObg@mail.gmail.com>
 <CAFEAcA_JbCrWRX=uHtbm=b+DATXRmJNzRe_p_v8Td2pfY4N7oQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_JbCrWRX=uHtbm=b+DATXRmJNzRe_p_v8Td2pfY4N7oQ@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 15 Feb 2022 14:02:43 -0500
Message-ID: <CAFn=p-ZrMQ0+62YufQvUr=F4zdTwmHph54RuXC-mxihJEpavHw@mail.gmail.com>
Subject: Re: [PULL 0/4] Python patches
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 1:01 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 15 Feb 2022 at 17:46, John Snow <jsnow@redhat.com> wrote:
> > Just so I don't leave this thread hanging, I filed a GitLab issue and
> > I'm working on it, but this one isn't as quick to solve as the other.
> >
> > https://gitlab.com/qemu-project/qemu/-/issues/874
>
> Is there anything particular to NetBSD that means it happens
> more often there, or is it just random luck that we hit
> the race there and haven't seen it elsewhere ?
>
> -- PMM

Complete random luck, something jostled loose by the scheduler.

I need to change the interface in the async library entirely to make
the process more granular -- We don't need the granularity in a truly
async mode, but the sync wrapper that allows the existing iotests
corpus to use the library in a synchronous manner *requires* a more
granular connection API, so I have to write one. It's in progress, it
just might be a few more days; verifying and testing the error
pathways has been slow work.

(In detail: python's asyncio.create_unix_server() call combines bind()
+ listen() + accept() into a single discrete step. A synchronous
client, though, needs to have a reprieve from all of those blocking
steps to launch the QEMU process after listen() but before accept() so
it can launch the QEMU process. I was able to pull the bind() step
out, but the async listen() + accept() steps the way I initially wrote
it are inseparable. Live and learn.)

In the meantime, there *IS* a way to use the old library, but I don't
think the environment variable in question is routed down into the VM
tests. I can look at (as a very quick fix) amending the VM launcher to
pass along that environment variable if it sees it set in the host
environment -- that should get you on the old, tried-and-true library
when you want it, and the test should pass.

--js


