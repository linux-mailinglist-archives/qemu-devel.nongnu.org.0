Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C8C54436F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 07:58:47 +0200 (CEST)
Received: from localhost ([::1]:38166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzBBq-0004kN-Qx
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 01:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nzB5I-0000UO-Ae
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 01:51:58 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:41932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nzB5G-0000tl-8m
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 01:51:56 -0400
Received: by mail-ed1-x532.google.com with SMTP id 25so29477061edw.8
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 22:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=vqrA/DejApn4MUFBKP9B+H8iKR0lZRlGa2Fizc8bEKY=;
 b=bb0Q6ZIH5RrsE65OgzvT1gzlz/UsF3Ws+1q77yFvfsuOy6T14MOP/752Ntn2iItFZe
 SRX93hLan02nvgzt/6MBP+N8ddIxMcVxQl2LvoqYuA3laXL9EYb1eKY/43uKLEO2S7gZ
 6VQGjYG/EVPR77DUFss86BkO0zsqXPej8CynHjrSxI35wwOMA+OvVje3Q6yn1DUzK4bj
 Lua1ry8N4vzQ/4FaN1qMvAu31JobMLdMUydArK1nwwjNk6IzPL3MsMEiazOLyfDmKWxC
 S0yp+lIgu8abmKdOiS7/dxil0YlW5HYuIGLkYifzler+gXc9n/knoxTPFbAymZgC5SsR
 UBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=vqrA/DejApn4MUFBKP9B+H8iKR0lZRlGa2Fizc8bEKY=;
 b=Y4F6I3vR0fynNlLEU+1i/nW4vi0cqO7OM+ca7WOvbBzaadeVOdmMFeOu0eJoaD5Uff
 kcGKeqoDi2tQx5suddLkoMKJkwpJvRwf9hTsAGifc8zBbXNTtPZg0DQIZv8KUtH+H5LV
 Glbkl3ohR3/4iX/jhQaR+8SAXrbGN5pUGM5JMK14JMb/e7ToXtO+K177aXDELJAMS7zl
 DJrnWjqp32IZvh7pxc8Jl2psbXRpVeoXqoQ//Hpzz2VEy/KeO4YhApP7KqWXDwDDGlUb
 qO5drt2lLFwqX7K9vcyb1sDt2Dba235aLbFEFYcV3q8+YVq957VmdnYPQGH2jjdNcAw+
 4vQg==
X-Gm-Message-State: AOAM5326oMugg24imNu4K+YFP5+uVcfrgncVixue7hMU0jn/HzUAE+Wv
 MA4loDmSHr40dNxrcBJGFxYqEt891KKK+WNZKeSpOQ==
X-Google-Smtp-Source: ABdhPJziJ6QRyX3OWjqM25TSQhUL4GQm1uRXiXG9DodCv943DXDLtCj7g0kffGwN0n9ZSw0eUSp0QIUizPrfbXyCVJo=
X-Received: by 2002:a05:6402:280b:b0:42d:d562:9b0e with SMTP id
 h11-20020a056402280b00b0042dd5629b0emr43028868ede.176.1654753911730; Wed, 08
 Jun 2022 22:51:51 -0700 (PDT)
MIME-Version: 1.0
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 9 Jun 2022 11:21:41 +0530
Message-ID: <CAARzgwxofG9Bq+nqm=2QT9UaqZJHfZ7vBQwjLYrwBrdT=Zfz3w@mail.gmail.com>
Subject: bios bits acpica upgrade
To: Josh Triplett <josh@joshtriplett.org>
Cc: Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::532;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x532.google.com
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

Hi Josh :

I have gone ahead and upgraded the acpica. Changes need to be reviewed
and bits need to be tested more. However, here are the changes:

In the acpica submodule:
https://github.com/biosbits/acpica/pull/1

in the main top level bits repo:
https://github.com/ani-sinha/bits/compare/master...ani-sinha:acpica-unix2-20220331

Hope to hear back from you soon,
Ani

