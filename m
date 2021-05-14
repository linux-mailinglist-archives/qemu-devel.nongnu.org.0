Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6609A380E89
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:59:43 +0200 (CEST)
Received: from localhost ([::1]:37922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbA6-0006PH-EZ
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhayy-0001NS-45
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:48:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhayv-0007DC-QC
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6nFvyvG6BDWIpehgJBOqGRj/OL8ul4aIZEikVhYQaNw=;
 b=LpjWlZzWfwl2Yk7oIpOWpg52J8vYMbsfXaiOSWTwhdpqU8uN4g/ycMczUbbl+O+CJhk5Kt
 RGnwS8S5ttAvqcAkSriPFodHsdH2IIYI+lRzNKlJNhFPMWJ/l3VOZU1mQd2aK37EzUVZlD
 AhrwAeQJwlCf1g+sYVPvtt7R4WsPSFw=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-KvX-W1KQOVSQwNU1vqunNQ-1; Fri, 14 May 2021 12:48:07 -0400
X-MC-Unique: KvX-W1KQOVSQwNU1vqunNQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 r85-20020a1fc1580000b02901f918091a78so62735vkf.6
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6nFvyvG6BDWIpehgJBOqGRj/OL8ul4aIZEikVhYQaNw=;
 b=N5j+ms3zyXg5zDqa7FehxZVvAPANWMMYjjwn9mqdM2NQWa5cAf5w1uxoFUfAtgX7ZS
 9WMgUzeyyvOMISzgcfIhB3JBQKPd27OXGkrSrmXGfxR9xyW8Ep+vKnMvJ/+YPYt1gN+q
 kYVxRoXCZshojBvkDcZsgxFZH+MOCWodkHZtyP6taN11IJwrip9+7osk+ge5+jmq09uj
 tjW99zhXOywDdyLiMJYjwVExRi52ClRzhN2+1YftiAlULdhyBY1FNJeXOYInamjdb1iw
 Axcdbeha62htygIRC5K6a3t8sELKEOnPciHfioltVvn/gHfni69wwxPqcZ4AhPKOVL2V
 79Kg==
X-Gm-Message-State: AOAM531v4dFzlPw7LboDLQFhjKXIzVOhpxyPYDSS7M6CSzbGU8Tx26te
 4YjmQHC+p9P0elDz0A5bW2cmljDF8OPsx/Xf51iHigSlevAE1DG8C4YitIJkOwbE+hrw1F7LmJV
 kI2sH7DyVmqf0K0FFk+m33dVAb2WPrWU=
X-Received: by 2002:a1f:a388:: with SMTP id m130mr39551694vke.1.1621010886997; 
 Fri, 14 May 2021 09:48:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8h0hrs5z7yNmAYFNsaERoR4TeAjv+w+kzVVNi6WUpJ8qRT7yAYFESje44bUPofEN2OmSE1YoyWL7uNYu1lN8=
X-Received: by 2002:a1f:a388:: with SMTP id m130mr39551684vke.1.1621010886806; 
 Fri, 14 May 2021 09:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210514120415.1368922-1-berrange@redhat.com>
 <20210514120415.1368922-2-berrange@redhat.com>
In-Reply-To: <20210514120415.1368922-2-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 14 May 2021 13:47:40 -0300
Message-ID: <CAKJDGDavAan3eOac7qzgDs78t5+SGv9=uXLPhEWBo2Ptns4xQg@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] gitlab: drop linux user build job for CentOS 7
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 9:04 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target.
>
> The build-user-centos7 job was to detect a failure specific to CentOS
> 7 and there are already other linux user jobs for other platforms.
> Thus we can drop this job rather than move it to CentOS 8.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .gitlab-ci.yml | 9 ---------
>  1 file changed, 9 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


