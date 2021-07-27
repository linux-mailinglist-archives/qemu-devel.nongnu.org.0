Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 995593D799E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 17:24:18 +0200 (CEST)
Received: from localhost ([::1]:40078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8OwL-0008IS-5H
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 11:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m8OuA-0007FV-1v
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 11:22:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m8Ou5-0000OG-OM
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 11:22:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627399313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aHo/Ps5/tZ7dbhKjkn0xOlLD3/KQIwWywR90vR4YYOc=;
 b=J2RctmtOPzRujwvLHVyYljbDGJnBVO6KM4K6cnxDlKI1RZYb+11s93HCTgBmKj9eb+UquA
 Pw5KwUH8RNo1PMbxhyReVsFh2LyvLacIxpaosRJvCRP+0P6Kh6jsNCykty+SdPU8RGnbsD
 caPajvzJkur+Jm+FPcChy8ypktluSOo=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-oUTbFiw-NOyHtiHTACiUJA-1; Tue, 27 Jul 2021 11:21:52 -0400
X-MC-Unique: oUTbFiw-NOyHtiHTACiUJA-1
Received: by mail-pl1-f197.google.com with SMTP id
 x14-20020a170902ec8eb029012bb183b35cso12638105plg.3
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 08:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aHo/Ps5/tZ7dbhKjkn0xOlLD3/KQIwWywR90vR4YYOc=;
 b=aFbYhHvKTnrZARnQsl4RcIWOU4G0w44CeGZx4r4Zk3yluXYyWwqiphlrM825sC4jko
 o5B0x/I9j3doQu+FvOoWVcvCMVSS/fz9IeM6aUB3DJj9Jt8GRS6KU36B0Tt4gcjwhGS8
 QfRhooGlZ4r/rmEA2XPnu88+frTc6edrgzm82v89O2CoiDV2auI9KG4jZcAseIKpCSQc
 fMloU0UEYJ9eFjMy/sR3GMNtXDwNTgsnB79OOB7nBHjsAVaiRUGyh1+kcHm9dg3enOal
 ZZyfHx7fNPdlUpS+j8oPuSg5IbR5fpWXXKTZI4a5TFf77rEbC+uYtl8ANWrYJuG8NfLH
 mnIQ==
X-Gm-Message-State: AOAM531cyQpvZGDnTVBQQSP8RFcqq0GwEc8O6PwVVOnRYbmbL0hZ5K0g
 qMPXV76kxrDFU30h1Mawol1rHwIHNSadn+qe9mpLlqAfwretLNLkuduyD4xcsITcojecd1cNy2E
 LufGjkxsbwePO/pCwgRUJwbQGE4yAVGg=
X-Received: by 2002:a17:90b:344a:: with SMTP id
 lj10mr4781349pjb.108.1627399311112; 
 Tue, 27 Jul 2021 08:21:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwK8lKnDbG/zJn++N/jUn0qklPzBph1TdGLvRHM/etyN9rvev8Fdu0HExrh16hJTapIzD3LU8GnZ7yum0aatj0=
X-Received: by 2002:a17:90b:344a:: with SMTP id
 lj10mr4781336pjb.108.1627399310911; 
 Tue, 27 Jul 2021 08:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210727142431.1672530-1-philmd@redhat.com>
 <20210727142431.1672530-5-philmd@redhat.com>
In-Reply-To: <20210727142431.1672530-5-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 27 Jul 2021 12:21:25 -0300
Message-ID: <CAKJDGDbmzNtOYtM4pEav1Xi7-hzrC4J2bGz2wrjzOJKxDz-d9g@mail.gmail.com>
Subject: Re: [PATCH-for-6.1 v5 4/4] gitlab-ci: Fix 'when:' condition in
 OpenSBI jobs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 27, 2021 at 11:27 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Jobs depending on another should not use the 'when: always'
> condition, because if a dependency failed we should not keep
> running jobs depending on it. The correct condition is
> 'when: on_success'.
>
> Fixes: c6fc0fc1a71 ("gitlab-ci.yml: Add jobs to build OpenSBI firmware bi=
naries")
> Reported-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  .gitlab-ci.d/opensbi.yml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


