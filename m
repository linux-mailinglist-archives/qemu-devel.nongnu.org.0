Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B69E38C992
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 16:55:14 +0200 (CEST)
Received: from localhost ([::1]:44042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk6YS-0000C6-T9
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 10:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lk6XR-0007mP-8O
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:54:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lk6XO-0000WF-Iz
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621608845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vkWZXMU/3fiOC766PyeBYhPV21EVkbwevnKj/UQshkk=;
 b=BHWMArWewsGIHkDhCLC9AQo+RFDmMkMSW9+i9efnxt5UCwjcHVezMvRVOardyZOSiG1PMv
 mJPTaypAAYnPtvH4UsflSIr8y5Od2PC8y7GFDwOuNPgjuuYt06C7QYBgtGKgaY0osdqFN5
 MFEpdrQAKwmNyO5LzinCMkVL1iW4b/8=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-9jL0c5yeO46pCMy08ksv6Q-1; Fri, 21 May 2021 10:54:04 -0400
X-MC-Unique: 9jL0c5yeO46pCMy08ksv6Q-1
Received: by mail-vk1-f198.google.com with SMTP id
 r10-20020a1fa80a0000b02901ebbe6c67c1so2993489vke.8
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 07:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vkWZXMU/3fiOC766PyeBYhPV21EVkbwevnKj/UQshkk=;
 b=kSplICGm1pJFYwXpa0SnMA6htZpvXBYah3EZ17oma0i8k2csIIrIVTql9yk0ZaHM66
 3BmtETBy+nkFMyEQTGg15763n7oz2l9+zjZZpN74rs4CJTSdqBV6iZ2i1/+9joYYULEc
 rHW7D1n1zxauPfPQbuwJa3ZVEs5hyJHVIx4pNGHw+LtXQUzVcnfTgo65hxPrD9GrIv/Y
 yQPAFGrauKdonjZAlglAGMxGjNDm9fBx5hVpZo7jrzzmGbdPmiPEXVbjAtvsuN6KR5JF
 gn7mr5SpVHVPiKmutJYoi2TPcXnf/rDETgunLTYmQL+Y3rnX/UcEokWtNtFAEtj4kmdG
 9k+g==
X-Gm-Message-State: AOAM530q7cJ4x48Ut2uluwmJwaByufVx2fh5dl2Lh+sg2B0l8/Gfxgex
 ZzVSo06A/5oTCNcCNjqoOOxMAfW3TGOysUVpfyOe58Cm5N2slvQRWZJDnAh2JOwAXWJr8FKfoMX
 di7Of4waZkcmURiwN5YX/k6WXrN42My8=
X-Received: by 2002:a05:6102:2f3:: with SMTP id
 j19mr10745714vsj.1.1621608843580; 
 Fri, 21 May 2021 07:54:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBnvyAaROUJ7jguFssY2cEfwW0Ifzpr+qFBdB5sQreSn+VPE2li7Ln3eQ0O/QpTXFt6dwCjrwRM2MVhuvppFY=
X-Received: by 2002:a05:6102:2f3:: with SMTP id
 j19mr10745687vsj.1.1621608843392; 
 Fri, 21 May 2021 07:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com> <87sg2gb5lf.fsf@linaro.org>
 <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org>
 <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
In-Reply-To: <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 21 May 2021 11:53:37 -0300
Message-ID: <CAKJDGDaTKDn9EvjmSoKUpu-QfhUhPi0USnH+SBFUZymtSU_GcA@mail.gmail.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 21, 2021 at 11:29 AM Peter Maydell <peter.maydell@linaro.org> w=
rote:
>
> On Fri, 21 May 2021 at 15:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> > If you think these tests belong to tests/tcg/, I am OK to put
> > them they, but I don't think adding the Avocado buildsys
> > machinery to the already-complex tests/tcg/ Makefiles is going
> > to help us...
>
> This does raise the question of what we're actually trying
> to distinguish. It seems to me somewhat that what tests/acceptance/
> actually contains that makes it interestingly different from other
> tests/ stuff is that it's specifically "tests using the Avocado
> framework". On that theory we might name it tests/avocado/.
>
> Or we could just leave it as it is -- is the current naming
> actually confusing anybody? :-)

Conceptually speaking, it isn't very clear because acceptance tests
are meant to test features requested by the customer during the
requisite phase for a specific software release. The QEMU project does
not have a formal requisite phase where features added to one software
version are discussed with the customers. In this case, the QEMU
acceptance tests are not accepting a use case or requested feature of
a release. Eventually, those tests may not be a blocker to a release
if some of them fail. Thus, calling them acceptance, may confuse
people working with tests.

>
> thanks
> -- PMM
>


