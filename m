Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A72BD4A686D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 00:19:38 +0100 (CET)
Received: from localhost ([::1]:58268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF2Qz-0003LL-PJ
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 18:19:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nExz2-0006nJ-6C
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:34:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nExz0-0002YI-Pt
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:34:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643740466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/NgJRnQ1vs8fb/67HjWHlSa1Fsbwjhcs0nuOvavwYCI=;
 b=U5Rqx2Lp76jD8FvS0eJkeKzuQ5zp/0wXCVUxxiu9d1gK+kIMhYe6Ng/Mt8yh0vwkdjO8D9
 EXR4IuZWAZViFN4JBl63TMituFm+CgrJUAOzHFfqidwT47RfcWwndK8xVxFQSIbB3oM8Fq
 tCuPFLBThlmHyiFmj/4yfUMel+fJYqg=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-LIIy_Cv6NgqlL2Z-Py_mXw-1; Tue, 01 Feb 2022 13:34:25 -0500
X-MC-Unique: LIIy_Cv6NgqlL2Z-Py_mXw-1
Received: by mail-yb1-f200.google.com with SMTP id
 i203-20020a253bd4000000b006195f020a0cso22869667yba.14
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:34:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/NgJRnQ1vs8fb/67HjWHlSa1Fsbwjhcs0nuOvavwYCI=;
 b=ScAfE1uJJFvAAivno4ch62d36Qms3WllwXbcLeHw6m41Bs4zQCIaGh6aZkFVpCk5Fn
 56DVdRm/4XIipVen2InJVlrAZ+Sa1hikL4x4UEi3kWuCbug/XzKTLfkiagWbgE106z9C
 Xb/Y7Vv83YHyZBcK5+nmSDHej9P0tP1r702qNMjU4DWp2BYsw1kFYwaESw4hljbuuVTr
 IN/Q3IIVsrcznYcNHb0s/76ui/N41IpGfUoDaC2HOKnlQKahcmNQZgphczGr+4kT+Fwu
 PDCnzZGWKev92NEWeFATMlV71WOaZfQ1vCNgdJexoK2H1unoWt5CubnKkYBLZWwroWGt
 afvw==
X-Gm-Message-State: AOAM533tlqhl1/qDRr4rTyslNEGdfNY5uKsvAmdF+8jg1ZhIKcP49t4L
 WCni9C9GPemVvyJVmtCoQ045jG6Y5CxMl4Oq0IjbJaT3QvTGVIqMUXb+/9razJ3DQ4An9K6IQJj
 9HbaaPGNMqi7p1qWiGOJd3XDQXfS9QLU=
X-Received: by 2002:a5b:2ce:: with SMTP id h14mr32584095ybp.572.1643740464822; 
 Tue, 01 Feb 2022 10:34:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwczEeUZ2GE3VfrymKv2LYwbcCkVcjuu4RIkn25iu6eOXFMY4YBbA/DuO/J0U+4qIoa5jx/rBEAbDDLDwNQLwg=
X-Received: by 2002:a5b:2ce:: with SMTP id h14mr32584074ybp.572.1643740464656; 
 Tue, 01 Feb 2022 10:34:24 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Feb 2022 10:34:24 -0800
From: Andrea Bolognani <abologna@redhat.com>
References: <20220201101911.97900-1-thuth@redhat.com>
 <CABJz62Osah308O2pHFMWs+D2X+Mq=aOf1NAKFcUaWF5bGzwJEw@mail.gmail.com>
 <87k0eexze4.fsf@linaro.org> <64143667-7027-e64a-26c8-99f1c72ebacd@amsat.org>
MIME-Version: 1.0
In-Reply-To: <64143667-7027-e64a-26c8-99f1c72ebacd@amsat.org>
Date: Tue, 1 Feb 2022 10:34:24 -0800
Message-ID: <CABJz62Os1a6hDnfffcifJgS8C2upbKmo1h5Nez1NF4LV0eG12Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] tests: Update CentOS 8 container to CentOS Stream 8
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 01, 2022 at 06:47:14PM +0100, Philippe Mathieu-Daud=C3=A9 wrote=
:
> Andrea, do you think it is acceptable to merge this and fix on top, or
> we should do it properly from start?

My preference is always to avoid follow-up tweaks if possible :) but
ultimately the decision is up to the QEMU developers and maintainers.

--=20
Andrea Bolognani / Red Hat / Virtualization


