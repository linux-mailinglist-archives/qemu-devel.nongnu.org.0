Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780C353C6F7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 10:37:47 +0200 (CEST)
Received: from localhost ([::1]:36984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx2oT-0000qp-52
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 04:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nx2nG-0008RY-C3
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 04:36:30 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:36704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nx2nE-0003CG-IS
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 04:36:30 -0400
Received: by mail-ej1-x629.google.com with SMTP id s12so7364205ejx.3
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 01:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=LHyOgOc2SYxjkZq08MTM9nseZGUSo+vWB+xI6JjiK5Y=;
 b=FuYE0gDzCRv1LBMWewWGtbu3vqQTx6NCstpw6bOHXYSPuke3kkHMco11tzEKD+xPTX
 MFmFYz3PGMhMt1xekPA6wQQqJYlMzIysPYCDVWXIyNMwQVFwuPPWMh+3d7aUMQgeC782
 7hGcVuNxUsphkEuUsSSHyXPjNWB4zloYQl/gEuN0jTLWJqwX98AOP7gSFHFpaRHJPga2
 cMCJukLoLyo5X4qWe7Zde4VcIFyr0Jnj3ay9/DEPeFl1Y2aukrJIdS648ru55u0XPQMY
 Ur1kdhOCtkAqkGPfNcSPoT6njcU3fLjADKa3LO3fUU7sk/u3cK4cdqeEuZnGkiwfUxcQ
 YXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=LHyOgOc2SYxjkZq08MTM9nseZGUSo+vWB+xI6JjiK5Y=;
 b=0NAMv9W4SocLDwAU7JDQL0BqIa02D8b4mslJpvPDZPu6wkm6DHGLDysYpuTQxzhqO/
 Fzy/jmmlfbLcY293qFse4/LCu1d0GJZBiF0OW9kXUZnAfaoOyCU9UlipMLTimVBz0Ydo
 6i0g3jhk4bAUVFewMjyHx04LJpCw37RW2w+PDn0fYOOiTxDG34h13nYHxCu3iLeqXVa9
 JkxK8Pe7WLyY9lC9jva+Z6WFY2AOwTqq1Oic9Bx+cyXMe/jwEOnz0yhFuIlNmclLWoeH
 FWk9SosoY3/L+rE7vjx7J4EJE9lTZhR9mLrQea76NPs1rdPE7ikZKG4JY4V7K1/JCR6b
 HFgA==
X-Gm-Message-State: AOAM531UUQs2SfTRyGwFH+reCUvkJEr15K9o1jq4ZEFoJ4MZCt3pd8ZZ
 lfC89qq1UpjG+IoxhxlLW85l/8UAweEgQbj7OyYbHw==
X-Google-Smtp-Source: ABdhPJz4jkpJgy5ylgqtnrTqSBYmvTU+9bhy8+giSVg/9hGOcb9jL4AqDifGCkusYA9s3RVrG/jzBjSi+S5RClH97iI=
X-Received: by 2002:a17:907:7f9f:b0:6ff:4275:1e4e with SMTP id
 qk31-20020a1709077f9f00b006ff42751e4emr7410251ejc.121.1654245386888; Fri, 03
 Jun 2022 01:36:26 -0700 (PDT)
MIME-Version: 1.0
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 3 Jun 2022 14:06:15 +0530
Message-ID: <CAARzgwyg-n-u+ATuYWsCu35kqos1z7UwcfCAPz-6LTgbQ3q2VA@mail.gmail.com>
Subject: Changes for building bits on newer gcc 9.4 compiler
To: Josh Triplett <josh@joshtriplett.org>
Cc: Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::629;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi josh :
Here are the pull requests. Please feel free to review and merge:

Main bits module:
https://github.com/biosbits/bits/pull/13

Submodules:
https://github.com/biosbits/grub/pull/1
https://github.com/biosbits/python/pull/1
https://github.com/biosbits/libffi/pull/1
https://github.com/biosbits/fdlibm/pull/1

Thanks
ani

