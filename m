Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7006D3E5E87
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 17:00:01 +0200 (CEST)
Received: from localhost ([::1]:53476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDTEW-0005hZ-H3
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 11:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mDTBI-00080o-8Z
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:56:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mDTBH-0002EO-0h
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628607398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1KQ90Zjm63NxOD4nRyeaJn5mr07wyiRp6kr4VYUfX0Y=;
 b=LFeIAoqBLmYvI7+Lw3hAU+XH8L0BOorvPsM9yDSjrNpBsrSIK3dQOKjfgeDAPObV5/SrYr
 Ezu/K7/B6NqrCSh1kksFPWHN1bKihsbjUapyE8DbQ3x+Fa3PpNzihBeo37Id4rUzB+4lPq
 +m/EqGyndtuP967D3MaEw72XVjlUm04=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-qx7lxpOtP3-zEAR12LwnAg-1; Tue, 10 Aug 2021 10:56:36 -0400
X-MC-Unique: qx7lxpOtP3-zEAR12LwnAg-1
Received: by mail-pj1-f72.google.com with SMTP id
 16-20020a17090a1990b029017582e03c3bso2520280pji.7
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 07:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1KQ90Zjm63NxOD4nRyeaJn5mr07wyiRp6kr4VYUfX0Y=;
 b=Lr0J3As/M8yG7L5k7TbSOtZa1LC8CY+di8wfWGtIU99eeOMwe9eSnTDzmhh5IfLcr1
 kNN+eJLCJ/t89kLVVKXo4MZcssou/XWOhjxak2QpziF2bZjGdNoNwGsg2TXW0wpkqNGX
 L3V9gHsoNHh9PqKIJ5O4iSTnJNGUAzSvNhdFU0lkYkD9oyMRtlozGU99kSpgr+puu6HW
 bpSErq4ytVjttEejV/4VZj62YsN78e2wYRI8aEMHbmhxbR+wpsacDhqH6zvsGSC1Xiza
 5HtVE5TPAMmQkUJuYFN3MYqXygeoO1BQuMSPK9Eqz1KpUNpcXTT7s4ep33s/xM4M3062
 MKxA==
X-Gm-Message-State: AOAM530Gdt1TaYzbflaUw8W1UY8HgXJA0mN8DuqTsPcJiGPecedU+Vp6
 OTDHXCB8dLAddQN/iMqKIKSvVpElEM7HKjoHUl4wMLeMuDCYAZTdt3ekbaKb1rpYSPZbkzbMsTr
 UbluBhL5pAOHW+AzDrnQCaTSMu+SDoU4=
X-Received: by 2002:a17:90a:7789:: with SMTP id
 v9mr33185051pjk.159.1628607395733; 
 Tue, 10 Aug 2021 07:56:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5kERS5BeVfmC2n2oGX+5QKW9vzpwv086QcksBXxkPyiTLx5eVpqh7UVkbEgTRKMa3TQ52mq3fAljwAlHqe9w=
X-Received: by 2002:a17:90a:7789:: with SMTP id
 v9mr33185014pjk.159.1628607395441; 
 Tue, 10 Aug 2021 07:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210810140653.3969823-1-berrange@redhat.com>
 <20210810140653.3969823-2-berrange@redhat.com>
In-Reply-To: <20210810140653.3969823-2-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 10 Aug 2021 11:56:09 -0300
Message-ID: <CAKJDGDZo4hfAu5ha=D+rQfM4Urm1DANEzD7kgL_7Wq0ZoZoSuQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gitlab: exclude sparc-softmmu and riscv32-softmmu
 from cross builds
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 10, 2021 at 11:07 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> We need to cut down compile time by excluding more targets. Both these
> targets still have their 64-bit variant enabled, so the loss of coverage
> is mitigated to some degree.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .gitlab-ci.d/crossbuild-template.yml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


