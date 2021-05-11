Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239F637B010
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 22:28:19 +0200 (CEST)
Received: from localhost ([::1]:60540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgYzK-0005ZF-8A
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 16:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgYyH-0003uQ-0p
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:27:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgYyF-0004Cs-Ah
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:27:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620764830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0P4uahpmQopsf71lwfM+VhpztSfUX2y5dwzZPnBnJjI=;
 b=f18T8OtdXvYtEd8NrZQLZn0PRU2YLyoR2jBr4jAwL5xqHhctEbSwBNXw9dl0ih4Rji9VFj
 6mjRGcGjqYKxctL6WhweRTJ3/v6jLTjiqu3YJvTM51D683GkFpwPM0Pth5cKPm6Fwagb8k
 7vR1lRwXXorlTXVegHyVsXqLjZYhg2M=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-4W6uIkumNaaH6z2Iv0Cz3Q-1; Tue, 11 May 2021 16:27:08 -0400
X-MC-Unique: 4W6uIkumNaaH6z2Iv0Cz3Q-1
Received: by mail-vs1-f69.google.com with SMTP id
 f20-20020a67d8940000b029022a675e6e86so6928200vsj.2
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 13:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0P4uahpmQopsf71lwfM+VhpztSfUX2y5dwzZPnBnJjI=;
 b=XlHlaS9rXjWNE0MYSyqI9YHqMURTsXwItK/ZI+XV38bmdvmVXHwvR2hg9kc3epq7y3
 3TESHAurO4UF1reCS50Gw4r26ynsoKwmrlowtPqgop5npJfTPDMJM9Zf6cTLxUvdEF5w
 h9V9r8WauiI48Sc75hzwbBQEkXFNmNXDI443rn4QKDbapfcN3QEermsPTfhIEWqhDZ1Y
 L8CsdHuutOq4yL8dpyQR1Djb2THvDCRz7NYrLykdNw4qlUDTN6jQCua/MuBwRy+lLzQm
 pTa7ZNs3jP2GXwB+ZCMHXfp9NYd1baRTiSdnB08EnB69B6ZT5orZImUMtlAfO91U4xAR
 1Icw==
X-Gm-Message-State: AOAM531umpGsN/lvyIA3KyOAbjTdfsvIktJQP//nkJdFKs7KVeCyCiCO
 y2T7YZA87vYcFjkE+7bnP2jD/2JaLA053SLOM4PkxumNQSqn3ma+2iZ7CbkHTDxqPAS07QU5xx/
 GX3kEiFsYeIeutNLjukHZXwgLnTooLUQ=
X-Received: by 2002:a1f:280e:: with SMTP id o14mr11478790vko.19.1620764828308; 
 Tue, 11 May 2021 13:27:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiZdUfGbx81WJ3yX4jhTL58CjfssPwFLAY9bkmnPQTn1AQ8CSc4bEtpVCs1n4V30PGS5nlxcFtE7l3I6bGHTk=
X-Received: by 2002:a1f:280e:: with SMTP id o14mr11478766vko.19.1620764828105; 
 Tue, 11 May 2021 13:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210511072952.2813358-1-f4bug@amsat.org>
 <20210511072952.2813358-4-f4bug@amsat.org>
In-Reply-To: <20210511072952.2813358-4-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 11 May 2021 17:26:42 -0300
Message-ID: <CAKJDGDY0CpPA__k=BTWX1WWnnV6bkGz6he_vAMZ7Jj0ALNTrgg@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] gitlab-ci: Extract container job template to
 container-template.yml
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 4:30 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Extract the container job template to a new file
> (container-template.yml) to be able to reuse it
> without having to run all the jobs included, which
> are mainly useful for mainstream CI.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/container-template.yml | 22 ++++++++++++++++++++++
>  .gitlab-ci.d/containers.yml         | 24 ++----------------------
>  2 files changed, 24 insertions(+), 22 deletions(-)
>  create mode 100644 .gitlab-ci.d/container-template.yml
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


