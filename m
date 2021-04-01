Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD71350E57
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 07:10:14 +0200 (CEST)
Received: from localhost ([::1]:42144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRpav-0007LD-8S
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 01:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lRpZg-0006q4-Ll; Thu, 01 Apr 2021 01:08:56 -0400
Received: from mail-io1-f52.google.com ([209.85.166.52]:45721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lRpZf-0002CD-6I; Thu, 01 Apr 2021 01:08:56 -0400
Received: by mail-io1-f52.google.com with SMTP id k8so910390iop.12;
 Wed, 31 Mar 2021 22:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fc4RWcd3ISQsBuHpJedvpbBJ3k7OPE4/gqpmnYuqjg4=;
 b=K9ciPl1F2t2XiAlcl6k6e2xfIBtI9nOiJ3+C+YRJ8jEEryh+AGhVBjTUs5Rig7jtKF
 wnaHzFf5FPn2/xxwoH9tJOUdQ+Tpr1/fa9sSGia9OvXXLE4H0XB+PCYtZqr24M9kMAx+
 Nf2vnHFt8UjvOP9Uu1UugMswLUJ5MeNIk1HSbqqYI6Ti2N8PoiE5k7XSAM7Z0nw8ZIAW
 ZuCWlHPotZHy79t1JM1UvCbQzbYfnioR35oO/N2SAcKqCrIDiQW+U/zK66QyFhRIlUsQ
 mZ1AeQpTF9VhBcRt+iA7wFm82v1QBbzuhPqXwCGs5S8HjD/JprXpdAevJwUTJ/RGDPO/
 DvDQ==
X-Gm-Message-State: AOAM5323MSi0OHA1RmKg2h6RNQ8Qf7/C0Vl2TBhhTdE3o+yMoGEvEutI
 dmBp6tFOVfplKKaYKIBpiXGS6iT4PHI=
X-Google-Smtp-Source: ABdhPJzVa6Avgw2u+7TK343gAksyNHR70QzhUE/BMiLeNfTm1DuQPNQjHNg+bP2LUEUCIpWU/Ajgrg==
X-Received: by 2002:a05:6638:2726:: with SMTP id
 m38mr6187496jav.6.1617253732864; 
 Wed, 31 Mar 2021 22:08:52 -0700 (PDT)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com.
 [209.85.166.175])
 by smtp.gmail.com with ESMTPSA id 23sm2300703iog.45.2021.03.31.22.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 22:08:52 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id j16so1013209ilq.13;
 Wed, 31 Mar 2021 22:08:52 -0700 (PDT)
X-Received: by 2002:a92:c26e:: with SMTP id h14mr820265ild.33.1617253732329;
 Wed, 31 Mar 2021 22:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210315180341.31638-1-j@getutm.app>
 <20210315180341.31638-3-j@getutm.app>
In-Reply-To: <20210315180341.31638-3-j@getutm.app>
From: Joelle van Dyne <j@getutm.app>
Date: Wed, 31 Mar 2021 22:08:41 -0700
X-Gmail-Original-Message-ID: <CA+E+eSAc7mvmxfrafgL4RYoSpj-M2T7WCXYXgFw3YOwxwWx+Rw@mail.gmail.com>
Message-ID: <CA+E+eSAc7mvmxfrafgL4RYoSpj-M2T7WCXYXgFw3YOwxwWx+Rw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] block: check for sys/disk.h
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.52; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f52.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 11:03 AM Joelle van Dyne <j@getutm.app> wrote:
>
> Some BSD platforms do not have this header.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Joelle van Dyne <j@getutm.app>

Please bear with me as I am still new to this, but what happens to the
three patches that are reviewed if the last patch does not get
reviewed? Do the reviewed patches still get to make it into 6.0? I am
willing to drop the unreviewed patch if there are issues. Thanks.

-j

