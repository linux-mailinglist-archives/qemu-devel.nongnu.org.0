Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B04599B0A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 13:42:40 +0200 (CEST)
Received: from localhost ([::1]:33712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP0Od-00012Y-TA
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 07:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oP0IQ-0004tU-VI
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 07:36:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oP0IN-00086R-Mc
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 07:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660908969;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4LhMGAzyNsqjir2io+xF5hhLEzIDWYjgYLSr+NXzv/U=;
 b=CKw3r1DgUWQIZyUbP+qbPCODn9ByYCe8F5XxB81cVJhA4F7XtchrFD8qDtu7uDnZN6j50v
 wpfSwgcECAzrSFSjtNTrpx0nIA0aZQiYw6F2Em0ryYgq5MD4NzAZfz3QLxY/yCbXQNMp2l
 Goa+EDXEWqqKVZoLKT/Ea4kSpFOWO3Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-170-Acy6_oLQMvCZ3Cu7OYYeaw-1; Fri, 19 Aug 2022 07:36:08 -0400
X-MC-Unique: Acy6_oLQMvCZ3Cu7OYYeaw-1
Received: by mail-wm1-f70.google.com with SMTP id
 c66-20020a1c3545000000b003a5f6dd6a25so4187413wma.1
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 04:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=4LhMGAzyNsqjir2io+xF5hhLEzIDWYjgYLSr+NXzv/U=;
 b=XR6ERQeEh0hsPPY92W+j/EvLfeQburKwQh8lVJCbP2TJWjax5nMmIAfAZz9Ga5qdRr
 Vi6k6ch4gjxm7jud1nSvivcuAaPU6B7TtSa+tZYbo5dh6GSuhIAH1qqQbHf8ZyJgvyYL
 W38tyA5XCmobnXsdBkz+9yEFaTDqT7ISRLQ3deYUZQ6MS/hABTMVoBCwd1ZbJ0UOWAVm
 5sDO3HFcPzlEGa8BZduInTXhvfT9OG5U70EB4tUxFrw1kkmvxUqC1FMSajl4Sc4RMudT
 ZTNgS2oKVztDycZjuZedx0319iqv6Qj2pBMHXLdgl/exOAe8I2CBAh8E2VsyXDujBRHK
 xCYw==
X-Gm-Message-State: ACgBeo1j6gjzL1XR0jv+QI1GLbe8RWXEKbQ3sIj5YN8U7B3ReXksdHHs
 sEh5G0MuZL6uVKT68jtdu5qHCg5IH/TN+s+b+VgszmvGJ77BW9GpY6mQkFAv5p3gaAWxPwRXBvB
 1Kgfjfhfgxf7xMu8=
X-Received: by 2002:a05:600c:1c99:b0:3a5:b62a:52fa with SMTP id
 k25-20020a05600c1c9900b003a5b62a52famr7886103wms.161.1660908966764; 
 Fri, 19 Aug 2022 04:36:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4nG3+mXt4sGM/R1mpSh7JkCQ8qqk1zbVuerqnOnc1d+7Eltbco3N5mfUuhR+s+5OQigrzlEg==
X-Received: by 2002:a05:600c:1c99:b0:3a5:b62a:52fa with SMTP id
 k25-20020a05600c1c9900b003a5b62a52famr7886088wms.161.1660908966572; 
 Fri, 19 Aug 2022 04:36:06 -0700 (PDT)
Received: from localhost (static-205-204-7-89.ipcom.comunitel.net.
 [89.7.204.205]) by smtp.gmail.com with ESMTPSA id
 q9-20020adfdfc9000000b0021d221daccfsm3787129wrn.78.2022.08.19.04.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 04:36:06 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo =?utf-8?Q?Br=C3=A1s?= <leobras@redhat.com>
Cc: qemu-devel@nongnu.org,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  Eric Blake <eblake@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Yanan Wang
 <wangyanan55@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>
Subject: Re: [PATCH v7 08/12] multifd: Add capability to enable/disable
 zero_page
In-Reply-To: <cdf15834492aa55215ef75b6a963e1c7b3ff49a9.camel@redhat.com>
 ("Leonardo =?utf-8?Q?Br=C3=A1s=22's?= message of "Thu, 11 Aug 2022 06:29:44
 -0300")
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-9-quintela@redhat.com>
 <cdf15834492aa55215ef75b6a963e1c7b3ff49a9.camel@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Fri, 19 Aug 2022 13:36:05 +0200
Message-ID: <874jy81n4q.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Br=C3=A1s <leobras@redhat.com> wrote:
> On Tue, 2022-08-02 at 08:39 +0200, Juan Quintela wrote:
>> We have to enable it by default until we introduce the new code.
>>=20
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>=20
>> ---
>>=20
>> Change it to a capability.  As capabilities are off by default, have
>> to change MULTIFD_ZERO_PAGE to MAIN_ZERO_PAGE, so it is false for
>> default, and true for older versions.
>
> IIUC, the idea of a capability is to introduce some new features to the c=
ode,
> and let users enable or disable it.=20

All capabilities are false by default.
If we change the capability to be true by default, we need to teach
libvirt new tricks.

> If it introduce a new capability, is not very intuitive to think that it =
will be
> always true for older versions, and false for new ones.

It don't need to be intuitive, it just need to be documented correctly.
I think that is done, no?

> I would suggest adding it as MULTIFD_ZERO_PAGE, and let it disabled for n=
ow.
> When the full feature gets introduced, the capability could be enabled by
> default, if desired.

I have it that way before it was a capability.
but the info migrate_capabilities

showed everything false and this one true, wondering _why_ this one is
true.

So I decided to rename it, and make it true by default.

> What do you think?

I preffer it this way, why?

Because at some point in the future, we will remove the code that
implements the capability and the capability.  So the idea is that we
don't want to use it for old code.

Later, Juan.


