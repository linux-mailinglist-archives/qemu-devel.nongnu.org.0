Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAA659CAD1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 23:28:06 +0200 (CEST)
Received: from localhost ([::1]:32998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQExo-0004oG-W7
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 17:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oQEwL-0003JS-8z
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 17:26:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oQEwI-0004A7-CI
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 17:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661203589;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=61iZEhZkS43beT/Y4ChLWQSgE4N4cEob/T9sVDoDO+U=;
 b=R8pX+6YkdZnE6qR5FHtpQUz8OnDgWjKGXMLQ54s8aNXZ8PHm+darqdQV4eno42eGzoUGVh
 1h9nXYnZHW6Eawdn+/iH9kDa9/Uh9pGwEyRm+2sMkhOEcvBkhyTa6+1u3taopQFLw8kR6O
 HDDT0wLGmL3Q2SJMSun6KJiIYJE9iEA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-258-6Ug9UVbhOAaUIm8GScGgDg-1; Mon, 22 Aug 2022 17:26:28 -0400
X-MC-Unique: 6Ug9UVbhOAaUIm8GScGgDg-1
Received: by mail-wm1-f70.google.com with SMTP id
 n7-20020a1c2707000000b003a638356355so4728813wmn.2
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 14:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=61iZEhZkS43beT/Y4ChLWQSgE4N4cEob/T9sVDoDO+U=;
 b=FRp4rRKCDgO2kp/sbFCf0Uz6xJQlPDclUDt9STh0jfG/4AUu1jhp+J2MppkvWyChvZ
 RPNf1ATeboHtIN3QfGerzx80C45O5alKgTipZ2wrYYoAR/YRfUlajeZlEZ4zcrSxtbhh
 AmfVrpDjGmaDSVb4VnBDVIdJJZYpCAZSQhaITxQsWwceU9xQ0eplvvzc7/MkZVnPBfiX
 /TQbylGcBp2Q8ibpJ2wGtfduFlY/SMhCj/XtrCosH4iY0tl7ngQ1GcdFxjb6/9AbP/2y
 haDDym5cvyt/u1SWD4JgwkLnCMCmG95+M02pFOt+gVZlb1sywNjAB+Se1Z3llZJttb0T
 Jv+w==
X-Gm-Message-State: ACgBeo3DRR34Y/fLSoHdXnHax0NkUl9a0wq0OQDlPc8g/S4M+EAW6oD9
 9DogzYUwjpSdE9R4IFWDttgIppVlk5JM662DPApxlG4BqR5+UAgAtEqHRnwRvmAjJWqACcFjd0n
 BjolReBDyVfn5l4A=
X-Received: by 2002:a5d:4302:0:b0:225:5303:39e5 with SMTP id
 h2-20020a5d4302000000b00225530339e5mr4840252wrq.380.1661203586475; 
 Mon, 22 Aug 2022 14:26:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4qZhhXc+ss3rp59ZTohL7wl+dODtBzr56YouI7we+R2F2wYgRL91jAT76kxy6b1sAxoPWPWQ==
X-Received: by 2002:a5d:4302:0:b0:225:5303:39e5 with SMTP id
 h2-20020a5d4302000000b00225530339e5mr4840240wrq.380.1661203586243; 
 Mon, 22 Aug 2022 14:26:26 -0700 (PDT)
Received: from localhost (static-205-204-7-89.ipcom.comunitel.net.
 [89.7.204.205]) by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c358300b003a607e395ebsm24322496wmq.9.2022.08.22.14.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 14:26:25 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH  v1 5/6] tests/qtest/migration-test: Remove duplicated
 test_postcopy from the test plan
In-Reply-To: <20220822165608.2980552-6-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Mon, 22 Aug 2022 17:56:07 +0100")
References: <20220822165608.2980552-1-alex.bennee@linaro.org>
 <20220822165608.2980552-6-alex.bennee@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 22 Aug 2022 23:26:24 +0200
Message-ID: <87v8qkynpb.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> From: Thomas Huth <thuth@redhat.com>
>
> test_postcopy() is currently run twice - which is just a waste of resourc=
es
> and time. The commit d1a27b169b2d that introduced the duplicate talked ab=
out
> renaming the "postcopy/unix" test, but apparently it forgot to remove the
> old entry. Let's do that now.
>
> Fixes: d1a27b169b ("tests: Add postcopy tls migration test")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Message-Id: <20220819053802.296584-5-thuth@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


