Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D22B389701
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:49:40 +0200 (CEST)
Received: from localhost ([::1]:45240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljSCJ-0006Hy-Bf
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ljRqk-0007mg-Lf
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:27:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ljRqh-0002s1-FQ
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621452438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x8U+jHL/Cshm/Uidh7qHs/RxQFPW4RgrivXB5GFLaYk=;
 b=PaJ7y6yzwaOj9kFOPgHsD7JsjEtW4K9xplOc2XOHTaUA1wl45K+G/pof2dE+ibIN3Jb+CW
 uzUEs5uJNYHK0xOEn5UQ4HyQnMfALtLZJrBCZ/AO3DiV8ad6Z5JYyZPlZ/6rT7NyYV9HZ5
 t6Uh3pd0kBT6OtQFiY4XnHR+DQCPN9I=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-nSgGkhlJNqSKd9Ol-LEXyQ-1; Wed, 19 May 2021 15:27:16 -0400
X-MC-Unique: nSgGkhlJNqSKd9Ol-LEXyQ-1
Received: by mail-vs1-f70.google.com with SMTP id
 o9-20020a67e1490000b029023663bab48aso1933792vsl.20
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 12:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x8U+jHL/Cshm/Uidh7qHs/RxQFPW4RgrivXB5GFLaYk=;
 b=GebvZ7MkQdeDeDCkjlhDVzJeLFEkvBhe6PVjt9wnZvr5xRVsJd0LNQYZlS5pAXVn7A
 dJiT0jb23brNlJmrYFfCiWBTZLM/6qsNzNdtLAxL39LQT4adgkqe/5915kII7DmkXiSR
 lmGs92AKS6+TCOUP/aSBNe5WIWTNUAcn/O34R4YBQXLOdXlTyvQrHNkuFHDqrtcEsMQJ
 5avvM94ERtSj/zSxn6jSLeCm8T3FqsVH/rXbqXHxmNPH8GtMGoAQNDwrTpEQnTpuny+7
 jv8fxxZQ53UGpiTmYhNstUEvUHOTQW6iJTAOpAmRutPHNs1KXJmPcND0zXpGBzZfBiS3
 g2Ew==
X-Gm-Message-State: AOAM530oZtynbse4x/2PpNZ+G9UsA2MsKsyM2Avi9T9rRb0xy+3pNJrM
 Rss6H6fVPJwpxansd5wK26zRfWbje4lXcm4zlOlnRkmWymZEgOvXGiHOmPZ6ysHmxtI9AsSkbZF
 iqn3I1c2dqF45emeo2zI9sb+a/0+njEE=
X-Received: by 2002:a05:6102:2431:: with SMTP id
 l17mr692031vsi.45.1621452435992; 
 Wed, 19 May 2021 12:27:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjrocDr43x86GM/Z1VQiAUQVMEBWi+k8m5ZLgmXwx9J80P7mv+vmyrZ2e7+r4VrIgEuU57mf3NeOUX9r8YHLA=
X-Received: by 2002:a05:6102:2431:: with SMTP id
 l17mr692023vsi.45.1621452435827; 
 Wed, 19 May 2021 12:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210519185504.2198573-1-f4bug@amsat.org>
 <20210519185504.2198573-3-f4bug@amsat.org>
In-Reply-To: <20210519185504.2198573-3-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 19 May 2021 16:26:50 -0300
Message-ID: <CAKJDGDbNZuicFLqKbHL7z7DqXnMbphQqcHh=YC72h6Lad8oxgQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] gitlab-ci: Rename acceptance_test_job ->
 integration_test_job
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 3:55 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> The acceptance tests aren't accepting anything,
> rename them as integration tests.

Kind of related, I'm missing a patch changing the name of the
directory from `acceptance` to `integration`, but we can do it later,
when this series is merged.


