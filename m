Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE94E36F835
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 11:55:41 +0200 (CEST)
Received: from localhost ([::1]:53638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcPs4-0007l3-NI
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 05:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lcPof-0004y1-SJ
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:52:10 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lcPob-0001Ml-ON
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:52:09 -0400
Received: by mail-wr1-x431.google.com with SMTP id t18so12282267wry.1
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 02:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=/AX2g3q+7/zzynF96V8DldG/iQpFOGh6+ZREPW4E9a0=;
 b=egtvWSXk3jS9eXJUlMxIWUvHHeHZtG8wIs3Yc1iEv/iWImSJoAmAs5bhzWvEvP6pTa
 C/x6nOQCPE9BoiiKMeiQ8/+VKKvKJv6MwcE13dGwYBXYMvgEcO/KH/NAw6iUpq+nqMHI
 knivMiGP/XYoreGiEVLLwhq6vQcNoPTthGTERnUWqfYtXVdJGurl1FS1s8KHnKm8AP+T
 Mwmylr1tmhEGH3dUVuTy7K9xdXryOkbF23s7uEj5UqIhkiS1znNkQmF/37xvVwzJo3La
 hAQhNcw9JXPfO9bpYlffZDT1bAdI9TzE5MStov3ihkB4QP6lFMPnUSCaW30ql6lu7oJS
 e1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=/AX2g3q+7/zzynF96V8DldG/iQpFOGh6+ZREPW4E9a0=;
 b=jllArZShbscoszEBQHXtknc+KonQJFLkXSYONbDLdnubXi+FVGoSlP36VQfZicWJQ1
 haZP6lIrYbHkMFmnK1MEleAevQuC/S7pA3EsXM5YRSW1NxkpxWfqIWJy60HXeJqNOkTv
 ozPIW+d8uI9IYdFJxaIc9heWMwq+bjT7osgE+El8iunQ/k03w56agXNFhq2qsyQ90qQn
 qYOqhXT2f6Mze+cencbTez2cBQlxD5VFbFpQeag2a2VbJD1PUSxb79YoXp7z8iz+Qfgo
 KcH3k7Z/3wmFYWND1uwnHXckKY/OLul51iwHhdDmyhnL+Zn10Xu2la1lqSBu5xBYd2li
 XnKA==
X-Gm-Message-State: AOAM532lETD2Hj8auZB2Ncsbw/Hy2FSkAyKVqRAP5jjWxCs+d44WTaIu
 x0OlWSt7NFAdZQ+w4zhE66F1cQ==
X-Google-Smtp-Source: ABdhPJyJDa9Y9R4wwIyo7vg6R8yD/KG1U7b7U6oVnCXV0fERDhp1KZOKXAiLrEImzoA/Wd62tv8QcA==
X-Received: by 2002:adf:f80f:: with SMTP id s15mr5596871wrp.341.1619776322427; 
 Fri, 30 Apr 2021 02:52:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j13sm2199053wrd.81.2021.04.30.02.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 02:52:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B0BC81FF7E;
 Fri, 30 Apr 2021 10:52:00 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-6-philmd@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 05/12] qtest/arm-cpu-features: Restrict
 sve_tests_sve_off_kvm test to KVM
Date: Fri, 30 Apr 2021 10:51:56 +0100
In-reply-to: <20210415163304.4120052-6-philmd@redhat.com>
Message-ID: <87im44w14v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> The sve_tests_sve_off_kvm() test is KVM specific.
> Only run it if KVM is available.
>
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tests/qtest/arm-cpu-features.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-feature=
s.c
> index 7f4b2521277..66300c3bc20 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -604,6 +604,8 @@ int main(int argc, char **argv)
>      if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm=
")) {
>          qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
>                              NULL, test_query_cpu_model_expansion_kvm);
> +        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
> +                            NULL, sve_tests_sve_off_kvm);
>      }
>=20=20
>      if (g_str_equal(qtest_get_arch(), "aarch64")) {
> @@ -611,8 +613,6 @@ int main(int argc, char **argv)
>                              NULL, sve_tests_sve_max_vq_8);
>          qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
>                              NULL, sve_tests_sve_off);
> -        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
> -                            NULL, sve_tests_sve_off_kvm);
>      }
>=20=20
>      return g_test_run();


--=20
Alex Benn=C3=A9e

