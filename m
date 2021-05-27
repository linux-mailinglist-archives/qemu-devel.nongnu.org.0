Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F89393320
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:02:37 +0200 (CEST)
Received: from localhost ([::1]:47450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmISy-0008OY-AH
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmIPI-0006OZ-K3
 for qemu-devel@nongnu.org; Thu, 27 May 2021 11:58:48 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:44947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmIPG-0006et-S9
 for qemu-devel@nongnu.org; Thu, 27 May 2021 11:58:48 -0400
Received: by mail-ot1-f50.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so634485otp.11
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 08:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0td18BumK/icI+qdzXDEC06zii6VdAKhuB7BsCWGUVE=;
 b=oYfU074ztSbWcHW+H7Db0AsHX/UrRhR4vZIvd56t9VyuqmijcARB7KRGD/DkK9HjNC
 8Shvwzx0JCh3CXZht0VlLC8Dhw6mfw1D7YvVbNSZQHgs0mHQHJRGS2lpxZpgBmf8Rk7r
 yVL24oio9Hl5Ki3IKWJLDd77PmK4KEAa4hJ9DZbKevtq8raR8ZEsoBVQBmeEPqDCD7+A
 hx8ZQrdkyabHARHjlIXQyPWhsI495bKe94erstqffgmKcxf3qZuz3rZhe12/keP3CkM2
 /GLLO2sNVbxy2FQqqOhq3vfDdfaf7BIVba28W89TIEb0R7a/fgKrwSFe+Lyx2P1YlA4g
 a/tA==
X-Gm-Message-State: AOAM530FMd2A9Nxek69eAa/hccKQVN0zCCQEH9OjDlJj70hayZ7OLvIN
 7ztt51sBLiEFlUy0tYrZEh0LqDLq4sQlfimQVAo=
X-Google-Smtp-Source: ABdhPJzdudi8MuDxciOAdolfw4V1likqI310XcsIlkLJtaXDR13icfLj8h0uAtz3LqR26VyV1IOu29bzkfFM4z+KlqM=
X-Received: by 2002:a9d:6e09:: with SMTP id e9mr3280766otr.126.1622131125988; 
 Thu, 27 May 2021 08:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210514120415.1368922-1-berrange@redhat.com>
 <20210514120415.1368922-2-berrange@redhat.com>
In-Reply-To: <20210514120415.1368922-2-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 27 May 2021 17:58:35 +0200
Message-ID: <CAAdtpL45SG2Y8bZJYj+NBOPBFB0paVt2fFX+jyF+B=5aY8siGw@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] gitlab: drop linux user build job for CentOS 7
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.50;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f50.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 2:04 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
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

Thanks, patch applied to gitlab-ci-next.

