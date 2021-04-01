Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7B735159A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 16:18:58 +0200 (CEST)
Received: from localhost ([::1]:41464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRy9w-0008VD-Oj
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 10:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lRy8p-0007yv-57
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 10:17:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lRy8n-0000aw-3E
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 10:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617286661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XNtbxKUi2S8ifavT1QC10qi1Nc/e1boW/qBMLcJ1K0c=;
 b=D11rvWbiOmFXhVL7EU3FZT1I6oHWK9HJQFkRR/jo31LfdAQI32QBmok/MzMN9pae9ZMYiT
 ZeZQY/VuEUWfT/kktWon/u3MncNYess1tCK6isZAl4DGh3cU2SXp881Hiv4LrQyMvyVAR9
 9inVTqU0UiN9sbXo3ONB66x4X32ERd0=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-yjjQOHsCNaulArdz3-oncA-1; Thu, 01 Apr 2021 10:17:36 -0400
X-MC-Unique: yjjQOHsCNaulArdz3-oncA-1
Received: by mail-vk1-f200.google.com with SMTP id s69so1810147vkd.20
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 07:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XNtbxKUi2S8ifavT1QC10qi1Nc/e1boW/qBMLcJ1K0c=;
 b=kPY40/ZeuENS+qr0SbSyHfvEDWUDmGvLKAkXWlkCwUtz14uBHhYjoyf6gcUXrZlkzj
 vHK+sOWIKepqa+L889g7ZM0YFPvDdKrZMKjwszxRDH4XhMTISGox7/Jsq2K6xpgMt0IT
 f8NYdS40kVZGzHQb8ikG2o7ER0hYxUedKQSqQw/WGgVHCOyDypnA/HqnYZXkyIEYc/hV
 x2Fh1iFSgGdMJb3x59mg0fMrmPJnn4JhkTGQ3p9rby9Hed8vJJNhxfw9tcEBiHyHqOgi
 n7x6iJKfbPcFBEZ9OWSn+c1YF+P1Ng8M8M4+oFVAn6m2Z77PreSpObjMklT2417kriPE
 olIw==
X-Gm-Message-State: AOAM531BbLi39cQ1548EgnqnfKZJ4kjoI9sB1m9jCfFvHZshrJHoM0Of
 x6lPX4LDvJfC9MHIb6MsjRI0oElXpaVFWIKdp6d36S5AO3xmmJ7BmRz5u5HSEOpTn+Ve1fCRXgq
 lVE3LWAHyRcNZ2yjwH7HhDsjZ4qfMFlA=
X-Received: by 2002:a9f:2069:: with SMTP id 96mr5133180uam.110.1617286655734; 
 Thu, 01 Apr 2021 07:17:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrc+hNcV+XYjrIC/7unMRrr7tc6XHmueF+rwIPVHE0SNfGnHNj0C4qlyMkYPQGTwfPa7Di9hlxHHsMO0QeYoc=
X-Received: by 2002:a9f:2069:: with SMTP id 96mr5133159uam.110.1617286655552; 
 Thu, 01 Apr 2021 07:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210401102530.12030-1-alex.bennee@linaro.org>
 <20210401102530.12030-11-alex.bennee@linaro.org>
In-Reply-To: <20210401102530.12030-11-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 1 Apr 2021 11:17:09 -0300
Message-ID: <CAKJDGDYGi+96mTK10K63gbBR-SNOMZBbMKe3i+ZS_O5p1M3Oww@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] gitlab-ci.yml: Fix the filtering for the git
 submodules
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 1, 2021 at 7:25 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> Commit 7d7dbf9dc15be6e introduced a new line starting with
> "GIT_SUBMODULES_ACTION=3D" in the config-host.mak file. The grep that
> tries to determine the submodules in the gitlab-ci.yml file matches
> this new line, too, causing a warning message when updating the modules:
>
>  warn: ignoring non-existent submodule GIT_SUBMODULES_ACTION=3Dupdate
>
> Fix it by matching the "GIT_SUBMODULES=3D..." line only.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20210331073316.2965928-1-thuth@redhat.com>
> ---
>  .gitlab-ci.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Missing my review from the original patch, anyway:

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


