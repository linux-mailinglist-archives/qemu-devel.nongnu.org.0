Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FA02C9027
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 22:43:17 +0100 (CET)
Received: from localhost ([::1]:52272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjqx2-0006qD-Ak
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 16:43:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kjqwA-000664-0Y
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 16:42:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kjqw7-00024p-DR
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 16:42:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606772537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMrRpx7cIXLxHQXqq5HD76p5M6pt7zAw6AYdbvr5Pt8=;
 b=Eid1vv3KDTvynaFC8ASM+s+gcpoLvfqNpr6u6/9iKfWrXP+BWYGrKtl9dU6KSMOoKNJniL
 EQd+YflOw7So+nN7jOXrBYuOrPbkZKoHCBGb+/U6l3A4RairKS0QHeAt01vXlrV0xBnfu7
 S54qL1nz9C9eQ46Pr+CjKClz3Ss6F5s=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-_4Yv-edyNN6UbroGKcRG7A-1; Mon, 30 Nov 2020 16:42:15 -0500
X-MC-Unique: _4Yv-edyNN6UbroGKcRG7A-1
Received: by mail-vk1-f199.google.com with SMTP id s68so4400293vkb.6
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 13:42:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hMrRpx7cIXLxHQXqq5HD76p5M6pt7zAw6AYdbvr5Pt8=;
 b=b5SKrtpyAa4on7rkDpgItzAiP+rvoIMoy8o6xYTuee5QKHlM89diFLu67Zb3z4fn/t
 LSSoEoQH6ea8TiXHX3OZOzXZWceNJ+7FyCHJ57QRjW89ULPlbeG+NO24v1mgYI/Y+/cV
 3OhS8oqQ11fZckQNirhGHiXUeJ3OOcCBPi1qWkM2EiD3lLaixcOF7Zpqj1Bp4XtT393C
 XAGWXuI0Q3h7CC9yym6RbaHh1ukpf+04esMP0gnSC10V18vVtOVWEtfv6NYHIjQsJEru
 e2wBira+wW+CD6z7KktuqofbGJZT8S1VtSKnhwkM0SYJb7Fk5TlABJFlcR1CfXGOfG9z
 z13g==
X-Gm-Message-State: AOAM533mWd1s8/KDLuoclWB7mlB49YTqChV1hLaqjf/Ik2uPJD3/wOCS
 hdmcRV8WqQqJk8vj1SUhBEmfamm/Dg6xSMkxCQhyrjAkKvMdkWk30MBMjBxg+PyTcoaDdx1aTFf
 X2F+sydZa+vh/X3tsKDYYpM8dOCgqKVs=
X-Received: by 2002:a1f:1b95:: with SMTP id b143mr4328024vkb.1.1606772535341; 
 Mon, 30 Nov 2020 13:42:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwY9rPEgNBVrM0fVj95zmFo8DLMkXPDlCeCeFuI0WA0O5AjtddNe8wsZbmTZzGfSeRgkFqIPF9tkXQVknpIOp8=
X-Received: by 2002:a1f:1b95:: with SMTP id b143mr4328018vkb.1.1606772535174; 
 Mon, 30 Nov 2020 13:42:15 -0800 (PST)
MIME-Version: 1.0
References: <20201127174110.1932671-1-philmd@redhat.com>
In-Reply-To: <20201127174110.1932671-1-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 30 Nov 2020 18:42:04 -0300
Message-ID: <CAKJDGDYsxO4YbJLbf9gOEDfuOhxu=ybKkF-vQ5Pn+EPJHacpEA@mail.gmail.com>
Subject: Re: [RFC PATCH-for-5.2] gitlab-ci: Do not automatically run Avocado
 integration tests anymore
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 virt-ci-maint-team <virt-ci-maint-team@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 2:41 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> We lately realized that the Avocado framework was not designed
> to be regularly run on CI environments. Therefore, as of 5.2
> we deprecate the gitlab-ci jobs using Avocado. To not disrupt
> current users, it is possible to keep the current behavior by
> setting the QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE variable
> (see [*]).
> From now on, using these jobs (or adding new tests to them)
> is strongly discouraged.

When you say, "Avocado framework was not designed to be regularly run
on CI environments", I feel your pain. Avocado is a really nice test
framework, and I agree with you that running it locally is a little
easier than running inside a CI environment. Debugging a job failure
in the CI is not user-friendly; finding the command to reproduce a job
failure locally is not user-friendly. I understand why you would like
to remove the CI's acceptance tests, but I think your proposal is
missing some arguments and some planning.

If I read correctly, we share the same view that the CI and the
software tests are two different things. Here you are proposing that
we temporarily remove the CI's acceptance tests because it is not
user-friendly to the devs. This does not mean the tests will be lost.
It will be possible to run them locally or in the CI using the
QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE variable.

>
> Tests based on Avocado will be ported to new job schemes during
> the next releases, with better documentation and templates.

I understand you intend to make a more reliable and stable CI. Some
wording on why the new job scheme will be better than what we have now
and some planning on enabling the acceptance tests again in the CI may
help evaluate if it is feasible or just the same as what we have
today.

It would be nice to hear from other subsystem maintainers their pain
points about using the CI and how we can improve it. I hear you that
Avocado needs to improve its interface to be more user friendly. As an
Avocado developer, I would also like to hear from others where we can
improve Avocado to make it less painful for the QEMU developers'.


